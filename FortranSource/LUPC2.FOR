C     VERSION AFTER TESTING ON 09 JUNE 1995

C     ##################################################################
      FUNCTION LUPC2( ICMP, AVAL, XC, YC, NUMVAL )
C     ##################################################################
#ifdef WIN32
      use dfport
#endif
C     ##################################################################
C     ###### LOOK-UP TABLE FUNCTION BASED UPON COMPARTMENT NUMBER ######
C     ###### SAME AS LOOKUPC, FOR 2-DIMENSIONAL ARRAYS, XC AND YC ######
C     ##################################################################

C     include statement
      INCLUDE 'full.com'

      INTEGER ICMP, IC
      INTEGER JC, JCNT, JSAVE
      INTEGER NUMVAL
      double precision AVAL
      double precision XC(MAXCOMP,MAXCOUNT), YC(MAXCOMP,MAXCOUNT)
      double precision LUPC2

C     write banner on entry into function
      IF ( LEVEL_LUPC2 .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A15)') 'FUNCTION LUPC2!'
      END IF

C     if improper number of values passed to function then
      IF ( ( NUMVAL .LE. 0 ) .OR. ( NUMVAL .GT. MAXCOUNT ) ) THEN
C       write error message
        WRITE(out_unit,'(1X,A)') 'FUNCTION LUPC2 ERROR!'
     &      // '  verfiy the compartment input tables '
        WRITE(out_unit,'(1X,A35)') 'IMPROPER NUMBER OF VALUES IN ARRAY!'
        WRITE(out_unit,'(1X,A12,I6)') 'NUMVAL    = ', NUMVAL
        WRITE(out_unit,'(1X,A12,I6)')    'ICMP      = ', ICMP
        WRITE(out_unit,'(1X,A12,I6)') 'MAXCOUNT  = ', MAXCOUNT
C       terminate program
        call perror('Trace back')
      write(*,*) '***********    S T O P   ********************'

C      *****************    S T O P   ***************************
        STOP
      END IF
C     end if improper number of values passes to function

C     write scalars passed to fucntion call
      IF ( LEVEL_LUPC2 .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,I6)')    'NUMCOMP   = ',
     *    NUMBER_OF_COMPARTMENTS
        WRITE(out_unit,'(1X,A12,I6)')    'ICMP      = ', ICMP
        WRITE(out_unit,'(1X,A12,F11.4)') 'AVAL      = ', AVAL
        WRITE(out_unit,'(1X,A12,I6)')    'NUMVAL    = ', NUMVAL
      END IF

C     write elements of independent-variable array
      IF ( LEVEL_LUPC2 .GE. 3 ) THEN
        DO IC = 1, NUMBER_OF_COMPARTMENTS
          WRITE(out_unit,'(1X,A3,I1,A7,5F11.4)')
     *      'XC(', IC, ',.)  = ', (XC(IC,JC),JC=1,NUMVAL)
        END DO
      END IF

C     write elements of dependent-variable array
      IF ( LEVEL_LUPC2 .GE. 3 ) THEN
        DO IC = 1, NUMBER_OF_COMPARTMENTS
          WRITE(out_unit,'(1X,A3,I1,A7,5E11.4)')
     *      'YC(', IC, ',.)  =  ', (YC(IC,JC),JC=1,NUMVAL)
        END DO
      END IF

C     initialize value of jsave
      JSAVE = 0
C     initialize value of lupc2
      LUPC2 = 0.0

C     do-loop for each element of independent-variable array
      DO JCNT = 1, NUMVAL

C        select largest xc-value for which aval >= xc
C        if given value greater than or equal to table value
         IF ( AVAL+EPS_TIME .GE. XC(ICMP,JCNT) ) THEN
C          save corresponding yc-value as look-up value
           JSAVE = JCNT
           LUPC2 = YC(ICMP,JCNT)
         END IF

      END DO
C     end do-loop for each element of independent-variable array

C     output values found to meet condition
      IF ( LEVEL_LUPC2 .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,I6)')    'JSAVE     = ', JSAVE
        WRITE(out_unit,'(1X,A12,F11.4)') 'LUPC2     = ', LUPC2
      END IF

C     return to caller
      RETURN

C     end of function LUPC2
      END
