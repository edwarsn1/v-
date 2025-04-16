C     ------------------------------------------------------------------
C
C     Include:     cr_doses
C
C     ------------------------------------------------------------------
C
C     Author(s):   David K. Monroe
C                  Steven Humphreys
C                  Sandia National Laboratories
C
C     Description: Calculates control room doses. The user supplies the
C                  breathing rates and occupancy factors as a function
C                  of time for each location in the control room.
C
C                  Doses can be calculated for various organs depending
C                  on whether the user is using the Dose Conversion
C                  Factors (DCFs) Publication 60 of the International
C                  Commission on Radiological Protection (ICRP60) or
C                  Federal Guidance Reports 11 & 12 (FGR11&12). Below
C                  are the two organ lists for ICRP60 and FGR11&12
C                  respectively. Care must be taken to ensure that the
C                  dosdata.inp file contains the organs in the same
C                  order.
C
C                  ICRP60:
C
C                     ( 1) STOMACH     ( 2) SMALL IN    ( 3) LUNGS
C                     ( 4) RED MARR    ( 5) LOWER LI    ( 6) THYROID
C                     ( 7) OVARIES     ( 8) EDEWBODY    ( 9) BONE SUR
C                     (10) BREAST      (11) TESTES      (12) THYROIDH
C                     (13) ADRENALS    (14) BLAD WAL    (15) KIDNEYS
C                     (16) LIVER       (17) PANCREAS    (18) SPLEEN
C                     (19) THYMUS      (20) ICRP60ED
C
C                  FGR11&12:
C
C                     ( 1) GONADS      ( 2) BREAST      ( 3) LUNGS
C                     ( 4) RED MARR    ( 5) BONE SUR    ( 6) THYROID
C                     ( 7) REMAINDER   ( 8) EFFECTIVE   ( 9) SKIN(FGR)
C
C                     FGR11&12 EFFECTIVE is the same as ICRP60 EDEWBODY
C
C     Usage:       included mcode\doses.for
C
C     Inputs:      simtim - Current simulation time.
C                  deltat - Current time increment.
C                  nstep  - Current time step counter.
C
C     Outputs:     dose - Dose for each location, each organ, and each
C                  route. Routes are inhalation dose, cloudshine dose,
C                  and skin dose.
C
C     Variables:
C
C     Calls:       lupl2 & lupl2b
C
C     Assumptions: Design Reference Document was "Model Description", by
C                  LeAnn Adams Miller, February 25, 1994, pp. 14-16.
C
C     Version:     3.0
C
C     Date:        October 1, 1995
C
C     Revision
C     History:     3.1 - March 6, 1996 - added control room occupancy
C                  factors to the dose calculations.
C
C                  3.0 - October 1, 1995 - No longer estimating the
C                  activity release rates for the activity entering the
C                  environment or control room. This estimate was only
C                  necessary to determine each path's contribution to
C                  the total dose but it was difficult to determine the
C                  accuracy of this estimate. The effect of this change
C                  is that we will be unable to determine individual
C                  pathway contribution to dose (never an NRC
C                  requirement) but our dose calculations which will
C                  include all pathways into environment or control room
C                  will be more accurate.
C
C                  2.0 - July 8, 1995 - This subroutine was changed in
C                  order to accomodate both the MACCS and FGR 11&12
C                  DCFs. The primary difference is that the organs are
C                  different for the MACCS and FGR 11&12 DCFs. The
C                  position of the organs will be determined by the
C                  FGR 11&12 positions. The MACCS DCF input file will
C                  be edited to match the FGR 11&12 positions for
C                  THYROID and EDEWBODY (labled EFFECTIVE in the
C                  FGR11&12 DCFs.)
C
C                  1.1 - May 23, 1995 - Added the dose_unit argument and
C                  modified the code to use the global out_unit variable
C                  for writing information to the output file.
C
C                  1.0 - September 15, 1994 - Initial version.
C
C     ------------------------------------------------------------------

C     begin cr_doses.for
C
C                     I = index for dose location
C                comp_n = compartment it is in
C

         if(level_doses .ge. 2) then
            write(out_unit, '(1x, a, 2(/, 1x, a))')
     &      '-----------------------------',
     &      'Control-room dose calculation',
     &      '-----------------------------'


         end if

C        Get volume of control room, m3.

         comp_volume = compartment_volume(comp_n)

C        Write volume of control room.

         if(level_doses .ge. 2) then
            write(out_unit, '(1x, a, a)')
     &         'Compartment name = ', compartment_name(comp_n)
         end if

C        Get worker breathing rate, m3/s.

         wbrate = lupl2b(i, simtim, location_breathing_rate_time,
     &      location_breathing_rate, location_breathing_rate_count(i))

C        Write worker breathing rate, m3/s.

         if(level_doses .ge. 2) then
            write(out_unit, '(1x, a, e11.4, a)')
     &         'Breathing rate = ', wbrate, ' m3/s'
         end if

C        Get worker occupancy factor.

         wofact = lupl2b(i, simtim, location_occupancy_factor_time,
     &      location_occupancy_factor,
     &      location_occupancy_factor_count(i))

C        Write worker occupancy_factor.

         if(level_doses .ge. 2) then
            write(out_unit, '(1x, a, e11.4)')
     &         'occupancy_factor = ', wofact
         end if

C        Calculate inhalation doses.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, 2(/, 1x, a))')
     &            '------------------------------',
     &            'Control room - inhalation dose',
     &            '------------------------------'
            end if

C           Calculate doses for each organ.

            do j = 1, organ_count, 1

C              Initialize total dose for inhalation, Sv.

               dose_org = 0.0

C              Calculate doses for each organ.

               do k = 1, number_of_nuclides
				   
C                 Inhalation dose conversion factor, Sv/Bq.

                  dcf = dcf_inhale(k, j)

C                 Calculate the time integrated activity for the current
C                 nuclide, Bq s using the trapeziod rule to approximate
C                 the time integrated activity.
C
C   no dose from aerosols  
                  IF (ngroup(k) .EQ. MAXCGRP) THEN
                     activity = 0.0

				  ELSE IF (nstep .eq. 1) THEN
                     activity = xn(k, comp_n, 1, nstep) *
     &                  decay_constant(k) * deltat(nstep) / 2.0
                  ELSE
                     activity = (xn(k, comp_n, 1, nstep - 1) +
     &                  xn(k, comp_n, 1, nstep)) *
     &                  decay_constant(k) * deltat(nstep) / 2.0
                  END IF

C                 Calculate concentration of nuclide activity, Bq s/m3.

                  concent = activity / comp_volume

C                 Inhalation dose for current nuclide, Sv.

                  dose_nuc = dcf * concent * wbrate * wofact

C                 Running sum of organ dose for inhalation, Sv.

                  dose_org = dose_org + dose_nuc

                  if((level_doses .ge. 3) .and.
     &               (xn(k, comp_n, 1, nstep) .ne. 0.0)) then
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'Simulation time is ', simtim / 3600.0, ' hr'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'deltat         = ', deltat(nstep) / 3600.0,
     &                  ' hr'
                     write(out_unit, '(1x, 2a)')
     &                  'nuclide_name   = ', nuclide_name(k)
                     write(out_unit, '(1x, 2a)')
     &                  'organ_name     = ', organ_name(j)
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'comp_volume    = ', comp_volume, ' m3'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'concent        = ', concent, ' Bq/m3'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'dcf            = ', dcf, ' Sv/Bq'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'wbrate         = ', wbrate, ' m3/s'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'xn             = ', xn(k, comp_n, 1, nstep),
     &                  ' atoms'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'decay_constant = ', decay_constant(k), ' 1/s'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'activity       = ', activity, ' Bq'
                     write(out_unit, '(1x, a, 2(e11.4, a))')
     &                  'dose_nuc       = ', dose_nuc, ' Sv,   ',
     &                  dose_nuc * SV_TO_REM, ' rem'
                  end if

               end do

C              Load total organ dose for inhalation, Sv.

               dose(i, j, 1) = dose_org

            end do

C           Write out selected doses for control room inhalation.


            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, e11.4,a)')
     &            'Thyroid dose from control room inhalation:    ',
     &            dose(i, 6, 1), ' Sv'
               write(out_unit, '(1x, a, e11.4, a))')
     &            'TEDE dose from control room inhalation:       ',
     &            dose(i, 8, 1), ' Sv'
            end if

C        End of calculate inhalation doses.

C        Calculate cloudshine doses.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, 2(/, 1x, a))')
     &            '------------------------------',
     &            'Control room - cloudshine dose',
     &            '------------------------------'
            end if

C           Absorption coefficient for air, 1/m.
C
C           abscoef = 3.0e-3
C
C           Calculate DCF correction factor for a finite volume. The
C           methodology below was derived from "Reactor Shielding Design
C           Manual, Theodore Rockwell III, McGraw-Hill Book Company,
C           Inc., 1956, pp. 346, 371, 405-506; and with private
C           correspondence from William Arcieri, Scientech, Inc.
C
C           Calculate edge length of semi-cube (a volume whose
C           width = length = 2 * heigth) for the given
C           compartment volume, m.

            edgelength = (2.0 * comp_volume) ** (1.0 / 3.0)

C           Calculate the effective radius of an equivalent
C           hemisphere with the same volume, m.
C           Note: 0.6204 = (3/(4pi))**(1/3).

            radiuseff  = 0.6204 * edgelength

C           Calculate the correction factor for the finite hemisphere,
C           dimensionless. The reference above multiplied the correction
C           factor by 0.98 to account for the geometric differences
C           between the semi-cube and the effective hemisphere. Since
C           this represents a minor reduction in dose based on a
C           geometric assumption about the control room (ie., that it is
C           a semi-cube) that might not even be correct, the correction
C           factor has been left off.

C           The correction factor is based on the ratio of the radiation
C           flux as seen by a point at the center of an hemisphere with
C           a finite radius r1, and an hemisphere with a radius r2, as
C           r2 goes to infinity.

C                      p        (-ur)             p
C              F     = -- (1 - e     ),   f     = --
C               r=r1   2u                  r=r2   2u

C              F
C               r=r1        (-ur)
C              ----- = 1 - e
C              F
C               r=r2

C              where:

C                 F = Radiation flux, Bq/m2;
C                 p = Activity concentration, Bq/m3;
C                 u = Absorbtion coeficient, 1/m; and
C                 r = Hemisphere radius, m.

C           fincorr = 1.0 - dexp(-1.0 * abscoef * radiuseff)

C           Compare HABIT's methodology (K. G. Murphy, K. M. Campe) to
C           RADTRAD's methodology (see above reference). The control
C           room volume is converted to ft^3 for the HABIT calculations.

            if(level_doses .eq. 72) then
               write(out_unit, '(/, 1x, a, e11.4)')
     &            'HABIT''s   geometry correction factor      = ',
     &            ((comp_volume * 0.3531d2) ** 0.338d0) / 0.1173d4

               write(out_unit, '(/, 1x, a, e11.4)')
     &            'RADTRAD''s geometry correction factor      = ',
     &            fincorr

               write(out_unit, '(/, 1x, a, e11.4, /)')
     &            'The geometry factor ratio,  HABIT/RADTRAD = ',
     &            ((comp_volume * 0.3531d2) ** 0.338d0) / 0.1173d4 /
     &            fincorr
            end if

C           Use Murphy Campe.

            fincorr =
     &         ((comp_volume * 0.3531d2) ** 0.338d0) / 0.1173d4

C           Calculate doses for each organ.

            do j = 1, organ_count, 1

C               Beta is not effected by constrained volume
C               eliminate the volume adjustment for skin doses (J=9)
C               only valid for std organ list from FGR 12

               if (j.eq.9) fincorr = 1.0

C              Initialize total dose for cloudshine, Sv.

               dose_org = 0.0

C              Calculate doses for each nuclide.

               do k = 1, number_of_nuclides, 1

C                 Semi-Infinite cloudshine dose conversion factor,
C                 Sv m3/Bq s.

                  dcf = dcf_cshine(k, j)

C                 Effective compartment cloudshine DCF, Sv m3/Bq s.

                  dcfeff = dcf * fincorr

C                 Calculate the time integrated activity for the current
C                 nuclide, Bq s using the trapeziod rule to approximate
C                 the time integrated activity.
C
C   no dose from aerosols 
                  IF (ngroup(k) .EQ. MAXCGRP) THEN
                     activity = 0.0

				  ELSE IF (nstep .eq. 1) THEN
                     activity = xn(k, comp_n, 1, nstep) *
     &                  decay_constant(k) * deltat(nstep) / 2.0
                  ELSE
                     activity = (xn(k, comp_n, 1, nstep - 1) +
     &                  xn(k, comp_n, 1, nstep)) *
     &                  decay_constant(k) * deltat(nstep) / 2.0
                  END IF

C                 Concentration of nuclide activity, Bq s/m3.

                  concent = activity / comp_volume

C                 Cloudshine dose for current nuclide, Sv.

                  dose_nuc = dcfeff * concent * wofact

C                 Running sum of cloudshine dose for organ, Sv.

                  dose_org = dose_org + dose_nuc

                  if((level_doses .ge. 3) .and.
     &               (xn(k, comp_n, 1, nstep) .ne. 0.0)) then
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'Simulation time is ', simtim / 3600.0, ' hr'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'deltat         = ', deltat(nstep) / 3600.0,
     &                  ' hr'
                     write(out_unit, '(1x, 2a)')
     &                  'nuclide_name   = ', nuclide_name(k)
                     write(out_unit, '(1x, 2a)')
     &                  'organ_name     = ', organ_name(j)
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'comp_volume    = ', comp_volume, ' m3'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'edgelength     = ', edgelength, ' m'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'radiuseff      = ', radiuseff, ' m'
                     write(out_unit, '(1x, a, e11.4)')
     &                  'fincorr        = ', fincorr
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'dcf            = ', dcf, ' Sv/Bq'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'dcfeff         = ', dcfeff, ' Sv/Bq'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'concent        = ', concent, ' Bq/m3'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'xn             = ', xn(k, comp_n, 1, nstep),
     &                  ' atoms'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'decay_constant = ', decay_constant(k), ' 1/s'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'activity       = ', activity, ' Bq'
                     write(out_unit, '(1x, a, 2(e11.4, a))')
     &                  'dose_nuc       = ', dose_nuc, ' Sv,   ',
     &                  dose_nuc * SV_TO_REM, ' rem'
                  end if

               end do

C              Load total organ dose for cloudshine, Sv.

               dose(i, j, 2) = dose_org

            end do

C           Write out selected doses for environment cloudshine.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, e11.4, a)')
     &            'Whole-body dose from control room cloudshine: ',
     &            dose(i, 8, 2), ' Sv'
               write(out_unit, '(1x, a, e11.4, a)')
     &            'Skin dose from control room cloudshine: ',
     &            dose(i, 9, 2), ' Sv'
               write(out_unit, '(1x, a, e11.4, a))')
     &            'TEDE dose from control room cloudshine:       ',
     &            dose(i, 8, 2), ' Sv'
            end if

C        End of calculate cloudshine doses.

C        Calculate skin doses due to deposition on the skin

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, 2(/, 1x, a))')
     &            '------------------------',
     &            'Control room - skin dose',
     &            '------------------------'
            end if


C     end cr_doses.for

C     ------------------------------------------------------------------
