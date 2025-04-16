C     ##################################################################

      SUBROUTINE SPRY( ICMP, SIMTIM, NSTEP, DELTAT, XNGRP, GRRATE, 
     $   SPREM )

C     ##################################################################

C     #################################################################
C     ######### POWERS/BURSON MODEL IS AN OPTION FOR AEROSOLS #########
C     ######### INCLUDES CHANGES REQUESTED BY NRC IN FEB 1995 #########
C     #################################################################
     
C     ##################################################################            
C     ####### NEED TO INCORPORATE FRESH_WATER_FRACTION(MAXCOMP)! ####### 
C     ##################################################################

C     This subroutine determines the removal coefficients for all four
C     transport groups due to the action of sprays. It is assumed that
C     no removal effect occurs for nobles gases. For the other three
C     transport groups, the removal coefficient can be specified by the
C     user. For the aerosol transport group, the removal coefficient can
C     also be calculated using the Powers/Burson mechanistic model.

C     This Powers/Burson aerosol removal model requires that the
C     following user-specified quantities:
C     (1) Q, the spray water flux, in m3-H2O/m2/sec
C        (the cross-sectional area used in determining this
C         is the mean containment area);
C     (2) H, the fall height, in m;
C     (3) SALPHA, the ratio of unsprayed volume to sprayed volume,
C     (4) KPCT, the percentile of the model (10th, 50th, 90th).

C     The physical constants required by the Powers/Burson model
C     are found in the DATA statements below.

C     If the release is instantaneous, then the aerosol mass initially
C     released into the source compartment will be stored in variable
C     AMASSINT. If the addition of aerosol mass occurs over time, then
C     the mass fraction of aerosol does not need to be computed.

C     The model should not be used for spray water fluxes and fall
C     heights outside of specified ranges. For spray water fluxes this
C     range is from 1.0E-05 to 2.5E-03 m3-H2O/m2/sec. For fall heights
C     this range is from 5.0 to 50.0 m. In either case, if the specified
C     value is out of range, then it will be reset to within the range
C     and a warning message will be written to the output file.

C     The aerosol removal coefficient is dependent upon the fraction
C     of the aerosol suspended in the atmosphere. This is the ratio of
C     the aerosol mass in the compartment atmosphere at a given time
C     to the total aerosol mass released into the compartment atmosphere
C     up until that same given time.

C     Reference is "A Simplified Model for Aerosol Removal by
C     Containment Sprays", D. A. Powers and S. B. Burson. Also see
C     "Model Description", LeAnn Adams Miller, 2/25/94.

C     Inputs:
C     (1) compartment number
C     (2) current simulation time
C     (3) counter of current time step
C     (4) duration of current time step
C     (5) transport group counts/mass
C     (6) transport group release rate

C     Output:
C     SPREM() spray removal coefficients for all transport groups, 1/sec
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol

C     Called by:
C     COEFFS

C     Calls to:
C     LUPC2 (function, look-up table)

       include 'full.com'

      COMMON / X34QAZ / ALLIN, DTUSED

      INTEGER ICMP, II
      INTEGER KPCT, KSTP
      INTEGER NSTEP, NMAX

      double precision LUPC2
      double precision SIMTIM, DELTAT(MAXSTEP), DTUSED, DTMAX  
      double precision XNGRP(MAXTGRP,MAXCOMP,MAXCLOC,MAXSTEP)
      double precision GRRATE(MAXCOMP,MAXTGRP)
      double precision QTYH2O, QTYCGS, QTYH2O_MIN, QTYH2O_MAX
      double precision HTFALL, HTFCGS, HTFALL_MIN, HTFALL_MAX
      double precision AMASS, AMASSINT, AMASSL, AMASSN, DEPMAS
      double precision FACTOR, FAERO
      double precision SALPHA, ARGEXP, ALLIN, TERRY, AVGSPRY
      double precision SPREM(MAXTGRP), SPREM90, XMASS_ASYM, XMULT
      double precision AA(3), BB(3), CC(3), DD(3), EE(3), FF(3), GG(3)
      double precision XX(3), YY(3), ZZ(3)

C     ######## aerosol removal by sprays, model parameters ########
C     values of constants used in Eqn. 2 on page 4 of LAM reference
C     AA, ..., GG determine the 90% decontamination coefficient
C     XX, YY, ZZ determine the decontamination ratio
C     column headings are 10th, 50th, and 90th percentiles
C     ############# consider renaming these variables #############

      DATA AA, BB, CC, DD, EE, FF, GG, XX, YY, ZZ  /
C          10th pct      50th pct      90th pct
C        AA through GG determine 90% decontamination coefficient
     $     5.5750,       6.83707,      7.10927,
     $     0.94362,      1.0074,       0.92549,
     $     0.0,         -2.4045E-5,    0.0,
     $    -6.9821E-3,   -4.1731E-3,   -8.0868E-4,
     $    -7.327E-7,     9.006E-8,     0.0,
     $     0.0,         -1.2478,       0.0,
     $     3.555E-6,     0.0,          0.0,
C        XX through ZZ determine decontamination ratio
     $     0.1108,       0.1815,       0.3751,
     $    -0.00201,     -0.01153,      0.00648,
     $     0.8945,       0.5843,       0.2786   /

C     minimum and maximum values of spray water flux, m3-H2O/m2/sec
CTJH  correction for units problem, see Powers/Burson report, page 172
      QTYH2O_MIN = 1.0E-05
      QTYH2O_MAX = 2.6E-03

C     minimum and maximum values of fall height, m
C     see Powers/Burson report, page 172
      HTFALL_MIN =  5.0
      HTFALL_MAX = 50.0

C     variables used by TJH
      allin = 1.0

C     write banner on entry into subroutine
      IF ( LEVEL_SPRY .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A16)') 'SUBROUTINE SPRY!'
      END IF

C     ##########################################################
C     ############# NOBLE GAS REMOVAL COEFFICIENT ##############
C     ##########################################################

C     it is assumed that there is no effect on nobles
C     removal coefficient for noble gases, 1/sec
      SPREM(1) = 0.0

      IF ( LEVEL_SPRY .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A12,E13.4)') 'SPREM(1)  = ', SPREM(1)
      END IF

C     ##########################################################
C     ########## ELEMENTAL IODINE REMOVAL COEFFICIENT ##########
C     ##########################################################

C  TJH check for model availability first
C     if removal coefficient used for elemental iodine then
      IF ( SPRAYS_ELEMENTAL_MODEL(ICMP) .GT. 0 ) THEN
C
C     if removal coefficient used for elemental iodine then
      IF ( SPRAYS_ELEMENTAL_COUNT(ICMP) .GT. 0 ) THEN

C       user-specified removal coefficient, 1/sec
        SPREM(2) = LUPC2( ICMP, SIMTIM, SPRAYS_ELEMENTAL_TIME,
     $    SPRAYS_ELEMENTAL, SPRAYS_ELEMENTAL_COUNT(ICMP) )

          IF (ION_ELEM .EQ. 1)  SPREM(2) = 0.0

      ELSE
C     else if removal coefficient not used for elemental iodine then
     $ IF ( SPRAYS_ELEMENTAL_COUNT(ICMP) .EQ. 0 ) THEN

C       removal coefficient is zero, 1/sec
        SPREM(2) = 0.0

      ELSE
C     else if value of count is out of range then
     $ IF ( SPRAYS_ELEMENTAL_COUNT(ICMP) .LT. 0 ) THEN

C       error has occurred so write message
        WRITE(out_unit,'(1X,A36)')
     $   'SUBROUTINE SPRY: ERROR HAS OCCURRED!'
        WRITE(out_unit,'(1X,A36)')
     $   '------------------------------------'
        WRITE(out_unit,'(1X,A35)')
     $   'SPRAYS_ELEMENTAL_COUNT IS NEGATIVE!'
        WRITE(out_unit,'(1X,A23,I2,A4,I2)')
     $   'SPRAYS_ELEMENTAL_COUNT(', ICMP, ') = ',
     $    SPRAYS_ELEMENTAL_COUNT(ICMP)

      END IF
	END IF
C     end if removal coefficient used for elemental iodine

      IF ( LEVEL_SPRY .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A12,E13.4)') 'SPREM(2)  = ', SPREM(2)
      END IF

C     #########################################################
C     ########## ORGANIC IODINE REMOVAL COEFFICIENTS ##########
C     #########################################################

C  TJH check for model availability first
C     if removal coefficient used for organic iodine then
      IF ( SPRAYS_ORGANIC_MODEL(ICMP) .GT. 0 ) THEN
C
C     if removal coefficient used for organic iodine then
      IF ( SPRAYS_ORGANIC_COUNT(ICMP) .GT. 0 ) THEN

C       user-specified removal coefficient, 1/sec
        SPREM(3) = LUPC2( ICMP, SIMTIM, SPRAYS_ORGANIC_TIME,
     $    SPRAYS_ORGANIC, SPRAYS_ORGANIC_COUNT(ICMP) )

      ELSE
C     else if removal coefficient not used for organic iodine then
     $ IF ( SPRAYS_ORGANIC_COUNT(ICMP) .EQ. 0 ) THEN

C       removal coefficient is zero, 1/sec
        SPREM(3) = 0.0

      ELSE
C     else if value of count is out of range then
     $ IF ( SPRAYS_ORGANIC_COUNT(ICMP) .LT. 0 ) THEN

C       error has occurred so write message
        WRITE(out_unit,'(1X,A36)')
     $   'SUBROUTINE SPRY: ERROR HAS OCCURRED!'
        WRITE(out_unit,'(1X,A36)')
     $   '------------------------------------'
        WRITE(out_unit,'(1X,A33)')
     $   'SPRAYS_ORGANIC_COUNT IS NEGATIVE!'
        WRITE(out_unit,'(1X,A21,I2,A4,I2)')
     $   'SPRAYS_ORGANIC_COUNT(', ICMP, ') = ',
     $    SPRAYS_ORGANIC_COUNT(ICMP)

      END IF
	END IF
C     end if removal coefficient used for organic iodine

      IF ( LEVEL_SPRY .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A12,E13.4)') 'SPREM(3)  = ', SPREM(3)
      END IF

C     ###################################################
C     ########### AEROSOL REMOVAL COEFFICIENTS ##########
C     ###################################################

C     if user-specified aerosol-removal coefficient is used then
      IF ( SPRAYS_AEROSOL_MODEL(ICMP) .EQ. 1 ) THEN

C       if removal coefficient count is positive then
        IF ( SPRAYS_AEROSOL_COUNT(ICMP) .GT. 0 ) THEN

C         user-specified aerosol-removal coefficient, 1/sec
          SPREM(4) = LUPC2( ICMP, SIMTIM, SPRAYS_AEROSOL_TIME,
     $      SPRAYS_AEROSOL, SPRAYS_AEROSOL_COUNT(ICMP) )
          IF (ION_AERO .EQ. 1)  SPREM(4) = SPREM(4) / 10.0
          IF (ION_AERO .EQ. 2)  SPREM(4) = 0.0

        ELSE
C       else if removal coefficient count is zero then
     $  IF ( SPRAYS_AEROSOL_COUNT(ICMP) .EQ. 0 ) THEN

C         removal coefficient is zero, 1/sec
          SPREM(4) = 0.0

        ELSE
C       else if removal coefficient count is negative then
     $  IF ( SPRAYS_AEROSOL_COUNT(ICMP) .LT. 0 ) THEN

C         error has occurred so write message
          WRITE(out_unit,'(1X,A36)')
     $     'SUBROUTINE SPRY: ERROR HAS OCCURRED!'
          WRITE(out_unit,'(1X,A36)')
     $     '------------------------------------'
          WRITE(out_unit,'(1X,A41)')
     $     'SPRAYS_AEROSOL_COUNT IS NEGATIVE! CASE 1!'
          WRITE(out_unit,'(1X,A21,I2,A4,I2)')
     $     'SPRAYS_AEROSOL_COUNT(', ICMP, ') = ',
     $      SPRAYS_AEROSOL_COUNT(ICMP)

        END IF
C       end if removal coefficient count is positive

C     end if user-specified aerosol-removal coefficient is used

      ELSE
C     else if Powers/Burson removal coefficient is used  and
C          the residual aerosol is greater than 0.1 gm   then
C
     $ IF ( SPRAYS_AEROSOL_MODEL(ICMP) .EQ. 2) THEN

C       ##################################################
C       ############## POWERS/BURSON MODEL! ##############
C       ##################################################

C       perform error checking on coefficient count

C       if time-and-coefficient count is not positive then
        IF ( SPRAYS_AEROSOL_COUNT(ICMP) .LE. 0 ) THEN

C         error has occurred so write message
          WRITE(out_unit,'(1X,A36)')
     $     'SUBROUTINE SPRY: ERROR HAS OCCURRED!'
          WRITE(out_unit,'(1X,A36)')
     $     '------------------------------------'
          WRITE(out_unit,'(1X,A45)')
     $     'SPRAYS_AEROSOL_COUNT IS NON-POSITIVE! CASE 2!'
          WRITE(out_unit,'(1X,A21,I2,A4,I2)')
     $     'SPRAYS_AEROSOL_COUNT(', ICMP, ') = ',
     $      SPRAYS_AEROSOL_COUNT(ICMP)

        END IF
C       end if time-and-coefficient count is zero

C       spray water flux, m3-H2O/m2/sec
C       sprays_aerosol_flux specified in metric units in user screen
        IF ( SPRAYS_AEROSOL_COUNT(ICMP) .GT. 0 ) THEN
          QTYH2O = LUPC2( ICMP, SIMTIM, SPRAYS_AEROSOL_TIME,
     $      SPRAYS_AEROSOL_FLUX, SPRAYS_AEROSOL_COUNT(ICMP) )
        ELSE
          WRITE(out_unit,'(1X,A22)') 'SUBROUTINE SPRY ERROR!'
          WRITE(out_unit,'(1X,A22)') 'LUPC2 CALL FOR QTYH2O!'
          WRITE(out_unit,'(1X,A21,I2,A4,I2)')
     $     'SPRAYS_AEROSOL_COUNT(', ICMP, ') = ',
     $      SPRAYS_AEROSOL_COUNT(ICMP)
        END IF

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A12,E13.4,A14,A24)')
     $     'QTYH2O    = ', QTYH2O, ' m3-H2O/m2/sec',
     $     ' (before range checking)'
        END IF

C       perform range checking for spray water flux value

C       if spray water flux is less than minimum for model then

        IF ( QTYH2O .LT. QTYH2O_MIN) THEN 
          IF (LEVEL_SPRY .GE. 2 ) THEN
C         write warning message
            WRITE(out_unit,'(1X,A46)')
     $       '----------------------------------------------'
            WRITE(out_unit,'(1X,A46)')
     $       'WARNING! POTENTIAL PROBLEM IN SUBROUTINE SPRY!'
            WRITE(out_unit,'(1X,A30,F10.4,A3)')                               
     $       ' SPRAY MODEL TURNOFF AT TIME =',SIMTIM/3600.,' hr'
            WRITE(out_unit,'(1X,A27,1pe12.5,2A)')
     $      ' SPRAY WATER FLUX ', QTYH2O/0.00508, ' (cfm-H2O/sq-ft) ',
     $      ' LESS THAN LOWER LIMIT'
            WRITE(out_unit,'(1X,A26,1pe12.5,A15)')
     $      ' FLUX VALUE BEING RESET TO', QTYH2O_MIN/0.00508, 
     &          ' cfm-H2O/sq-ft!'
C
          END IF
C         reset spray water flux to minimum value for model
          QTYH2O = QTYH2O_MIN

C          go to end of model 
          go to 1111
C        
        END IF
C       end if spray water flux is less than minimum for model

C       if spray water flux is greater than maximum for model then
        IF ( QTYH2O .GT. QTYH2O_MAX ) THEN
C         write warning message
          WRITE(out_unit,'(1X,A46)')
     $     '----------------------------------------------'
          WRITE(out_unit,'(1X,A46)')
     $     'WARNING! POTENTIAL PROBLEM IN SUBROUTINE SPRY!'
          WRITE(out_unit,'(1X,A27,1pe12.5,2A)')
     $      ' SPRAY WATER FLUX ', QTYH2O/0.00508, ' (cfm-H2O/sq-ft) ',
     $      ' GREATER THAN UPPER LIMIT'
          WRITE(out_unit,'(1X,A26,1pe12.5,A15)')
     $     ' FLUX VALUE BEING RESET TO', QTYH2O_MAX/0.00508, 
     &                 ' (cfm-H2O/sq-ft)'
C         reset spray water flux to maximum value for model
          QTYH2O = QTYH2O_MAX
        END IF
C       end if spray water flux is greater than maximum for model

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A12,E13.4,A14,A23)')
     $     'QTYH2O    = ', QTYH2O, ' m3-H2O/m2/sec',
     $     ' (after range checking)'
        END IF

C       fall height of droplets, m
C       sprays_aerosol_height specified in metric units in user screen
        IF ( SPRAYS_AEROSOL_COUNT(ICMP) .GT. 0 ) THEN
          HTFALL = LUPC2( ICMP, SIMTIM, SPRAYS_AEROSOL_TIME,
     $      SPRAYS_AEROSOL_HEIGHT, SPRAYS_AEROSOL_COUNT(ICMP) )
        ELSE
          WRITE(out_unit,'(1X,A22)') 'SUBROUTINE SPRY ERROR!'
          WRITE(out_unit,'(1X,A22)') 'LUPC2 CALL FOR HTFALL!'
          WRITE(out_unit,'(1X,A21,I2,A4,I2)')
     $     'SPRAYS_AEROSOL_COUNT(', ICMP, ') = ',
     $      SPRAYS_AEROSOL_COUNT(ICMP)
        END IF

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A12,E13.4,A2,A24)')
     $     'HTFALL    = ', HTFALL, ' m', ' (before range checking)'
        END IF

C       perform range checking for fall height value

C       if fall height is less than minimum for model then
        IF ( HTFALL .LT. HTFALL_MIN ) THEN
C         write warning message
          WRITE(out_unit,'(1X,A46)')
     $     '----------------------------------------------'
          WRITE(out_unit,'(1X,A46)')
     $     'WARNING! POTENTIAL PROBLEM IN SUBROUTINE SPRY!'
          WRITE(out_unit,'(1X,A25,F4.1,A3)')
     $     ' FALL HEIGHT IS LESS THAN', HTFALL_MIN, ' m!'
          WRITE(out_unit,'(1X,A27,F4.1,A3)')
     $     ' FALL HEIGHT BEING RESET TO', HTFALL_MIN, ' m!'
C         reset fall height to minimum value for model
          HTFALL = HTFALL_MIN
        END IF
C       end if fall height is less than minimum for model

C       if fall height is greater than maximum for model then
        IF ( HTFALL .GT. HTFALL_MAX ) THEN
C         write warning message
          WRITE(out_unit,'(1X,A46)')
     $     '----------------------------------------------'
          WRITE(out_unit,'(1X,A46)')
     $     'WARNING! POTENTIAL PROBLEM IN SUBROUTINE SPRY!'
          WRITE(out_unit,'(1X,A28,F5.1,A3)')
     $     ' FALL HEIGHT IS GREATER THAN', HTFALL_MAX, ' m!'
          WRITE(out_unit,'(1X,A27,F5.1,A3)')
     $     ' FALL HEIGHT BEING RESET TO', HTFALL_MAX, ' m!'
C         reset fall height to maximum value for model
          HTFALL = HTFALL_MAX
        END IF
C       end if fall height is greater than maximum for model

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A12,E13.4,A2,A23)')
     $     'HTFALL    = ', HTFALL, ' m', ' (after range checking)'
        END IF

C       ####################################################
C       ########## DETERMINE 'KEY' FOR PERCENTILE ##########
C       ####################################################

C       if 10th percentile then
        IF ( SPRAYS_AEROSOL_PERCENTILE(ICMP) .EQ. 10.0 ) THEN
          KPCT = 1
        ELSE
C       if 50th percentile then
     $  IF ( SPRAYS_AEROSOL_PERCENTILE(ICMP) .EQ. 50.0 ) THEN
          KPCT = 2
        ELSE
C       if 90th percentile then
     $  IF ( SPRAYS_AEROSOL_PERCENTILE(ICMP) .EQ. 90.0 ) THEN
          KPCT = 3
C       else error has occurred in setting percentile key
        ELSE
C         write error message
          WRITE(out_unit,'(1X,A46)')
     $     'SUBROUTINE SPRY: PERCENTILE NOT CORRECTLY SET!'
          WRITE(out_unit,'(1X,A46)')
     $     '----------------------------------------------'
          WRITE(out_unit,'(1X,A27,I2,A4,F5.1)')
     $     ' SPRAYS_AEROSOL_PERCENTILE(', ICMP, ') = ',
     $      SPRAYS_AEROSOL_PERCENTILE(ICMP)
C         perform hard termination of program
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP ! <<=================================================STOP
        END IF
C       end if 10th percentile then

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A26,I2,A4,F5.1)')
     $     'SPRAYS_AEROSOL_PERCENTILE(', ICMP, ') = ',
     $      SPRAYS_AEROSOL_PERCENTILE(ICMP)
          WRITE(out_unit,'(1X,A12,I4)') 'KPCT      = ', KPCT
        END IF

C       ratio of compartment volume not sprayed (dry) to
C       compartment volume that is sprayed (wet)

        IF ( SPRAYS_AEROSOL_COUNT(ICMP) .GT. 0 ) THEN
          SALPHA = LUPC2( ICMP, SIMTIM, SPRAYS_AEROSOL_TIME,
     &      SPRAYS_AEROSOL_ALPHA, SPRAYS_AEROSOL_COUNT(ICMP) )
        ELSE
          WRITE(out_unit,'(1X,A22)') 'SUBROUTINE SPRY ERROR!'
          WRITE(out_unit,'(1X,A22)') 'LUPC2 CALL FOR SALPHA!'
          WRITE(out_unit,'(1X,A21,I2,A4,I2)')
     &     'SPRAYS_AEROSOL_COUNT(', ICMP, ') = ',
     &      SPRAYS_AEROSOL_COUNT(ICMP)
        END IF

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A12,E13.4)') 'SALPHA    = ', SALPHA
        END IF


CTJH    determine 90% mass decontamination coefficient
CTJH    see Powers/Burson, pages 171-173
CTJH    convert to correlation units, e.g., cgs units

        QTYCGS = QTYH2O * 100.0
        HTFCGS = HTFALL * 100.0

        ARGEXP = + AA(KPCT)
     $           + BB(KPCT) * DLOG(QTYCGS)
     $           + CC(KPCT) * HTFCGS
     $           + DD(KPCT) * QTYCGS**2 * HTFCGS
     $           + EE(KPCT) * QTYCGS * HTFCGS**2
     $           + FF(KPCT) * QTYCGS
     $           + GG(KPCT) * QTYCGS**2 * HTFCGS**2

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A12,E13.4)') 'ARGEXP    = ', ARGEXP
        END IF

CTJH    account for units and unsprayed volume
CTJH    spray removal rate for aerosol removal by sprays, 1/sec
CTJH    note: sprays-alpha is ratio of DRY volume to WET volume

        SPREM(4) =  DEXP(ARGEXP) / 3600.0 / ( 1.0 + SALPHA )
        SPREM90 = SPREM(4)
c
        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A12,E13.4,A21)')
     $     'SPREM(4)  = ', SPREM(4), ' (intermediate value)'
        END IF
c
CTJH    if instantaneous release or residual deposition of aerosols
CTJH    modify the removal coefficient for reduced aerosol quantities
CTJH    as time progresses
c
        RLSE_TIME1 = DURATION_GAP(1) + DURATION_EARLY(1) + 
     &              DURATION_EX(1) + DURATION_LATE(1)
        RLSE_TIME2 = DURATION_GAP(2) + DURATION_EARLY(2) + 
     &              DURATION_EX(2) + DURATION_LATE(2)
           
        IF (SIMTIM .LT. MAX(RLSE_TIME1,RLSE_TIME2) )   THEN


CTJH    ####################################################
CTJH    ########## CONTINUOUS RELEASE OF AEROSOLS ##########
CTJH    ####################################################

CTJH    spray removal rate for aerosol removal by sprays
CTJH    modeled for the case of continuous release

CTJH    determine the asymptotic solution (pg 170)

          XMASS_ASYM = GRRATE(ICMP,MAXTGRP) / SPREM(4)

CTJH    test for large deposition rate where asymptotic is valid,
CTJH    reset the deposition rate to yield correct solution

          IF (SPREM(4)*DELTAT(NSTEP) .GT. 1.0) THEN
            SPREM(4) = ( 1.0 -   
     $       (XMASS_ASYM - GRRATE(ICMP,MAXTGRP)*DELTAT(NSTEP)) / 
     $        XNGRP(MAXTGRP,ICMP,1,NSTEP-1) ) / DELTAT(NSTEP)
            
            IF ( LEVEL_SPRY .GE. 3 ) THEN
              WRITE(out_unit,'(1X,A28)') 'REMOVAL FRACTION EXCEEDS 1.0!'
              WRITE(out_unit,'(1X,A24)') 'RESET VALUE OF SPREM(4)!'
            END IF

            IF ( LEVEL_SPRY .GE. 2 ) THEN
              WRITE(out_unit,'(1X,A12,E13.4,A17)')
     $         'SPREM(4)  = ', SPREM(4), ' (adjusted value)'
            END IF
          END IF

CTJH      M(0), total aerosol mass released into compartment
CTJH      atmosphere up to given time
CTJH      perform step-wise integration on group release rate

          IF ( NSTEP .EQ. 1 ) THEN
            AMASSINT = 0.0      + GRRATE(ICMP,MAXTGRP) * DELTAT(NSTEP)
          ELSE
            AMASSINT = AMASSINT + GRRATE(ICMP,MAXTGRP) * DELTAT(NSTEP)
          END IF

          IF ( LEVEL_SPRY .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A12,E13.4,A4)')
     $       'AMASSINT  = ', AMASSINT, ' kgm'
          END IF

          ALLIN = AMASSINT

        ELSE

CTJH    ####################################################
CTJH    ######## INSTANTANEOUS RELEASE OF AEROSOLS #########
CTJH    ####################################################

CTJH    spray removal rate for aerosol removal by sprays
CTJH    modeled for the case of burst (puff) release and for the
CTJH    end of the continuous release phase

c       will modify for internal time step control
c       this is intended to allow radtran to use a large (?) time step
c       for all cells while capturing the correct spray induced
c       deposition in this source term cell

c       assume that deltat(nstep) will result in less than a 10%
c       change in the total mass in the atmosphere of the cell

c       if SPREM(4) > 0.04    max step = 0.0001 * 3600.0
c       if SPREM(4) > 0.004   max step = 0.0010 * 3600.0
c       if SPREM(4) > 0.0004  max step = 0.0100 * 3600.0
c       if SPREM(4) < 0.0004  max step = 0.1000 * 3600.0

         DTMAX = 0.1 * 3600.0

         IF ( SPREM(4) .GE. 0.0004 )
     $     DTMAX = MIN(DELTAT(NSTEP),0.01*3600.0)
         IF ( SPREM(4) .GE. 0.004  )
     $     DTMAX = MIN(DELTAT(NSTEP),0.001*3600.0)
         IF ( SPREM(4) .GE. 0.04   )
     $     DTMAX = MIN(DELTAT(NSTEP),0.0001*3600.0)

c
c       adjust time step for lack of aerosol in volume
c
         IF (NSTEP .GT. 1) THEN
           IF (XNGRP(MAXTGRP,1,1,NSTEP-1) .LT.1.0) THEN
             XMULT = 10.0
             IF (XNGRP(MAXTGRP,1,1,NSTEP-1) .LT. 0.01) XMULT = 100.
             IF (XNGRP(MAXTGRP,1,1,NSTEP-1) .LT. 0.0001) XMULT = 1000.  
             DTMAX = MIN(DELTAT(NSTEP), XMULT*DTMAX, 360.0)
           END IF
         END IF

         IF ( LEVEL_SPRY .GE. 2 ) THEN
           WRITE(out_unit,'(1X,A12,E13.4)') 'DTMAX     = ', DTMAX
         END IF

         NMAX = DELTAT(NSTEP) / ( DTMAX * 1.01 ) + 1
         NMAX = MAX0(NMAX, 5)

         IF ( LEVEL_SPRY .GE. 2 ) THEN
           WRITE(out_unit,'(1X,A12,I4)') 'NMAX      = ', NMAX
         END IF

         DTUSED = DELTAT(NSTEP) / NMAX
c  kew
c  set the time constant for use in limiting global time step
c  ...
        time_constant(icmp) = min(time_constant(icmp),dtused)
        time_constant(icmp) = min(time_constant(icmp),
     &    0.1/sprem(4))

         IF ( LEVEL_SPRY .GE. 2 ) THEN
           WRITE(out_unit,'(1X,A12,E13.4)') 'DTUSED    = ', DTUSED
         END IF

         DEPMAS = 0.0
         AVGSPRY = 0.0

C        #######################################################
C        ############### TOP OF INTERNAL DO-LOOP ###############
C        #######################################################

         IF ( LEVEL_SPRY .GE. 2 ) THEN
           WRITE(out_unit,'(1X,A41)')
     $      'SUBROUTINE SPRY: TOP OF INTERNAL DO-LOOP!'
         END IF

C        do-loop for each kstp
         DO 2000 KSTP = 1, NMAX

C         M(t), aerosol mass in compartment atmosphere, time t
C         compartment atmosphere is location #1
          IF ( NSTEP * KSTP .EQ. 1 ) THEN
CTJH        save last value of amass
            AMASSL = 0.0
CTJH        update value of amass
            AMASS = 0.0
          ELSE
CTJH        save last value of amass
            AMASSL = AMASS
CTJH        update value of amass
            IF ( NSTEP .EQ. 1 ) THEN
              AMASS = - DEPMAS
            ELSE
              AMASS = XNGRP(MAXTGRP,ICMP,1,NSTEP-1) - DEPMAS
            END IF
          END IF

          IF ( LEVEL_SPRY .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A12,E13.4,A4)')
     $       'AMASS     = ', AMASS,  ' kgm'
            WRITE(out_unit,'(1X,A12,E13.4,A4)')
     $       'AMASSL    = ', AMASSL, ' kgm'
          END IF

C         M(0), total aerosol mass released into compartment
C         atmosphere up to given time
C         perform step-wise integration on group release rate
          IF ( NSTEP * KSTP .EQ. 1 ) THEN
            AMASSINT = 0.0      + GRRATE(ICMP,MAXTGRP) * DTUSED
          ELSE
            AMASSINT = AMASSINT + GRRATE(ICMP,MAXTGRP) * DTUSED
          END IF

          IF ( LEVEL_SPRY .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A12,E13.4,A4)')
     $       'AMASSINT  = ', AMASSINT, ' kgm'
          END IF

CTJH      the purpose of this logical block is to calculate FAERO, the
CTJH      fraction of the aerosol that is suspended in the compartment
CTJH      atmosphere

CTJH      if there is mass in the compartment atmosphere then
          IF ( AMASS .GT. 0.0 ) THEN

CTJH        now if new value is greater than old value then
CTJH        there are definitely sources coming in

CTJH        but if new value is less than old value then
CTJH        there are probably sources coming in
CTJH        follow DAP in assuming that the amount of aerosol
CTJH        deposited (removed) is less than the amount sourced in

c           if aerosol group release rate is zero then
            IF ( GRRATE(ICMP,MAXTGRP) .EQ. 0.0 ) THEN
              IF (AMASSINT .GT. 0.0) THEN
                FAERO = AMASS / AMASSINT
              ELSE
                FAERO = 0.9
                AMASSL = AMASS/0.9
                AMASSINT = AMASSL
              END IF

              IF ( AMASS .GT. AMASSL ) THEN
                IF ( LEVEL_SPRY .GE. 2 ) THEN
                  WRITE(out_unit,'(1X,A22)') 'INSTANTANEOUS RELEASE!'
                END IF
                AMASSINT = AMASS
                FAERO = 1.0
              END IF

            ELSE

CTJH          we have a continuous source
              FAERO = 0.9

            END IF
c           end if aerosol group release rate is zero

          ELSE

            FAERO = 1.0

          END IF
CTJH      end if there is mass in the compartment atmosphere

CDKM      load value of amassint into allin
          ALLIN = AMASSINT

          IF ( LEVEL_SPRY .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A12,E13.4)') 'FAERO     = ', FAERO
          END IF

          IF ( FAERO .LT. 0.0 ) THEN
            WRITE(out_unit,'(1X,A45)')
     $       'VALUE OF FRCT AERO IS NEGATIVE, NON-PHYSICAL!'
            WRITE(out_unit,'(1X,A12,E13.4)') 'AMASS     = ', AMASS
            WRITE(out_unit,'(1X,A12,E13.4)') 'AMASSINT  = ', AMASSINT
            WRITE(out_unit,'(1X,A12,E13.4)')
     $       'GRRATE(5) = ', GRRATE(ICMP,MAXTGRP)
      write(*,*) '***********    S T O P (SPRY)  *******************'

C      *****************    S T O P  ***************************
        STOP ! <<===============================================STOP
          END IF
          IF ( FAERO .GT. 1.0 ) THEN
            WRITE(out_unit,'(1X,A44)')
     $       'VALUE OF FRCT AERO IS TOO BIG, NON-PHYSICAL!'
            WRITE(out_unit,'(1X,A12,E13.4)') 'AMASS     = ', AMASS
            WRITE(out_unit,'(1X,A12,E13.4)') 'AMASSINT  = ', AMASSINT
            WRITE(out_unit,'(1X,A12,E13.4)')
     $       'GRRATE(5) = ', GRRATE(ICMP,MAXTGRP)
      write(*,*) '***********    S T O P (SPRY)  *******************'

C      *****************    S T O P   ***************************
        STOP ! <<===============================================STOP
          END IF

C         factor to account for change in aerosol decontamination
C         coefficient for case of FAERO not equal to 0.9
C         see equation near top of page 166 of Powers/Burson

          FACTOR = ( ( XX(KPCT) + YY(KPCT) * DLOG10(QTYCGS) ) *
     $               ( 1.0 - ( FAERO / 0.9 )**ZZ(KPCT) ) +
     $               ( FAERO / 0.9 )**ZZ(KPCT) )

          IF ( LEVEL_SPRY .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A12,E13.4)') 'FACTOR    = ', FACTOR
          END IF
c
C         determine aerosol removal fraction, 1/sec

          SPREM(4) = SPREM90 * FACTOR

CTJH      alter value of SPREM(4) based upon time step

          IF ( 1.0 / DTUSED .LT. SPREM(4)  ) THEN
            SPREM(4) = 1.0 / DTUSED
            IF ( LEVEL_SPRY .GE. 3 ) THEN
              WRITE(out_unit,'(1X,A28)') 'REMOVAL FRACTION EXCEEDS 1.0!'
              WRITE(out_unit,'(1X,A24)') 'RESET VALUE OF SPREM(4)!'
            END IF
          END IF

          IF ( LEVEL_SPRY .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A12,E13.4,A17)')
     $       'SPREM(4)  = ', SPREM(4), ' (adjusted value)'
          END IF

          DEPMAS = DEPMAS + (SPREM(4)*AMASS - GRRATE(1,5))*DTUSED
          AVGSPRY = AVGSPRY + SPREM(4)*AMASS*DTUSED

          IF ( LEVEL_SPRY .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A12,E13.4)') 'DEPMAS    = ', DEPMAS
            WRITE(out_unit,'(1X,A12,E13.4)') 'AVGSPRY   = ', AVGSPRY
          END IF

 2000   CONTINUE
C       end do-loop for each kstep

C       #######################################################
C       ############### END OF INTERNAL DO-LOOP ###############
C       #######################################################

        IF ( NSTEP .GE. 2 ) THEN
          AMASSN = XNGRP(MAXTGRP,ICMP,1,NSTEP-1)  - DEPMAS
          IF ( XNGRP(MAXTGRP,ICMP,1,NSTEP-1) .GT. 0.0 ) SPREM(4) =
     $      AVGSPRY / ( DELTAT(NSTEP) * XNGRP(MAXTGRP,ICMP,1,NSTEP-1) )
        ELSE
          AMASSN = - DEPMAS
          SPREM(4) = 0.0
        END IF

        END IF
C       end if instantaneous release of aerosols

        IF ( LEVEL_SPRY .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A18)')       'DIAGNOSTIC OUTPUT:'
          WRITE(out_unit,'(1X,A12,I4)') 'NMAX      = ', NMAX
          WRITE(out_unit,'(1X,A12,E13.4)') 'DTUSED    = ', DTUSED
          WRITE(out_unit,'(1X,A12,E13.4)') 'DELTAT    = ', DELTAT(NSTEP)
          WRITE(out_unit,'(1X,A12,E13.4)') 'DEPMAS    = ', DEPMAS
          WRITE(out_unit,'(1X,A12,E13.4)') 'AVGSPRY   = ', AVGSPRY
          WRITE(out_unit,'(1X,A12,E13.4)') 'FAERO     = ', FAERO
          IF ( NSTEP .GE. 2 ) THEN ! <<=================================
            WRITE(out_unit,'(1X,A12,E13.4)')
     $       'XNGRP     = ', XNGRP(MAXTGRP,1,1,NSTEP-1)
          ELSE ! <<=====================================================
            WRITE(out_unit,'(1X,A22)') 'XNGRP    =   UNDEFINED' ! <<====
          END IF ! <<===================================================
          WRITE(out_unit,'(1X,A12,E13.4)')
     $       'S(4)*DT   = ', SPREM(4)*DELTAT(NSTEP)
          WRITE(out_unit,'(1X,A12,E13.4)') 'FACTOR    = ', FACTOR
          WRITE(out_unit,'(1X,A12,E13.4)') 'AMASSN    = ', AMASSN
          WRITE(out_unit,'(1X,A12,E13.4)') 'AMASSINT  = ', AMASSINT
          WRITE(out_unit,'(1X,A12,E13.4)')
     $       'GRRATE(4) = ', GRRATE(ICMP,MAXTGRP)
          TERRY =  GRRATE(ICMP,MAXTGRP) * DELTAT(NSTEP)
          IF ( NSTEP .GT. 1 ) TERRY = TERRY + (1.0 - SPREM(4) * 
     $        DELTAT(NSTEP)) * XNGRP(MAXTGRP,ICMP,1,NSTEP-1)
          WRITE(out_unit,'(1X,A12,E13.4)') 'TERRY     = ', TERRY
        END IF

 1111   CONTINUE

      END IF
C     end if Powers/Burson removal coefficient is used

      IF ( LEVEL_SPRY .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A12,E13.4)') 'SPREM(4)  = ', SPREM(4)
      END IF

      SPREM(5) = SPREM(4)

      IF ( LEVEL_SPRY .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A12,5E13.4)')
     $   'SPREM     = ', (SPREM(II),II=1,MAXTGRP)
      END IF

C     return to caller
      RETURN

C     end of subroutine SPRY
      END
