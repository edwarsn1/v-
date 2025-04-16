C                               necstsrt.h

C     ###############################################################
C     ######## TOP OF BLOCK TO SORT AND REDUCE TIME MARKERS #########
C     ###############################################################

C     number of unique elements in minsteps
      NUMSTEPS = KOUNT - 1

C     output number of values before quick sort
      IF ( LEVEL_NECSTEPS .GE. 3 ) THEN
        WRITE(out_unit,'(1X,A35)') 'NUMBER OF VALUES BEFORE QUICK SORT:'
        WRITE(out_unit,'(1X,A12,I6)') 'NUMSTEPS  = ', NUMSTEPS
      END IF

      IF ( LEVEL_NECSTEPS .GE. 3 ) THEN
        DO I = 1, NUMSTEPS
          WRITE(out_unit,'(1X,I6,1PE11.4,A4)')
     &       I, MINSTEP(I) / 3600.0, ' hrs'
        END DO
      END IF

C     perform a quick-sort on minstep
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A15)') 'CALLING SORTER!'
      END IF
C     ################################
      CALL SORTER( NUMSTEPS, MINSTEP )
C     ################################

C     delete repetive entries in minstep
      KVALUE = NUMSTEPS
C     do for each value in minstep
      DO I = 1, NUMSTEPS
        IF ( MINSTEP(I) .NE. -1 ) THEN
 999      IF ( MINSTEP(I) .EQ. MINSTEP(I+1) ) THEN
            DO J = I, NUMSTEPS-1
               MINSTEP(J) = MINSTEP(J+1)
            END DO
            MINSTEP(NUMSTEPS) = -1
            KVALUE = KVALUE - 1
            GO TO 999
          END IF
        END IF
      END DO
C     end do for each value in minstep

C     delete repetive entries in minstep
C     KVALUE = NUMSTEPS
C     do for each value in minstep
C     DO I = 1, NUMSTEPS
C       IF ( MINSTEP(I) .NE. -1 ) THEN
C         DO WHILE ( MINSTEP(I) .EQ. MINSTEP(I+1) )
C           DO J = I, NUMSTEPS-1
C              MINSTEP(J) = MINSTEP(J+1)
C           END DO
C           MINSTEP(NUMSTEPS) = -1
C           KVALUE = KVALUE - 1
C         END DO
C         END IF
C       END IF
C     END DO
C     end do for each value in minstep

C     revised value of numsteps
      NUMSTEPS = KVALUE

C     ###############################################################
C     ######## END OF BLOCK TO SORT AND REDUCE TIME MARKERS #########
C     ###############################################################

C                               necstsrt.h
