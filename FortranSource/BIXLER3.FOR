C     VERSION RESULTING FROM MODIFICATIONS BY DKM ON 07 NOVEMBER 1995

C     ##################################################################
      SUBROUTINE BIXLER3( JAYPEE, SIMTIM, DECON )
C     ##################################################################

C     This subroutine calculates the decontamination coefficient for
C     organic iodine. It assumes that revaporization is negligible.

C     Reference : memo, 14 August 1995, to DKM from N. E. Bixler (6421),
C     "Simple Pipe Model for RADTRAD".

C     ==================================================================
C     CREATED BY DKM IN AUGUST 1995
C     TESTED BY DKM IN AUGUST 1995
C     ==================================================================

C     include statement
      INCLUDE 'full.com'
c

C

C     declaration of variable types
      INTEGER JAYPEE
      double precision PIEVAL, FLARGE, ATMOS
      double precision SIMTIM, LUPP2
      double precision PIPE_SURF, PIPE_VOL, FLOW_RATE, GAS_TEMP
      double precision GAS_PRESS
      double precision PIPE_DIAM, PIPE_LENGTH
      double precision FLOW_VEL, ARGUME, VEL_DEP_ORG, ETA_ORG, DECON

C     output header
      IF ( LEVEL_PIPIN .GE. 1 ) THEN
        WRITE(OUT_UNIT,'(1X,A19)') 'SUBROUTINE BIXLER3!'
      END IF

C     ratio of circumference to diameter, non-dim
      PIEVAL = 4.0 * DATAN( 1.0D0 )

C     large floating-point value
CDKM  FLARGE = 3.0E+38
      FLARGE = 1.0E+10

C     conversion factor, atm to dyne/cm2
      ATMOS = 1.01325E+06

C     ##################################################################

CDKM  pipe inner surface area, cm2 <<================== multiple values!
CDKM  PIPE_SURF = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_SURFACE,
CDKM *  BROCK_COUNT(JAYPEE) ) * 10000.0

C     pipe inner surface area, cm2 <<=================== only one value!
      PIPE_SURF = BROCK_SURFACE(JAYPEE,1) * 10000.0

      IF ( PIPE_SURF .LE. 0.0 ) THEN
        WRITE(out_unit,'(1X,A52)')
     &   'SUBROUTINE BIXLER3 ERROR! PIPE SURFACE NOT POSITIVE!'
        STOP
      END IF

CDKM  pipe volume, cm3 <<============================== multiple values!
CDKM  PIPE_VOL = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_VOLUME,
CDKM *  BROCK_COUNT(JAYPEE) ) * 1000000.0

C     pipe volume, cm3 <<=============================== only one value!
      PIPE_VOL = BROCK_VOLUME(JAYPEE,1) * 1000000.0

      IF ( PIPE_VOL .LE. 0.0 ) THEN
        WRITE(out_unit,'(1X,A52)')
     &  ' SUBROUTINE BIXLER3 ERROR! PIPE VOLUME NOT POSITIVE!'
         write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF

C     flow rate, cm3/sec
      FLOW_RATE = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &  BROCK_COUNT(JAYPEE) ) * 1000000.0

      IF (Version .lt. 3.10) THEN

C     gas temperature, deg K
         GAS_TEMP = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_TEMP,
     &     BROCK_COUNT(JAYPEE) )
C     gas pressure, dyne/cm2
         GAS_PRESS = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_PRESSURE,
     &     BROCK_COUNT(JAYPEE) ) * ATMOS
      ELSE
c     version 3.10

C     gas temperature, deg K
         GAS_TEMP   = BROCK_TEMP(JAYPEE,1)
C     gas pressure, dyne/cm2
         GAS_PRESS  = BROCK_PRESSURE(JAYPEE,1) * ATMOS

      END IF


C     output basic model variables
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
        WRITE(OUT_UNIT,'(1X,A13,E13.4,A2)')
     &  ' PIPE_SURF = ', PIPE_SURF / 100.0, ' m'
        WRITE(OUT_UNIT,'(1X,A13,E13.4,A3)')
     &  ' PIPE_VOL  = ', PIPE_VOL / 1000000.0, ' m3'
        WRITE(OUT_UNIT,'(1X,A13,E13.4,A7)')
     &  ' FLOW_RATE = ', FLOW_RATE / 1000000.0, ' m3/sec'
        WRITE(OUT_UNIT,'(1X,A13,E13.4,A6)')
     &  ' GAS_TEMP  = ', GAS_TEMP, ' deg K'
        WRITE(OUT_UNIT,'(1X,A13,E13.4,A4)')
     &  ' GAS_PRESS = ', GAS_PRESS / ATMOS, ' atm'
      END IF

C     ##################################################################

C     pipe diameter, cm
      PIPE_DIAM = 4.0 * PIPE_VOL / PIPE_SURF

      IF ( PIPE_DIAM .LE. 0.0 ) THEN
        WRITE(out_unit,'(1X,A53)')
     &   'SUBROUTINE BIXLER3 ERROR! PIPE DIAMETER NOT POSITIVE!'
         write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF

C     pipe length, cm
      PIPE_LENGTH = PIPE_SURF / PIEVAL / PIPE_DIAM

      IF ( PIPE_LENGTH .LE. 0.0 ) THEN
        WRITE(out_unit,'(1X,A51)')
     &   'SUBROUTINE BIXLER3 ERROR! PIPE LENGTH NOT POSITIVE!'
         write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF

C     flow velocity, cm/sec
      FLOW_VEL = FLOW_RATE * PIPE_LENGTH / PIPE_VOL

C     deposition velocity, cm/sec
      ARGUME = 2809.0 / GAS_TEMP - 19.30
      VEL_DEP_ORG = DEXP( ARGUME )

      IF (PIPING_ORGANIC_MODEL(JAYPEE) .EQ. 3) THEN
         VEL_DEP_ORG = PIPING_ORGANIC_VEL(JAYPEE)
      END IF

C     transport efficiency, non-dim
      IF ( FLOW_VEL .NE. 0.0 ) THEN
        ARGUME = 4.0 * VEL_DEP_ORG * PIPE_LENGTH / PIPE_DIAM / FLOW_VEL
        if (argume .GT. 10.) argume = 10.
        ETA_ORG = DEXP( -ARGUME )
      ELSE
        ETA_ORG = 0.0
      END IF

      IF ( LEVEL_PIPIN .GE. 3 ) THEN
        WRITE(OUT_UNIT,'(1X,A15,E13.4,A2)')
     &  ' PIPE_DIAM   = ', PIPE_DIAM / 100.0, ' m'
        WRITE(OUT_UNIT,'(1X,A15,E13.4,A2)')
     &  ' PIPE_LENGTH = ', PIPE_LENGTH / 100.0, ' m'
        WRITE(OUT_UNIT,'(1X,A15,E13.4,A6)')
     &  ' FLOW_VEL    = ', FLOW_VEL / 100.0, ' m/sec'
        WRITE(OUT_UNIT,'(1X,A15,E13.4,A6)')
     &  ' VEL_DEP_ORG = ', VEL_DEP_ORG / 100.0, ' m/sec'
        WRITE(OUT_UNIT,'(1X,A15,E13.4,A8)')
     &  ' ETA_ORG     = ', ETA_ORG, ' non-dim'
      END IF

C     decontamination factor, non-dim
      IF ( ETA_ORG .EQ. 0.0 ) THEN
        DECON = FLARGE
      ELSE
     &  IF ( ETA_ORG .GT. 0.0 ) THEN
        DECON = DMIN1(1.0 / ETA_ORG,900.0D0)
      ELSE
        WRITE(OUT_UNIT,'(1X,A39)')
     &  ' SUBROUTINE BIXLER3 ERROR: ETA_ORG < 0!'
         write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF

C     output decontamination factor, non-dim
      IF ( LEVEL_PIPIN .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A15,E13.4,A8)')
     &  ' DECON       = ', DECON, ' non-dim'
      END IF

      RETURN

      END
