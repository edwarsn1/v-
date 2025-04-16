C     VERSION CREATED DURING TESTING ON 6 JULY 1995

C     ##################################################################
      SUBROUTINE COUT( ICOMP, JPATH, SIMTIM, CLOUT )
C     ##################################################################

C     This subroutine calculates the removal coefficient for flow out of 
C     a compartment by way of a pathway as a result of convection (also
C     referred to as air leakage). 

C     Inputs:
C     (1) compartment number
C     (2) pathway number
C     (3) current simulation time

C     Output: removal coefficient due to convection, 1/sec 
C     CLOUT, removal coefficients for leakage from the compartment
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol

C     Reference is "Model Description", LeAnn Adams Miller, 2/25/94.
C     In particular, see Section 2.2.5 on Leakage!

C     -----------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     TESTED BY DKM IN JUNE 1995, JUNE 1995
C     -----------------------------------------------------------------

C     include statement
      INCLUDE 'full.com'

      INTEGER ICOMP, II
      INTEGER JPATH
      INTEGER KTG

      double precision SIMTIM
      double precision COMP_VOL
      double precision LUPP2
      double precision FLOW
      double precision CLOUT(MAXTGRP) 

C     write banner on entry into subroutine
      IF ( LEVEL_COUT .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A16)') 'SUBROUTINE COUT!'
      END IF

C     error checking 
      IF ( CONVECTION_COUNT(JPATH) .EQ. 0 ) THEN
        WRITE(out_unit,'(1X,A26)')       
     *   ' ERROR IN SUBROUTINE COUT!'
        WRITE(out_unit,'(1X,A34)')       
     *   ' VALUE OF CONVECTION_COUNT IS ZERO'
        WRITE(out_unit,'(1X,A10,I2)')     
     *   ' ICOMP  = ', ICOMP      
        WRITE(out_unit,'(1X,A10,I2)')     
     *   ' JPATH  = ', JPATH
        WRITE(out_unit,'(1X,A10,E11.4)')  
     *   ' SIMTIM = ', SIMTIM      
        WRITE(out_unit,'(1X,A29)')       
     *   ' HARD TERMINATION OF PROGRAM! (COUT) '
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF
      
C     volume of compartment, m3 <<===========================[VALUE NOT USED!]      
      COMP_VOL = COMPARTMENT_VOLUME(ICOMP)

C     write value of compartment volume
      IF ( LEVEL_COUT .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A18,I8)') 
     *   ' PATHWAY NUMBER = ', JPATH 
        WRITE(out_unit,'(1X,A16,A40)') 
     *   ' PATHWAY NAME = ', PATHWAY_NAME(JPATH)
        WRITE(out_unit,'(1X,A22,I8)') 
     *   ' COMPARTMENT NUMBER = ', ICOMP
        WRITE(out_unit,'(1X,A20,A40)') 
     *   ' COMPARTMENT NAME = ', COMPARTMENT_NAME(ICOMP)
        WRITE(out_unit,'(1X,A12,E13.4,A3)') 
     *   ' COMP_VOL = ', COMP_VOL, ' m3'
      END IF

C     flow rate through pathway, user-specified value, 1/sec           
      FLOW = LUPP2( JPATH, SIMTIM, CONVECTION_TIME,
     *  CONVECTION_FLOW_RATE, CONVECTION_COUNT(JPATH) )

C     write value of normalized flow rate
      IF ( LEVEL_COUT .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A18,E13.4,A6)') 
     *   ' NORM FLOW RATE = ', FLOW, ' 1/sec'
      END IF

C     write value of volumetric flow rate
      IF ( LEVEL_COUT .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A17,E13.4,A7)') 
     *   ' VOL FLOW RATE = ', COMP_VOL * FLOW, ' m3/sec'
      END IF

C     do-loop for each transport group
      DO KTG = 1, MAXTGRP

C        normalized flow rate for current transport group, 1/sec
         CLOUT(KTG) = FLOW

      END DO
C     end do-loop for each transport group

      IF ( LEVEL_COUT .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A9,5E13.4,A7)') 
     *   ' CLOUT = ', (CLOUT(II),II=1,MAXTGRP), '  1/sec'
      END IF

C     return to caller
      RETURN

C     end of subroutine COUT
      END

