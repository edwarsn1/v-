C     TESTED VERSION

C     ##################################################################      
      SUBROUTINE AEROSOL( REACTOR_TYPE, SIMTIM, TIME_STEP,
     $  PERCENTILE, DECOEFF)
C     ##################################################################
      
C     Tested on 21 March 1995 using the off-line driver. Results agreed 
C     with Examples 1, 2, 3 in reference.

C     Tested again on 09 June 1995 using the off-line driver, after      
C     logic changes made for error checking. Results agreed with those
C     obtained on 21 March 1995.

C     Subroutine AEROSOL receives the decontamination coefficient in
C     units of 1/hr and converts it to 1/sec. 
                                
C     Inputs:
C     variable            format        value(s)             origin
C     -------------------------------------------------------------
C     REACTOR_TYPE        char (a6)   PWRDBA, PWRSA 
C                                        APWRDBA              passed
C                                     BWRDBA, BWRSA
C     SIMTIM              double        seconds              passed
C     TIME_STEP           double        seconds              passed
C     PERCENTILE          double        10%, 50%, 90%        passed
C     PLANT_POWER_LEVEL   double        MW-thermal           PASSED

C     Output:
C     variable            format                  value(s)          origin    
C     DECOEFF             double precision          1/sec           AEROSOL

C     Called by:
C     XNTDEP

C     Calls to:
C     routine      reactor type                 release type
C     PWRSA        pressurized water reactor    gap release
C                  pressurized water reactor    in-vessel release
C                  pressurized water reactor    ex-vessel release
C                  pressurized water reactor    late in-vessel release
C     PWRDBA       pressurized water reactor    gap release
C                  pressurized water reactor    in-vessel release
C     APWRDBA      advanced PWR                 gap release
C                  advanced PWR                 in-vessel release
C     BWRSA        boiling water reactor        gap release
C                  boiling water reactor        in-vessel release
C                  boiling water reactor        ex-vessel release
C                  boiling water reactor        late in-vessel release
C     BWRDBA       boiling water reactor        gap release
C                  boiling water reactor        in-vessel release
     
C     Reference is "A Simplified Model of Aerosol Removal by Natural 
C     Processes in Reactor Containments", D. A. Powers, K. E. Washington,
C     S. B. Burson, J. L. Sprung, NUREG/CR-6189, SAND94-0407.


C     Reference is "Monte Carlo Uncertainity Analysis of Aerosol Behavior
C     in the AP600 Reactor Containment Under Conditions of a Specific 
C     Design - Basis Accident", D. A. Powers, NUREG/CR-, SAND (1996).



C     ------------------------------------------------------------------
C     NEW VERSION, CREATED BY DKM, FEBRUARY 1995.
C     TESTED BY DKM, MARCH AND JUNE, 1995
C     MODIFIED BY TJH, DEC 1996, TO ADD AP600 CAPABILITY,
C       TO CHANGE CALLING ROUTINES, AND TO UPDATE BWR ANALYSIS
C     ------------------------------------------------------------------  

C     include statement
      INCLUDE 'full.com'

      COMMON /DFN/ DFNOW, DFNOWX, DFNOW18
C
C

C     declared variable types
      CHARACTER*7 REACTOR_TYPE
      double precision PERCENTILE,POWER_MWT, POWER_APWR
      double precision DECOEFF, DECOEF, DECOEFA, DECOEFX, DECOEF18
      double precision DFNOW, DFNOWX, DFNOW18, FUTURE_TIME
      double precision HRTOSC, SIMTIM, TIME_STEP, TIME_MARKER(0:7)

C     conversion factor, hr to sec
      HRTOSC = 3600.0

C     conversion to MWth
      POWER_MWT = 1.0e-6*PLANT_POWER_LEVEL

C     verify simtim > 0.0
      DECOEFF = 0.0
	FUTURE_TIME = SIMTIM + TIME_STEP
      IF (SIMTIM .LE. 0.0) THEN 
C
C ... Initialization
C
        DFNOW = 1.0
	  DFNOWX = 1.0
	  DFNOW18 = 1.0	
	END IF

C     time markers for PWR DBA, sec
      IF ( REACTOR_TYPE .EQ. 'PWRDBA' ) THEN
        TIME_MARKER(0) =      0.0   !  0.0  hr
        TIME_MARKER(1) =   1800.0   !  0.5  hr
        TIME_MARKER(2) =   6480.0   !  1.8  hr
        TIME_MARKER(3) =  13680.0   !  3.8  hr
        TIME_MARKER(4) =  49680.0   ! 13.8  hr
        TIME_MARKER(5) =  80000.0   ! 22.22 hr
        TIME_MARKER(6) = 100000.0   ! 27.78 hr 
        TIME_MARKER(7) = 120000.0   ! 33.33 hr     

      ELSE
C
C     time markers for PWR SA, sec
     & IF ( REACTOR_TYPE .EQ. 'PWRSA' ) THEN
        TIME_MARKER(0) =      0.0   !  0.0  hr
        TIME_MARKER(1) =   1800.0   !  0.5  hr
        TIME_MARKER(2) =   6480.0   !  1.8  hr
        TIME_MARKER(3) =  13680.0   !  3.8  hr
        TIME_MARKER(4) =  42480.0   ! 11.8  hr
        TIME_MARKER(5) =  80000.0   ! 22.22 hr
        TIME_MARKER(6) = 100000.0   ! 27.78 hr
        TIME_MARKER(7) = 120000.0   ! 33.33 hr

      ELSE
C
C     time markers for advanced PWR DBA, sec
     & IF ( REACTOR_TYPE .EQ. 'APWRDBA' ) THEN
        TIME_MARKER(0) =      0.0   !  0.0  hr
        TIME_MARKER(1) =   1800.0   !  0.5  hr
        TIME_MARKER(2) =   6480.0   !  1.8  hr
        TIME_MARKER(3) =  13680.0   !  3.8  hr
        TIME_MARKER(4) =  49680.0   ! 13.8  hr
        TIME_MARKER(5) =  86400.0   ! 24.0  hr
        TIME_MARKER(6) = 100000.0   ! 27.78 hr
        TIME_MARKER(7) = 120000.0   ! 33.33 hr

      ELSE

C     time markers for BWR DBA, sec
     & IF ( REACTOR_TYPE .EQ. 'BWRDBA' ) THEN
        TIME_MARKER(0) =      0.0   !  0.0  hr
        TIME_MARKER(1) =   1800.0   !  0.5  hr
        TIME_MARKER(2) =   7200.0   !  2.0  hr
        TIME_MARKER(3) =  18000.0   !  5.0  hr
        TIME_MARKER(4) =  30000.0   !  8.33 hr
        TIME_MARKER(5) =  43200.0   ! 12.0  hr
        TIME_MARKER(6) =  70000.0   ! 19.44 hr
        TIME_MARKER(7) =  86400.0   ! 24.0  hr

      ELSE

C     time markers for BWR SA, sec
     & IF ( REACTOR_TYPE .EQ. 'BWRSA' ) THEN
        TIME_MARKER(0) =      0.0   !  0.0  hr
        TIME_MARKER(1) =   1800.0   !  0.5  hr
        TIME_MARKER(2) =   7200.0   !  2.0  hr
        TIME_MARKER(3) =  18000.0   !  5.0  hr
        TIME_MARKER(4) =  43200.0   ! 12.0  hr
        TIME_MARKER(5) =  80000.0   ! 22.22 hr
        TIME_MARKER(6) = 100000.0   ! 27.78 hr
        TIME_MARKER(7) = 120000.0   ! 33.33 hr

      ELSE

C     else reactor type not found for time-marker data
        WRITE(out_unit,'(1X,A49)') 
     $   ' REACTOR TYPE WAS NOT FOUND FOR TIME-MARKER DATA! (AEROSOL)'
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************

        STOP
      END IF

C     call appropriate subroutine for decontamination factor
CTJH
CTJH  NOTE: I extrapolated all the curves beyond 120000 sec
CTJH  that DAP used by setting the coefficient to a constant which
CTJH  allows decontamination to slightly increase from 33 to 720 hr.
CTJH
CTJH

C     -------- pressurized-water reactor Design Basis Accident -----------

C     if reactor_type is PWR then
      IF ( REACTOR_TYPE .EQ. 'PWRDBA' ) THEN

C       determine average decontamination coefficient 

          CALL PWRDBA(FUTURE_TIME, TIME_STEP, TIME_MARKER, PERCENTILE, ! <<=====     
     &      POWER_MWT, DFNOW, DECOEF, IODINE_GAP, IODINE_EARLY )

      ELSE

C     -------- pressurized-water reactor severe accident ---------------

C     if reactor_type is PWR then
     & IF ( REACTOR_TYPE .EQ. 'PWRSA' ) THEN

C       determine average decontamination coefficient
 
          CALL PWRSA(FUTURE_TIME, TIME_STEP, TIME_MARKER, PERCENTILE, ! <<=====
     &      POWER_MWT, DFNOW, DECOEF )


      ELSE

C     ---- advanced pressurized-water reactor Design Basis accident -----------

C     if reactor_type is APWR then

     & IF ( REACTOR_TYPE .EQ. 'APWRDBA' ) THEN

C       determine average decontamination coefficient 
C       for 1800 MWt advanced PWR design

          POWER_APWR = 1800.
 
          CALL APWRDBA(FUTURE_TIME, TIME_STEP, TIME_MARKER, PERCENTILE, 
     &      DFNOW, DECOEFA, IODINE_GAP, IODINE_EARLY )
C
          IF (DABS(POWER_MWT/POWER_APWR - 1.0) .GT. 0.05) THEN
C
C ...    determine decontamination for a non 1800 MWt PWR
c
           CALL PWRDBA(FUTURE_TIME, TIME_STEP, TIME_MARKER, PERCENTILE,     
     &           POWER_MWT, DFNOWX, DECOEFX, IODINE_GAP, IODINE_EARLY )
C
C ...    determine decontamination for a 1800 MWt PWR
c
           CALL PWRDBA(FUTURE_TIME, TIME_STEP, TIME_MARKER, PERCENTILE,     
     &        POWER_APWR, DFNOW18, DECOEF18, IODINE_GAP, IODINE_EARLY )
         ELSE
          DECOEF18 = 1.0
          DECOEFX = 1.0

         END IF 
C
C ...   The difference between the decontamination coefficients at 
C       600 MWE reflects the effect of phoretic deposition due to the 
C       cooled walls in the new design.  By multiplying the difference
C       by the power ratio this effect can be accounted for.  The 
C       addition of the PWR at power decontamination coefficient 
C       reflects the continuing gravitational deposition that is less 
C       dependent upon the design.
C        
         DECOEF = DECOEFX + (POWER_MWT/POWER_APWR)*
     $	       (DECOEFA - DECOEF18)
         IF (DECOEF .LT. 0.001) DECOEF = 0.001
C
C

      ELSE


C     ------------ boiling-water reactor Design Basis Accident -------------

C     if reactor_type is BWR then
     & IF ( REACTOR_TYPE .EQ. 'BWRDBA' ) THEN

C       determine average decontamination coefficient

          CALL BWRDBA(FUTURE_TIME, TIME_STEP, TIME_MARKER, PERCENTILE, ! <<======     
     &      POWER_MWT, DFNOW, DECOEF, IODINE_GAP, IODINE_EARLY )
 

C     end if reactor_type is BWR DBA 

      ELSE

C     ------------ boiling-water reactor severe accident -----------------

C     if reactor_type is BWR then
     & IF ( REACTOR_TYPE .EQ. 'BWRSA' ) THEN

C       determine average decontamination coefficient

          CALL BWRSA(FUTURE_TIME, TIME_STEP, TIME_MARKER, PERCENTILE, ! <<======     
     &      POWER_MWT, DFNOW, DECOEF )
 

C     end if reactor_type is BWR  SA

      ELSE

        WRITE(out_unit,'(1X,A49)') 
     &   ' REACTOR TYPE WAS NOT FOUND FOR SUBROUTINE CALLS! (AEROSOL)'
      write(*,*) '***********    S T O P   *******************'
      
C      *****************    S T O P   ***************************
        STOP
      
      END IF


C     decontamination coefficient received in units of 1/hr
C     convert decontamination coefficient to units of 1/sec
      DECOEFF = DECOEF / HRTOSC

C     return to caller
      RETURN
      
C     end of subroutine aerosol
      END
