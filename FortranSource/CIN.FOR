C     VERSION CREATED FOR TESTING ON 16 JUNE 1995

C     ##################################################################
      SUBROUTINE CIN( JAYPEE, SIMTIM, CLIN )
C     ##################################################################

C     This subroutine calculates the normalized flow into the compartment
C     due to convection (air leakage). The user specifies the compartment 
C     volume and the volumetric flow rate between the compartments. These 
C     values are returned in CLIN(4).

C     Inputs:
C     (1) number of pathway to current compartment
C     (2) simulation time

C     Output:
C     CLIN(), the removal coefficient for the transport group, 1/sec
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol

C     Called by:
C     COEFFS

C     Calls to:
C     LUPP2

C     ------------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     CREATED BY DKM ON 16 JUNE 1995
C     ------------------------------------------------------------------

C     include statements
      INCLUDE 'full.com'

      INTEGER II
      INTEGER JAYPEE
      INTEGER KTG

      double precision CONVERT
      double precision SIMTIM
      double precision FLOW
      double precision LUPP2
      double precision CLIN(MAXTGRP)

C     conversion factor, 1/sec to pct/day
      CONVERT = 100.0 * 24.0 * 3600.0

      IF ( LEVEL_CIN .GE. 1 ) THEN
        write(out_unit,'(1X,A15)') 'SUBROUTINE CIN!'
      END IF

C     flow rate into compartment, user-specified, 1/sec
      FLOW = LUPP2( JAYPEE, SIMTIM, CONVECTION_TIME,
     *  CONVECTION_FLOW_RATE, CONVECTION_COUNT(JAYPEE) )

      IF ( LEVEL_CIN .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A18,I8)')
     *   ' PATHWAY NUMBER = ', JAYPEE          
        WRITE(out_unit,'(1X,A16,A40)')
     *   ' PATHWAY NAME = ', PATHWAY_NAME(JAYPEE)
        write(out_unit,'(1X,A8,E13.4,A6)')
     *   ' FLOW = ', FLOW, ' 1/sec'
        write(out_unit,'(1X,A8,E13.4,A6)')
     *   ' FLOW = ', FLOW * CONVERT, ' %/day'
      END IF

C     do-loop for each transport group, 1/m3/sec
      DO KTG = 1, MAXTGRP

C       normalized flow into compartment, 1/sec
        CLIN(KTG) = FLOW

      END DO
C     end do-loop for each transport group

      IF ( LEVEL_CIN .GE. 2 ) THEN
        write(out_unit,'(1X,A8,E11.4,4E13.4,A7)') 
     *   ' CLIN = ', (CLIN(II),II=1,MAXTGRP), '  1/sec'
      END IF

C     return to caller
      RETURN

C     end of subroutine CIN
      END
