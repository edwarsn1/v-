C     ##################################################################      

      SUBROUTINE BWRDBA(FUTURE_TIME, TIME_STEP, TM, PCTILE, POWER,
     &                   DFNOW, DECOEFF, IODINE_GAP, IODINE_EARLY )    

C     ##################################################################

C     Boiling water reactor, design basis accident.

C     All entries checked against extra-wide chart on 03/21/95.

C     See Table 44 on page 215 of reference.

C     Reference is "A Simplified Model of Aerosol Removal by Natural 
C     Processes in Reactor Containments", D. A. Powers, K. E. Washington,
C     S. B. Burson, J. L. Sprung, NUREG/CR-6189, SAND94-0407.

C     Inputs:
C     FUTURE_TIME     simulation time, sec
C     TIME_STEP  current time step, sec
C     TM         time marker array, sec
C     PCTILE     uncertainty percentile
C     POWER      power in MW-thermal
C     DFNOW      last value of the decontamination factor
C     Outputs:
C     DECOEFF    decontamination coefficient, 1/hr

C     ------------------------------------------------------------------
C     CREATED BY DKM, FEBRUARY 1995.
C     MODIFIED BY TJH, June 1996 to reduce the number of subroutines
C     MODIFIED BY TJH, November 1996 to reflect final 1465 BWR releases
C     MODIFIED BY TJH, March 2001 to use actual input fractions and 
C                      derived LAMBDA instead of RG1083 fractions and a
C                      derived DF and an approximate LAMBDA
C     ------------------------------------------------------------------  
C

C
      INCLUDE 'Limits.h'
      INCLUDE 'FILENAME.H'

C     declared variables          
C                                           
      double precision POWER, PCTILE, TM(0:7), FUTURE_TIME, DECOEFF,
     &       DECOF_G, DECOF_IV, TIME_STEP, IODINE_GAP, IODINE_EARLY
C
      double precision DFGAP, DFINV, TNXT, RLSETOT,
     &       DFNOW, DFLAST, DUM1, DUM2, HRTOSC     

C
C
C
C      WRITE(out_unit,'(1X,A23)') '     Subroutine BWRDBA!'

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
C
C     GAP release period, 0-3600 sec, 0.0-0.5 hr
C     
      IF ( FUTURE_TIME .GT. TM(0) ) THEN

C
C       decontamination of gap release
C
        TNXT = DMIN1(TM(1),FUTURE_TIME) - TM(0)
        DUM1 = TNXT / (TM(1)-TM(0))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 1.285 *DEXP(- 2119. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 2.252 *DEXP(- 1977. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 2.903 *DEXP(- 1060. / POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
      END IF
C
C     In-VESSEL release period 1800 - 7200 sec, 0.5-2.0 hr
C
      IF ( FUTURE_TIME .GT. TM(1) ) THEN          
C
C       decontamination of gap release
C
        TNXT = DMIN1(TM(2),FUTURE_TIME) - TM(1)
        DUM2 = TNXT / (TM(2)-TM(1))      
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 1.161 *DEXP(- 2274. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 1.722 *DEXP(- 1777. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.809 *DEXP(- 777. / POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
C      
C       decontamination of in-vessel release
C      
        IF ( PCTILE .EQ. 10.0 ) DECOF_IV = 0.520 *DEXP(- 2173. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_IV = 0.752 *DEXP(- 1565. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_IV = 0.746 *DEXP(- 626. / POWER)  
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
C
      END IF
C
C      
C      during all following intervals the decontamination is independent
C      of release phase.
C      7200-250000 sec, 1.8-720 hr
C
C
C     decontamination period 7200-18000 sec, 2.0-5.0 hr
C
      IF ( FUTURE_TIME .GT. TM(2) ) THEN          
C
C       decontamination of gap & in-vessel release
C
        TNXT = DMIN1(TM(3),FUTURE_TIME) - TM(2)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 1.551 *DEXP(- 1507. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 1.811 *DEXP(- 1107. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.959 *DEXP(- 548. / POWER)
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF  
C
C     decontamination period 18000-30000 sec, 5.0-8.33 hr
C
      IF ( FUTURE_TIME .GT. TM(3) ) THEN          
C
        TNXT = DMIN1(TM(4),FUTURE_TIME) - TM(3)   
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.836 *DEXP(- 1091. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 1.317 *DEXP(- 1225. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.533 *DEXP(- 573. / POWER)
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF
C
C     decontamination period 30000-43200 sec, 8.33-12.0 hr
C
      IF ( FUTURE_TIME .GT. TM(4) ) THEN          
C
        TNXT = DMIN1(TM(5),FUTURE_TIME) - TM(4)   
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.780 *DEXP(- 1316. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 1.339 *DEXP(- 1474. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.524 *DEXP(- 647. / POWER)
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF 
C
C     decontamination period 43200-70000 sec, 12.0-19.44 hr
C
      IF ( FUTURE_TIME .GT. TM(5) ) THEN  
C
        TNXT = DMIN1(TM(6),FUTURE_TIME) - TM(5)   
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.778 *DEXP(- 1548. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 1.373 *DEXP(- 1634. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.564 *DEXP(- 717. / POWER)
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF  
C
C     decontamination period 70000-86400 s.   19.44-24. hr
C
      IF ( FUTURE_TIME .GT. TM(6) ) THEN          
C
        TNXT = DMIN1(TM(7),FUTURE_TIME) - TM(6)   
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.780 *DEXP(- 1686. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 1.441 *DEXP(- 1785. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.562 *DEXP(- 719. / POWER)
        DECOF_IV = DECOF_G
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
      END IF  
C
C     decontamination period 24.-720. hr
c
      IF ( FUTURE_TIME .GT. TM(7) ) THEN          
C
        TNXT = FUTURE_TIME - TM(7)   
        DECOF_G = 0.1
        DECOF_IV = 0.1
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

C     end of subroutine bwrdba
      END

