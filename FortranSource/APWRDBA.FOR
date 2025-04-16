C     ##################################################################

      SUBROUTINE APWRDBA( FUTURE_TIME, TIME_STEP, TM, PCTILE, 
     &                  DFNOW, DECOEFF, IODINE_GAP, IODINE_EARLY )	

C     ##################################################################

C     AP-600  Advanced Pressurized water reactor, Design Basis Accident.

C     See Table 15 on page 82 of reference.



C     Reference is "Monte Carlo Uncertainity Analysis of Aerosol Behavior
C     in the AP600 Reactor Containment Under Conditions of a Specific
C     Design - Basis Accident", D. A. Powers, NUREG/CR-, SAND.

C     Inputs:
C     FUTURE_TIME     simulation time, sec
C     TIME_STEP  current time step, sec
C     TM         time marker array, sec
C     PCTILE     uncertainty percentile
C     DFNOW      last value of the decontamination factor
C     Outputs:
C     DECOEFF    decontamination coefficient, 1/hr

C     ------------------------------------------------------------------
C     CREATED BY TJH, December 1996
C     MODIFIED BY TJH, March 2001 to use actual input fractions and 
C                      derived LAMBDA instead of RG1083 fractions and a
C                      derived DF and an approximate LAMBDA
C     ------------------------------------------------------------------
C
      INCLUDE 'Limits.h'
      INCLUDE 'FILENAME.H'
C
C


C     declared variables
C
      double precision PCTILE, TM(0:7), FUTURE_TIME, DECOEFF,
     $    DECOF_G, DECOF_IV, TIME_STEP, IODINE_GAP, IODINE_EARLY
C
      double precision DFGAP, DFINV, TNXT, RLSETOT,
     &       DFNOW, DFLAST, DUM1, DUM2, HRTOSC

C
C       WRITE(out_unit,'(1X,A23)') '     Subroutine APWRDBA!'

C     conversion factor, hr to sec
      HRTOSC = 3600.0

C
C ... initialization
C
      DFLAST = DFNOW
C
      DFGAP = 1.0
      DFINV = 1.0
C
      DUM1 = 0.0
      DUM2 = 0.0

	DECOF_G = 0.0
	DECOF_IV = 0.0
C
C     gap release period, 0-1800 sec, 0.0-0.5 hr
C
      IF ( FUTURE_TIME .GT. TM(0) ) THEN
C
C       decontamination of gap release
C
        TNXT = DMIN1(TM(1),FUTURE_TIME) - TM(0)
        DUM1 = TNXT / (TM(1)-TM(0))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.029
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.233
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.466
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
      END IF

C     IN-VESSEL release  1800-6480 sec, 0.5-1.8 hr
C
      IF ( FUTURE_TIME .GT. TM(1) ) THEN
C
C       decontamination of gap release
C
        TNXT = DMIN1(TM(2),FUTURE_TIME) - TM(1)
        DUM2 = TNXT / (TM(2)-TM(1))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.160
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.487
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.872

        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
C
C       decontamination of in-vessel release
C
        IF ( PCTILE .EQ. 10.0 ) DECOF_IV = 0.100
        IF ( PCTILE .EQ. 50.0 ) DECOF_IV = 0.240
        IF ( PCTILE .EQ. 90.0 ) DECOF_IV = 0.393

        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
C
      END IF

C
C      during all following intervals the decontamination is independent of
C      release phase, as noted on page 200 of reference.
C
C     decontamination period 6480-13680 sec, 1.8-3.8 hr
C
      IF ( FUTURE_TIME .GT. TM(2) ) THEN
C
        TNXT = DMIN1(TM(3),FUTURE_TIME) - TM(2)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.731
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.980
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.210
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF
C
C     decontamination period 13680-49680 sec, 3.8-13.8 hr
C
      IF ( FUTURE_TIME .GT. TM(3) ) THEN

        TNXT = DMIN1(TM(4),FUTURE_TIME) - TM(3)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.245
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.397
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.594
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF
C
C     decontamination period 49680-86400 sec, 13.8-24.0 hr
C
      IF ( FUTURE_TIME .GT. TM(4) ) THEN

        TNXT = DMIN1(TM(5),FUTURE_TIME) - TM(4)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.107
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.327
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.620
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF
C
C     decontamination period 86400-100000 sec, 24.0-27.78 hr
C
      IF ( FUTURE_TIME .GT. TM(5) ) THEN

        TNXT = DMIN1(TM(6),FUTURE_TIME) - TM(5)
        DECOF_G = 0.01
        DECOF_IV = 0.01
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF
C
C     decontamination period 100000-120000 sec, 27.78-33.33 hr
C
      IF ( FUTURE_TIME .GT. TM(6) ) THEN

        TNXT = DMIN1(TM(7),FUTURE_TIME) - TM(6)
        DECOF_G = 0.01
        DECOF_IV = 0.01
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF
C
C     decontamination period 120000-2500000 sec, 33.33-720 hr
C
      IF ( FUTURE_TIME .GT. TM(7) ) THEN

        TNXT = FUTURE_TIME - TM(7)
        DECOF_G = 0.01
        DECOF_IV = 0.01
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF
C
C
C ... convert LAMBDA by release type to an average LAMBDA
C
C     average should be based upon the release fractions of the particular
c     element (chemical class) involved.  We can not do this at this time
c     so I will follow the iodine pattern of 5% in phase 1 (IODINE_GAP) and 
c     30 % in phase 2 (IODINE_IV) for the design basis accident
C
C
      DFNOW = DUM1*IODINE_GAP/DFGAP
      RLSETOT = DUM1*IODINE_GAP
	DECOEFF = DFNOW*DECOF_G
      IF (DUM2 .GT. 0.0) THEN
         DFNOW = DFNOW + DUM2*IODINE_EARLY/DFINV
         RLSETOT = RLSETOT + DUM2*IODINE_EARLY
	   DECOEFF = DECOEFF + DECOF_IV*DUM2*IODINE_EARLY/DFINV
      END IF

	IF (DFNOW .GT. 0.0) THEN
	   DECOEFF = DECOEFF/DFNOW
	   DFNOW = RLSETOT/DFNOW
	ELSE
	   DFNOW = 1.0
	   DECOEFF = 0.0
	END IF
C
C
C     return to caller
      RETURN

C     end of subroutine apwrdba
      END

