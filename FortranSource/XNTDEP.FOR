C     ------------------------------------------------------------------
C
C     Subroutine:  xntdep
C
C     ------------------------------------------------------------------
C
C     Author(s):   David Monroe
C                  Steven Humphreys
C                  Sandia National Laboratories
C 
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872 1089
C
C     Description:
C
C     This subroutine calculates the removal coefficient for natural
C     deposition. This removal mechanism includes many phenomena, such
C     as gravitational settling, impaction, and diffusion.
C
C     The subroutine considers all four transport groups. However,
C     natural deposition is considered applicable only to elemental
C     iodine and aerosols. Noble gases and organic iodine are not
C     affected because they are non-reactive.
C
C     The removal coefficients for elemental iodine and aerosols can be
C     specified by the user. In the case of elemental iodine removal,
C     the user should include the effects of re-emmission of iodine,
C     because this effect is not modeled explicitly.
C
C     The removal coefficients for aerosols can be calculated using a
C     model by Henry (FAI Aerosol Correlation, Draft Technical Report
C     Fauske & Associates, Inc., Burr Ridge, Illinois, August 1984. ).
C     To use the Henry model the user must specify:
C       (1) the fall height (meters),
C       (2) the particle density (kgm/m3).
C     Reference values are provided in both cases.
C
C     The removal coefficients for aerosols can also be calculated using
C     a model by Powers ( "A Simplified Model of Aerosol Removal by
C     Natural Processes in Reactor Containments", D. A. Powers et al,
C     February 1995, prepared for the NRC by Sandia Labs, NUREG/CR-6189,
C     SAND94-0407 ). To use the Powers model the user must specify:
C       (1) reactor_type ( PWR, AWR, BWR )
C       (2) uncertainty percentile ( 10%, 50%, 90% )
C
C     The natural deposition coefficients, in units of 1/sec, will be
C     returned in the double precision array DEP(*).
C
C     Inputs:
C     (1) compartment number
C     (2) current simulation time
C     (3) counter of current time step
C     (4) transport group counts/masses
C
C     Output:
C     DEP(*), natural deposition coefficients (1/sec)
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol
C
C     Called by:
C     COEFFS, if compartment_deposition(icomp) = 1
C
C     Calls to:
C     LUPC2 (function)
C
C     Reference is "Model Description", LeAnn Adams Miller, 2/25/94
C
C     ------------------------------------------------------------------
C     ORIGINALY CREATED BY LAM 02/28/94
C     CODE MODIFICATION BY DKM 03/14/95
C     TESTING BY DKM IN JUNE, JULY, AND OCTOBER 1995
C     CODE MODIFICATION BY TJH 12/96  include time step in AEROSOL call
C     ------------------------------------------------------------------
c
C     ##################################################################

      SUBROUTINE XNTDEP( ICMP, SIMTIM, DELTAT, NSTEP, XNGRP, DEP )

C     ##################################################################

C     
      INCLUDE 'full.com'

      INTEGER ICMP, NSTEP

      double precision DEP(MAXTGRP)
      double precision XNGRP(MAXTGRP,MAXCOMP,MAXCLOC,MAXSTEP)
      double precision SIMTIM, DELTAT(MAXSTEP)

      double precision AMASS_ATM, AMASS_CON, FACTOR, EXPONE
      double precision HT_RATIO, HT_REF, HT_FALL
      double precision RHO_RATIO, RHO_REF, RHO_PLE
      double precision CON_REF
      double precision LUPC2

C     ############### variables for Powers model ###############
      CHARACTER*7 REACTOR_TYPE
      double precision PERCENTILE, DECOEFF, HRTOSC

C     reference height for Henry model, m
      DATA HT_REF / 5.0 /

C     reference particle density for Henry model, kgm/m3
C     change to code 12 June 1995, recommended by TJH and DAP
C     allows user to input theoretical densities rather than
C     true aerosol densities that account for packing, etc.
C     see page 10 of FAI report, cited above
C     ########## originally this value was set at 400.0 ##########
      DATA RHO_REF / 2270.0 /

C     reference atmospheric density for Henry model, kgm/m3
      DATA CON_REF / 6.0E-05 /

C     conversion factor, hr to sec
      HRTOSC = 3600.0

C     print out banner on entering subroutine
      IF ( LEVEL_XNTDEP .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A18)') 'SUBROUTINE XNTDEP!'
      END IF

CDKM  #############################################################
C     set deposit_aerosol_model(1) equal to one
C     for testing Powers model for natural deposition of aerosols
C     only used for plant_filename equal to aero_dap.pmf

CDKM  #############################################################
CDKM  #############################################################

      IF ( LEVEL_XNTDEP .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A13,E11.4,A2)')
     &  ' HT_REF    = ', HT_REF, ' m'
        WRITE(out_unit,'(1X,A13,E11.4,A6)')
     &  ' RHO_REF   = ', RHO_REF, ' kg/m3'
      END IF

C     ###########################################################
C     ############ natural deposition of noble gases ############
C     ###########################################################

C     no effect on noble gases
C     natural deposition coefficient, 1/sec
      DEP(1) = 0.0

      IF ( LEVEL_XNTDEP .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A13,E11.4,A20)')
     &  ' DEP(1)    = ', DEP(1), ' 1/sec, noble gases '
      END IF

C     ##########################################################
C     ######### natural deposition of elemental iodine #########
C     ##########################################################

C       natural deposition coefficient, 1/sec
        DEP(2) = 0.0

C     if deposition_elemental_count is zero then
      IF ( DEPOSIT_ELEMENTAL_MODEL(ICMP) .GT. 0 ) THEN
C
C     ##### NOTE CORRECTION: NO TABLE MEANS NO DEPOSITION! #####

C     if deposition_elemental_count is zero then
        IF ( DEPOSIT_ELEMENTAL_COUNT(ICMP) .GT. 0 ) THEN

C       natural deposition coefficient, 1/sec
          DEP(2) = LUPC2( ICMP, SIMTIM, DEPOSIT_ELEMENTAL_TIME,
     &      DEPOSIT_ELEMENTAL, DEPOSIT_ELEMENTAL_COUNT(ICMP) )

        END IF
C     end if deposition_elemental_count is zero
C
      END IF

      IF ( LEVEL_XNTDEP .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A13,E11.4,A20)')
     &  ' DEP(2)    = ', DEP(2), ' 1/sec, elem iodine '
      END IF

C     ##########################################################
C     ########## natural deposition of organic iodine ##########
C     ##########################################################

C     no effect on organic iodine
C     natural deposition coefficient, 1/sec
      DEP(3) = 0.0

      IF ( LEVEL_XNTDEP .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A13,E11.4,A20)')
     &  ' DEP(3)    = ', DEP(3), ' 1/sec, organ iodine'
      END IF

C     ########################################################
C     ############ natural deposition of aerosols ############
C     ########################################################
C       no effect on aerosols
C       natural deposition coefficient, 1/sec
        DEP(4) = 0.0

C     if no natural deposition of aerosols then
      IF ( DEPOSIT_AEROSOL_MODEL(ICMP) .EQ. 1 ) THEN

C     if natural deposition of aerosols user-specified then
        IF ( DEPOSIT_AEROSOL_COUNT(ICMP) .GT. 0 ) THEN

C       natural deposition coefficient, 1/sec
          DEP(4) = LUPC2( ICMP, SIMTIM, DEPOSIT_AEROSOL_TIME,
     &      DEPOSIT_AEROSOL, DEPOSIT_AEROSOL_COUNT(ICMP) )

        END IF
      END IF
C     end if natural deposition of aerosols user-specified

C     ###########################################################
C     ############ HENRY MODEL FOR AEROSOL REMOVAL ############
C     ###########################################################

C     ###########################################################
C     ##### NOTE: HENRY RECOMMENDS THAT THIS MODEL CAN BE #####
C     ##### USED FOR ANY COMPARTMENT (PAGE 1 OF REFERENCE). #####
C     ###########################################################

C     if Henry aerosol DF model is being used then
      IF ( DEPOSIT_AEROSOL_MODEL(ICMP) .EQ. 2 ) THEN

        IF ( LEVEL_XNTDEP .GE. 1 ) THEN
          WRITE(out_unit,'(1X,A21)') ' USING EPSTEIN MODEL!'
        END IF

C       aerosol mass suspended in atmosphere, kgm
C       ##### AT THE END OF THE LAST TIME STEP #####
C       transport group is aerosols (#4) and
C       compartment location is atmosphere (#1)
        IF ( NSTEP .EQ. 1 ) THEN
          AMASS_ATM = 0.0
        ELSE
          AMASS_ATM = XNGRP(MAXTGRP,ICMP,1,NSTEP-1)
        END IF

        IF ( LEVEL_XNTDEP .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A13,I6)')    ' ICMP      = ', ICMP
          WRITE(out_unit,'(1X,A13,I6)')    ' NSTEP-1   = ', NSTEP-1
          WRITE(out_unit,'(1X,A13,E11.4,A5)')
     &    ' AMASS_ATM = ', AMASS_ATM, ' kgm'
        END IF

C       aerosol mass concentration in atmosphere, kgm/m3
        AMASS_CON = AMASS_ATM / COMPARTMENT_VOLUME(ICMP)

        IF ( LEVEL_XNTDEP .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A13,E11.4,A3)')
     &    ' COMP VOL  = ', COMPARTMENT_VOLUME(ICMP), ' m3'
          WRITE(out_unit,'(1X,A13,E11.4,A7)')
     &    ' AMASS_CON = ', AMASS_CON, ' kgm/m3'
        END IF

C       if concentration greater than or equal to con_ref then
        IF ( AMASS_CON .GE. CON_REF ) THEN

C          parameters for Henry model, higher concentration
           IF ( LEVEL_XNTDEP .GE. 3 ) THEN
             WRITE(out_unit,'(1X,A31)')
     &       ' AMASS_CON .GE. 6.0E-05 kgm/m3!'
           END IF
           FACTOR = 0.022
           EXPONE = 0.6

C       else if concentration less than con_ref then
        ELSE

C          parameters for Henry model, lower concentration
           IF ( LEVEL_XNTDEP .GE. 3 ) THEN
              WRITE(out_unit,'(1X,A31)')
     &        ' AMASS_CON .LT. 6.0E-05 kgm/m3!'
           END IF
           FACTOR = 0.0016
           EXPONE = 0.33

        END IF
C       end if concentration greater than or equal to con_ref

        IF ( LEVEL_XNTDEP .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A13,E11.4)') ' FACTOR    = ', FACTOR
          WRITE(out_unit,'(1X,A13,E11.4)') ' EXPONE    = ', EXPONE
        END IF

C       fall height, user-specified, m
        HT_FALL = LUPC2( ICMP, SIMTIM, DEPOSIT_AEROSOL_TIME,
     &    DEPOSIT_HEIGHT, DEPOSIT_AEROSOL_COUNT(ICMP) )

        IF ( LEVEL_XNTDEP .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A13,E11.4,A2)')
     &    ' HT_FALL   = ', HT_FALL, ' m'
        END IF

C       height ratio, dimensionless
        IF ( HT_FALL .GT. 0.0 ) THEN
          HT_RATIO = HT_REF / HT_FALL
        ELSE
          HT_RATIO = 0.0
          WRITE(out_unit,'(1X,A32)')
     &    ' WARNING FROM SUBROUTINE XNTDEP!'
          WRITE(out_unit,'(1X,A29,E11.4)')
     &    ' IMPROPER VALUE OF HT_FALL = ', HT_FALL
          WRITE(out_unit,'(1X,A44)')
     &    ' HT_RATIO SET TO ZERO, EXECUTION CONTINUING!'
        END IF

        IF ( LEVEL_XNTDEP .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A13,E11.4)')
     &    ' HT_RATIO  = ', HT_RATIO
        END IF

C       particle density, user-specified, kgm/m3
        RHO_PLE = LUPC2( ICMP, SIMTIM, DEPOSIT_AEROSOL_TIME,
     &    DEPOSIT_PART_DENSITY, DEPOSIT_AEROSOL_COUNT(ICMP) )

        IF ( LEVEL_XNTDEP .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A13,E11.4,A7)')
     &    ' RHO_PLE   = ', RHO_PLE, ' kgm/m3'
        END IF

C       density ratio, dimensionless
        RHO_RATIO = RHO_PLE / RHO_REF

        IF ( LEVEL_XNTDEP .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A13,E11.4)') ' RHO_RATIO = ', RHO_RATIO
        END IF

C       natural deposition coefficient, 1/sec
        DEP(4) = FACTOR * HT_RATIO * RHO_RATIO * AMASS_CON**EXPONE

      END IF
C     end if Henry aerosol DF model is being used

C     ##########################################################
C     ########     POWERS MODEL FOR AEROSOL REMOVAL     ########
C     ######## ONLY APPLIES TO THE CONTAINMENT BUILDING ########
C     ######## OR TO OTHER LARGE VOLUMES LIKE DRYWELLS  ########
C     ##########################################################


C     ############# strategy #2 : user beware #############
C     if Powers aerosol DF model is being used and
      IF ( DEPOSIT_AEROSOL_MODEL(ICMP) .EQ. 3 ) THEN

C       reactor_type, format a3
C       user input from new screen <<==========================[SCREEN!]
C       specify either 'PWR' or 'AWR' or 'BWR'

CSLH    Screen added.

CSLH    REACTOR_TYPE = 'PWR'
CSLH    WRITE(out_unit,'(1X,A52)')
CSLH *  ' SUBROUTINE XNTDEP WARNING! REACTOR_TYPE HARD WIRED!'
    
CSLH    March 21, 1996 - Changed the following if statements because
CSLH    I changed the order and wording of the screen to:

CSLH       PWR - Pressurized Water Reactor
CSLH             Design basis accident

CSLH       PWR - Pressurized Water Reactor
CSLH             Severe accident

CSLH       BWR - Boiling Water Reactor
CSLH             Severe Accident

CSLH    So now the old AWR equals the new PWR DBA the regular PWR and
CSLH    BWR just switched spaces.

        IF ( DEPOSIT_AEROSOL_REACTOR(ICMP) .EQ. 1) THEN
          REACTOR_TYPE = 'PWRDBA'
        ELSE IF ( DEPOSIT_AEROSOL_REACTOR(ICMP) .EQ. 2) THEN
          REACTOR_TYPE = 'PWRSA'
        ELSE IF ( DEPOSIT_AEROSOL_REACTOR(ICMP) .EQ. 3) THEN
          REACTOR_TYPE = 'BWRDBA'
        ELSE IF ( DEPOSIT_AEROSOL_REACTOR(ICMP) .EQ. 4) THEN
          REACTOR_TYPE = 'BWRSA'
        ELSE IF ( DEPOSIT_AEROSOL_REACTOR(ICMP) .EQ. 5) THEN
          REACTOR_TYPE = 'APWRDBA'
        ELSE
          REACTOR_TYPE = '   '
        END IF
        
        IF ( REACTOR_TYPE .EQ. '   ' ) THEN
          WRITE(out_unit,'(1X,A47)')
     &    ' SUBROUTINE XNTDEP! REACTOR_TYPE NOT SPECIFIED!'
        END IF

        IF ( LEVEL_XNTDEP .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A18,E11.4,A3)')
     &    ' DURATION_GAP   = ', DURATION_GAP / 3600.0,   ' hr'
          WRITE(out_unit,'(1X,A18,E11.4,A3)')
     &    ' DURATION_EARLY = ', DURATION_EARLY / 3600.0, ' hr'
          WRITE(out_unit,'(1X,A18,E11.4,A3)')
     &    ' DURATION_EX    = ', DURATION_EX / 3600.0,    ' hr'
          WRITE(out_unit,'(1X,A18,E11.4,A3)')
     &    ' DURATION_LATE  = ', DURATION_LATE / 3600.0,  ' hr'
        END IF


C       uncertainty percentile, format double precision
C       user input from new screen <<==========================[SCREEN!]
C       specify as either 10.0 or 50.0 or 90.0

CSLH    Screen added.

CSLH    PERCENTILE = 50.0
CSLH    WRITE(out_unit,'(1X,A50)')
CSLH *  ' SUBROUTINE XNTDEP WARNING! PERCENTILE HARD WIRED!'

CTJH
CTJH    This stuff is really not percentiles as DAP uses in the 
CTJH    spray models but rather lower bound (10%), best estimate 
CTJH    (50%), and upper bound (90%)
CTJH
        PERCENTILE = DEPOSIT_AEROSOL_PERCENTILE(ICMP)

        IF ( ( PERCENTILE .NE. 10.0 )  .AND.
     &       ( PERCENTILE .NE. 50.0 )  .AND.
     &       ( PERCENTILE .NE. 90.0 ) ) THEN
          WRITE(out_unit,'(1X,A45)')
     &    ' SUBROUTINE XNTDEP! PERCENTILE NOT SPECIFIED!'
        END IF

C       selected output
        IF ( LEVEL_XNTDEP .GE. 4 ) THEN
          WRITE(out_unit,'(1X,A21,A4)')       ' Reactor Type      = ',
     &      REACTOR_TYPE
          WRITE(out_unit,'(1X,A21,F8.1,A3)')  ' Simulation Time   = ',
     &      SIMTIM / HRTOSC,            ' hr'
          WRITE(out_unit,'(1X,A21,F5.1,A2)')  ' Percentile        = ',
     &      PERCENTILE,                 ' %'
          WRITE(out_unit,'(1X,A21,F7.1,A11)') ' Plant Power Level = ',
     &      PLANT_POWER_LEVEL / 1000000.0, ' MW-thermal'
        END IF

C       call subroutine for Powers model for aerosol removal
C       decontamination coefficient returned in units of 1/sec

C         #################################################
          CALL AEROSOL( REACTOR_TYPE, SIMTIM, DELTAT(NSTEP),
     &      PERCENTILE, DECOEFF )
C         #################################################

C       selected output
        IF ( LEVEL_XNTDEP .GE. 4 ) THEN
          WRITE(out_unit,'(1X,A21,E11.4,A6)')
     &    ' Decon Coefficient = ', DECOEFF, ' 1/sec'
          WRITE(out_unit,'(1X,A21,E11.4,A6)')
     &    ' Decon Coefficient = ', DECOEFF * HRTOSC, ' 1/hr '
        END IF

C       natural deposition coefficient, 1/sec
        DEP(4) = DECOEFF
C       global variable used for output
        deposit_lambda(ICMP,4) = DEP(4)

      END IF
C     end if Powers aerosol DF model is being used

      IF ( LEVEL_XNTDEP .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A13,E11.4,A12)')
     &   ' DEP(4)    = ', DEP(4), ' 1/sec, aerosols    '
      END IF

      deposit_lambda(ICMP,5) = DEP(4)
	DEP(5) = DEP(4)

      IF ( LEVEL_XNTDEP .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A13,5E11.4)')
     &   ' DEP(1-5)  = ', DEP(1), DEP(2), DEP(3), DEP(4), DEP(5)
      END IF

C     return to caller
      RETURN

C     end of subroutine XNTDEP
      END
