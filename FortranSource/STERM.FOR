C     ------------------------------------------------------------------
C
C     Subroutine:  sterm
C
C     ------------------------------------------------------------------
C
C     Author(s):   David Monroe
C                  Steven Humphreys
C                  LeAnn Adams Miller
C                  Ken Washington
C
C                  Sandia National Laboratories
C
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872-1089
C
C     Description: This subroutine calculates the release rate of
C                  material from the core inventory to the source term
C                  compartment.
C
C                  Reference document:
C
C                  Soffer, L., Burson, S.B., Ferrell, C.M., Lee, R.Y.,
C                  Ridgely, J.N., "Accident Source Terms for Light-Water
C                  Nuclear Power Plants: Report for Comment",
C                  NUREG-1465, U.S. Nuclear Regulatory Commission,
C                  Office of Nuclear Regulatory Research, Washington,
C                  DC, June 1995.
C
C                  Note:
C
C                  Non-radioactive release rates were only specified
C                  in the draft NUREG-1465. See "Accident Source Terms
C                  for Light-Water Nuclear Power Plants: Proposed Final
C                  Version," September 20, 1994, sec. 3.7, p. 30.
C
C
C     Usage:       CALL STERM(SIMTIM, NSTEP, DELTAT, RRATE, GRRATE)
C
C     Inputs:      SIMTIM - the simulation time at the beginning of the
C                  current time step.
C
C                  NSTEP  Time step counter, 2 is curent, 1 is last
C
C                  DELTAT(NSTEP)  Time step, sec
C
C     Outputs:     RRATE(I, NSRC) - nuclide I release rate in atom/sec
C                  for source NSRC
C
C                  GRRATE(KOMP, ITG) - the ITG transport-group release
C                  rate in the KOMP source term compartment.
C
C     Variables:
C
C     Assumptions: The ex-vessel and late in-vessel releases are the
C                  only releases that may overlap. This restriction is
C                  consistent with NUREG-1465 Tables 3.11, 3.12, and
C                  3.13 
C
C                  RRATE and GRRATE are output only variables. Any
C                  information in these variables will be lost when this
C                  subroutine is called.
C
C     Version:     3.10
C
C     Date:        May 2004
C
C
C     Revision
C     History:     3.10  Allowed multiple inventory and release files
C
C                  3.04  March 2002, removed overlying pool and modified
C                  system to allow 5 groups (noble, elemental, organic
C                  and aerosol iodine, rest of aereosols

C
C                  2.1 - January 16, 1996 - added decay of source
C                  by multiplying nuclide_initial_amount by dfactor
C                  everywhere, where dfactor = e(-lambda * simtim)
C                  this is only done if the source compartment is
C                  has decay turned on. note that no ingrowth
C                  of nuclides in the source is considered. - kew
C  
C                  2.0 - November 3, 1995 - block if structure for
C                  determining the source term release phase and
C                  consequent release fractions changed to perform
C                  the ex-vessel and late in-vessel releases
C                  simultaneously as specified in NUREG-1465,
C                  sec. 3.3, p. 12. 
C
C                  1.1 - October 2, 1995 - subroutine testing completed.
C
C                  1.0 - March 14, 1994 - initial version.
C
C     ------------------------------------------------------------------

      subroutine sterm(simtim, nstep, deltat, rrate, grrate)
      include 'full.com'
      integer nstep
      double precision simtim, deltat(MAXSTEP), time_onset
      double precision rrate(maxnuc,maxcomp), grrate(maxcomp, maxtgrp)

      integer i, j

      double precision hrtosc
      double precision rf(maxcgrp)
      double precision duration, pratio, release_rate
      double precision tmark1, tmark2, tmark3, tmark4

C        Variables for decay and ingrowth

      integer k, ndel, ndloop, nd(MAXNUC,3)
      double precision dfactor, gfactor, temp(MAXNUC), timstep

C        Conversion factor, s/hr.
      parameter(hrtosc = 3600.0)

C        Write banner on entry into subroutine.
      if (level_sterm .ge. 1) then
            write(out_unit, '(1x, a)') 'Subroutine STERM!'
      end if

c        move the rate terms to correspond to noble, elemental I,
C        organic I, aerosol I, and all aerosols including iodine


C        Initialize release fractions, nuclide release rates, group
C        release rates, and duration. Initializing these values here
C        allows us to handle both the overlapping ex-vessel and late
C        in-vessel phases and the post late in-vessel phases without
C        adding a lot of code to handle those special cases.

      do i = 1, MAXCGRP, 1
            rf(i) = 0.0
      end do

      do j = 1, MAXCOMP, 1
        do i = 1, MAXNUC, 1
            rrate(i,j) = 0.0
        end do
      end do

      do i = 1, MAXCOMP, 1
         do j = 1, MAXTGRP, 1
               grrate(i, j) = 0.0
         end do
      end do

      duration = 0.0


C        Calculate power ratio - plant power to inventory power (MWth).

      pratio = plant_power_level / inventory_power_level

         if (level_sterm .ge. 2) then
            write(out_unit, '(1x, a, e11.4, a)')  
     &         ' plant_power_level     = ',
     &         plant_power_level / 1.00e+06, ' MWth'
            write(out_unit, '(1x, a, e11.4, a)')
     &         ' inventory_power_level = ',
     &         inventory_power_level / 1.00e+06, ' MWth'
            write(out_unit, '(1x, a, e11.4)')
     &         ' power ratio           = ', pratio
         end if


C
      TIME_ONSET =  max(0.0d0, ONSET_GAP_RELEASE - START_ACCIDENT)

      IF (No_Decay .eq. 2) THEN
C ... Loop over all source term inventories and 
C     generate decay and daughters for the initial inventory
C     
        DO NUM_INVEN = 1, Number_Inventory_Files
C
C ... Modify the decay and daughtering to force a step size of 5
C     minutes (300 s) or less, to allow daughtering to be correctly 
C     predicted.  The shortest halflife currently in use is 900+ seconds
C     for the Xe-135 nuclide (used for TID releases)
C

          IF (NSTEP.EQ.1) THEN
             timstep = START_ACCIDENT
             ndel = (timstep+1.)/(0.25*dt_decay)
		ELSE
             timstep = deltat(nstep-1)
             ndel = (timstep+1.)/300.0
		END IF  
          ndel = max(ndel,1)
          timstep = timstep/ndel
C
          do ndloop = 1, ndel
C
            do i=1, number_of_nuclides,1
               temp(i) = nuclide_initial_amount(i,NUM_INVEN)
               dfactor=dexp(-decay_constant(i)*timstep)
               nuclide_initial_amount(i,NUM_INVEN) = temp(i) * dfactor
            end do 
C xxx   
            IF (calculate_daughters .EQ. 1) THEN
               do i=1, number_of_nuclides,1
                  do j=1, 3, 1
                     nd(i,j) = 0
                     if (branch_fraction(i,j) .GT. 0.0) then
                        do k=1, number_of_nuclides,1
                           if (nuclide_daughter(i,j) .EQ.
     &                        nuclide_name(k)) then
                              nd(i,j) = k
                           endif
                        end do
                     endif
                  end do
               end do
               do i = 1, number_of_nuclides
                     gfactor=1.0-dexp(-decay_constant(i)*timstep)
                  do j=1, 3
                     if (nd(i,j) > 0) then
                        nuclide_initial_amount(nd(i,j),NUM_INVEN) = 
     &                     nuclide_initial_amount(nd(i,j),NUM_INVEN) + 
     &                     gfactor * temp(i) * 
     &                     branch_fraction(i,j)
                     endif
                  end do
               end do
            END IF
          end do
         
        END DO
      END IF


      DO NSRC = 1, Number_of_Sources, 1
	   KOMP = Source_Term_On(NSRC)
         NUM_INVEN = Compartment_Inventory_File(NSRC)    
	   NRLSE = Inventory_Release(NSRC)

C     skip if concentration inventory (no release table)
         IF (NRLSE .GT. 0) THEN
C
C ...
C         write(out_unit,'(/1x, a, 4I4)') 'STERM..NSRC, KOMP,'
C    &         //' NUM_INVEN, NRLSE =', NSRC,KOMP,NUM_INVEN,NRLSE
C

C        Set time markers to correspond with the 4 releases phases as
C        defined in NUREG-1465, sec. 3.3, pp. 9-12.

C        Time line for setting release durations.
C        ---------------------------------------------------------------
C        Phase 1:
C           Gap               0.0 <= t < DG
C        Phase 2:
C           Early In-vessel              DG <= t < DG+DE
C        Phase 3:
C           Ex-vessel                              DG+DE <= t < DG+DE+DX
C        Phase 4:
C           Late In-vessel                         DG+DE <= t < DG+DE+DL
C        ---------------------------------------------------------------

          if (level_sterm .ge. 2) then
            write(out_unit, '(1x, a, I3)') 
     &         'Release Fractiion Table = ', NRLSE
            write(out_unit, '(1x, a, e11.4, a)')
     &         'duration_gap   = ', duration_gap(NRLSE) / 3600.0, ' h'
            write(out_unit, '(1x, a, e11.4, a)')
     &         'duration_early = ', duration_early(NRLSE) / 3600.0, ' h'
            write(out_unit, '(1x, a, e11.4, a)')
     &         'duration_ex    = ', duration_ex(NRLSE) / 3600.0, ' h'
            write(out_unit, '(1x, a, e11.4, a)')
     &         'duration_late  = ', duration_late(NRLSE) / 3600.0, ' h'
          end if

C        Time-line markers for releases, s.

          tmark1 = TIME_ONSET + duration_gap(NRLSE)
          tmark2 = tmark1 + duration_early(NRLSE)
          tmark3 = tmark2 + duration_ex(NRLSE)
          tmark4 = tmark2 + duration_late(NRLSE)

          if (level_sterm .ge.2 .and. nstep.eq.1) then
            write(out_unit, '(1x, a, e11.4, 2a)')
     &         'tmark 1 = ', tmark1 / 3600.0, ' h',
     &         '   end of gap release phase'
            write(out_unit, '(1x, a, e11.4, 2a)')
     &         'tmark 2 = ', tmark2 / 3600.0, ' h',
     &         '   end of early in-vessel release phase'
            write(out_unit, '(1x, a, e11.4, 2a)')
     &         'tmark 3 = ', tmark3 / 3600.0, ' h',
     &         '   end of ex-vessel release phase'
            write(out_unit, '(1x, a, e11.4, 2a)')
     &         'tmark 4 = ', tmark4 / 3600.0, ' h',
     &         '   end of late in-vessel release phase'
            write(out_unit, '(1x, a, e11.4, a)')
     &         'simtim  = ', simtim / 3600.0, ' h'
          end if

C
          if (level_sterm .ge. 2) then
            write(out_unit, '(1x, i6, 1p4e11.4)')
     &         nstep,simtim,onset_gap_release,deltat(nstep)
          end if

C        Set release fractions to the values appropriate for the present
C        phase(s) of the release.

C        If SIMTIM during gap release (Phase 1).

         IF (simtim.ge.TIME_ONSET .and. simtim.lt.tmark1) THEN

C           Get release fractions.

            rf( 1) = nobles_gap(NRLSE)
            rf( 2) = iodine_gap(NRLSE)
            rf( 3) = cesium_gap(NRLSE)
            rf( 4) = tellurium_gap(NRLSE)
            rf( 5) = strontium_gap(NRLSE)
            rf( 6) = barium_gap(NRLSE)
            rf( 7) = ruthenium_gap(NRLSE)
            rf( 8) = cerium_gap(NRLSE)
            rf( 9) = lanthanum_gap(NRLSE)
            rf(10) = aerosol_gap(NRLSE)

C           Get release duration, s.

            duration = duration_gap(NRLSE)

C           Calculate the nuclide, non-radioactive aerosol, and the
C           transport group release rates.


              do i = 1, number_of_nuclides, 1

C            Calculate nobles nuclide and transport group release
C                rates, atom/s.

                 if (ngroup(i) .eq. 1) then

                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)*
     &                     rf(ngroup(i))*pratio/duration
                    grrate(komp, 1) = grrate(komp, 1) + rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)

C                 Calculate iodine nuclide and transport group release
C                 rates.

                 else if (ngroup(i) .eq. 2) then

C                    Calculate iodine nuclide release rates, atom/s.

                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)*
     &                     rf(ngroup(i))*pratio/duration

C                    Calculate elemental iodine transport group release
C                    rate, atom/s.

                    grrate(komp, 2) = grrate(komp, 2) +
     &                     i_fraction_elemental(NSRC) * rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)

C                    Calculate organic iodine transport group release
C                    rate, atom/s.

                    grrate(komp, 3) = grrate(komp, 3) +
     &                     i_fraction_organic(NSRC) * rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)

C                    Calculate aerosol iodine's contribution to the
C                    aerosol transport group release rate, atom/

                    grrate(komp, 4) = grrate(komp, 4) +
     &                     i_fraction_aerosol(NSRC) * rrate(i,NSRC) * 
     &                     source_term_fraction(NSRC)

c                     add iodine into general aerosols also

                    grrate(komp, 5) = grrate(komp, 5) +
     &                     i_fraction_aerosol(NSRC) * rrate(i,NSRC) *
     &                     atomic_weight(i) / AVOGADRO / 1.0d3 *
     &                     source_term_fraction(NSRC)


C                 Calculate remaining radioactive aerosol's nuclide
C                 release rates, atom/s, and contribution to the aerosol
C                 transport group release rate, kg/s.

                 else if ((ngroup(i).ge.3) .and. 
     &                                   (ngroup(i).le.MAXCGRP))then
                 
                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)
     &                     *rf(ngroup(i))*pratio/duration
                    grrate(komp, MAXTGRP) = grrate(komp, MAXTGRP) +
     &                    rrate(i,NSRC)*atomic_weight(i)/AVOGADRO/1000.*
     &                    source_term_fraction(NSRC)

	           end if

              end do


C                   PHASE 2

C        Else if SIMTIM during early in-vessel release (Phase 2).

         ELSE IF ((simtim .ge. tmark1) .and. (simtim .lt. tmark2)) THEN

C           Get release fractions.

            rf( 1) = nobles_early(NRLSE)
            rf( 2) = iodine_early(NRLSE)
            rf( 3) = cesium_early(NRLSE)
            rf( 4) = tellurium_early(NRLSE)
            rf( 5) = strontium_early(NRLSE)
            rf( 6) = barium_early(NRLSE)
            rf( 7) = ruthenium_early(NRLSE)
            rf( 8) = cerium_early(NRLSE)
            rf( 9) = lanthanum_early(NRLSE)
            rf(10) = aerosol_early(NRLSE)

C           Get release duration, s.

            duration = duration_early(NRLSE)

C           Calculate the nuclide, non-radioactive aerosol, and the
C           transport group release rates.



              do i = 1, number_of_nuclides, 1

                 if (ngroup(i) .eq. 1) then
                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)
     &                     *rf(ngroup(i))*pratio/duration
				  grrate(komp, 1) = grrate(komp, 1) + rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)

                 else if (ngroup(i) .eq. 2) then
                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)*
     &                     rf(ngroup(i))*pratio/duration
                    grrate(komp, 2) = grrate(komp, 2) +
     &                     i_fraction_elemental(NSRC) * rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)
                    grrate(komp, 3) = grrate(komp, 3) +
     &                     i_fraction_organic(NSRC) * rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)
                    grrate(komp, 4) = grrate(komp, 4) +
     &                     i_fraction_aerosol(NSRC) * rrate(i,NSRC) * 
     &                     source_term_fraction(NSRC)
c add iodine into general aerosols also
                    grrate(komp, MAXTGRP) = grrate(komp, MAXTGRP) +
     &                     i_fraction_aerosol(NSRC) * rrate(i,NSRC) *
     &                     atomic_weight(i) / AVOGADRO / 1.0d3 *
     &                     source_term_fraction(NSRC)

                 else if ((ngroup(i).ge.3) .and. 
     &                                   (ngroup(i).le.MAXCGRP))then
                 
                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)*
     &                      rf(ngroup(i))* pratio/duration
                    grrate(komp, MAXTGRP) = grrate(komp, MAXTGRP) +
     &                     rrate(i,NSRC)*atomic_weight(i)/ AVOGADRO 
     &                     / 1.0d3 * source_term_fraction(NSRC)

                 end if
              end do


C                         PHASE 3

C        Else if SIMTIM during ex-vessel release (Phase 3).

         ELSE IF ((simtim .ge. tmark2) .and. (simtim .lt. tmark3)) THEN

C           Get release fractions.

            rf( 1) = nobles_ex(NRLSE)
            rf( 2) = iodine_ex(NRLSE)
            rf( 3) = cesium_ex(NRLSE)
            rf( 4) = tellurium_ex(NRLSE)
            rf( 5) = strontium_ex(NRLSE)
            rf( 6) = barium_ex(NRLSE)
            rf( 7) = ruthenium_ex(NRLSE)
            rf( 8) = cerium_ex(NRLSE)
            rf( 9) = lanthanum_ex(NRLSE)
            rf(10) = aerosol_ex(NRLSE)

C           Get release duration, s.

            duration = duration_ex(NRLSE)




              do i = 1, number_of_nuclides, 1

                 if (ngroup(i) .eq. 1) then
                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)*
     &                     rf(ngroup(i))*pratio/duration
                    grrate(komp, 1) = grrate(komp, 1) + rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)

                 else if (ngroup(i) .eq. 2) then
                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)*
     &                     rf(ngroup(i))*pratio/duration
                    grrate(komp, 2) = grrate(komp, 2) +
     &                     i_fraction_elemental(NSRC) * rrate(i,NSRC) *
     &                     source_term_fraction(NSRC)
                    grrate(komp, 3) = grrate(komp, 3) +
     &                     i_fraction_organic(NSRC) * rrate(i,NSRC)  *
     &                     source_term_fraction(NSRC)
                    grrate(komp, 4) = grrate(komp, 4) +
     &                     i_fraction_aerosol(NSRC) * rrate(i,NSRC)  * 
     &                     source_term_fraction(NSRC)
c add iodine into general aerosols also
                    grrate(komp, MAXTGRP) = grrate(komp, MAXTGRP) +
     &                     i_fraction_aerosol(NSRC) * rrate(i,NSRC) *
     &                     atomic_weight(i) / AVOGADRO/ 1.0d3 *
     &                     source_term_fraction(NSRC)

                 else if ((ngroup(i).ge.3) .and. 
     &                                   (ngroup(i).le.MAXCGRP))then
                 
                    rrate(i,NSRC) = nuclide_initial_amount(i,NUM_INVEN)
     &                     *rf(ngroup(i))*pratio/duration
                    grrate(komp, MAXTGRP) = grrate(komp, MAXTGRP) +
     &                     rrate(i,NSRC) * atomic_weight(i) / AVOGADRO 
     &                     / 1.0d3 * source_term_fraction(NSRC)
                 end if
              end do

         END IF
C                        PHASE 4

C        Add the late in-vessel nuclide release rates to the release
C        rates already calculated (either 0.0 or the ex-vessel release
C        fractions - gap and early in-vessel timing will cause this
C        block if to be skipped). Note: now using TMARK2 instead of
C        TMARK3 and IF instead of ELSE IF construct to allow for
C        ex-vessel and late in-vessel release overlap.

C        If SIMTIM during late in-vessel release (Phase 4)

         IF ((simtim .ge. tmark2) .and. (simtim .lt. tmark4)) THEN

C           Get release fractions.

            rf( 1) = nobles_late(NRLSE)
            rf( 2) = iodine_late(NRLSE)
            rf( 3) = cesium_late(NRLSE)
            rf( 4) = tellurium_late(NRLSE)
            rf( 5) = strontium_late(NRLSE)
            rf( 6) = barium_late(NRLSE)
            rf( 7) = ruthenium_late(NRLSE)
            rf( 8) = cerium_late(NRLSE)
            rf( 9) = lanthanum_late(NRLSE)
            rf(10) = aerosol_late(NRLSE)

C           Get release duration, s.

            duration = duration_late(NRLSE)

C           Calculate the nuclide, non-radioactive aerosol, and the
C           transport group release rates. Note that the nuclide release
C           rates are added to previously calculated values (either 0.0
C           or ex-vessel release rates).



              do i = 1, number_of_nuclides, 1
                 if (ngroup(i) .eq. 1) then
                    release_rate =  nuclide_initial_amount(i,NUM_INVEN)*
     &                    rf(ngroup(i))*pratio/duration
                    rrate(i,NSRC) = rrate(i,NSRC) + release_rate
                    grrate(komp, 1) = grrate(komp, 1) + release_rate *
     &                    source_term_fraction(NSRC)

                 else if (ngroup(i) .eq. 2) then
                    release_rate =  nuclide_initial_amount(i,NUM_INVEN)*
     &                    rf(ngroup(i))*pratio/duration
                    rrate(i,NSRC) = rrate(i,NSRC) + release_rate
                    grrate(komp, 2) = grrate(komp, 2) +
     &                    i_fraction_elemental(NSRC) * release_rate *
     &                    source_term_fraction(NSRC)
                    grrate(komp, 3) = grrate(komp, 3) +
     &                  i_fraction_organic(NSRC) * release_rate *
     &                  source_term_fraction(NSRC)
                    grrate(komp, 4) = grrate(komp, 4) +
     &                  i_fraction_aerosol(NSRC) * release_rate * 
     &                  source_term_fraction(NSRC)
c add iodine into general aerosols also
                    grrate(komp, MAXTGRP) = grrate(komp, MAXTGRP) +
     &                  i_fraction_aerosol(NSRC) * release_rate *
     &                  atomic_weight(i) / AVOGADRO / 1.0d3 *
     &                  source_term_fraction(NSRC)

                 else if ((ngroup(i).ge.3) .and. 
     &                                   (ngroup(i).le.MAXCGRP))then
                 
                    release_rate =  nuclide_initial_amount(i,NUM_INVEN)*
     &                    rf(ngroup(i))*pratio/duration
                    rrate(i,NSRC) = rrate(i,NSRC) + release_rate
                    grrate(komp, MAXTGRP) = grrate(komp, MAXTGRP) +
     &                     release_rate*atomic_weight(i)/ AVOGADRO 
     &                     / 1.0d3 * source_term_fraction(NSRC)
                 end if
              end do

         END IF

C        Write release fractions and duration.

         if (level_sterm .ge. 2) then
            write(out_unit,'(1x,a13,f11.4,4f13.4)')
     &         ' rf(01-05) = ', rf( 1), rf( 2), rf( 3), rf( 4), rf( 5)
            write(out_unit,'(1x,a13,f11.4,4f13.4)')
     &         ' rf(06-10) = ', rf( 6), rf( 7), rf( 8), rf( 9), rf(10)
            write(out_unit,'(1x,a13,f11.4,a3)')
     &         ' duration  = ', duration / hrtosc, ' h'
         end if

C        Write nuclide release rates.

         if (level_sterm .ge. 2) then
            do i = 1, number_of_nuclides
               if ( nuclide_initial_amount(i,NUM_INVEN) .ne. 0.0 ) then
                  write(out_unit,'(1x,a14,i2,a4,a7)')
     &               ' nuclide_name(', i, ') = ', nuclide_name(i)
                  write(out_unit,'(1x,a8,i2,a4,i2)')
     &               ' ngroup(', i, ') = ', ngroup(i)
                  write(out_unit,'(1x,a24,i2,a4,e11.4,a5)')
     &               ' nuclide_initial_amount(', i, ') = ',
     &               nuclide_initial_amount(i,NUM_INVEN), ' atom'
                  write(out_unit,'(1x,a4,i2,a4,e11.4)')
     &               ' rf(', ngroup(i), ') = ', rf(ngroup(i))
                  write(out_unit,'(1x,a13,e11.4,a8)')
     &               ' pratio    = ', pratio, ' non-dim'
                  write(out_unit,'(1x,a13,e11.4,a3)')
     &               ' duration  = ', duration / 3600.0, ' h'
                  write(out_unit,'(1x,a7,i2,a4,e11.4,a9)')
     &               ' rrate(', i, ') = ', rrate(i,komp), ' atom/s'
               end if
            end do
         end if

C        Write transport group release rates.

         if (level_sterm .ge. 2) then
            write(out_unit,'(1x,a8,i2,a6,e10.4,a9,a10,a19)')
     &         ' grrate(', komp, ',1) = ', grrate(komp,1), ' atom/s',
     &         '   nobles ', ' transport group #1'
            write(out_unit,'(1x,a8,i2,a6,e10.4,a9,a10,a19)')
     &         ' grrate(', komp, ',2) = ', grrate(komp,2), ' atom/s',
     &         '   elem-I ', ' transport group #2'
            write(out_unit,'(1x,a8,i2,a6,e10.4,a9,a10,a19)')
     &         ' grrate(', komp, ',3) = ', grrate(komp,3), ' atom/s',
     &         '   ogan-I ', ' transport group #3'
            if (MAXTGRP.eq.4)  then
		    write(out_unit,'(1x,a8,i2,a6,e10.4,a7,a10,a19)')
     &          ' grrate(', komp, ',4) = ', grrate(komp,4), ' atom/s',
     &          '   aeros  ', ' transport group #4'  
            else        
		    write(out_unit,'(1x,a8,i2,a6,e10.4,a7,a10,a19)')
     &          ' grrate(', komp, ',4) = ', grrate(komp,4), ' kg/s',
     &          '   aeros  ', ' transport group #4'  
              write(out_unit,'(1x,a8,i2,a6,e10.4,a7,a10,a19)')
     &          ' grrate(', komp, ',5) = ', grrate(komp,5), ' kg/s',
     &          '   aeros  ', ' transport group #5'
            end if
         end if

        END IF        
	END DO

      return

      end

C     ------------------------------------------------------------------
