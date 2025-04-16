C     ------------------------------------------------------------------
C
C     Include:     e_doses
C
C     ------------------------------------------------------------------
C
C     Author(s):   David K. Monroe
C                  Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872-1089
C
C     Description: Caclculates environment doses are for receptors
C                  located at user defined locations (eg. exclusion area
C                  boundary (EAB), low population zone (LPZ)).
C
C                  The user supplies the X/Qs and breathing rates as a
C                  function of time for each location in the
C                  environment.
C
C                  If the user wishes to model occupancy factors, he or
C                  she can do so by scaling the X/Qs or breathing rates
C                  as appropriate.
C
C                  Radioactive decay and ingrowth during transport in
C                  the environment, from the release point to the
C                  receptor point, will be not be calculated. The travel
C                  time is difficult to estimate and the assumption that
C                  no decay occurs in the environment until the activity
C                  reaches the receptor is consistent with present
C                  practice.
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
C     Usage:       Included in doses.for
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
C     Calls:       lupl2b
C
C     Assumptions: Design Reference Document was "Model Description", by
C                  LeAnn Adams Miller, February 25, 1994, pp. 14-16.
C
C     Version:     3.10
C
C     Date:        October 1, 1995
C
C     Revision
C     History:     3.0 - October 1, 1995 - No longer estimating the
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

C     begin e_doses.for
C
C                     I = index for dose location
C                comp_n = compartment it is in
C

         if(level_doses .ge. 2) then
            write(out_unit, '(1x, a, 2(/, 1x, a))')
     &         '----------------------------',
     &         'Environment dose calculation',
     &         '----------------------------'
         end if

C        Get atmospheric relative concentration value, for the nstep
C        time step, s/m3.

         xqratio = 0.0
         IF (location_xq_count(I) .gt. 0) THEN
            xqratio = lupl2(I, simtim, location_xq_time, location_xq,
     &         location_xq_count(I))
         END IF

         if(level_doses .ge. 2) then
            write(out_unit, '(1x, a,i2, 1pe11.4, a)')
     &         'X/Q = ', I, xqratio, ' s/m3'
        end if

C        Calculate inhalation doses.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, 2(/, 1x, a))')
     &            '-----------------------------',
     &            'Environment - inhalation dose',
     &            '-----------------------------'
            end if

C           Get worker breathing rate, m3/s.

            wbrate = lupl2b(i, simtim, location_breathing_rate_time,
     &         location_breathing_rate,
     &         location_breathing_rate_count(i))

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, e11.4, a)')
     &            'Breathing rate = ', wbrate, ' m3/s'
            end if

C           Calculate doses for each organ.

            do j = 1, organ_count, 1

C              Initialize total dose for inhalation, Sv.

               dose_org = 0.0

C              Calculate doses for each nuclide.

               do k = 1, number_of_nuclides, 1

C                 Inhalation dose conversion factor, Sv/Bq.

                  dcf = dcf_inhale(k, j)

C                 Activity for current nuclide, Bq.

                  activity = xn(k, comp_n, 1, nstep) *
     &            decay_constant(k)

c   if an aerosol, no dose 
                  IF (ngroup(k) .EQ. MAXCGRP) activity = 0.0
                     

C                 Inhalation dose for current nuclide, Sv.

                  dose_nuc = dcf * wbrate * activity * xqratio

C                 Running sum of total dose for organ, Sv.

                  dose_org = dose_org + dose_nuc

C                 Print only nuclide doses that had activity.
C                 if((level_doses .ge. 3) .and.
C    &               (xn(k, comp_n, 1, nstep) .ne. 0.0)) then
C                 Print all and only the effective doses.
                  if((level_doses .ge. 3) .and. (j .eq. 8)) then
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
     &                  'dcf            = ', dcf, ' Sv/Bq'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'wbrate         = ', wbrate, ' m3/s'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'xqratio        = ', xqratio, ' s/m3'
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

C           Write out selected doses for envrionment inhalation.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, e11.4,a)')
     &            'Thyroid dose from environment inhalation:    ',
     &            dose(i, 6, 1), ' Sv'
               write(out_unit, '(1x, a, e11.4, a))')
     &            'TEDE dose from environment inhalation:       ',
     &            dose(i, 8, 1), ' Sv'
            end if

C        End of calculate inhalation doses.

C        Calculate cloudshine doses.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, 2(/, 1x, a))')
     &            '-----------------------------',
     &            'Environment - cloudshine dose',
     &            '-----------------------------'
            end if

C           Calculate doses for each organ.

            do j = 1, organ_count, 1

C              Initialize total dose for cloudshine, Sv.

               dose_org = 0.0

C              Calculate doses for each nuclide.

               do k = 1, number_of_nuclides, 1

C                 Cloudshine dose conversion factor, Sv-m3/Bq-s.

                  dcf = dcf_cshine(k, j)

C                 Activity for current nuclide, Bq.

                  activity = xn(k, comp_n, 1, nstep) *
     &            decay_constant(k)

c   if an aerosol, no dose 
                  IF (ngroup(k) .EQ. MAXCGRP) activity = 0.0

C                 Cloudshine dose for current nuclide, Sv.

                  dose_nuc = dcf * activity * xqratio

C                 Running sum of cloudshine dose for organ, Sv.

                  dose_org = dose_org + dose_nuc

C                 Print only nuclide doses that had activity.
C                 if((level_doses .ge. 3) .and.
C    &               (xn(k, comp_n, 1, nstep) .ne. 0.0)) then
C                 Print all and only the effective doses.
                  if((level_doses .ge. 3) .and. (j .eq. 8)) then
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
     &                  'dcf            = ', dcf, ' Sv/Bq'
                     write(out_unit, '(1x, a, e11.4, a)')
     &                  'xqratio        = ', xqratio, ' s/m3'
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
     &            'Whole-body dose from environment cloudshine: ',
     &            dose(i, 8, 2), ' Sv'
               write(out_unit, '(1x, a, e11.4, a))')
     &            'TEDE dose from environment cloudshine:       ',
     &            dose(i, 8, 2), ' Sv'
            end if

C        End of calculate cloudshine doses.

C        Calculate skin doses.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, 2(/, 1x, a))')
     &            '-----------------------',
     &            'Environment - skin dose',
     &            '-----------------------'
            end if

C           Initialize total dose for skin, Sv.

            dose_org = 0.0

C           Deposition velocity to skin, m/s, and skin DCF, Sv-m2/Bq,
C           below taken from from NUREG/CR--4691-Vol.2 "MELCOR Accident
C           Consequence Code System (MACCS): Model Description",
C           H-N Jow, et. al., pp. 3-14 - 3-16.

            veldep = 0.01
            veldep = 0.0

C           Calculate dose for each nuclide.

            do j = 1, number_of_nuclides

C              Calculate skin DCF assuming 8 hours residence time for
C              material deposited on the skin (see comment above),
C              Sv-m2/Bq.

               dcf = 5.4e-14 *
     &            (1.0 - dexp(-1.0 * decay_constant(j) *
     &            (8.0 * 3600))) / decay_constant(j)

C              Activity for current nuclide, Bq.

                  activity = xn(j, comp_n, 1, nstep) *
     &            decay_constant(j)

C              Skin dose for current nuclide, Sv.

               dose_nuc = dcf * xqratio * activity * veldep

C              Running sum of skin dose.

               dose_org = dose_org + dose_nuc

c  kew
c  fixed index of xn( check below from k to j
c  ...
               if((level_doses .ge. 10) .and.
     &            (xn(j, comp_n, 1, nstep) .ne. 0.0)) then
c    &            (xn(k, comp_n, 1, nstep) .ne. 0.0)) then
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'Simulation time is ', simtim / 3600.0, ' hr'
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'deltat         = ', deltat(nstep) / 3600.0, ' hr'
                  write(out_unit, '(1x, 2a)')
     &               'nuclide_name   = ', nuclide_name(j)
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'veldep         = ', veldep, ' m/s'
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'dcf            = ', dcf, ' Sv/Bq'
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'xqratio        = ', xqratio, ' s/m3'
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'xn             = ', xn(j, comp_n, 1, nstep),
     &               ' atoms'
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'decay_constant = ', decay_constant(j), ' 1/s'
                  write(out_unit, '(1x, a, e11.4, a)')
     &               'activity       = ', activity, ' Bq'
                  write(out_unit, '(1x, a, 2(e11.4, a))')
     &               'dose_nuc       = ', dose_nuc, ' Sv,   ',
     &               dose_nuc * SV_TO_REM, ' rem'
               end if

            end do

C           Load total skin dose, Sv.

            dose(i, 1, 3) = dose_org

C           Write out dose for environment skin deposition.

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, a, e11.4, a, /)')
     &            'Skin deposition dose from environment:       ',
     &            dose(i, 1, 3), ' Sv'
            end if

C        End of calculate skin doses.

C     end e_doses.for

C     ------------------------------------------------------------------
