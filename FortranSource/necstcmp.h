C                               necstcmp.h

C     #########################################################
C     ########## BEGIN DO-LOOP OVER ALL COMPARTMENTS ##########
C     #########################################################

C     do-loop for each compartment
      DO I = 1, NUMBER_OF_COMPARTMENTS

C       ############### COMPARTMENT SPRAYS ###############

C       if compartment has sprays then
        IF ( COMPARTMENT_SPRAYS(I) .EQ. 1 ) THEN

          IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A19,I2,A4,I2)')
     *       'COMPARTMENT_SPRAYS(', I, ') = ',
     *        COMPARTMENT_SPRAYS(I)
          END IF

C         ##### sprays - elemental iodine #####
C         if number of DF/RC's is not zero then
          IF ( SPRAYS_ELEMENTAL_COUNT(I) .NE. 0 ) THEN
C           load spray elemental time vector into minstep
            DO J = 1, SPRAYS_ELEMENTAL_COUNT(I)
              MINSTEP(KOUNT) = SPRAYS_ELEMENTAL_TIME(I,J)
              KOUNT = KOUNT + 1
            END DO
          END IF
C         end if number of DF/RC's is not zero

C         ##### sprays - organic iodine #####
C         if number of DF/RC's is not zero then
          IF ( SPRAYS_ORGANIC_COUNT(I) .NE. 0 ) THEN
C           load spray organic time vector into minstep
            DO J = 1, SPRAYS_ORGANIC_COUNT(I)
              MINSTEP(KOUNT) = SPRAYS_ORGANIC_TIME(I,J)
              KOUNT = KOUNT + 1
            END DO
          END IF
C         end if number of DF/RC's is not zero

C         ##### sprays - aerosol iodine #####
C         if number of DF/RC's not zero then
          IF ( SPRAYS_AEROSOL_COUNT(I) .NE. 0 ) THEN
C           load spray aerosol time vector into minstep
            DO J = 1, SPRAYS_AEROSOL_COUNT(I)
              MINSTEP(KOUNT) = SPRAYS_AEROSOL_TIME(I,J)
              KOUNT = KOUNT + 1
            END DO
          END IF
C         end if number of DF/RC's not zero

        END IF

C       ################ COMPARTMENT SUMP ################

C       if compartment has sump then
        IF ( COMPARTMENT_SUMP(I) .EQ. 1 ) THEN

          IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A17,I2,A4,I2)')
     *       'COMPARTMENT_SUMP(', I, ') = ',
     *        COMPARTMENT_SUMP(I)
          END IF

C         if sump volatilization count not zeros then
          IF ( SUMP_VOLATILIZATION_COUNT(I) .NE. 0 ) THEN
C           load sump volatilization time vector into minstep
            DO J = 1, SUMP_VOLATILIZATION_COUNT(I)
              MINSTEP(KOUNT) = SUMP_VOLATILIZATION_TIME(I,J)
              KOUNT = KOUNT + 1
            END DO
          END IF
C         end if sump volatilization count not zeros then

        END IF

C       ############## COMPARTMENT FILTER ###############

C       if compartment has recirculation filters then
        IF ( COMPARTMENT_FILTERS(I) .EQ. 1 ) THEN

          IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A20,I2,A4,I2)')
     *       'COMPARTMENT_FILTERS(', I, ') = ',
     *        COMPARTMENT_FILTERS(I)
          END IF

C         if comp filter efficiency count not zero then
          IF ( C_FILTER_EFF_COUNT(I) .NE. 0 ) THEN
C           load comp filter eff count time vector into minstep
            DO J = 1, C_FILTER_EFF_COUNT(I)
              MINSTEP(KOUNT) = C_FILTER_TIME(I,J)
              KOUNT = KOUNT + 1
            END DO
          END IF
C         end if comp filter efficiency count not zero then

        END IF

C       ############ COMPARTMENT DEPOSITION #############

C       if compartment deposition occurs then
        IF ( COMPARTMENT_DEPOSITION(I) .EQ. 1 ) THEN

          IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A23,I2,A4,I2)')
     *       'COMPARTMENT_DEPOSITION(', I, ') = ',
     *        COMPARTMENT_DEPOSITION(I)
          END IF

C         if deposition elemental count not zero then
          IF ( DEPOSIT_ELEMENTAL_COUNT(I) .NE. 0 ) THEN
C           load deposition elemental count time vector into minstep
            DO J = 1, DEPOSIT_ELEMENTAL_COUNT(I)
              MINSTEP(KOUNT) = DEPOSIT_ELEMENTAL_TIME(I,J)
              KOUNT = KOUNT + 1
            END DO
          END IF
C         end if deposition elemental count not zero then

C         if deposition aersol count not zero then
          IF ( DEPOSIT_AEROSOL_COUNT(I) .NE. 0 ) THEN
C           load deposition aerosol count time vector into minstep
            DO J = 1, DEPOSIT_AEROSOL_COUNT(I)
              MINSTEP(KOUNT) = DEPOSIT_AEROSOL_TIME(I,J)
              KOUNT = KOUNT + 1
            END DO
          END IF
C         end if deposition aersol count not zero

        END IF



      END DO
C     end do-loop for each compartment

C     #########################################################
C     ########### END DO-LOOP OVER ALL COMPARTMENTS ###########
C     #########################################################

C                               necstcmp.h
