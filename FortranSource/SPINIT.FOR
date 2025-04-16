C     VERSION COPIED TO MCODE ON 29 JUNE 1995

C     ##################################################################      
      SUBROUTINE SPINIT( QTYH2O, HTFALL, ALPHA, PCTILE, NUMB, ICMP)
C     ################################################################## 
C
C	 2.2 - June 1998 - moved the extra spray model 
c                  times into common sprays and activated this
C                  routine
C                  
C     include statement 
c      INCLUDE 'MCODE\full.com'
       include 'full.com'
      INTEGER NUMB, NSTEPX, NPCT
      INTEGER ICMP, I, ISW

      double precision QTYH2O, HTFALL, ALPHA, PCTILE, QTYCGS, HTFCGS
      double precision ARGEXP, BASEDT, SPREM90, TIME1, TMIN1
      double precision AA(3), BB(3), CC(3), DD(3), EE(3), FF(3), GG(3)

C     AA through GG determine 90% decontamination coefficient   
      DATA AA, BB, CC, DD, EE, FF, GG             /
C          10th pct      50th pct      90th pct
     &     5.5750,       6.83707,      7.10927,
     &     0.94362,      1.0074,       0.92549,
     &     0.0,         -2.4045E-5,    0.0,
     &    -6.9821E-3,   -4.1731E-3,   -8.0868E-4,
     &    -7.327E-7,     9.006E-8,     0.0,
     &     0.0,         -1.2478,       0.0,
     &     3.555E-6,     0.0,          0.0        /

C     output banners to files      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A18)') 'SUBROUTINE SPINIT!'   
      END IF

CTJH
CTJH    set uncertainty percentile to 90, which is used to
CTJH    account for sprays with continuously releasing aerosols
CTJH
CTJH       PCTILE = 90.0 ! <<=============== HARD-WIRED IN NECSTSPR!
CTJH

C     set integer for percentile
      IF ( PCTILE .EQ. 10.0 ) THEN
        NPCT = 1
      ELSE
     & IF ( PCTILE .EQ. 50.0 ) THEN  
        NPCT = 2
      ELSE
     & IF ( PCTILE .EQ. 90.0 ) THEN        
        NPCT = 3
      END IF

      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A7,I2)') 'NPCT = ', NPCT
      END IF
          
C     convert to correlation units, e.g., cgs units                 
      QTYCGS = 100.0 * QTYH2O
      HTFCGS = 100.0 * HTFALL
      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN     
        WRITE(out_unit,'(1X,A9,F7.3,A16)') 
     &   'QTYH2O = ', QTYCGS, ' cm3-H2O/cm2/sec'
        WRITE(out_unit,'(1X,A9,F6.1,A3)') 'HTFALL = ', HTFCGS, ' cm'
        WRITE(out_unit,'(1X,A8,F3.1)') 'ALPHA = ',  ALPHA  
      END IF      

C     argument of exponent            
      ARGEXP = + AA(NPCT) + BB(NPCT) * DLOG(QTYCGS) +
     &  CC(NPCT) * HTFCGS + DD(NPCT) * QTYCGS**2 * HTFCGS +
     &  EE(NPCT) * QTYCGS * HTFCGS**2 + FF(NPCT) * QTYCGS +
     &  GG(NPCT) * QTYCGS**2 * HTFCGS**2

      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A10,1pe13.4)') 'ARGEXP  = ', ARGEXP
      END IF

C     sprem90 accounts for effects of sprays on any aerosol

C     spray removal rate for aerosol removal by sprays, 1/sec              
C     account for units and unsprayed volume
C     note: sprays-alpha is ratio of DRY volume to WET volume
C
      SPREM90 =  DEXP(ARGEXP) / 3600.0 / ( 1.0 + ALPHA )

      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A10,1pe13.4)') 'SPREM90 = ', SPREM90
      END IF
C     initialize count            
C      SPRAYS_AEROSOL_COUNT(ICMP) = 5 
      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN     
         WRITE(out_unit,'(1X,A21,I2,A4,I2)') 
     &      'SPRAYS_AEROSOL_COUNT(', ICMP, ') = ',
     &      SPRAYS_AEROSOL_COUNT(ICMP)
         WRITE(out_unit,'(1X,A25,1pe13.4)') 
     &      'SPRAYS_AEROSOL_FLUX(1,1) = ', SPRAYS_AEROSOL_FLUX(ICMP,1)
         WRITE(out_unit,'(1X,A25,1pe13.4)') 
     &      'SPRAYS_AEROSOL_FLUX(1,2) = ', SPRAYS_AEROSOL_FLUX(ICMP,2)
         WRITE(out_unit,'(1X,A25,1pe13.4)') 
     &      'SPRAYS_AEROSOL_TIME(1,1) = ', SPRAYS_AEROSOL_TIME(ICMP,1)
         WRITE(out_unit,'(1X,A25,1pe13.4)') 
     &      'SPRAYS_AEROSOL_TIME(1,2) = ', SPRAYS_AEROSOL_TIME(ICMP,2)
      END IF
C
C   FIND TIME FOR START OF SPRAY (TIME1, S)
C
      TIME1 = SPRAYS_AEROSOL_TIME(ICMP,1)/3600.0
      IF (SPRAYS_AEROSOL_FLUX(ICMP,1).LE.1.0D-8) THEN
         DO I = 2,5
            IF(SPRAYS_AEROSOL_FLUX(ICMP,I).GT.1.0D-8) THEN
               IF(TIME1.LE.0.0) TIME1 = SPRAYS_AEROSOL_TIME(ICMP,I)/
     &            3600.0
            END IF
        END DO
      END IF
C                         
C     set number of time steps (0.45 to pick up in core release)          
      NUMB =  50 
      IF (TIME1.GE.0.45) NUMB = 30
C
C   MINIMUM TIME STEP (S)
      TMIN1 = 5.0
C
C     output number of time steps      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN     
        WRITE(out_unit,'(1X,A,1pe13.4)') 'time1 = ', time1
        WRITE(out_unit,'(1X,A7,I2)') 'NUMB = ', NUMB
      END IF

C     set event markers, hrs to sec
      SPRAYS_TIME_MARKER(1) = TIME1*3600.
      SPRAYS_TIME_MARKER(2) = SPRAYS_TIME_MARKER(1)+ TMIN1  
      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN     
        WRITE(out_unit,'(1X,A24,1pe13.4)') 
     &   'SPRAYS_TIME_MARKER(1) = ', SPRAYS_TIME_MARKER(1)
        WRITE(out_unit,'(1X,A24,1pe13.4)') 
     &   'SPRAYS_TIME_MARKER(2) = ', SPRAYS_TIME_MARKER(2)
      END IF
         
C     set baseline deltat (S)
      BASEDT = MIN( 0.1/SPREM90, TMIN1 )
      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN     
        WRITE(out_unit,'(1X,A9,1pE13.4)') 'BASEDT = ', BASEDT
      END IF
c
      ISW = 0          
C     set baseline deltat and time markers (S)
      DO NSTEPX = 1, NUMB+1
        IF ( NSTEPX .GT. 1 ) THEN
          SPRAYS_TIME_MARKER(NSTEPX) = 
     &      SPRAYS_TIME_MARKER(NSTEPX-1) +  BASEDT
        END IF
        IF ( NSTEPX .GT. 3 ) THEN 
C
C ... this is the key logic where the time step increases
c     as one goes longer into the spray
c
          BASEDT = MIN( 360.0, 1.5 * BASEDT )
          IF (NUMB.EQ.50 .AND. SPRAYS_TIME_MARKER(NSTEPX)
     &        .GT.1800. .AND. ISW.EQ.0) THEN
C
C   RESET TIME STEP FOR IN CORE RELEASE AT 0.5 HR
C
               ISW = 1
               BASEDT = MIN( 0.1/SPREM90, TMIN1 )
               SPRAYS_TIME_MARKER(NSTEPX)= 1800. + BASEDT
          END IF 
        END IF
      END DO 
      
C     load sprays water flux, sprays height, and sprays-alpha
C     for all time markers generated by initialization      
C      DO NSTEPX = 1, 5 
C        SPRAYS_AEROSOL_FLUX(ICMP,NSTEPX)   = QTYH2O   
C        SPRAYS_AEROSOL_HEIGHT(ICMP,NSTEPX) = HTFALL
C        SPRAYS_AEROSOL_ALPHA(ICMP,NSTEPX)  = ALPHA
C      END DO
      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        DO NSTEPX = 1, 5 
          WRITE(out_unit,'(1X,A20,I2,A1,I2,A4,1pe13.4)') 
     &     'SPRAYS_AEROSOL_FLUX(', ICMP, ',', NSTEPX, ') = ',
     &      SPRAYS_AEROSOL_FLUX(ICMP,NSTEPX)
        END DO
        DO NSTEPX = 1, 5 
          WRITE(out_unit,'(1X,A22,I2,A1,I2,A4,1pe13.4)') 
     &     'SPRAYS_AEROSOL_HEIGHT(', ICMP, ',', NSTEPX, ') = ',
     &      SPRAYS_AEROSOL_HEIGHT(ICMP,NSTEPX)
        END DO
        DO NSTEPX = 1, 5 
          WRITE(out_unit,'(1X,A21,I2,A1,I2,A4,1pe13.4)') 
     &     'SPRAYS_AEROSOL_ALPHA(', ICMP, ',', NSTEPX, ') = ',
     &      SPRAYS_AEROSOL_ALPHA(ICMP,NSTEPX)
        END DO
      END IF

C     output sprays time markers      
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN     
        DO NSTEPX = 1, NUMB+1      
          WRITE(out_unit,'(1X,A4,I3,A19,F7.1,A7,F8.4,A3)')
     &     'N = ', NSTEPX, 'Time Marker = ',
     &      SPRAYS_TIME_MARKER(NSTEPX), ' sec = ', 
     &      SPRAYS_TIME_MARKER(NSTEPX)/3600.0, ' hr'
        END DO
      END IF

C     end of subroutine SPINIT
      END
