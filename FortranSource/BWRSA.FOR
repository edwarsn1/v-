
C     ##################################################################      

      SUBROUTINE BWRSA(FUTURE_TIME, TIME_STEP, TM, PCTILE, POWER, DFNOW,
     &                  DECOEFF )

C     ##################################################################

C     Boiling water reactor, severe accident.

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
C     MODIFIED BY TJH, December 1996 to reflect final 1465 BWR releases
C     ------------------------------------------------------------------  
C

C
      INCLUDE 'Limits.h'
      INCLUDE 'FILENAME.H'

C     declared variables          
C                                          
      double precision POWER, PCTILE, TM(0:7), FUTURE_TIME, DECOEFF,
     &       DECOF_G, DECOF_IV, DECOF_EX, DECOF_LIV, TIME_STEP
C
      double precision DFGAP, DFINV, DFEXV, DFLINV, TNXT, RLSETOT,
     &       DFNOW,  DFLAST, DUM1, DUM2, DUM3, DUM4, HRTOSC

C
C      WRITE(out_unit,'(1X,A23)') '     Subroutine BWRSA!'

C     conversion factor, hr to sec
      HRTOSC = 3600.0

C
C ... initialization
C
      DFLAST = DFNOW
C
      DFGAP = 1.0
      DFINV = 1.0
      DFEXV = 1.0
      DFLINV = 1.0
C
      DUM1 = 0.0
      DUM2 = 0.0
      DUM3 = 0.0
      DUM4 = 0.0
C
C     GAP release period, 0-1800 sec, 0.0-0.5 hr
C     
      IF ( FUTURE_TIME .GT. TM(0) ) THEN
C
C       decontamination of gap release
C
        TNXT = DMIN1(TM(1),FUTURE_TIME) - TM(0)
        DUM1 = TNXT / (TM(1)-TM(0))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 1.919 * DEXP(- 2767. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 3.517 * DEXP(- 2534. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 4.074 * DEXP(- 1165. /POWER)
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
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 1.558 * DEXP(- 2646. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 3.155 * DEXP(- 2407. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 5.132 * DEXP(- 1557. /POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
C      
C       decontamination of in-vessel release
C        
        IF ( PCTILE .EQ. 10.0 ) DECOF_IV = 0.724 * DEXP(- 2498. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_IV = 1.202 * DEXP(- 2045. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_IV = 1.446 * DEXP(- 1012. /POWER)   
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
C          
      END IF
C
C     EX-VESSEL & LATE IN-VESSEL release period, 7200-18000 sec, 2.0-5.0 hr
C
      IF ( FUTURE_TIME .GT. TM(2) ) THEN          
C
C       decontamination of gap & in-vessel release
C
        TNXT = DMIN1(TM(3),FUTURE_TIME) - TM(2)
        DUM3 = TNXT / (TM(3)-TM(2))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.939 * DEXP(- 616. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 1.479 * DEXP(- 500. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 2.224 * DEXP(- 116. /POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
C
C     decontamination of ex-vessel & late in-vessel release
C          
        IF ( PCTILE .EQ. 10.0 ) DECOF_EX = 0.394 * DEXP(- 429. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_EX = 0.525 * DEXP(- 302. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_EX = 0.639 * DEXP(- 62. /POWER)
        DFEXV = DFEXV*DEXP( DECOF_EX*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_EX*TNXT/HRTOSC )
C
      END IF
C      
C     late in-vessel release period 18000-43200 sec, 5.0-12.0 hr
C
      IF ( FUTURE_TIME .GT. TM(3) ) THEN          
C
C       decontamination of gap, in-vessel, & ex-vessel release    
C       dum4 accounts for start of late in-vessel release at 2.0 hr
C
        TNXT = DMIN1(TM(4),FUTURE_TIME) - TM(3)
        DUM4 = (DMIN1(TM(4),FUTURE_TIME) - TM(2)) / (TM(4)-TM(2))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.576 * DEXP(- 172. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.779 * DEXP(- 252. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 1.037 * DEXP(- 240. /POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
C
C       decontamination of late in-vessel release
C    
        IF ( PCTILE .EQ. 10.0 ) DECOF_LIV = 0.000005
        IF ( PCTILE .EQ. 50.0 ) DECOF_LIV = 0.00075
        IF ( PCTILE .EQ. 90.0 ) DECOF_LIV = 0.052
        DFLINV = DFLINV*DEXP( DECOF_LIV*TNXT/HRTOSC )
C
      END IF  
C
C      
C      during all following intervals the decontamination is independent of
C      release phase, as noted on page 200 of reference.
C          
C     decontamination period 43200-80000 sec, 12.0-22.22 hr
C
      IF ( FUTURE_TIME .GT. TM(4) ) THEN                  

        TNXT = DMIN1(TM(5),FUTURE_TIME) - TM(4)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.295 * DEXP(- 849. / POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.445 * DEXP(- 630. / POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.704 * DEXP(- 468. / POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )
      END IF  
C      
C     decontamination period 80000-100000 sec, 22.22-27.78 hr
C
      IF ( FUTURE_TIME .GT. TM(5) ) THEN          

        TNXT = DMIN1(TM(6),FUTURE_TIME) - TM(5)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.217 * DEXP(- 894. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.463 * DEXP(- 1242. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.700 * DEXP(- 717. /POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )

      END IF  
C      
C     decontamination period 100000-120000 sec, 27.78-33.33 hr
C
      IF ( FUTURE_TIME .GT. TM(6) ) THEN          

        TNXT = DMIN1(TM(7),FUTURE_TIME) - TM(6)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.196 * DEXP(- 945. /POWER)
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.473 * DEXP(- 1384. /POWER)
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.665 * DEXP(- 643. /POWER)
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )

      END IF 
C
C     decontamination period 120000-2500000 sec, 33.33-720 hr
C
      IF ( FUTURE_TIME .GT. TM(7) ) THEN          

        TNXT = FUTURE_TIME - TM(7)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.1
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.1
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.1
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )

      END IF
C
C ... convert DF by release type to an average DF
C
C     average should be based upon the release fractions of the particular
c     element (chemical class) involved.  We can not do this at this time
c     so I will follow the iodine pattern of 5% in phase 1 and 25 % in 
c     phase 2, 30% in phase 3, and 1% in phase 4 for the severe accident.
c
C
      DFNOW = DUM1*0.05/DFGAP
      RLSETOT = DUM1*0.05
      IF (DUM2 .GT. 0.0) THEN
         DFNOW = DFNOW + DUM2*0.25/DFINV
         RLSETOT = RLSETOT + DUM2*0.25
      END IF
      IF (DUM3 .GT. 0.0) THEN
         DFNOW = DFNOW + DUM3*0.30/DFEXV
         RLSETOT = RLSETOT + DUM3*0.30
      END IF
      IF (DUM4 .GT. 0.0) THEN
         DFNOW = DFNOW + DUM4*0.01/DFLINV
         RLSETOT = RLSETOT + DUM4*0.01
      END IF
C      
      DFNOW = MAX(1.0, RLSETOT/DFNOW)
C
C     convert average decontamination factor, DFNOW, to a 
C                        removal coefficient, DECOEFF
C     assume the change in DF over the interval unless its negative,
C            then use the average DF over all time or 1
C
      DECOEFF = 0.0
      IF (DFLAST .GT. 0.0) THEN
      DECOEFF = HRTOSC * DLOG(DFNOW/DFLAST)/TIME_STEP  
          IF (DECOEFF .LT. 0.0) DECOEFF = HRTOSC * MAX (0.,
     &                                DLOG(DFNOW)/(FUTURE_TIME-TM(0)))
      END IF

C     return to caller
      RETURN

C     end of subroutine bwrsa
      END

