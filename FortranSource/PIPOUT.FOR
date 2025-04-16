C     ##################################################################
      SUBROUTINE PIPOUT( ICOMP, JPATH, SIMTIM, PIPFL )
      INCLUDE 'full.com'
      INTEGER ICOMP, JPATH
      DOUBLE PRECISION SIMTIM, PIPFL(MAXTGRP)
C     ##################################################################

C     This subroutine calculates the normalized flow out of the given
C     compartment by way of piping for all four transport groups.

C     The removal rates are returned to COEFFS by way of the
C     array PIPFL(MAXTGRP).

C     Subroutine PIPOUT is called in the following cases:
C     (1) user-specified DF's being used
C     (2) Brockmann / Bixler DF's being used

C     Inputs:
C     (1) compartment number
C     (2) pathway number
C     (3) current current time

C     Output:
C     PIPFL, removal rates for all transport groups

C     Reference is "Model Description", LeAnn Adams Miller, 2/25/94

C     Called by:
C     COEFFS, when pathway type is "piping pathway"

C     Calls to:
C     LUPP2

C     ------------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     MODIFIED BY DKM ON 8/24/95 FOR BROCKMANN/BIXLER CODE
C     ------------------------------------------------------------------

      INTEGER II
      DOUBLE PRECISION FLOW, LUPP2

C     Write banner on entry into subroutine.
      IF ( LEVEL_PIPOUT .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A19)') 'SUBROUTINE PIPOUT!'
      END IF

C     ###########################################
C     ########## Effect on noble gases. #########
C     ###########################################

C     There are no removal mechanisms for nobles in the pipe so the
C     transport rate equals the pipe flow rate. The source of the
C     transport rate comes from either the user defined DFs or the
C     Brockmann/Bixler DFs, test for deposition model being on 
C
      IF ( PIPING_AEROSOL_MODEL(JPATH) .LE. 1 ) THEN
C     Flow rate, m3/sec.

        IF ( PIPING_ELEMENTAL_MODEL(JPATH) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE IF ( PIPING_ELEMENTAL_MODEL(JPATH) .EQ. 1 ) THEN
          FLOW = LUPP2( JPATH, SIMTIM, PIPING_TIME,
     &     PIPING_FLOW, PIPING_COUNT(JPATH) )
        END IF
	ELSE
        FLOW = LUPP2( JPATH, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &    BROCK_COUNT(JPATH) )
      END IF

C     Calculate normalized flow rate, 1/sec.

      PIPFL(1) = FLOW / COMPARTMENT_VOLUME(ICOMP)

      IF ( LEVEL_PIPOUT .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A13)') ' Noble gases:'
        WRITE(out_unit,'(1X,A12,E13.4,A7)')
     &  ' FLOW     = ', FLOW, ' m3/sec'
        WRITE(out_unit,'(1X,A20,I2,A4,E13.4,A3)')
     &  ' COMPARTMENT_VOLUME(', ICOMP, ') = ',
     &    COMPARTMENT_VOLUME(ICOMP), ' m3'
        WRITE(out_unit,'(1X,A12,E13.4,A6)')
     &  ' PIPFL(1) = ', PIPFL(1), ' 1/sec'
      END IF

C     ################################################
C     ########## effect on elemental iodine ##########
C     ################################################

      IF ( PIPING_AEROSOL_MODEL(JPATH) .LE. 1 ) THEN
C     flow rate, m3/sec
        IF ( PIPING_ELEMENTAL_MODEL(JPATH) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE IF ( PIPING_ELEMENTAL_MODEL(JPATH) .EQ. 1 ) THEN
          FLOW = LUPP2( JPATH, SIMTIM, PIPING_TIME,
     &      PIPING_FLOW, PIPING_COUNT(JPATH) )
        END IF
      ELSE
        FLOW = LUPP2( JPATH, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &    BROCK_COUNT(JPATH) )
      END IF

C     normalized flow rate, 1/sec
      PIPFL(2) = FLOW / COMPARTMENT_VOLUME(ICOMP)

      IF ( LEVEL_PIPOUT .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A18)') ' Elemental iodine:'
        WRITE(out_unit,'(1X,A12,E13.4,A7)')
     &  ' FLOW     = ', FLOW, ' m3/sec'
        WRITE(out_unit,'(1X,A20,I2,A4,E13.4,A3)')
     &  ' COMPARTMENT_VOLUME(', ICOMP, ') = ',
     &    COMPARTMENT_VOLUME(ICOMP), ' m3'
        WRITE(out_unit,'(1X,A12,E13.4,A6)')
     &  ' PIPFL(2) = ', PIPFL(2), ' 1/sec'
      END IF

C     ##############################################
C     ########## effect on organic iodine ##########
C     ##############################################

      IF ( PIPING_AEROSOL_MODEL(JPATH) .LE. 1 ) THEN
C     flow rate, m3/sec
        IF ( PIPING_ORGANIC_MODEL(JPATH) .EQ. 0 ) THEN
          FLOW = 0.0
        ELSE IF ( PIPING_ORGANIC_MODEL(JPATH) .EQ. 1 ) THEN
          FLOW = LUPP2( JPATH, SIMTIM, PIPING_TIME,
     &      PIPING_FLOW, PIPING_COUNT(JPATH) )
        END IF
      ELSE
        FLOW = LUPP2( JPATH, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &    BROCK_COUNT(JPATH) )
      END IF

C     normalized flow rate, 1/sec
      PIPFL(3) = FLOW / COMPARTMENT_VOLUME(ICOMP)

      IF ( LEVEL_PIPOUT .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A16)') ' Organic iodine:'
        WRITE(out_unit,'(1X,A12,E13.4,A7)')
     &  ' FLOW     = ', FLOW, ' m3/sec'
        WRITE(out_unit,'(1X,A20,I2,A4,E13.4,A3)')
     &  ' COMPARTMENT_VOLUME(', ICOMP, ') = ',
     &    COMPARTMENT_VOLUME(ICOMP), ' m3'
        WRITE(out_unit,'(1X,A12,E13.4,A6)')
     &  ' PIPFL(3) = ', PIPFL(3), ' 1/sec'
      END IF

C     ########################################
C     ########## effect on aerosols ##########
C     ########################################

C     flow rate, m3/sec
      IF ( PIPING_AEROSOL_MODEL(JPATH) .EQ. 0 ) THEN
        FLOW = 0.0
      ELSE IF ( PIPING_AEROSOL_MODEL(JPATH) .EQ. 1 ) THEN
        FLOW = LUPP2( JPATH, SIMTIM, PIPING_TIME,
     &    PIPING_FLOW, PIPING_COUNT(JPATH) )
      ELSE IF ( PIPING_AEROSOL_MODEL(JPATH) .GT. 1 ) THEN
        FLOW = LUPP2( JPATH, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &    BROCK_COUNT(JPATH) )
      END IF

C     normalized flow rate, 1/sec
      PIPFL(4) = FLOW / COMPARTMENT_VOLUME(ICOMP)

      IF ( LEVEL_PIPOUT .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A10)') ' Aerosols:'
        WRITE(out_unit,'(1X,A12,E13.4,A7)')
     &  ' FLOW     = ', FLOW, ' m3/sec'
        WRITE(out_unit,'(1X,A20,I2,A4,E13.4,A3)')
     &  ' COMPARTMENT_VOLUME(', ICOMP, ') = ',
     &    COMPARTMENT_VOLUME(ICOMP), ' m3'
        WRITE(out_unit,'(1X,A12,E13.4,A6)')
     &  ' PIPFL(4) = ', PIPFL(4), ' 1/sec'
      END IF

      PIPFL(5) = PIPFL(4)

C     output for all five transport groups
      IF ( LEVEL_PIPOUT .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,E11.4,3E13.4,A7)')
     &  ' PIPFL    = ', (PIPFL(II),II=1,MAXTGRP), '  1/sec'
      END IF

      RETURN

      END
