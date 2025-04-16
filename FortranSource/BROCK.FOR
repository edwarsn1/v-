C     VERSION RESULTING FROM MODIFICATIONS BY TJH 2004

C     ##################################################################
      SUBROUTINE BROCK( JAYPEE, SIMTIM, DFACTR)
C     ##################################################################

C     This subroutine calculates the transport efficiency of aerosols
C     for piping pathways. It was adapted from a document, ASTEC.MCD,
C     provided by John E. Brockmann of SNL/A.

C     The subroutine assumes continuous flow from the pipeway inlet. It
C     is based upon a lumped-node description.

C     Subroutine BROCK includes the following effects:
C     (1) gravitational settling, for low-flow-rate conditions;
C     (2) turbulent inertial deposition, along straight pipe sections;
C     (3) Brownian diffusion, along straight sections of pipe;
C     (4) inertial deposition in bends.

C     These four effects were judged to be the important ones for steam
C     pipe modeling. Other effects found in ASTEC.MCD are not included.
C     See the memo entitled "Simple Pipe Model for RADTRAD", from
C     N. E. Bixler.

C     Called by:
C     PIPIN 

C     Calls to:
C     none

C     ==================================================================
C     CREATED BY DKM IN AUGUST 1995
C     TESTED BY DKM IN AUGUST 1995
C     MODIFIED TJH 2004
C     ==================================================================

C     include statement
c      INCLUDE 'MCODE\full.com'
      include 'full.com'
c
c...
C
C     Revision
C     History:     
C			2004	Added Homogeneous deposition model
C			2004	Added velocity due input stream edits
C
C

C     declaration of variable types
      INTEGER JAYPEE, ERR_KEY_1, ERR_KEY_2
      double precision PIEVAL, DEGRAD, FLARGE, ATMOS
      double precision SIMTIM, LUPP2
      double precision BOLTZ, GRAVITY, GAS_CONST, MOLE_WT_AIR
      double precision GAS_DENSE, GAS_VISCOS
      double precision VELOC_INLET, VELOC_PIPE, PART_DENSE, PART_DIAM
      double precision ARGUME, SQROOT, FACTOR, POWER1, POWER2
      double precision MEAN_FREE_PATH, SLIP_CORR, MOBILITY, DIFFUSE
      double precision T_RELAX
      double precision V_SETTLE, VEL_REL
CDKM  double precision VEL_DEP, LOG_VD ! <<=========== deactivated code!
      double precision REYNOLDS, STOKES, SETTLE_PAR, DIFF_PAR
      double precision ETA_LAM_GRAV, ETA_TURB_GRAV, ETA_GRAV
      double precision ETA_TURB_INERT, ETA_INERT
      double precision ETA_DIFF_1, ETA_DIFF_2
      double precision ETA_LAM_DIFF, ETA_TURB_DIFF, ETA_DIFF
      double precision ETA_LAM_BEND_1, ETA_LAM_BEND_2
      double precision ETA_LAM_BEND, ETA_TURB_BEND, ETA_BEND
      double precision TRANS_EFF, DFACTR
      double precision PIPE_SURF, PIPE_VOL, FLOW_RATE
      double precision GAS_TEMP, GAS_TEMP_MIN, GAS_PRESS
      double precision PIPE_DIAM, INNER_DIAM, INLET_DIAM, PIPE_LENGTH
      double precision BEND_ANGLE
      double precision AREA_SETTLE_TO_AREA_FLOW, ETA_HOMOG

C     output header
      IF ( LEVEL_PIPIN .GE. 1 ) THEN
	WRITE(out_unit,'(1X,A17)') 'SUBROUTINE BROCK!'
      END IF

C     ############## mathematical and physical constants ###############

C     ratio of circumference to diameter, non-dim
      PIEVAL = 4.0 * DATAN( 1.0D0 )
C     conversion factor, from degrees to radians, non-dim
      DEGRAD = PIEVAL / 180.0
C     large floating-point number
      FLARGE = 3.0E+38
C     conversion factor, atm to dyne/cm2
      ATMOS = 1.01325E+06
C     Boltzmann constant, erg/deg
      BOLTZ = 1.38E-16
C     gravitational acceleration, cm/sec2
      GRAVITY = 981.0
C     universal gas constant, erg/mole/deg
C     GAS_CONST = 8.31441E+07
      GAS_CONST = GAS_CONSTANT * 1.0d7
C     mole weight of air, gm/mole
      MOLE_WT_AIR = 29.0
C     gas viscosity, poise
      GAS_VISCOS = 1.93E-04
C     gas temperature minimum, deg K
      GAS_TEMP_MIN = 273.0

C     ##################################################################

C     pipe inner surface area, cm2 <<=================== only one value!
      PIPE_SURF = BROCK_SURFACE(JAYPEE,1) * 10000.0

C     error checking on pipe inner surface area
      IF ( PIPE_SURF .EQ. 0.0 ) THEN
	WRITE(out_unit,'(1X,A51)')
     &  ' SUBROUTINE BROCK ERROR! PIPE SURFACE AREA IS ZERO!'
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF

C     pipe volume, cm3 <<=============================== only one value!
      PIPE_VOL = BROCK_VOLUME(JAYPEE,1) * 1000000.0

C     error checking on pipe volume
      IF ( PIPE_VOL .EQ. 0.0 ) THEN
	WRITE(out_unit,'(1X,A45)')
     &  ' SUBROUTINE BROCK ERROR! PIPE VOLUME IS ZERO!'
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP
      END IF

C     flow rate, cm3/sec
      FLOW_RATE = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_FLOW,
     &  BROCK_COUNT(JAYPEE) ) * 1000000.0

C     check for flow rate equal to zero
C     if flow rate is zero, set decon coeff to unity and exit subroutine
      IF ( FLOW_RATE .EQ. 0.0 ) THEN
C	WRITE(out_unit,'(1X,A54)')
C     &  ' SUBROUTINE BROCK: FLOW RATE IS ZERO, SET DF TO UNITY!'
	DFACTR = 1.0
	GOTO 9999 ! <<================================== branch to 9999!
      END IF

      IF (Version .lt. 3.10) THEN
C     Bend angle, radians
         BEND_ANGLE = LUPP2(JAYPEE,SIMTIM,BROCK_TIME,BROCK_ANGLE,
     &     BROCK_COUNT(JAYPEE)) * DEGRAD
C     gas temperature, deg K
         GAS_TEMP = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_TEMP,
     &     BROCK_COUNT(JAYPEE) )
C     gas pressure, dyne/cm2
         GAS_PRESS = LUPP2( JAYPEE, SIMTIM, BROCK_TIME, BROCK_PRESSURE,
     &     BROCK_COUNT(JAYPEE) ) * ATMOS
      ELSE
c     version 3.10
C     Bend angle, radians
         BEND_ANGLE = BROCK_ANGLE(JAYPEE,1) * DEGRAD
C     gas temperature, deg K
         GAS_TEMP   = BROCK_TEMP(JAYPEE,1)
C     gas pressure, dyne/cm2
         GAS_PRESS  = BROCK_PRESSURE(JAYPEE,1) * ATMOS
C     aerosol settling velocity, cm/s
         VELOCITY_S = BROCK_VELOCITY(JAYPEE) * 100.0
      END IF

C     place lower bound on gas temperature, deg K
      IF ( GAS_TEMP .LT. GAS_TEMP_MIN ) THEN
	   WRITE(out_unit,'(1X,A58)')
     &    ' SUBROUTINE BROCK: GAS TEMPERATURE RESET TO MINIMUM VALUE!'
	   GAS_TEMP = GAS_TEMP_MIN
      END IF
c
C     check for gas pressure equal to zero
C     if gas pressure is zero, set decon coeff to unity and exit
C     subroutine
      IF ( GAS_PRESS .EQ. 0.0 ) THEN
	   DFACTR = 1.0
	   GOTO 9999 ! <<================================== branch to 9999!
      END IF

C     output basic model variables
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A15,E13.4,A3)')
     &    ' PIPE_SURF   = ', PIPE_SURF / 10000.0, ' m2'
	  WRITE(out_unit,'(1X,A15,E13.4,A3)')
     &    ' PIPE_VOL    = ', PIPE_VOL / 1000000.0, ' m3'
	  WRITE(out_unit,'(1X,A15,E13.4,A7)')
     &    ' FLOW_RATE   = ', FLOW_RATE / 1000000.0, ' m3/sec'
	  WRITE(out_unit,'(1X, A15,E13.4, A4)')
     &    'BEND ANGLE = ', BEND_ANGLE / DEGRAD, 'deg'
	  WRITE(out_unit,'(1X,A15,E13.4,A6)')
     &    ' GAS_TEMP    = ', GAS_TEMP, ' deg K'
	  WRITE(out_unit,'(1X,A15,E13.4,A4)')
     &    ' GAS_PRESS   = ', GAS_PRESS / ATMOS, ' atm'
      END IF

C     ######### transport parameters, inlet and transport line #########

C     pipe diameter, cm
      PIPE_DIAM = 4.0 * PIPE_VOL / PIPE_SURF

C     inner diameter, cm
      INNER_DIAM = PIPE_DIAM ! <<======= assumed to be same as pipe_diam

C     inlet diameter, cm
      INLET_DIAM = PIPE_DIAM ! <<======= assumed to be same as pipe_diam

C     pipe length, cm
      PIPE_LENGTH = PIPE_SURF / PIEVAL / PIPE_DIAM
C     The bend angle is now set above with the rest of the user inputs.
C     bend angle, radian         ?????????
C
C
C     BEND_ANGLE =0.0 * DEGRAD ! <<======== pipe assumed to be straight
C     output transport properties
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A20)')
     &    ' Pipeway Parameters:'
	  WRITE(out_unit,'(1X,A15,E13.4,A2)')
     &    ' PIPE_DIAM   = ', PIPE_DIAM / 100.0, ' m'
	  WRITE(out_unit,'(1X,A15,E13.4,A2)')
     &    ' INNER_DIAM  = ', INNER_DIAM / 100.0, ' m'
	  WRITE(out_unit,'(1X,A15,E13.4,A2)')
     &    ' INLET_DIAM  = ', INLET_DIAM / 100.0, ' m'
	  WRITE(out_unit,'(1X,A15,E13.4,A2)')
     &   ' PIPE_LENGTH = ', PIPE_LENGTH / 100.0, ' m'
      END IF

C     ######################### gas parameters #########################

C     gas density, gm/cm3
      GAS_DENSE = GAS_PRESS * MOLE_WT_AIR / GAS_CONST / GAS_TEMP

C     pipe gas velocity, cm/sec
      VELOC_PIPE = 4.0 * FLOW_RATE / PIEVAL / PIPE_DIAM**2

C     inlet gas velocity, cm/sec
      VELOC_INLET = 4.0 * FLOW_RATE / PIEVAL / INLET_DIAM**2

C     output gas parameters
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A16)')
     &    ' Gas Parameters:'
	  WRITE(out_unit,'(1X,A15,E13.4,A6)')
     &    ' GAS & PIPE WALL_TEMP    = ', GAS_TEMP, ' deg K'
	  WRITE(out_unit,'(1X,A15,E13.4,A4)')
     &    ' GAS_PRESS   = ', GAS_PRESS / ATMOS, ' atm'
  	  WRITE(out_unit,'(1X,A15,E13.4,A7)')
     &    ' GAS_DENSE   = ', GAS_DENSE, ' gm/cm3'
	  WRITE(out_unit,'(1X,A15,E13.4,A6)')
     &    ' GAS_VISCOS  = ', GAS_VISCOS, ' poise'
	  WRITE(out_unit,'(1X,A15,E13.4,A7)')
     &    ' FLOW_RATE   = ', FLOW_RATE / 1000000.0, ' m3/sec'
	  WRITE(out_unit,'(1X,A15,E13.4,A6)')
     &    ' VELOC_PIPE  = ', VELOC_PIPE / 100.0, ' m/sec'
	  WRITE(out_unit,'(1X,A15,E13.4,A6)')
     &    ' VELOC_INLET = ', VELOC_INLET / 100.0, ' m/sec'
      END IF

C     ####################### aerosol parameters #######################

C     particle material density, gm/cm3
      PART_DENSE = 1.0
c...  using CsI density
c      PART_DENSE = 3.67 / 1.384
c...
C     particle index, non-dim integer
CTJH  use 0.5 to 1 micron for fission products in aerosol form
CTJH  concentration is typically 1.0E+14 1/m3 for this size range
CDKM  PART_INDEX = 27 ! particle size of 0.512 micron
CDKM  PART_INDEX = 28 ! particle size of 0.645 micron
CDKM  PART_INDEX = 29 ! particle size of 0.813 micron
      PART_INDEX = 30 ! particle size of 1.024 micron
CNEB  PART_INDEX = 31 ! particle size of 1.290 micron

C      IF ( LEVEL_PIPIN .GE. 3 ) THEN
C        WRITE(out_unit,'(1X,A56)')
C     &  ' SUBROUTINE BROCK NOTICE: PARTICLE SIZE SET TO 1 MICRON!'
C      END IF

C     particle size, cm
      IF ( PART_INDEX .EQ. 0 ) THEN
	  PART_DIAM = 1.0E-07
      ELSE
 	  PART_DIAM = ((2.0)**(1.0/3.0))**PART_INDEX * 1.0E-07
      END IF
c      PART_DIAM = 1.9D-4

C     output aerosol parameters
      IF ( LEVEL_PIPIN .GE. 1 ) THEN
	WRITE(out_unit,'(1X,A20)')
     &  ' Aerosol Parameters:'
	WRITE(out_unit,'(1X,A15,E13.4,A7)')
     &  ' PART_DENSE  = ', PART_DENSE, ' gm/cm3'
	WRITE(out_unit,'(1X,A15,I8,A17)')
     &  ' PART_INDEX  = ', PART_INDEX, '          non-dim'
	WRITE(out_unit,'(1X,A15,E13.4,A7)')
     &  ' PART_DIAM   = ', PART_DIAM * 1.0E+04, ' micron'
      END IF

C     ##################################################################
C     ################ FUNCTIONS FOR AEROSOL PROPERTIES ################
C     ##################################################################

C     molecular mean free path, cm
      ARGUME = PIEVAL * GAS_CONST * GAS_TEMP / 2.0 / MOLE_WT_AIR
      SQROOT = DSQRT(ARGUME)
      MEAN_FREE_PATH = GAS_VISCOS / GAS_PRESS * SQROOT

C     slip correction, non-dim
      ARGUME = 0.55 * PART_DIAM / MEAN_FREE_PATH
      FACTOR = 1.257 + 0.4 * DEXP(-ARGUME)
      SLIP_CORR = 1.0 + 2.0 * MEAN_FREE_PATH / PART_DIAM * FACTOR

C     dynamic mobility of particle, (cm/sec)/dyne
      MOBILITY = SLIP_CORR / 3.0 / PIEVAL / GAS_VISCOS / PART_DIAM

C     diffusivity of particle, cm2/sec
      DIFFUSE = BOLTZ * GAS_TEMP * MOBILITY

C     relaxation time for particle, sec
      T_RELAX = PIEVAL * PART_DIAM**3 * PART_DENSE * MOBILITY / 6.0

C     settling velocity for particle, cm/sec
      V_SETTLE = T_RELAX * GRAVITY

      IF (VERSION .ge. 3.10 .and. VELOCITY_S .gt. 0.0) THEN
         V_SETTLE = VELOCITY_S 
      END IF

      IF (SIMTIM .eq. 0.0) then
        write(out_unit,'(/ 12x,a,3(/5x, a, 1pe12.5,a))')
     &    ' Beginning values from pipe deposition model' ,
     &    ' Settling Velocity = ', V_SETTLE*0.01, ' m/s',
     &    ' Particle Diameter = ', PART_DIAM * 1.0E+04, ' micron',
     &    ' Particle Density  = ', PART_DENSE, ' gm/cc'
      END IF

CDKM  deposition velocity <<========================== deactivated code!
CDKM  from least-squares-fit formula in Cline report (page 11)
CDKM  LOG_VD = 1220.0 / GAS_TEMP - 5.56
CKDM  VEL_DEP = 10.0**LOG_VD

C     output functions for aerosol properties
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A34)')
     &    ' Functions for Aerosol Properties:'
	  WRITE(out_unit,'(1X,A18,E13.4,A3)')
     &    ' MEAN_FREE_PATH = ', MEAN_FREE_PATH, ' cm'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' SLIP_CORR      = ', SLIP_CORR, ' non-dim'
	  WRITE(out_unit,'(1X,A18,E13.4,A14)')
     &    ' MOBILITY       = ', MOBILITY, ' (cm/sec)/dyne'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' DIFFUSE        = ', DIFFUSE, ' cm2/sec'
	  WRITE(out_unit,'(1X,A18,E13.4,A4)')
     &    ' T_RELAX        = ', T_RELAX, ' sec'
	  WRITE(out_unit,'(1X,A18,E13.4,A7)')
     &    ' V_SETTLE       = ', V_SETTLE, ' cm/sec'

CDKM    WRITE(out_unit,'(1X,A18,E13.4,A7)') ! <<====== deactivated code!
CDKM *  ' VEL_DEP        = ', VEL_DEP, ' cm/sec' ! <<= deactivated code!
      END IF

C     ##################################################################
C     ########### DIMENSIONLESS PARAMETERS FOR CORRELATIONS ############
C     ##################################################################

C     relative velocity, non-dim
      VEL_REL = V_SETTLE / VELOC_PIPE

C     Stokes number, non-dim
      STOKES = T_RELAX * VELOC_PIPE / PIPE_DIAM

C     Reynolds number, non-dim
      REYNOLDS = PIPE_DIAM * VELOC_PIPE * GAS_DENSE / GAS_VISCOS

C     settling parameter, non-dim
      SETTLE_PAR = 0.75 * PIPE_LENGTH * VEL_REL / PIPE_DIAM

C     diffusion parameter, non-dim
      DIFF_PAR = PIEVAL * DIFFUSE * PIPE_LENGTH / FLOW_RATE

C     Area parameter, 1/m
      AREA_SETTLE_TO_AREA_FLOW = 4.0*PIPE_LENGTH / (PIEVAL*PIPE_DIAM)

C     output dimensionless parameters for correlations
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	WRITE(out_unit,'(1X,A43)')
     &  ' Dimensionless Parameters for Correlations:'
	WRITE(out_unit,'(1X,A15,E13.4,A8)')
     &  ' VEL_REL     = ', VEL_REL, ' non-dim'
	WRITE(out_unit,'(1X,A15,E13.4,A8)')
     &  ' STOKES      = ', STOKES, ' non-dim'
	IF ( REYNOLDS .LT. 2300.0 ) THEN
	  WRITE(out_unit,'(1X,A15,E13.4,A8,A20)')
     &    ' REYNOLDS    = ', REYNOLDS, ' non-dim',
     &    '      (laminar flow)'
	ELSE
	  WRITE(out_unit,'(1X,A15,E13.4,A8,A22)')
     &    ' REYNOLDS    = ', REYNOLDS, ' non-dim',
     &    '      (turbulent flow)'
	END IF
	WRITE(out_unit,'(1X,A15,E13.4,A8)')
     &  ' SETTLE_PAR  = ', SETTLE_PAR, ' non-dim'
	WRITE(out_unit,'(1X,A15,E13.4,A8)')
     &  ' DIFF_PAR    = ', DIFF_PAR, ' non-dim'
	WRITE(out_unit,'(1X,A20,E13.4,A6)')
     &  ' AREA SETTLE/FLOW = ', AREA_SETTLE_TO_AREA_FLOW, ' 1 / m'
      END IF

C     ##################################################################
C     ##################### GRAVITATIONAL SETTLING #####################
C     ##################################################################

C     efficiency for laminar pipe flow, non-dim
C
      ERR_KEY_1 = 0
      ARGUME = 1.0 - SETTLE_PAR**(2.0/3.0)
      IF ( ARGUME .LE. 0.0 ) THEN
	  ETA_LAM_GRAV = 0.0
      ELSE IF ( ARGUME .GT. 0.0 ) THEN
	  SQROOT = DSQRT(ARGUME)
	  FACTOR = 2.0 * SETTLE_PAR * SQROOT -
     &     SETTLE_PAR**(1.0/3.0) * SQROOT +
     &     DASIN( SETTLE_PAR**(1.0/3.0) )
	  ETA_LAM_GRAV = 1.0 - 2.0 / PIEVAL * FACTOR
      END IF

C     efficiency for turbulent pipe flow, non-dim
C
      ARGUME = MIN( 10.0, 16.0 * SETTLE_PAR / 3.0 / PIEVAL)
      ETA_TURB_GRAV = DEXP( - ARGUME )

C     efficiency for homogeneous deposition (Gingrich AEB 98-03 App A)

      ARGUME = VEL_REL * AREA_SETTLE_TO_AREA_FLOW
	ETA_HOMOG = 1 / (1 + ARGUME)

C     appropriate value of transport efficiency chosen

      IF ( REYNOLDS .LT. 2300.0 ) THEN
	  ETA_GRAV = ETA_LAM_GRAV
      ELSE
	  ETA_GRAV = ETA_TURB_GRAV
      END IF
C     IF homogeneous settling
      IF (PIPING_AEROSOL_MODEL(JAYPEE) .EQ. 3) ETA_GRAV = ETA_HOMOG

C     output gravitation settling results
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A32)')
     &    ' Gravitational Settling Results:'
	  IF ( ERR_KEY_1 .EQ. 1 ) THEN
	    WRITE(out_unit,'(1X,A55)')
     &      ' Square root does not exist! Assume efficiency is zero!'
	  END IF

	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_LAM_GRAV  = ', ETA_LAM_GRAV, ' non-dim'
	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_TURB_GRAV = ', ETA_TURB_GRAV, ' non-dim'
	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_GRAV      = ', ETA_GRAV, ' non-dim'
	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_HOMOG     = ', ETA_HOMOG, ' non-dim'
      END IF

C     ##################################################################
C     ################## TURBULENT INERTIAL DEPOSITION #################
C     ##################################################################

C     for straight sections of pipe

C     efficiency for turbulent inertial deposition, non-dim
      FACTOR = STOKES * REYNOLDS**(0.75)
      IF ( FACTOR .LT. 326.6 ) THEN
	  ARGUME = - 4.0 * PIPE_LENGTH / PIPE_DIAM * 1.861E-07 *
     &      REYNOLDS**(11.0/8.0) * STOKES**2
      ELSE
	  ARGUME = - 4.0 * PIPE_LENGTH / PIPE_DIAM * 1.988E-02 /
     &      REYNOLDS**(1.0/8.0)
      END IF
      if (argume .LT. -10.0) argume = -10.
      ETA_TURB_INERT = DEXP (ARGUME)

C     appropriate value of efficiency, non-dim
      IF ( REYNOLDS .LT. 2300.0 ) THEN
	  ETA_INERT = 1.0
      ELSE
	  ETA_INERT = ETA_TURB_INERT
      END IF

C     output gravitation settling results
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A39)')
     &    ' Turbulent Inertial Deposition Results:'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' ETA_TURB_INERT = ', ETA_TURB_INERT, ' non-dim'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' ETA_INERT      = ', ETA_INERT, ' non-dim'
      END IF

C     ##################################################################
C     ######################## DIFFUSION EFFECTS #######################
C     ##################################################################

C     for straight sections of pipe
C
C     Gormely and Kennedy misprint correction (0.77 becomes 0.177)
C     efficiency for laminar-flow, low diffusion parameter, non-dim
      ETA_DIFF_1 = 1.0 - 2.56 * DIFF_PAR**(2.0/3.0) +
     &  1.2 * DIFF_PAR + 0.177 * DIFF_PAR**(4.0/3.0)

C     efficiency for laminar_flow, high diffusion parameter, non-dim
      ETA_DIFF_2 = 0.819 * DEXP( -3.657 * DIFF_PAR ) +
     &  0.097 * DEXP( -22.3 * DIFF_PAR ) +
     &  0.032 * DEXP( -57.0 * DIFF_PAR )

C     appropriate efficiency for laminar flow, non-dim
      IF ( DIFF_PAR .LT. 0.02 ) THEN
	  ETA_LAM_DIFF = ETA_DIFF_1
      ELSE
	  ETA_LAM_DIFF = ETA_DIFF_2
      END IF

C     efficiency for turbulent-flow, non-dim
      ARGUME = DIFF_PAR**(2.0/3.0) * 0.0187 * REYNOLDS**(13.0/24.0) *
     &  ( PIPE_LENGTH / PIPE_DIAM )**(1.0/3.0)
      if (argume .GT. 10.0) argume = 10.0
      ETA_TURB_DIFF = DEXP(-ARGUME)

C     appropriate value of efficiency, non-dim
      IF ( REYNOLDS .LT. 2300.0 ) THEN
	  ETA_DIFF = ETA_LAM_DIFF
      ELSE
	  ETA_DIFF = ETA_TURB_DIFF
      END IF

C     output diffusion results
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A19)')
     &    ' Diffusion Effects:'
	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_DIFF_1    = ', ETA_DIFF_1, ' non-dim'
	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_DIFF_2    = ', ETA_DIFF_2, ' non-dim'
	  IF ( DIFF_PAR .LT. 0.02 ) THEN
	    WRITE(out_unit,'(1X,A17,E13.4,A8,A20)')
     &      ' ETA_LAM_DIFF  = ', ETA_LAM_DIFF, ' non-dim',
     &      '      (first value) '
	  ELSE
	    WRITE(out_unit,'(1X,A17,E13.4,A8,A20)')
     &      ' ETA_LAM_DIFF  = ', ETA_LAM_DIFF, ' non-dim',
     &      '      (second value)'
	  END IF
	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_TURB_DIFF = ', ETA_TURB_DIFF, ' non-dim'
	  WRITE(out_unit,'(1X,A17,E13.4,A8)')
     &    ' ETA_DIFF      = ', ETA_DIFF, ' non-dim'
      END IF

C     ##################################################################
C     ################### INERTIAL DEPOSITION IN BENDS #################
C     ##################################################################

C     efficiency for laminar flow, non-dim
C     first of two alternate expressions, only one to be selected
      ERR_KEY_2 = 0
      ETA_LAM_BEND_1 = 1.0 - STOKES * BEND_ANGLE
      IF ( ETA_LAM_BEND_1 .LT. 0.0 ) THEN
C       ERR_KEY_2 = 1
	  ETA_LAM_BEND_1 = 0.0
      END IF

C     efficiency for laminar flow, non-dim
C     second of two alternate expressions, only one to be selected
      POWER1 = 0.452 * STOKES / 0.171 + 2.242
      POWER2 = 2.0 / PIEVAL * BEND_ANGLE
      ETA_LAM_BEND_2 = ( 1.0 + ( STOKES / 0.171 )**POWER1 )**(-POWER2)

C     efficiency for laminar flow, non-dim
C     value of expression selected
      ETA_LAM_BEND = ETA_LAM_BEND_2

C     efficiency for turbulent flow, non-dim
      ARGUME = 2.823 * STOKES * BEND_ANGLE
      if (argume .gt. 10.0) argume =10.0
      ETA_TURB_BEND = DEXP(-ARGUME)

C     appropriate value of efficiency, non-dim
      IF ( REYNOLDS .LT. 2300.0 ) THEN
	  ETA_BEND = ETA_LAM_BEND
      ELSE
	  ETA_BEND = ETA_TURB_BEND
      END IF

C     output inertial deposition in bends
      IF ( LEVEL_PIPIN .GE. 3 ) THEN
	  WRITE(out_unit,'(1X,A30)')
     &    ' Inertial Deposition in Bends:'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' POWER1         = ', POWER1, ' non-dim'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' POWER2         = ', POWER2, ' non-dim'
	  IF ( ERR_KEY_2 .EQ. 1 ) THEN
	    WRITE(out_unit,'(1X,A51)')
     &      ' Eta_lam_bend_1 was negative and was reset to zero!'
	  END IF
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' ETA_LAM_BEND_1 = ', ETA_LAM_BEND_1, ' non-dim'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' ETA_LAM_BEND_2 = ', ETA_LAM_BEND_2, ' non-dim'
	  WRITE(out_unit,'(1X,A18,E13.4,A8,A20)')
     &    ' ETA_LAM_BEND   = ', ETA_LAM_BEND, ' non-dim',
     &    '      (second value)'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' ETA_TURB_BEND  = ', ETA_TURB_BEND, ' non-dim'
	  WRITE(out_unit,'(1X,A18,E13.4,A8)')
     &    ' ETA_BEND       = ', ETA_BEND, ' non-dim'
      END IF

C     ##################################################################
C     ############ COLLECTIVE TREATMENT OF ALL EFFICIENCIES ############
C     ##################################################################

C     overall efficiency for transport, non-dim
      TRANS_EFF = ETA_GRAV * ETA_INERT * ETA_DIFF * ETA_BEND

C     decontamination factor, non-dim
      IF ( TRANS_EFF .GT. 1.0D-3 ) THEN
	  DFACTR = MIN(1.0/TRANS_EFF,900.0D0)
      ELSE
        DFACTR = 900.0D0
      END IF

C     store deposition efficiencies for printing in printout
      brock_output(JAYPEE,1) = 1. - ETA_GRAV
      brock_output(JAYPEE,2) = 1. - ETA_INERT
      brock_output(JAYPEE,3) = 1. - ETA_DIFF
      brock_output(JAYPEE,4) = 1. - ETA_BEND

C     output all efficiencies obtained
      IF ( LEVEL_PIPIN .GE. 2 ) THEN
	  WRITE(out_unit,'(1X,A32)')
     &    ' Tabulation of All Transport Efficiencies:'
	  WRITE(out_unit,'(1X,A15,E13.4,A19)')
     &    ' ETA_GRAV    = ', ETA_GRAV, ' gravitational loss'
	  WRITE(out_unit,'(1X,A15,E13.4,A22)')
     &    ' ETA_INERT   = ', ETA_INERT, ' turb inert deposition'
	  WRITE(out_unit,'(1X,A15,E13.4,A15)')
     &    ' ETA_DIFF    = ', ETA_DIFF, ' diffusion loss'
	  WRITE(out_unit,'(1X,A15,E13.4,A16)')
     &    ' ETA_BEND    = ', ETA_BEND, ' bend deposition'
      END IF
      IF ( LEVEL_PIPIN .GE. 2 ) THEN
	  WRITE(out_unit,'(1X,A38)')
     &    ' Particle Size and Overall Efficiency:'
	  WRITE(out_unit,'(1X,A15,I8)')
     &    ' PART_INDEX  = ', PART_INDEX
	  WRITE(out_unit,'(1X,A15,E13.4,A7)')
     &    ' PART_DIAM   = ', PART_DIAM * 1.0E+04, ' micron'
	  WRITE(out_unit,'(1X,A15,E13.4)')
     &    ' TRANS_EFF   = ', TRANS_EFF
      END IF

C     branch to here if flow rate is zero
C     branch to here if gas pressure is zero
9999  CONTINUE ! <<===================================== branch to here!

      IF ( LEVEL_PIPIN .GE. 2 ) THEN
	  WRITE(out_unit,'(1X,A15,E13.4,A8)')
     &    ' DFACTR       = ', DFACTR, ' non-dim'
      END IF

C     ##################################################################
C     #################### END OF SUBROUTINE BROCK #####################
C     ##################################################################

      RETURN

      END
