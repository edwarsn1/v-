C     TESTED VERSION

C     ##################################################################
      DOUBLE PRECISION FUNCTION LUPP2( IPTH, AVAL, XP, YP, NUMVAL )
C     ##################################################################
#ifdef WIN32
      use dfport
#endif
C     ##################################################################
C     ######   LOOK-UP TABLE FUNCTION BASED UPON PATHWAY NUMBER   ######
C     ###### SAME AS LOOKUPP, FOR 2-DIMENSIONAL ARRAYS, XP AND YP ######
C     ##################################################################

C     include statement
      INCLUDE 'full.com'

      INTEGER IPTH, IP
      INTEGER JP, JSAVE, JCNT
      INTEGER NUMVAL
      double precision AVAL
      double precision XP(MAXPATH,MAXCOUNT), YP(MAXPATH,MAXCOUNT)

C     write banner on entry into function
      IF ( LEVEL_LUPP2 .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A15)') 'FUNCTION LUPP2!'
      END IF

C     if number of values is improper then
      IF ( ( NUMVAL .LE. 0 ) .OR. ( NUMVAL .GT. MAXCOUNT ) ) THEN
C       write error message
        WRITE(out_unit,'(1X,A)')    'FUNCTION LUPP2 ERROR!'
     &      // '  verfiy the pathway input tables '
        WRITE(out_unit,'(1X,A)')    'IMPROPER VALUE OF NUMVAL!'
        WRITE(out_unit,'(1X,A12,I2)') 'NUMVAL    = ', NUMVAL
        WRITE(out_unit,'(1X,A12,I2)') 'IPTH    = ', IPTH
        WRITE(out_unit,'(1X,A12,I2)') 'MAXCOUNT  = ', MAXCOUNT
C       Terminate the program with a subprogram traceback.
        call perror('Trace back')
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF
C     end if number of values is improper

C     write scalars passed to function
      IF ( LEVEL_LUPP2 .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,I6)') 'NUMPATH   = ', NUMBER_OF_PATHWAYS
        WRITE(out_unit,'(1X,A12,I6)') 'IPTH      = ', IPTH
        WRITE(out_unit,'(1X,A12,F11.4)') 'AVAL      = ', AVAL
        WRITE(out_unit,'(1X,A12,I6)') 'NUMVAL    = ', NUMVAL
      END IF

C     write elements of independent-variable array
      IF ( LEVEL_LUPP2 .GE. 3 ) THEN
        DO IP = 1, NUMBER_OF_PATHWAYS
          WRITE(out_unit,'(1X,A3,I1,A8,6F13.5)')
     *      'XP(', IP, ',.)   = ', (XP(IP,JP),JP=1,NUMVAL)
        END DO
      END IF

C     write elements of dependent-variable array
      IF ( LEVEL_LUPP2 .GE. 3 ) THEN
        DO IP = 1, NUMBER_OF_PATHWAYS
          WRITE(out_unit,'(1X,A3,I1,A8,6F13.5)')
     *      'YP(', IP, ',.)   = ', (YP(IP,JP),JP=1,NUMVAL)
        END DO
      END IF

C     initialize variables
      JSAVE = 0
      LUPP2 = 0.0

C     do-loop for each element of independent-variable array
C     note that numvalue is in common block 'david'
      DO JCNT = 1, NUMVAL

C        if given value greater than or equal to xp-value then
         IF ( AVAL+EPS_TIME .GE. XP(IPTH,JCNT) ) THEN
C          save values of index and dependent variable
           JSAVE = JCNT
           LUPP2 = YP(IPTH,JCNT)
         END IF
C        end if given value greater than or equal to xp-value

      END DO
C     end do-loop for each element of independent-variable array

C     output values found to meet condition
      IF ( LEVEL_LUPP2 .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,I6)')    'JSAVE     = ', JSAVE
        WRITE(out_unit,'(1X,A12,F11.4)') 'LUPP2     = ', LUPP2
      END IF

C     return to caller
      RETURN

C     end of function LUPP2
      END
