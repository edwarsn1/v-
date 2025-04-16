C     ##################################################################
      FUNCTION LUPL2( ILOC, AVAL, XP, YP, NUMVAL )
C     ##################################################################
#ifdef WIN32
      use dfport
#endif
C     ##################################################################
C     #####    LOOK-UP TABLE FUNCTION BASED UPON LOCATION NUMBER   #####
C     #####      VERSION OF LOOKUP FOR 2-DIMENSIONAL X/Q ARRAYS    #####
C     ##################################################################

C     include statement
      INCLUDE 'full.com'

      INTEGER ILOC, IP, JP
      INTEGER KCNT, KSAVE
      INTEGER NUMVAL
      double precision AVAL
      double precision XP( MAX_XQS, MAXCOUNT )
      double precision YP( MAX_XQS, MAXCOUNT )
      double precision LUPL2

C     write banner on entry into function
      IF ( LEVEL_LUPl2 .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A15)') 'FUNCTION LUPL2!'
      END IF

C     if number of values is improper then
      IF ( ( NUMVAL .LE. 0 ) .OR. ( NUMVAL .GT. MAXCOUNT ) ) THEN
C       write error message
        WRITE(out_unit,'(1X,A)') 'FUNCTION LUPL2 ERROR! '
     &        // ' check the input for X/Q tables '
        WRITE(out_unit,'(1X,A25)')    'IMPROPER VALUE OF NUMVAL!'
        WRITE(out_unit,'(1X,A11,I2)') 'NUMVAL   = ', NUMVAL
        WRITE(out_unit,'(1X,A12,I6)') 'ILOC      = ', ILOC
        WRITE(out_unit,'(1X,A11,I2)') 'MAXCOUNT = ', MAXCOUNT
C       terminate program
        call perror('Trace back')
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF
C     end if number of values is improper

C     write scalars passed to function
      IF ( LEVEL_LUPL2 .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,I6)')
     &     'NUMLOC    = ', Number_Dose_Locations
        WRITE(out_unit,'(1X,A12,I6)') 'ILOC      = ', ILOC
        WRITE(out_unit,'(1X,A12,E13.4)') 'AVAL      = ', AVAL
        WRITE(out_unit,'(1X,A12,I6)') 'NUMVAL    = ', NUMVAL
      END IF

C     write elements of independent-variable array
      IF ( LEVEL_LUPL2 .GE. 3 ) THEN
        DO IP = 1, Number_Dose_Locations
          DO JP = 1, NUMVAL
            WRITE(out_unit,'(1X,A,I2,A,I2,A,f12.4)')
     *        'XP(', IP, ', ', JP, ') = ', XP(IP,JP)
          END DO
        END DO
      END IF

C     write elements of dependent-variable array
      IF ( LEVEL_LUPL2 .GE. 3 ) THEN
        DO IP = 1, Number_Dose_Locations
          DO JP = 1, NUMVAL
            WRITE(out_unit,'(1X,A,I2,A,I2,A,f12.4)')
     *        'YP(', IP, ', ', JP, ') = ', YP(IP,JP)
          END DO
        END DO
      END IF

C     initialize variables
      KSAVE = 0
      LUPL2 = 0.0

C     do-loop for each element of independent-variable array
C     note that numvalue is in common block 'david'
      DO KCNT = 1, NUMVAL

C        if given value greater than or equal to xp-value then
         IF ( AVAL+EPS_TIME .GE. XP(ILOC,KCNT) ) THEN
C          save values of index and dependent variable
           KSAVE = KCNT
           LUPL2 = YP(ILOC,KCNT)
         END IF
C        end if given value greater than or equal to xp-value

      END DO
C     end do-loop for each element of independent-variable array

C     output values found to meet condition
      IF ( LEVEL_LUPL2 .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A12,I6)')    'KSAVE     = ', KSAVE
        WRITE(out_unit,'(1X,A12,E13.4)') 'LUPL2     = ', LUPL2
      END IF

C     return to caller
      RETURN

C     end of function LUPL2
      END
