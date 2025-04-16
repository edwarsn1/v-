C                               necstspr.h

C
C  AEROSOL NATURAL DEPOSITION TIME MARKERS
C
       IDEPNOW = 0
       DO ICMP = 1, NUMBER_OF_COMPARTMENTS, 1
          IF ( DEPOSIT_AEROSOL_REACTOR(ICMP) .NE. 0) THEN
              IDEPNOW = DEPOSIT_AEROSOL_REACTOR(ICMP)
          END IF
       END DO

C     time markers for PWR DBA, sec
      IF ( IDEPNOW .EQ. 1 ) THEN
        TIME_MARKER(0) =      0.0D0   !  0.0  hr
        TIME_MARKER(1) =   1800.0D0   !  0.5  hr
        TIME_MARKER(2) =   6480.0D0   !  1.8  hr
        TIME_MARKER(3) =  13680.0D0   !  3.8  hr
        TIME_MARKER(4) =  49680.0D0   ! 13.8  hr
        TIME_MARKER(5) =  80000.0D0   ! 22.22 hr
        TIME_MARKER(6) = 100000.0D0   ! 27.78 hr 
        TIME_MARKER(7) = 120000.0D0   ! 33.33 hr     

      ELSE
C
C     time markers for PWR SA, sec
     & IF ( IDEPNOW .EQ. 2 ) THEN
        TIME_MARKER(0) =      0.0D0   !  0.0  hr
        TIME_MARKER(1) =   1800.0D0   !  0.5  hr
        TIME_MARKER(2) =   6480.0D0   !  1.8  hr
        TIME_MARKER(3) =  13680.0D0   !  3.8  hr
        TIME_MARKER(4) =  42480.0D0   ! 11.8  hr
        TIME_MARKER(5) =  80000.0D0   ! 22.22 hr
        TIME_MARKER(6) = 100000.0D0   ! 27.78 hr
        TIME_MARKER(7) = 120000.0D0   ! 33.33 hr

      ELSE
C
C     time markers for advanced PWR DBA, sec
     & IF ( IDEPNOW .EQ. 5 ) THEN
        TIME_MARKER(0) =      0.0D0   !  0.0  hr
        TIME_MARKER(1) =   1800.0D0   !  0.5  hr
        TIME_MARKER(2) =   6480.0D0   !  1.8  hr
        TIME_MARKER(3) =  13680.0D0   !  3.8  hr
        TIME_MARKER(4) =  49680.0D0   ! 13.8  hr
        TIME_MARKER(5) =  86400.0D0   ! 24.0  hr
        TIME_MARKER(6) = 100000.0D0   ! 27.78 hr
        TIME_MARKER(7) = 120000.0D0   ! 33.33 hr

      ELSE

C     time markers for BWR DBA, sec
     & IF ( IDEPNOW .EQ. 3 ) THEN
        TIME_MARKER(0) =      0.0D0   !  0.0  hr
        TIME_MARKER(1) =   1800.0D0   !  0.5  hr
        TIME_MARKER(2) =   7200.0D0   !  2.0  hr
        TIME_MARKER(3) =  18000.0D0   !  5.0  hr
        TIME_MARKER(4) =  30000.0D0   !  8.33 hr
        TIME_MARKER(5) =  43200.0D0   ! 12.0  hr
        TIME_MARKER(6) =  70000.0D0   ! 19.44 hr
        TIME_MARKER(7) =  86400.0D0   ! 24.0  hr

      ELSE

C     time markers for BWR SA, sec
     & IF ( IDEPNOW .EQ. 4 ) THEN
        TIME_MARKER(0) =      0.0D0   !  0.0  hr
        TIME_MARKER(1) =   1800.0D0   !  0.5  hr
        TIME_MARKER(2) =   7200.0D0   !  2.0  hr
        TIME_MARKER(3) =  18000.0D0   !  5.0  hr
        TIME_MARKER(4) =  43200.0D0   ! 12.0  hr
        TIME_MARKER(5) =  80000.0D0   ! 22.22 hr
        TIME_MARKER(6) = 100000.0D0   ! 27.78 hr
        TIME_MARKER(7) = 120000.0D0   ! 33.33 hr


      END IF

C    load depsotion time markers into minstep
      IF (IDEPNOW .gt.0) THEN
         DO NSTEPX = 1, 7
           MINSTEP(KOUNT) = TIME_MARKER(NSTEPX)
           KOUNT = KOUNT + 1
         END DO
      ENDIF

C     ##############################################################
C     ######## TOP OF BLOCK TO ADD SPRAYS-MODEL TIME MARKERS #######
C     ##############################################################
c23456789012345678901234567890123456789012345678901234567890123456789012
C     do-loop for each compartment
      DO ICMP = 1, NUMBER_OF_COMPARTMENTS

C       ############### COMPARTMENT SPRAYS ###############

C       if compartment has sprays then
        IF ( COMPARTMENT_SPRAYS(ICMP) .EQ. 1 ) THEN

          IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
            WRITE(out_unit,'(1X,A19,I2,A4,I2)')
     &       'COMPARTMENT_SPRAYS(', ICMP, ') = ',
     &        COMPARTMENT_SPRAYS(ICMP)
C
            WRITE(out_unit,'(1X,A21,I2,A4,I2)')
     &       'SPRAYS_AEROSOL_MODEL(', ICMP, ') = ',
     &        SPRAYS_AEROSOL_MODEL(ICMP)
          END IF

CSLH  The next two lines are the old version of the code which
CSLH  first check to see if sprays were in the plant model.

C     if Powers/Burson model used for aerosol removal then
           IF ( SPRAYS_AEROSOL_MODEL(ICMP) .EQ. 2 ) THEN

CSLH  I added the sprays-in-the-plant-model-check to the if statement.

CSLH  If sprays are being used and the Powers/Burson model used for
CSLH  aerosol removal then

C       output banners to files
             IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
               WRITE(out_unit,'(1X,A38)')
     &          'CODE BLOCK TO ADD SPRAYS TIME MARKERS!'
             END IF


C       output release type
              IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
                  WRITE(out_unit,'(1X,A32)')
     &             'CASE #1 : CONTINUOUS RELEASE!'
              END IF
C
C       load data set into variables provided
C
              QTYH2O = SPRAYS_AEROSOL_FLUX(ICMP,1)
              HTFALL = SPRAYS_AEROSOL_HEIGHT(ICMP,1)
              ALPHA  = SPRAYS_AEROSOL_ALPHA(ICMP,1)

              PCTILE = SPRAYS_AEROSOL_PERCENTILE(ICMP)
C
              IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
                WRITE(out_unit,'(1X,A9,1pe13.4)') 'QTYH2O = ', QTYH2O
                WRITE(out_unit,'(1X,A9,1pe13.4)') 'HTFALL = ', HTFALL
                WRITE(out_unit,'(1X,A9,1pe13.4)') 'ALPHA  = ', ALPHA
                WRITE(out_unit,'(1X,A9,1pe13.4)') 'PCTILE = ', ALPHA
              END IF

CTJH
CTJH    set uncertainty percentile to 90, which is used to
CTJH    account for sprays with continuously releasing aerosols
CTJH
              PCTILE = 90.0 ! <<=============== HARD-WIRED FOR SPREM90!
CTJH
              IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
                WRITE(out_unit,'(1X,A9,F5.1,A24)') 
     &           'PCTILE = ', PCTILE,' HARD-WIRED FOR SPREM90!'
              END IF
C
C ... reactivated call to spray time stepping  TJH    
C
              CALL SPINIT( QTYH2O, HTFALL, ALPHA, PCTILE, NUMB, ICMP)
C
CSLH    

CSLH    output sprays time markers
C
              IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
                WRITE(out_unit,'(1X,A28)') 
     &               'VALUES RETURNED TO NECSTEPS:'
                DO NSTEPX = 1, NUMB+1
                  WRITE(out_unit,'(1X,A5,I3,A19,F7.1,A7,F8.4,A3)')
     &               ' N = ', NSTEPX, 'Time Marker = ',
     &               SPRAYS_TIME_MARKER(NSTEPX), ' sec = ',
     &               SPRAYS_TIME_MARKER(NSTEPX)/3600.0, ' hr'
                END DO
              END IF
c23456789012345678901234567890123456789012345678901234567890123456789012

CSLH    load sprays time markers into minstep
              DO NSTEPX = 1, NUMB+1
                MINSTEP(KOUNT) = SPRAYS_TIME_MARKER(NSTEPX)
                KOUNT = KOUNT + 1
              END DO

           END IF
C     if Powers/Burson model used for aerosol removal then
         END IF
c     if compartment has the spray option on
      END DO
C     end compartment loop
C     ##############################################################
C     ######## END OF BLOCK TO ADD SPRAYS-MODEL TIME MARKERS #######
C     ##############################################################

C                               necstspr.h
