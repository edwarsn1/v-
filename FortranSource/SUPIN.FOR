C     VERSION CREATED FOR TESTING ON 16 JUNE 1995

C     ##################################################################
      SUBROUTINE SUPIN( ICOMP, JAYPEE, SIMTIM, SUPFIN )
C     ##################################################################

C     This subroutine calculates the removal coefficient for material
C     flowing into a compartment through a generic path. 

C     The user must specify DF's for elemental iodine, organic iodine     
C     and all aerosols if pathway_type(jaypee)= 3 was chosen.
C
C     The user must specify DF's for elemental iodine, organic iodine     
C     and all aerosols if pathway_type(jaypee)= 6 was chosen.

C     Inputs:
C     (1) compartment number
C     (2) pathway number
C     (3) current simulation time

C     Output:
C     SUPFIN, removal coeffients for the four transport groups
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol
C         if pathway_type(jaypee)= 3 was chosen
C
C     SUPFIN, removal coeffients for the four transport groups
C     (1) nobles, (2) all iodine, (3) empty, 
C     (4) iodine aerosol  (5) all aerosol 
C         if pathway_type(jaypee)= 6 was chosenC

C     -----------------------------------------------------------------
C     CREATED BY LAM MARCH 1994
C     TESTED BY DKM JULY 1995
C     MODIFIED BY TJH DEC 2005 TO ALLOW NON I AEROSOLS TO BE A SEPARATE DF
C     -----------------------------------------------------------------

C     include statement
      INCLUDE 'full.com'

      INTEGER ICOMP, II
      INTEGER JAYPEE

      double precision SIMTIM, GMTOMS
      double precision FLOW, DF, LUPP2
      double precision SUPFIN(MAXTGRP)

CTJH  code added by TJH in October 1995

C        Lines previously from cptran.inc. The other files that
C        previously included this file, also now contain these lines.

C        transport groups removed from compartment atmospheres
C        and deposited into other compartment sub-locations
C        assignments for ctran (compartments):

C        ctran(comp,1,tg)     not defined      atmosphere, revol'n
C        ctran(comp,2,tg)     sprays           comp sump
C        ctran(comp,3,tg)     not defined      comp opool
C        ctran(comp,4,tg)     nat dep          dep surfaces
C        ctran(comp,5,tg)     recirc filter    comp filter

C        transport groups deposited in pathways
C        assignments for ptran (pathways):

C     Pathway Types
C     ptran(Path,1,Group)     pipe walls
C     ptran(Path,2,Group)     pathway filters
C     ptran(Path,3,Group)     s-pool
C     ptran(Path,4,Group)     no accumulation
C     ptran(Path,5,Group)     not defined      
C
C     GROUP is the transport group (ITG) 1= nobels, 2= I2_elem
C      3 = HI or CH3I_organic, 4 = CsI aerosol and 5 = other aerosols
C
C     pthgrp(Group, Path, Step)

CTJH     Code added by TJH in October 1995.

      double precision ctran(MAXCOMP, MAXCLOC, MAXTGRP)
      double precision ptran(MAXPATH, MAXPLOC, MAXTGRP)
      double precision frac_out(MAXTGRP,MAXPATH)
	double precision xoq_now(MAX_XQS)

      common / cptran / ctran, ptran, frac_out, xoq_now

C        included into following subroutines
C        radcalc             sourcep             coeffs
C        filtin              pipin               supin

C        End of cptran.inc lines.

C
C TJH  modified call to LUPP2 to use subscript for number of entries
C      modified to include flow conversion from gpm to m3/sec
C      modified to include noble gas transport through the 
C              suppression pool with out retention
C

C     conversion factor, gal/min to m3/sec
      GMTOMS = 6.3090E-05
C
C     write banner on entry into subroutine
      IF ( LEVEL_SUPIN .GE. 1 ) THEN
        write(out_unit,'(1X,A17)') 'SUBROUTINE SUPIN!'
      END IF

C     ########## transport rate for noble gases #########

CTJH  Note: It is being assumed that there is no 
C     retention of noble gases by the suppression pool
C     and that the noble gas flow is input when any of the others is avaialable.

      FLOW = 0.0
      IF (SP_NOBELGAS_COUNT(JAYPEE) .GE. 1) THEN
C
C       flow rate, m3/sec
        FLOW = GMTOMS * LUPP2( JAYPEE, SIMTIM, SP_AEROSOL_TIME,
     &               SP_NOBELGAS_FLOW_RATE, SP_NOBELGAS_COUNT(JAYPEE))
      END IF

C     No Nobel Gas decontamination (DF=1)

      SUPFIN(1) = FLOW / COMPARTMENT_VOLUME(ICOMP)
C     transport rate of noble gases, 1/sec    
      PTRAN(JAYPEE,3,1) = 0.0

      IF ( LEVEL_SUPIN .GE. 3 ) THEN
        write(out_unit,'(1X,A13,E11.4,A6)')
     &  ' SUPFIN(1) = ', SUPFIN(1), ' 1/sec'
        write(out_unit,'(1X,A13,E11.4,A6)')
     &  ' PTRAN(1)  = ', PTRAN(JAYPEE,3,1), ' 1/sec'
      END IF
C
C    ###################################################################
C
	IF (PATHWAY_TYPE(JAYPEE) .EQ. 3) THEN

C     ########## transport rate for elemental iodine ##########

        FLOW = 0.0

C     if value is user-specified then
        IF ( SP_ELEMENTAL_MODEL(JAYPEE) .EQ. 1 ) THEN

C       flow rate, m3/sec
          FLOW = GMTOMS * LUPP2( JAYPEE, SIMTIM, SP_ELEMENTAL_TIME,
     &               SP_ELEMENTAL_FLOW_RATE, SP_ELEMENTAL_COUNT(JAYPEE))

C       decontamination factor, non-dim
          DF = LUPP2( JAYPEE, SIMTIM, SP_ELEMENTAL_TIME, 
     &               SP_ELEMENTAL_DF, SP_ELEMENTAL_COUNT(JAYPEE) )

C       transport rate, 1/sec
          SUPFIN(2) = FLOW / COMPARTMENT_VOLUME(ICOMP) / DF

CTJH    added on 19 October 1995
C       retention rate, 1/sec
          PTRAN(JAYPEE,3,2) =
     &      FLOW / COMPARTMENT_VOLUME(ICOMP) * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_SUPIN .GE. 3 ) THEN
            write(out_unit,'(1X,A13,E11.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            write(out_unit,'(1X,A13,E11.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' SUPFIN(2) = ', SUPFIN(2), ' 1/sec'
          write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' PTRAN(2)  = ', PTRAN(JAYPEE,3,2), ' 1/sec'
          END IF

C     else if value to be obtained from model then
        ELSE IF ( SP_ELEMENTAL_MODEL(JAYPEE) .EQ. 2 ) THEN

C       output error message
          write(out_unit,'(1X,A26)') 'ERROR IN SUBROUTINE SUPIN!'
          write(out_unit,'(1X,A49)')
     &     'MODEL FOR ELEMENTAL IODINE REMOVAL NOT AVAILABLE!'
C       perform hard termination of program
          write(*,*) '***********    S T O P - 1  *******************'
          GO TO 100 

        END IF
C     end if value is user-specified

C     ########## transport rate for organic iodine ##########
c

        FLOW = 0.0
C     if value is user-specified then
        IF ( SP_ORGANIC_MODEL(JAYPEE) .EQ. 1 ) THEN

C       flow rate, m3/sec
          FLOW = GMTOMS * LUPP2( JAYPEE, SIMTIM, SP_ORGANIC_TIME,
     &               SP_ORGANIC_FLOW_RATE, SP_ORGANIC_COUNT(JAYPEE))

C       decontamination factor, non-dim
          DF = LUPP2( JAYPEE, SIMTIM, SP_ORGANIC_TIME, 
     &               SP_ORGANIC_DF, SP_ORGANIC_COUNT(JAYPEE) )

C       transport rate, 1/sec
          SUPFIN(3) = FLOW / COMPARTMENT_VOLUME(ICOMP) / DF

CTJH    added on 19 October 1995
C       retention rate, 1/sec
          PTRAN(JAYPEE,3,3) =
     &      FLOW / COMPARTMENT_VOLUME(ICOMP) * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_SUPIN .GE. 3 ) THEN
            write(out_unit,'(1X,A13,E11.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            write(out_unit,'(1X,A13,E11.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' SUPFIN(3) = ', SUPFIN(3), ' 1/sec'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' PTRAN(3)  = ', PTRAN(JAYPEE,3,3), ' 1/sec'
          END IF

C     else if value to be obtained from model then
        ELSE IF ( SP_ORGANIC_MODEL(JAYPEE) .EQ. 2 ) THEN

C       output error message
          write(out_unit,'(1X,A26)') 'ERROR IN SUBROUTINE SUPIN!'
          write(out_unit,'(1X,A47)')
     &     'MODEL FOR ORGANIC IODINE REMOVAL NOT AVAILABLE!'
C       perform hard termination of program
          write(*,*) '***********    S T O P - 2  *******************'
          GO TO 100

        END IF
C     end if value is user-specified

C     ########## transport rate for aerosols ##########

        FLOW = 0.0
C     if value is user-specified then
        IF ( SP_AEROSOL_MODEL(JAYPEE) .EQ. 1 ) THEN

C       flow rate, m3/sec
          FLOW = GMTOMS * LUPP2( JAYPEE, SIMTIM, SP_AEROSOL_TIME,
     &               SP_AEROSOL_FLOW_RATE, SP_AEROSOL_COUNT(JAYPEE))

C       decontamination factor, non-dim
          DF = LUPP2( JAYPEE, SIMTIM, SP_AEROSOL_TIME, SP_AEROSOL_DF,
     &               SP_AEROSOL_COUNT(JAYPEE) )

C       transport rate for aerosols, 1/sec
          SUPFIN(4) = FLOW / COMPARTMENT_VOLUME(ICOMP) / DF

CTJH    added on 19 October 1995
C       retention rate for aerosols, 1/sec
          PTRAN(JAYPEE,3,4) =
     &      FLOW / COMPARTMENT_VOLUME(ICOMP) * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_SUPIN .GE. 3 ) THEN
            write(out_unit,'(1X,A13,E11.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            write(out_unit,'(1X,A13,E11.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' SUPFIN(4) = ', SUPFIN(4), ' 1/sec'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' PTRAN(4)  = ', PTRAN(JAYPEE,3,4), ' 1/sec'
          END IF

C     else if value obtained from model then
        ELSE IF ( SP_AEROSOL_MODEL(JAYPEE) .EQ. 2 ) THEN

C       output error message
          write(out_unit,'(1X,A26)') 'ERROR IN SUBROUTINE SUPIN!'
          write(out_unit,'(1X,A40)')
     &     'MODEL FOR AEROSOL REMOVAL NOT AVAILABLE!'
C       perform hard termination of program
          write(*,*) '***********    S T O P - 3   *******************'
          GO TO 100

        END IF
C     end if value is user-specified
C
C   Non-Iodine Aerosols
C
        SUPFIN(5) = SUPFIN(4)
        PTRAN(JAYPEE,3,5) = PTRAN(JAYPEE,3,4)

        IF ( LEVEL_SUPIN .GE. 2 ) THEN
          write(out_unit,'(1X,A10,5E13.4,A6)')
     &    ' SUPFIN = ', (SUPFIN(II),II=1,MAXTGRP), ' 1/sec'
          write(out_unit,'(1X,A10,5E11.4,A6)')
     &    ' PTRAN  = ', (PTRAN(JAYPEE,3,II),II=1,MAXTGRP), ' 1/sec'
        END IF

C
C    ###################################################################
C
      ELSE IF (PATHWAY_TYPE(JAYPEE) .EQ. 6) THEN 

C     ########## transport rate for ALL iodine ##########

        FLOW = 0.0

C     if value is user-specified then
          IF ( SP_ELEMENTAL_MODEL(JAYPEE) .EQ. 1 ) THEN

C       flow rate, m3/sec
          FLOW = GMTOMS * LUPP2( JAYPEE, SIMTIM, SP_ELEMENTAL_TIME,
     &               SP_ELEMENTAL_FLOW_RATE, SP_ELEMENTAL_COUNT(JAYPEE))

C       decontamination factor, non-dim
          DF = LUPP2( JAYPEE, SIMTIM, SP_ELEMENTAL_TIME, 
     &               SP_ELEMENTAL_DF, SP_ELEMENTAL_COUNT(JAYPEE) )

C       Elemental Iodine
C       transport rate, 1/sec
          SUPFIN(2) = FLOW / COMPARTMENT_VOLUME(ICOMP) / DF

CTJH    added on 19 October 1995
C       retention rate, 1/sec
          PTRAN(JAYPEE,3,2) =
     &      FLOW / COMPARTMENT_VOLUME(ICOMP) * ( 1.0 - 1.0 / DF )
C
C       Organic Iodine 
C
        SUPFIN(3) = SUPFIN(2)
        PTRAN(JAYPEE,3,3) = PTRAN(JAYPEE,3,2)
C
C       Iodine Aerosol
C
        SUPFIN(4) = SUPFIN(2)
        PTRAN(JAYPEE,3,4) = PTRAN(JAYPEE,3,2)
C
          IF ( LEVEL_SUPIN .GE. 3 ) THEN
            write(out_unit,'(1X,A13,E11.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            write(out_unit,'(1X,A13,E11.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' SUPFIN(2) = ', SUPFIN(2), ' 1/sec'
          write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' PTRAN(2)  = ', PTRAN(JAYPEE,3,2), ' 1/sec'
          END IF

C     else if value to be obtained from model then
        ELSE IF ( SP_ELEMENTAL_MODEL(JAYPEE) .EQ. 2 ) THEN

C       output error message
          write(out_unit,'(1X,A26)') 'ERROR IN SUBROUTINE SUPIN!'
          write(out_unit,'(1X,A49)')
     &     'MODEL FOR  IODINE REMOVAL NOT AVAILABLE!'
C       perform hard termination of program
          write(*,*) '***********    S T O P - 4    *******************'
          GO TO 100

        END IF



C     ########## transport rate for non iodine aerosols ##########

        FLOW = 0.0
C     if value is user-specified then
        IF ( SP_AEROSOL_MODEL(JAYPEE) .EQ. 1 ) THEN

C       flow rate, m3/sec
          FLOW = GMTOMS * LUPP2( JAYPEE, SIMTIM, SP_AEROSOL_TIME,
     &                SP_AEROSOL_FLOW_RATE, SP_AEROSOL_COUNT(JAYPEE))

C       decontamination factor, non-dim
          DF = LUPP2( JAYPEE, SIMTIM, SP_AEROSOL_TIME, SP_AEROSOL_DF,
     &               SP_AEROSOL_COUNT(JAYPEE) )

C       transport rate for aerosols, 1/sec
          SUPFIN(5) = FLOW / COMPARTMENT_VOLUME(ICOMP) / DF

CTJH    added on 19 October 1995
C       retention rate for aerosols, 1/sec
          PTRAN(JAYPEE,3,5) =
     &      FLOW / COMPARTMENT_VOLUME(ICOMP) * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_SUPIN .GE. 3 ) THEN
            write(out_unit,'(1X,A13,E11.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            write(out_unit,'(1X,A13,E11.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' SUPFIN(5) = ', SUPFIN(5), ' 1/sec'
            write(out_unit,'(1X,A13,E11.4,A6)')
     &      ' PTRAN(5)  = ', PTRAN(JAYPEE,3,5), ' 1/sec'
          END IF

C     else if value obtained from model then
        ELSE IF ( SP_AEROSOL_MODEL(JAYPEE) .EQ. 2 ) THEN

C       output error message
          write(out_unit,'(1X,A26)') 'ERROR IN SUBROUTINE SUPIN!'
          write(out_unit,'(1X,A40)')
     &     'MODEL FOR AEROSOL REMOVAL NOT AVAILABLE!'
C       perform hard termination of program
          write(*,*) '***********    S T O P - 5   *******************'
          GO TO 100

        END IF
C     end if value is user-specified

	END IF
C
C    ####################################################################
C     return to caller
      RETURN
C
  100 CONTINUE

C      *****************    S T O P   ***************************
      STOP 

C     end of subroutine SUPIN
      END
