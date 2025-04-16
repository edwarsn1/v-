C     VERSION RESULTING FROM MODIFICATIONS BY DKM ON 07 NOVEMBER 1995

C     ##################################################################
      SUBROUTINE PIPIN( JAYPEE, SIMTIM, PIPFIN )
      INCLUDE 'full.com'
      INTEGER JAYPEE
      DOUBLE PRECISION SIMTIM, PIPFIN(MAXTGRP)
C     ##################################################################

C     This subroutine calculates the removal rate for material flowing
C     into a compartment by way of a pipeway. There is no effect upon
C     noble gases.

C     The user specifies the flow rate the transport groups. 
C     In addition, the user may specify the DF's for
C     these same transport groups, or, request that they be obtained
C     using the Brockmann/Bixler algorithms.

C     Inputs:
C     (1) pathway number
C     (2) current simulation time

C     Output:
C     PIPFIN, removal rates for all transport groups

C     Calls to:
C     BIXLER1    DF for elemental iodine
C     BIXLER3    DF for organic iodine
C     BROCK      DF for aerosols

C     notes:
C        no decontamination occurs for nobles, so there is no subroutine
C        to be called for this transport group a subroutine for the
C        deconamination of HOI (iodous acid) was begun,
C        and was called BIXLER2; it is not used because the effects of
C        HOI are believed to be neglibible

C     Reference is "Model Description", LeAnn Adams Miller, 2/25/94

C     -----------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     MODIFIED BY DKM ON 8/24/95 FOR BROCKMANN/BIXLER CODE
C     -----------------------------------------------------------------

      INTEGER II
      DOUBLE PRECISION COMP_VOL, FLOW, DF
      DOUBLE PRECISION LUPP2

CTJH  code added by TJH on 19 October 1995

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

C        ptran(path,1,tg)     pipe loss        pipe walls
C        ptran(path,2,tg)     filter loss      pathway filters
C        ptran(path,3,tg)     s-pool loss      s-pool
C        ptran(path,4,tg)     nat convect      no accumulation
C        ptran(path,5,tg)     not defined      -----------

CTJH     Code added by TJH on 19 October 1995.

      double precision ctran(MAXCOMP, MAXCLOC, MAXTGRP)
      double precision ptran(MAXPATH, MAXPLOC, MAXTGRP)
      double precision frac_out(MAXTGRP,MAXPATH)
	double precision xoq_now(MAX_XQS)

      common / cptran / ctran, ptran, frac_out, xoq_now

C        included into following subroutines
C        radcalc             sourcep             coeffs
C        filtin              pipin               supin

C        End of cptran.inc lines.

C     write banner on entry into subroutine
      IF ( LEVEL_PIPIN .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A18)') 'SUBROUTINE PIPIN!'
      END IF

C     compartment volume, m3
      COMP_VOL = COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))

      IF ( LEVEL_PIPIN .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A30)')
     &  ' Volume of "from-compartment":'
        WRITE(out_unit,'(1X,A13,E13.4,A3)')
     &  ' COMP_VOL  = ', COMP_VOL, ' m3'
      END IF

C     #################################################
C     ########## coefficient for noble gases ##########
C     #################################################

C     If no decontamination then:
C     Using the aerosol model values for noble gases for convenience
C
      IF ( PIPING_AEROSOL_MODEL(JAYPEE) .EQ. 0 ) THEN
C       Flow rate, m3/sec.
        FLOW = 0.0

C     If user-specified DF then:
      ELSE IF ( PIPING_AEROSOL_MODEL(JAYPEE) .EQ. 1 ) THEN
C       Flow rate, m3/sec.
        IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE
          FLOW = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &      PIPING_FLOW, PIPING_COUNT(JAYPEE) )
        END IF
C     If Brockmann-Bixler models specified
      ELSE IF ( PIPING_AEROSOL_MODEL(JAYPEE) .GE. 2 ) THEN
C       Flow rate, m3/sec.
        IF ( BROCK_COUNT(JAYPEE) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE
          FLOW = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &      BROCK_COUNT(JAYPEE) )
        END IF

      END IF

C       decontamination factor, non-dim
        DF = 1.0

C     Transport rate is for all forms (1/sec)
        PIPFIN(1) = FLOW / COMP_VOL 
          
C     Retention rate in pathway, 1/sec.

        PTRAN(JAYPEE,1,1) = 0.0

C       transport rate for elemental iodine, 1/sec
       
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A28)')
     &   ' Nobles, no decontamination:'
        WRITE(out_unit,'(1X,A13,E13.4,A7,A28)')
     &   ' FLOW      = ', FLOW, ' m3/sec',
     &   '    set to zero, temporarily'
        WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &   ' DF        = ', DF, ' non-dim'
        WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &   ' PIPFIN(1) = ', PIPFIN(1), ' 1/sec'
        WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &   ' PTRAN(1)  = ', PTRAN(JAYPEE,1,1), ' 1/sec'
      END IF

C     ######################################################
C     ########## coefficient for elemental iodine ##########
C     ######################################################

      IF ( PIPING_AEROSOL_MODEL(JAYPEE) .LE. 1 ) THEN

C     if no decontamination then
        IF ( PIPING_ELEMENTAL_MODEL(JAYPEE) .EQ. 0 ) THEN

C       flow rate, m3/sec
          IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
            FLOW = 0.0
          ELSE
            FLOW = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &        PIPING_FLOW, PIPING_COUNT(JAYPEE) )
          END IF

C       decontamination factor, non-dim
          DF = 1.0

C       transport rate for elemental iodine, 1/sec
          PIPFIN(2) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
          PTRAN(JAYPEE,1,2) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_PIPIN .GE. 3 ) THEN
            WRITE(out_unit,'(1X,A38)')
     &      ' Elemental iodine, no decontamination:'
            WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &      ' PIPFIN(2) = ', PIPFIN(2), ' 1/sec'
            WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &      ' PTRAN(2)  = ', PTRAN(JAYPEE,1,2), ' 1/sec'
          END IF

        ELSE IF ( PIPING_ELEMENTAL_MODEL(JAYPEE) .EQ. 1 ) THEN

C     if user-specified DF then 

C       flow rate, m3/sec
          IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
            FLOW = 0.0
          ELSE
            FLOW = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &        PIPING_FLOW, PIPING_COUNT(JAYPEE) )
          END IF

C       decontamination factor, non-dim
          IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
            DF = 1.0
          ELSE
            DF = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &        PIPING_ELEMENTAL_DF, PIPING_COUNT(JAYPEE) )
          END IF

C       error checking with reset
          IF ( DF .LT. 1.0 ) THEN
            DF = 1.0
          END IF

C       transport rate for elemental iodine, 1/sec
          PIPFIN(2) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
          PTRAN(JAYPEE,1,2) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_PIPIN .GE. 3 ) THEN
            WRITE(out_unit,'(1X,A37)')
     &      ' Elemental iodine, user-specified DF:'
            WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &     ' DF        = ', DF, ' non-dim'
            WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &      ' PIPFIN(2) = ', PIPFIN(2), ' 1/sec'
           WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &     ' PTRAN(2)  = ', PTRAN(JAYPEE,1,2), ' 1/sec'
          END IF
        END IF

      ELSE

C       flow rate, m3/sec
        IF ( BROCK_COUNT(JAYPEE) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE
          FLOW = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &      BROCK_COUNT(JAYPEE) )
        END IF

        DF = 1
	  IF (PIPING_ELEMENTAL_MODEL(JAYPEE) .GT. 1) THEN 
C       decontamination factor from Bixler model, non-dim

           CALL BIXLER1( JAYPEE, SIMTIM, DF )
        END IF

C       error checking with reset
        IF ( DF .LT. 1.0 ) THEN
          DF = 1.0
        END IF
C
C   code added by TJH (11/00) to allow edits of piping losses
C
        BROCK_OUTPUT(JAYPEE,6) = 1.0 - 1.0/DF
	  BROCK_OUTPUT(JAYPEE,7) = DF
C
C       transport rate for elemental iodine, 1/sec
        PIPFIN(2) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
        PTRAN(JAYPEE,1,2) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

        IF ( LEVEL_PIPIN .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A39)')
     &     ' Elemental iodine, Brockmann/Bixler DF:'
          WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &    ' FLOW      = ', FLOW, ' m3/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &    ' DF        = ', DF, ' non-dim'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PIPFIN(2) = ', PIPFIN(2), ' 1/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PTRAN(2)  = ', PTRAN(JAYPEE,1,2), ' 1/sec'
        END IF

      END IF
C     end if value is user-specified

C     ####################################################
C     ########## coefficient for organic iodine ##########
C     ####################################################

      IF ( PIPING_AEROSOL_MODEL(JAYPEE) .LE. 1 ) THEN

C     if no decontamination then
        IF ( PIPING_ORGANIC_MODEL(JAYPEE) .EQ. 0 ) THEN

C       flow rate, m3/sec
          IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
            FLOW = 0.0
          ELSE
            FLOW = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &        PIPING_FLOW, PIPING_COUNT(JAYPEE) )
          END IF

C       decontamination factor, non-dim
          DF = 1.0

C       transport rate for organic iodine, 1/sec
          PIPFIN(3) = FLOW / COMP_VOL  / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
          PTRAN(JAYPEE,1,3) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_PIPIN .GE. 3 ) THEN
            WRITE(out_unit,'(1X,A36)')
     &      ' Organic iodine, no decontamination:'
            WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &      ' PIPFIN(3) = ', PIPFIN(3), ' 1/sec'
            WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &      ' PTRAN(3)  = ', PTRAN(JAYPEE,1,3), ' 1/sec'
          END IF

        ELSE IF ( PIPING_ORGANIC_MODEL(JAYPEE) .EQ. 1 ) THEN
C     if user-specified DF then

C       flow rate, m3/sec
          IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
            FLOW = 0.0
          ELSE
            FLOW = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &        PIPING_FLOW, PIPING_COUNT(JAYPEE) )
          END IF

C       decontamination factor, non-dim
          IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
            DF = 1.0
          ELSE
            DF = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &        PIPING_ORGANIC_DF, PIPING_COUNT(JAYPEE) )
          END IF

C       error checking with reset
          IF ( DF .LT. 1.0 ) THEN
            DF = 1.0
          END IF

C       transport rate for organic iodine, 1/sec
          PIPFIN(3) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
          PTRAN(JAYPEE,1,3) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

          IF ( LEVEL_PIPIN .GE. 3 ) THEN
            WRITE(out_unit,'(1X,A35)')
     &      ' Organic iodine, user-specified DF:'
            WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &      ' FLOW      = ', FLOW, ' m3/sec'
            WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &      ' DF        = ', DF, ' non-dim'
            WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &      ' PIPFIN(3) = ', PIPFIN(3), ' 1/sec'
            WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &      ' PTRAN(3)  = ', PTRAN(JAYPEE,1,3), ' 1/sec'
          END IF
        END IF

      ELSE

C     if Brockmann/Bixler DF then

C       flow rate, m3/sec
        IF ( BROCK_COUNT(JAYPEE) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE
          FLOW = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &      BROCK_COUNT(JAYPEE) )
        END IF
        
	  DF = 1

        IF (PIPING_ORGANIC_MODEL(JAYPEE) .GT. 1) THEN
C       decontamination coefficient from Bixler model, non-dim

              CALL BIXLER3( JAYPEE, SIMTIM, DF )
        END IF
C       error checking with reset
        IF ( DF .LT. 1.0 ) THEN
          DF = 1.0
        END IF
C
C   code added by TJH (11/00) to allow edits of piping losses
C
        BROCK_OUTPUT(JAYPEE,8) = 1.0 - 1.0/DF
	  BROCK_OUTPUT(JAYPEE,9) = DF
C
C       transport rate for elemental iodine, 1/sec
        PIPFIN(3) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
        PTRAN(JAYPEE,1,3) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

        IF ( LEVEL_PIPIN .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A37)')
     &     ' Organic iodine, Brockmann/Bixler DF:'
          WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &    ' FLOW      = ', FLOW, ' m3/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &    ' DF        = ', DF, ' non-dim'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PIPFIN(3) = ', PIPFIN(3), ' 1/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PTRAN(3)  = ', PTRAN(JAYPEE,1,3), ' 1/sec'
        END IF

      END IF

C     ##############################################
C     ########## coefficient for aerosols ##########
C     ##############################################

C     if no decontamination then
      IF ( PIPING_AEROSOL_MODEL(JAYPEE) .EQ. 0 ) THEN

C       flow rate, m3/sec
        IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE
          FLOW = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &      PIPING_FLOW, PIPING_COUNT(JAYPEE) )
        END IF

C       decontamination factor, non-dim
        DF = 1.0

C       transport rate for aerosols, 1/sec
        PIPFIN(4) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
        PTRAN(JAYPEE,1,4) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

        IF ( LEVEL_PIPIN .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A30)')
     &    ' Aerosols, no decontamination:'
          WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &    ' FLOW      = ', FLOW, ' m3/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &    ' DF        = ', DF, ' non-dim'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PIPFIN(4) = ', PIPFIN(4), ' 1/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PTRAN(4)  = ', PTRAN(JAYPEE,1,4), ' 1/sec'
        END IF

      ELSE

C     if user-specified DF then
     *IF ( PIPING_AEROSOL_MODEL(JAYPEE) .EQ. 1 ) THEN

C       flow rate, m3/sec
        IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE
          FLOW = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &      PIPING_FLOW, PIPING_COUNT(JAYPEE) )
        END IF

C       decontamination factor, non-dim
        IF ( PIPING_COUNT(JAYPEE) .EQ. 0 ) THEN
          DF = 1.0
        ELSE
          DF = LUPP2( JAYPEE, SIMTIM, PIPING_TIME,
     &      PIPING_AEROSOL_DF, PIPING_COUNT(JAYPEE) )
        END IF

C       error checking with reset
        IF ( DF .LT. 1.0 ) THEN
          DF = 1.0
        END IF

C       transport rate for aerosols, 1/sec
        PIPFIN(4) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
        PTRAN(JAYPEE,1,4) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

        IF ( LEVEL_PIPIN .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A29)')
     &    ' Aerosols, user-specified DF:'
          WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &    ' FLOW      = ', FLOW, ' m3/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &    ' DF        = ', DF, ' non-dim'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PIPFIN(4) = ', PIPFIN(4), ' 1/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PTRAN(4)  = ', PTRAN(JAYPEE,1,4), ' 1/sec'
        END IF

      ELSE

C     if Brockmann/Bixler DF then
     *IF ( PIPING_AEROSOL_MODEL(JAYPEE) .GT. 1 ) THEN

C       flow rate, m3/sec
        IF ( BROCK_COUNT(JAYPEE) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE
          FLOW = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &      BROCK_COUNT(JAYPEE) )
        END IF

C       deconatamination factor from Brockmann model, non-dim
        CALL BROCK( JAYPEE, SIMTIM, DF )

C       error checking with reset
        IF ( DF .LT. 1.0 ) THEN
          DF = 1.0
        END IF
C
C   code added by TJH (11/00) to allow edits of piping losses
C
	  BROCK_OUTPUT(JAYPEE,5) = DF
C
C       transport rate for aerosols, 1/sec
        PIPFIN(4) = FLOW / COMP_VOL / DF

CTJH    code added by TJH on 19 October 1995
C       retention rate in pathway, 1/sec
        PTRAN(JAYPEE,1,4) = FLOW / COMP_VOL * ( 1.0 - 1.0 / DF )

        IF ( LEVEL_PIPIN .GE. 3 ) THEN
          WRITE(out_unit,'(1X,A31)')
     &    ' Aerosols, Brockmann/Bixler DF:'
          WRITE(out_unit,'(1X,A13,E13.4,A7)')
     &    ' FLOW      = ', FLOW, ' m3/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A8)')
     &    ' DF        = ', DF, ' non-dim'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PIPFIN(4) = ', PIPFIN(4), ' 1/sec'
          WRITE(out_unit,'(1X,A13,E13.4,A6)')
     &    ' PTRAN(4)  = ', PTRAN(JAYPEE,1,4), ' 1/sec'
        END IF

      END IF
C     end if value is user-specified

      PIPFIN(5) = PIPFIN(4)
	PTRAN(JAYPEE,1,5) =PTRAN(JAYPEE,1,4)

C     write values of pipfin for all four transport groups
      IF ( LEVEL_PIPIN .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,E11.4,4E13.4,A7)')
     &  ' PIPFIN   = ', (PIPFIN(II),II=1,MAXTGRP), '  1/sec'
      END IF

      RETURN

      END
