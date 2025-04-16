C     ------------------------------------------------------------------
C
C     Subroutine:  doses
C
C     ------------------------------------------------------------------
C
C     Author(s):   David Monroe
C                  Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames
C                  505-872-1089
C                  ALION/ ITSO
C
C     Description: Environment and control room doses are calculated for
C                  receptors located at user defined locations (eg.
C                  exclusion area boundary (EAB), low population zone
C                  (LPZ), control Room operator).
C
C                  The user supplies the X/Qs and breathing rates as a
C                  function of time for each location in the
C                  environment. The user also supplies the breathing
C                  rates and occupancy factors as a function of time for
C                  each location in the control room. The user may also
C                  specifiy a special X/Q as a function of time for
C                  defining the atmospheric relative concentration of
C                  activity for pathways which remove activity from
C                  the environment.
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
C     Usage:       Called by radcalc
C
C     Inputs:      simtim - Current simulation time.
C                  deltat - Current time increment.
C                  nstep  - Current time step counter.
C
C     Outputs:     dose_wbod - Doses acquired during the time interval,
C                  present criteria whole-body (all organs), each
C                  location, each route.
C
C                  dose_skin - Doses acquired during the time interval,
C                  for skin organ only, each location, each route.
C                  
C                  dose_thyr - Thyroid dose, each location, each route.
C
C                  dose_tede - Dose acquired during the time interval,
C                  proposed criterion for total effective dose
C                  equivalent, each location, each route.
C
C     Variables:   dose - Dose for each location, each organ, and each
C                  route. Routes are inhalation dose, cloudshine dose,
C                  and skin dose.
C
C     Calls:       lupl2
C
C     Assumptions: Design Reference Document was "Model Description", by
C                  LeAnn Adams Miller, February 25, 1994, pp. 14-16.
C
C     Version:     3.4
C
C     Date:        March 6, 1996
C
C     Revision
C     History:     3.4 - March 6, 1996 - added control room occupancy
C                  factors to the dose calculations.
C
C                  3.3 - February 2, 1996 - removed onzone patch.
C
C                  3.2 - January 17, 1996 - patch in onzone for printout
C                  purposes.
C
C                  3.1 - November 9, 1995 - Removed dose_unit references
C                  all output will be done to the regular output file.
C                  Dose variables changed to double precision for more
C                  accurate accumulation.
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

      subroutine doses(simtim, deltat, nstep, xn, dose_wbod,
     &   dose_skin, dose_thyr, dose_tede)
      include 'full.com'
      double precision simtim
      double precision deltat(MAXSTEP)
      integer nstep
      double precision xn(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision dose_wbod(MAXDOSE, MAXSTEP)
      double precision dose_skin(MAXDOSE, MAXSTEP)
      double precision dose_thyr(MAXDOSE, MAXSTEP)
      double precision dose_tede(MAXDOSE, MAXSTEP)

         double precision SV_TO_REM
         parameter (SV_TO_REM = 100.0)

         integer i, j, k, comp_n

         character error_message * 80

         double precision lupl2, lupl2b
         double precision wbrate, wofact
         double precision activity, concent
         double precision comp_volume, edgelength, radiuseff, fincorr
         double precision veldep, xqratio, dcf, dcfeff
C        double precision abscoef

         double precision dose(MAXDOSE, MAXORG, MAXROUTE)
         double precision dose_org, dose_nuc
C        MAXROUTE  =     3,   ! Max Dose Routes (injest, shine, deposit)


C        Write banner on entry into subroutine.
         if(level_doses .ge. 1) then
            write(out_unit, '(1x, a)') 'Subroutine doses!'
         end if

	   n_xq_numb = 0
    
C        Calculated doses for each user-specified location.

         do I = 1, Number_Dose_Locations, 1

C           Get compartment number for the current location.

            comp_n = location_compartment_number(I)

            if(level_doses .ge. 2) then
               write(out_unit, '(1x, 2a)')
     &            'Compartment name = ', compartment_name(comp_n)
               write(out_unit, '(1x, 2a)')
     &            'Location name    = ', location_name(I)
               write(out_unit, '(1x, 2(a, i2))')
     &            'location_compartment_number(', I, ') = ',
     &            location_compartment_number(I)
               write(out_unit,  '(1x, a, i2)') 'comp_n = ', comp_n
               write(out_unit, '(1x, 2(a, i2))')
     &            'compartment_type(', I, ') = ',
     &            compartment_type(comp_n)
            end if

C           Compartment types:

C           (1) Control room - doses are calculated using calculated
C               control room compartment concentration.
C           (2) Environment - doses are calculated using user-specified
C               X/Q values.
C           (3) Normal - no doses are calculated in this compartments.
C           (4) Normal room - doses are calculated using calculated
C               room compartment concentration.
C           Note:  A control room release to the environment is 0, 
C                  i.e. it dose not effect the offsite dose.
C
            select case(compartment_type(comp_n))
C
C                     I = index for dose location
C                comp_n = compartment it is in
C

               case(1)   ! Control room compartment.
C                 "Call" calculate control room doses code.
                  include 'doses_cr.h'

               case(2)   ! Environment compartment.
C                 "Call" calculate environment doses code.
                  include 'doses_e.h'

               case(3)   ! Normal compartment.
C                 No doses are calculated in normal compartments.

               case(4)   ! Normal dose compartment .
C                 "Call" calculate room doses code.
                  include 'doses_cr.h'

               case(5)   ! Control room compartment.
C                 No doses are calculated in normal compartments.

               case default   ! Invalid compartment type.
                  write(error_message, '(a, i2, a)')
     &               'Compartment ' // compartment_name(comp_n) //
     &               ' has an invalid type of ',
     &               compartment_type(comp_n), '.'
C                  call message (trim(error_message))

            end select

         end do

         do i = 1, Number_Dose_Locations

C           Calculate doses for the present criteria.

C              Whole-body, all organs, Sv
C              Organ(s) = (8) EDEWBODY/EFFECTIVE
C              Route(s) = (2) CLOUDSHINE

               dose_wbod(i, nstep) = dose(i, 8, 2)

C              skin, shine, Sv
C              Organ(s) = (9) SKIN
C              Route(s) = (2) CLOUDSHINE

               dose_skin(i, nstep) = dose(i, 9, 2)

C              Thyroid dose, inhalation, Sv
C              Organ(s) = (6) THYROID
C              Route(s) = (1) INHALATION

               dose_thyr(i, nstep) = dose(i, 6, 1)

C           Calculate doses for the proposed criterion.

C              TEDE, inhalation(chronic) + cloudshine, Sv
C              Organ(s) = (8) EDEWBODY/EFFECTIVE
C              Route(s) = (1) INHALATION and (2) CLOUDSHINE

               dose_tede(i, nstep) = dose(i, 8, 1) + dose(i, 8, 2)

            if(level_doses .ge. 2) then

               write(out_unit, '(/ 1x, 3a, /)')
     &            'Doses recieved from location ',
     &            trim(location_name(i)),
     &            ' during this time step.'

               write(out_unit, '(/, 1x, 2a)')
     &            'location name = ', location_name(i)
               write(out_unit, '(/, 14x, 3a, /)')
     &            'Inhalation        ', 'Cloudshine        ',
     &            'Total Organ'

               do j = 1, organ_count
                  write(out_unit, '(1x, a10, 3(e11.4, a))')
     &               organ_name(j),
     &               dose(i, j, 1), ' Sv,   ',
     &               dose(i, j, 2), ' Sv,   ',
     &               dose(i, j, 1) + dose(i, j, 2), ' Sv'
               end do

C              Write doses for the present criteria.

                  write(out_unit, '(1x, a, 2(e11.4, a))')
     &               'Whole body           = ',
     &                dose_wbod(i, nstep), ' Sv,   ',
     &                dose_wbod(i, nstep) * SV_TO_REM, ' rem'

                  write(out_unit, '(1x, a, 2(e11.4, a))')
     &               'Skin                 = ',
     &                dose_skin(i, nstep), ' Sv,   ',
     &                dose_skin(i, nstep) * SV_TO_REM, ' rem'

                  write(out_unit, '(1x, a, 2(e11.4, a))')
     &               'Thyroid (Inhalation) = ',
     &                dose_thyr(i, nstep), ' Sv,   ',
     &                dose_thyr(i, nstep) * SV_TO_REM, ' rem'

C              Write doses for the proposed criterion.

                  write(out_unit, '(1x, a, 2(e11.4, a))')
     &               'TEDE                 = ',
     &                dose_tede(i, nstep), ' Sv,   ',
     &                dose_tede(i, nstep) * SV_TO_REM, ' rem'

            end if

         end do


         return

      end

C     ------------------------------------------------------------------
