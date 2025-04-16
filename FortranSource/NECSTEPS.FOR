C     VERSION CREATED 29 JUNE 1995 TO INCLUDE TIME MARKERS FOR
C     SPRAYS-AEROSOL MODEL (POWERS)

C     March 6, 1996 - added control room occupancy factor check.

C     ##################################################################
      SUBROUTINE NECSTEPS( NUMSTEPS, MINSTEP)
C     ##################################################################

C     ##################################################################
C     THINGS TO DO:
C     (1) CHECK FOR BREATHING-RATE TIMES BEING LOADED
C     (2) CHECK FOR X/Q TIMES BEING LOADED
C     (3) CHECK DURATION-BLOCK LOGIC AGAINST STERM
C     (4) ADD CODE FOR PATHWAY_EXP_TIME
C     (5) ADD CODE FOR PATHWAY_TIME_START
C     (6) ADD CODE FOR PATHWAY_XQ_TIME
C     (7) ADD CODE FOR BREATHING_RATE_TIME
C     (8) ADD CODE FOR TIME MARKERS IN MSIV.H IF NECESSARY
C     ##################################################################

C     This subroutine determines the minimum set of timesteps that are
C     necessary to capture all of the events and other system changes
C     that are included in the user input.

C     Loop over all possible time vectors and incorporate values into
C     the vector MINSTEP. Sort these and delete any and all repetitions.

C     Called by:
C     RADTRAD

C     Calls to:
C     SORT
C     SPINIT

C     compartment attibutes considered
C     (1) sprays
C     (2) sump
C     (3) recirculation filter
C     (4) natural deposition
C     (5) overlying pool

C     pathway types considered
C     (1) piping pathway
C     (2) filtered pathway
C     (3) suppression pool
C     (4) natural convection (air leakage)
C     (5) water pathway (water leakage)

C     other things considered
C     (1) release durations
C     (2) sprays-model time markers

C     include statements
      INCLUDE 'full.com'
c
C  tjh  moved the spray times into common sprays
c
      INTEGER I, ICMP
      INTEGER J, NXQ
      INTEGER KOUNT, KVALUE
      INTEGER NUMSTEPS, NCASE, COMP_N
      INTEGER NSTEPX, NUMB

c  kew
c  replace dimension size with maxzone
c  ...
      double precision MINSTEP(maxzone)
      double precision TRELEASE, Time_Marker(0:7), TIME_ONSET
      double precision QTYH2O, HTFALL, ALPHA, PCTILE, RESET_DT     
C
C     write banner on entry into subroutine
C
      IF ( LEVEL_NECSTEPS .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A20)') 'SUBROUTINE NECSTEPS!'
      END IF

C     initialize counter for time markers
      KOUNT = 1

CSLH  Changed include file to "necstcmp.h" for faster greps.

C     include block of code for looping over all compartments
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A27)') 'necstcmp.h, COMPARTMENTS!'
      END IF

      INCLUDE 'necstcmp.h' ! <<=================================

CSLH  Changed include file to "necstpth.h" for faster greps.

C     include block of code for looping over all pathways
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A23)') 'necstpth.h, PATHWAYS!'
      END IF

      INCLUDE 'necstpth.h' ! <<=================================

CSLH  Added the necstloc.h block to add location parameter time steps
CSLH  (pathway_xq and breathing_rate_time) to the necessary time steps
CSLH  array, minstep.

C     include block of code for looping over all pathways
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A24)') 'necstloc.h, LOCATIONS!'
      END IF

      INCLUDE 'necstloc.h' ! <<=================================

CSLH  Changed include file to "necstrel.h" for faster greps.

C     include block of code for including release durations
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A32)') 'necstrel.h, RELEASE DURATIONS!'
      END IF

      INCLUDE 'necstrel.h' ! <<=================================

CSLH  Changed include file to "necstspr.h" for faster greps.

C     include block of code for including sprays time markers
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A34)') 'necstspr.h, SPRAYS TIME MARKERS!'
      END IF

      INCLUDE 'necstspr.h' ! <<=================================

CSLH  Changed include file to "necstsrt.h" for faster greps.

C     include block of code for sorting and reducing time markers
      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A30)') 'necstsrt.h, SORTING ROUTINE!'
      END IF

      INCLUDE 'necstsrt.h' ! <<=================================

C
C      Eliminate steps greater than accident time (duration_accident)
c
      NUM_DUM = NUMSTEPS
      END_TIME = DURATION_ACCIDENT-START_ACCIDENT
	DO I = 1, NUM_DUM, 1
	   IF (MINSTEP(I) .LE. END_TIME) NUMSTEPS=I
      END DO

C     Output results after quick sort and after reduction.

      IF ( LEVEL_NECSTEPS .GE. 2 ) THEN
        WRITE(out_unit,'(1X,A34)') 'NUMBER OF VALUES AFTER QUICK SORT:'
        WRITE(out_unit,'(1X,A12,I6)') 'NUMSTEPS  = ', NUMSTEPS
        WRITE(out_unit,'(1X,A18)') 'VALUES OF MINSTEP:'
        DO I = 1, NUMSTEPS
          WRITE(out_unit,'(1X,I6,1pe11.4,A4)')
     &       I, MINSTEP(I) / 3600.0, ' hrs'
        END DO

      END IF

      RETURN

      END
