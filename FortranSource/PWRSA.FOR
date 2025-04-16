C     ##################################################################      

      SUBROUTINE PWRSA(FUTURE_TIME, TIME_STEP, TM, PCTILE, POWER, DFNOW,
     &                  DECOEFF )

C     ##################################################################

C     Pressurized water reactor, severe accident.

C     All entries checked against extra-wide chart on 03/21/95.
C     Also checked by TJH on 09/06/95.

C     See Table 26 on page 173 of reference.

C     Reference is "A Simplified Model of Aerosol Removal by Natural 
C     Processes in Reactor Containments", D. A. Powers, K. E. Washington,
C     S. B. Burson, J. L. Sprung, NUREG/CR-6189, SAND94-0407.

C     Inputs:
C     FUTURE_TIME      simulation time, sec
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
C     MODIFIED BY TJH, December 1996 FOR final releases
C     MODIFIED BY TJH, March 2001 to use actual input fractions and 
C                      final DF instead of RG1083 fractions and a
C                      numerical derivativeC     ------------------------------------------------------------------
C

C
      INCLUDE 'Limits.h'
      INCLUDE 'FILENAME.H'
C

C     declared variables          
C                                          
      double precision POWER, PCTILE, TM(0:7), FUTURE_TIME, DECOEFF,
     &       DECOF_G, DECOF_IV, DECOF_EX, DECOF_LIV, TIME_STEP
C
      double precision DFGAP, DFINV, DFEXV, DFLINV, TNXT, RLSETOT,
     &       DFNOW, DFLAST, DUM1, DUM2, DUM3, DUM4, HRTOSC     
C
C      WRITE(out_unit,'(1X,A23)') '     Subroutine PWRSA!'

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
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.0167 + 3.25 E-06 * POWER
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.0256 + 3.90 E-06 * POWER  
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.0349 + 3.755E-06 * POWER
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
      END IF

C     IN-VESSEL release period, 1800-6480 sec, 0.5-1.8 hr
C
      IF ( FUTURE_TIME .GT. TM(1) ) THEN          
C
C       decontamination of gap release
C
        TNXT = DMIN1(TM(2),FUTURE_TIME) - TM(1)
        DUM2 = TNXT / (TM(2)-TM(1))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.0322 + 7.16 E-06 * POWER
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.0474 + 8.39 E-06 * POWER
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.0808 + 5.955E-06 * POWER
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
C
C       decontamination of in-vessel release
C
        IF ( PCTILE .EQ. 10.0 ) DECOF_IV = 0.0166 + 3.49E-06 * POWER
        IF ( PCTILE .EQ. 50.0 ) DECOF_IV = 0.0257 + 3.87E-06 * POWER
        IF ( PCTILE .EQ. 90.0 ) DECOF_IV = 0.0505 + 0.94E-06 * POWER
        DFINV = DFINV*DEXP( DECOF_IV*TNXT/HRTOSC )
C
      END IF

C     EX-VESSEL & LATE IN-VESSEL release period, 6480-13680 sec, 1.8-3.8 hr
C
      IF ( FUTURE_TIME .GT. TM(2) ) THEN          
C
C       decontamination of gap & in-vessel release
C
        TNXT = DMIN1(TM(3),FUTURE_TIME) - TM(2)
        DUM3 = TNXT / (TM(3)-TM(2))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.0472 +  62.0 / POWER
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.0948 + 141.2 / POWER
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.1146 + 371.9 / POWER
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
C
C     late in-vessel release occurs with ex-vessel release 
C     as noted on page 161 of reference
C    
c       decontamination of ex-vessel & late in-vessel release
c        
        IF ( PCTILE .EQ. 10 ) DECOF_EX = 0.0272 +  42.0  / POWER
        IF ( PCTILE .EQ. 50 ) DECOF_EX = 0.0551 +  84.65 / POWER
        IF ( PCTILE .EQ. 90 ) DECOF_EX = 0.0754 + 184.9  / POWER
        DFEXV = DFEXV*DEXP( DECOF_EX*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_EX*TNXT/HRTOSC )
C  
      END IF      
C      
C     late in-vessel release period 13680-42480 sec, 3.8-11.8 hr
C
      IF ( FUTURE_TIME .GT. TM(3) ) THEN          
C
C       decontamination of gap, in-vessel, & ex-vessel release
C       dum4 accounts for start of late in-vessel release at 1.8 hr
C
        TNXT = DMIN1(TM(4),FUTURE_TIME) - TM(3)
        DUM4 = (DMIN1(TM(4),FUTURE_TIME) - TM(2)) / (TM(4)-TM(2))
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.068 +  81.8 / POWER
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.269 + 141.2 / POWER
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.378 + 161.6 / POWER
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
C
C       decontamination of late in-vessel release
C         
        IF ( PCTILE .EQ. 10 ) DECOF_LIV = 0.0222 + 6.44E-06 * POWER
        IF ( PCTILE .EQ. 50 ) DECOF_LIV = 0.0547 - 0.62E-06 * POWER
        IF ( PCTILE .EQ. 90 ) DECOF_LIV = 0.0829 - 3.40E-06 * POWER
        DFLINV = DFLINV*DEXP( DECOF_LIV*TNXT/HRTOSC )
C
      END IF  
C
C      
C      during all following intervals the decontamination is independent of
C      release phase, as noted on page 200 of reference.
C          
C     decontamination period 42480-80000 sec, 11.8-22.22 hr
C
      IF ( FUTURE_TIME .GT. TM(4) ) THEN          

        TNXT = DMIN1(TM(5),FUTURE_TIME) - TM(4)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 
     &    0.0915 * ( 1.0 - DEXP( -2.216 * POWER / 1000.0 ) )
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.144
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.210  + 50.6 / POWER
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )

      END IF  
c      
C     decontamination period  80000-100000 sec, 22.22-27.78 hr
c
      IF ( FUTURE_TIME .GT. TM(5) ) THEN          

        TNXT = DMIN1(TM(6),FUTURE_TIME) - TM(5)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.0377
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.0838
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.0933 + 12.0 / POWER
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )

      END IF 
C      
C     decontamination period  100000-120000 sec, 27.78-33.33 hr
C
      IF ( FUTURE_TIME .GT. TM(6) ) THEN          

        TNXT = DMIN1(TM(7),FUTURE_TIME) - TM(6)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.0277
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.0669
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.0717 + 10.8 / POWER
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )

      END IF 
      
C     decontamination period 120000-2500000 sec, 33.33-720. hr
C
      IF ( FUTURE_TIME .GT. TM(7) ) THEN  

        TNXT = FUTURE_TIME - TM(7)
        IF ( PCTILE .EQ. 10.0 ) DECOF_G = 0.01
        IF ( PCTILE .EQ. 50.0 ) DECOF_G = 0.01
        IF ( PCTILE .EQ. 90.0 ) DECOF_G = 0.01
        DFGAP = DFGAP*DEXP( DECOF_G*TNXT/HRTOSC )
        DFINV = DFINV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFEXV = DFEXV*DEXP( DECOF_G*TNXT/HRTOSC )
        DFLINV = DFLINV*DEXP( DECOF_G*TNXT/HRTOSC )

      END IF
C
C ... convert DF by release type to an average DF
C
C     average should be based upon the release fractions of the particular
c     element (chemical class) involved.  We can not do this at this time
c     so I will follow the iodine pattern of 5% in phase 1 and 35 % in 
c     phase 2 and 25% in phase 3 and 10% in phase 4 for the severe accident, 
c
c ....   note dap used this draft 1465 release
C
C
      DFNOW = DUM1*0.05/DFGAP
      RLSETOT = DUM1*0.05
      IF (DFINV .GT. 1.0) THEN
         DFNOW = DFNOW + DUM2*0.35/DFINV
         RLSETOT = RLSETOT + DUM2*0.35
      END IF
      IF (DFEXV .GT. 1.0) THEN
         DFNOW = DFNOW + DUM3*0.25/DFEXV
         RLSETOT = RLSETOT + DUM3*0.25
      END IF
      IF (DFLINV .GT. 1.0) THEN
         DFNOW = DFNOW + DUM4*0.10/DFLINV
         RLSETOT = RLSETOT + DUM4*0.10
      END IF
      DFNOW = MAX(1.0, RLSETOT/DFNOW)
      IF (DFNOW .GT. 1.0D6) DFNOW = 1.0e6
C
C     convert average decontamination factor, DFNOW, to a 
C                        removal coefficient, DECOEFF
C     assume the change in DF over the interval unless its negative,
C            then use the average DF over all time or 1C
      IF (DFLAST .GT. 0.0) THEN
      DECOEFF = HRTOSC * DLOG(DFNOW/DFLAST)/TIME_STEP  
          IF (DECOEFF .LT. 0.0) DECOEFF = HRTOSC * MAX (0.,
     &                                DLOG(DFNOW)/(FUTURE_TIME-TM(0)))
      END IF
C
C     return to caller
      RETURN

C     end of subroutine pwrsa
      END

