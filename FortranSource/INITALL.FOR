C     SLH - Decenber 8, 1997 - removed call to SDF which intialized the
C     SDF parameters in the absence of an SDF input file.

C     VERSION CREATED FOR TESTING ON 27 JULY 1995

C     ##################################################################
      SUBROUTINE INITALL (error_code, inp_out)
C     ##################################################################

C     sets input for RADTRAD program
C     reads plant model file information
C     reads scenario description file information

C     Called by:
C     RADCALC

C     Calls to:
C     RD_NIF
C     NIFOUT
C     RD_RFT
C     RFTOUT
C     RD_INP

C     include statement
      INCLUDE 'full.com'

      INTEGER error_code

C     display banner on entry into subroutine
      IF ( LEVEL_INITALL .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A19)') 'SUBROUTINE INITALL!'
      END IF

C     call subroutine RD_RFT to read the release fraction file (*.RFT)

      DO IK = 1, Number_Release_Files
        call RD_RFT(IK, error_code, inp_out) !<<++++++++++++++++++++++++++++++++++++++++++++++++
        IF (ERROR_CODE .GT. 0) RETURN
      END DO

C     call subroutine RD_NIF to read the nuclide inventory file (*.NIF).

      DO IK = 1, Number_Inventory_Files
        CALL RD_NIF(2,IK, error_code, inp_out) ! <<=============================================   
        IF (ERROR_CODE .GT. 0) RETURN

      END DO
C
C     call subroutine to read dose conversion factors
c
      CALL RD_INP(error_code, inp_out)! <<======================================================   

C     return to caller
      RETURN

C     end of subroutine INITALL
      END

