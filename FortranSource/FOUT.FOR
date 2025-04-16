C     FOUT.FOR, CREATED ON 15 JUNE 1995 DURING TESTING
C     MODIFIED BY DKM ON 18 OCTOBER 1995, ORIGINAL IS FOUT.ORG

C     ##################################################################
      SUBROUTINE FOUT( ICOMP, JPATH, SIMTIM, FLOUT )
C     ##################################################################

C     This subroutine calculates the transport rate resulting from flow
C     out of a compartment by way of a filter. 

C     Inputs:
C     (1) compartment number
C     (2) pathway number
C     (3) current simulation time

C     Output:
C     FLOUT, coefficients for flow out of compartment through filter
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol

C     Reference is "Model Description", LeAnn Adams Miller, 2/25/94

C     ------------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     TESTED BY DKM ON 15 JUNE 1995
C     ------------------------------------------------------------------

C     include statement
      INCLUDE 'full.com'

      INTEGER ICOMP
      INTEGER JPATH
      INTEGER KTG
      
      double precision LUPP2
      double precision FLOUT(MAXTGRP)
      double precision SIMTIM
      double precision FLOW

C     write banner on entry into subroutine
      IF ( LEVEL_FOUT .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A16)') 'SUBROUTINE FOUT!'
      END IF
C
C   check for filter failure
C
      JPLUS = p_filter_eff_count(JPATH) + 1

      IF (P_Filter_Failure(JPATH) .GT.0 .and. 
     &           SIMTIM .gt. P_FILTER_TIME(JPATH,JPLUS+1) ) THEN 
c
c     filter train is shutdown
c
         FLOW = P_FILTER_FLOW_RATE(JPATH,JPLUS+1)

      ELSE IF (P_Filter_Failure(JPATH) .GT.0 .and. 
     &           SIMTIM .gt. P_FILTER_TIME(JPATH,JPLUS) ) THEN 
c
c     filter has failed
c
         FLOW = P_FILTER_FLOW_RATE(JPATH,JPLUS)
      ELSE

C     flow rate through filter, m3/sec
         FLOW = LUPP2( JPATH, SIMTIM, P_FILTER_TIME, 
     &        P_FILTER_FLOW_RATE, P_FILTER_EFF_COUNT(JPATH) )

      END IF

      IF ( LEVEL_FOUT .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A13,E16.10,A5)') 
     *  ' FLOW      = ', FLOW, ' m3/s'
      END IF

C     do-loop for each transport group
      DO KTG = 1, MAXTGRP

        FLOUT(KTG) = FLOW / COMPARTMENT_VOLUME(ICOMP)

        IF ( LEVEL_FOUT .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A7,I1,A5,F16.10,A6)')
     *     ' FLOUT(', KTG, ')  = ', FLOUT(KTG), ' 1/sec'
        END IF

      END DO
C     end do-loop for each transport group
        
C     return to caller
      RETURN

C     end of subroutine FOUT
      END
