C necstpth.h

CDKM  note addition to code made on 08 september 1995 by dkm
Ctjh  added a way to find significant changes in flow

C     ##########################################################
C     ############ TOP OF DO-LOOP OVER ALL PATHWAYS ############
C     ##########################################################

      RESET_DT1 = 0.0d0
      RESET_DT2 = 0.0d0
      RESET_DT3 = 0.0d0
      RESET_DT4 = 0.0d0

C     do loop for each pathway
      DO I = 1, NUMBER_OF_PATHWAYS
         RESET_DT = 0.0d0

C        ############### PIPING PATHWAY ################

C        if pathway type is piping pathway then
         IF ( PATHWAY_TYPE(I) .EQ. 1 ) THEN

            IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
              WRITE(out_unit,'(1X,A13,I2,A4,I2)')
     &         'PATHWAY_TYPE(', I, ') = ',
     &          PATHWAY_TYPE(I)
            END IF

C        get steps from aerosol,elemental & organic pipe flow input 
            IF ( PIPING_COUNT(I) .NE. 0 ) THEN
               DO J = 1, PIPING_COUNT(I)
                  MINSTEP(KOUNT) = PIPING_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
            END IF
            IF ( PIPING_COUNT(I) .GT. 1 ) THEN
               DO J = 2, PIPING_COUNT(I)
                  IF (PIPING_FLOW(I,J-1)*50.0 .lt. PIPING_FLOW(I,J))             
     &                    RESET_DT = PIPING_TIME(I,J)
	           END DO
	        END IF 

C        get steps from Brockmann aerosol model pipe flow input
            IF ( BROCK_COUNT(I) .GT. 0 ) THEN
               DO J = 1, BROCK_COUNT(I)
                  MINSTEP(KOUNT) = BROCK_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
            END IF
            IF ( BROCK_COUNT(I) .GT. 1 ) THEN
               DO J = 2, BROCK_COUNT(I)
                  IF (BROCK_FLOW(I,J-1)*50.0 .lt. BROCK_FLOW(I,J))             
     &                    RESET_DT = BROCK_TIME(I,J)
	           END DO
	        END IF 

         END IF

C        ############### FILTER PATHWAY ################

C        if pathway type is filtered pathway then
         IF ( PATHWAY_TYPE(I) .EQ. 2 ) THEN

            IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
              WRITE(out_unit,'(1X,A13,I2,A4,I2)')
     &         'PATHWAY_TYPE(', I, ') = ',
     &          PATHWAY_TYPE(I)
            END IF

            IF ( P_FILTER_EFF_COUNT(I) .NE. 0 ) THEN
               DO J = 1, P_FILTER_EFF_COUNT(I)
                  MINSTEP(KOUNT) = P_FILTER_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
               IF ( P_FILTER_EFF_COUNT(I) .GT. 1 ) THEN
                  DO J = 2, P_FILTER_EFF_COUNT(I)
                     IF(P_FILTER_FLOW_RATE(I,J-1)*50.0 .lt. 
     &                       P_FILTER_FLOW_RATE(I,J) )
     &                       RESET_DT = P_FILTER_TIME(I,J)
	              END DO
	           END IF 
            END IF

         END IF

C        ############## GENERIC TRANSPORT PATH ###############

C        if pathway type is generic then
         IF (PATHWAY_TYPE(I) .EQ. 3 .OR. PATHWAY_TYPE(I) .EQ. 6) THEN

            IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
              WRITE(out_unit,'(1X,A13,I2,A4,I2)')
     &         'PATHWAY_TYPE(', I, ') = ',
     &          PATHWAY_TYPE(I)
            END IF

            IF ( SP_AEROSOL_COUNT(I) .NE. 0 ) THEN
               DO J = 1, SP_AEROSOL_COUNT(I)
                  MINSTEP(KOUNT) = SP_AEROSOL_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
            END IF

            IF ( SP_ELEMENTAL_COUNT(I) .NE. 0 ) THEN
               DO J = 1, SP_ELEMENTAL_COUNT(I)
                  MINSTEP(KOUNT) = SP_ELEMENTAL_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
            END IF

            IF ( SP_ORGANIC_COUNT(I) .NE. 0 ) THEN
               DO J = 1, SP_ORGANIC_COUNT(I)
                  MINSTEP(KOUNT) = SP_ORGANIC_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
            END IF

            IF ( SP_VOLATILIZATION_COUNT(I) .NE. 0 ) THEN
               DO J = 1, SP_VOLATILIZATION_COUNT(I)
                  MINSTEP(KOUNT) = SP_VOLATILIZATION_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
            END IF

         END IF

C        ############# NATURAL CONVECTION ##############

C        if pathway type is natural convection then
         IF ( PATHWAY_TYPE(I) .EQ. 4 ) THEN

            IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
              WRITE(out_unit,'(1X,A13,I2,A4,I2)')
     &         'PATHWAY_TYPE(', I, ') = ',
     &          PATHWAY_TYPE(I)
            END IF

            IF ( CONVECTION_COUNT(I) .NE. 0 ) THEN
               DO J = 1, CONVECTION_COUNT(I)
                  MINSTEP(KOUNT) = CONVECTION_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
               IF ( CONVECTION_COUNT(I) .GT. 1 ) THEN
                  DO J = 2, CONVECTION_COUNT(I)
                     IF(CONVECTION_FLOW_RATE(I,J-1)*50.0 .lt. 
     &                       CONVECTION_FLOW_RATE(I,J) )             
     &                       RESET_DT = CONVECTION_TIME(I,J)
	              END DO
	           END IF
            END IF

         END IF

C        ############### WATER LEAKAGE ################

C        if pathway type is water leakage then
         IF ( PATHWAY_TYPE(I) .EQ. 5 ) THEN

            IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
              WRITE(out_unit,'(1X,A13,I2,A4,I2)')
     &         'PATHWAY_TYPE(', I, ') = ',
     &          PATHWAY_TYPE(I)
            END IF

            IF ( WATER_LEAKAGE_COUNT(I) .NE. 0 ) THEN
               DO J = 1, WATER_LEAKAGE_COUNT(I)
                  MINSTEP(KOUNT) = WATER_LEAKAGE_TIME(I,J)
                  KOUNT = KOUNT + 1
               END DO
            END IF

         END IF
Ctjh
C   crude way of finding time points where the flow dramaticaly changes
C
         IF (RESET_DT .GT. 40.0) THEN
            IF (RESET_DT1 .EQ. 0.0) THEN
                RESET_DT1 = RESET_DT
            ELSE IF (RESET_DT2 .EQ. 0.0) THEN
                IF (RESET_DT .NE. RESET_DT1) RESET_DT2 = RESET_DT
            ELSE IF (RESET_DT3 .EQ. 0.0) THEN
                IF (RESET_DT.NE.RESET_DT1 .AND. RESET_DT.NE.RESET_DT2) 
     &	            RESET_DT3 = RESET_DT
            ELSE IF (RESET_DT4 .EQ. 0.0) THEN
                IF (RESET_DT.NE.RESET_DT1 .AND. RESET_DT.NE.RESET_DT2 
     &        .AND. RESET_DT.NE.RESET_DT3) RESET_DT4 = RESET_DT
            END IF
         END IF			
	  END DO
C     end do loop for each pathway

C     ############################################################
C     ############# END OF DO-LOOP OVER ALL PATHWAYS #############
C     ############################################################

C END OF necstpth.h
