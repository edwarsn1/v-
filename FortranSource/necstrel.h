C                               necstrel.h

C<<<<CHECK LOGIC OF THIS BLOCK OF CODE AGAINST THAT IN SOURCE/STERM>>>>

C     ############################################################
C     ######## TOP OF BLOCK TO INCLUDE RELEASE DURATIONS #########
C     ############################################################
c
c    get the start and finish time
c
      TIME_ONSET = max(0.0d0, ONSET_GAP_RELEASE - START_ACCIDENT)
      IF (ONSET_GAP_RELEASE .GT. 0.0)  RESET_DT4 = TIME_ONSET
      MINSTEP(KOUNT) = TIME_ONSET
      KOUNT = KOUNT + 1
      MINSTEP(KOUNT) = 7200.0D0 + TIME_ONSET
      KOUNT = KOUNT + 1
      MINSTEP(KOUNT) = DURATION_ACCIDENT - START_ACCIDENT
      KOUNT = KOUNT + 1

C
C   get release durations from RFT file
C
      DO NRLSE = 1, Number_Release_Files

C     if gap duration not zero
        TRELEASE = DURATION_GAP(NRLSE)
C     if
        IF ( TRELEASE .NE. 0 ) THEN
           MINSTEP(KOUNT) = DURATION_GAP(NRLSE) + TIME_ONSET
           KOUNT = KOUNT + 1
        END IF
C     end if first phase, gap duration not zero

C     if gap duration and early release duration not zero then
        TRELEASE = DURATION_GAP(NRLSE) + DURATION_EARLY(NRLSE)
C     if
        IF ( TRELEASE .NE. 0 ) THEN
           MINSTEP(KOUNT) = TRELEASE + TIME_ONSET
           KOUNT = KOUNT + 1
        END IF
C     end if second phase, early release duration not zero then

        TRELEASE = DURATION_GAP(NRLSE) + DURATION_EARLY(NRLSE) + 
     &             DURATION_EX(NRLSE)
C     
        IF ( TRELEASE .NE. 0 ) THEN
           MINSTEP(KOUNT) = TRELEASE + TIME_ONSET
           KOUNT = KOUNT + 1
        END IF
C     end if third time slot, or Ex-vessel release duration not zero then

        TRELEASE = DURATION_GAP(NRLSE) + DURATION_EARLY(NRLSE) + 
     &             DURATION_LATE(NRLSE)
C     
        IF ( TRELEASE .NE. 0 ) THEN
           MINSTEP(KOUNT) = TRELEASE + TIME_ONSET
           KOUNT = KOUNT + 1
        END IF
C     end if fourth time slot, or air injection release duration not zero then

      END DO

C     ############################################################
C     ######## END OF BLOCK TO INCLUDE RELEASE DURATIONS #########
C     ############################################################

C                               necstrel.h
