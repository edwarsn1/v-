C     ------------------------------------------------------------------
C
C     Subroutine:  coeffs
C
C     ------------------------------------------------------------------
C
C     Author(s):   David Monroe
C                  (505) 844-9510
C
C                  Steven Humphreys
C                  (505) 844-7223
C
C                  Accident Analysis / Consequence Assessment Department
C
C                  LeAnn Adams Miller
C                  (505) 844-3772
C
C                  Facilities Safety and Risk Analysis Department
C
C                  Sandia National Laboratories
C                  Albuquerque, NM 87185
C
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872-1089
C
C     Description: This subroutine combines the coefficients for the
C                  individual removal and transport mechanism to obtain
C                  the system matrix for the differential equation
C                  governing nuclide counts.
C
C                  For each of the four transport groups, there will be
C                  obtained a set of coefficients, Cij, with the indices
C                  i and j designating compartment numbers.
C
C                  The value of Cij is positive when it corresponds to a
C                  loss in the content of the ith compartment. It is
C                  negative when it corresponds to a gain in the content
C                  of the ith compartment. This loss or gain is
C                  proportional to the content of the jth compartment.
C                  Presently all losses occur on the diagonal of the
C                  system matrix and all gains occur off the diagonal.
C
C                  For example, C11 is the loss for compartment 1
C                  resulting from removal/transport processes that are
C                  proportional to the content of compartment 1. Thus,
C                  there is a removal mechanism in compartment 1 or
C                  there is a transport mechanism that is removing
C                  material from compartment 1.
C
C                  As another example, C12 is the gain for
C                  compartment 1 resulting from transport processes that
C                  are proportional to the content of compartment 2.
C                  Thus, there is a transport pathway that is removing
C                  material from compartment 2 and carrying it to
C                  compartment 1.
C
C     Usage:       CALL coeffs(simtim, nstep, deltat, xngrp, grrate,
C                     coeff, transport_eff)
C
C     Inputs:      simtim - current simulation time.
C
C                  nstep - current time step counter.
C
C                  deltat - time step increments.
C
C                  xngrp - quantity of each transport group, each
C                  compartment location, each time step.
C
C                  grrate - group release rate for each transport group.
C
C                  transport_eff - group transport efficiency
C
C     Outputs:     coeff - coefficients of system matrix, 1/sec.
C                  frac-out - Q/Vol for exhaust pathways
C                  xoq_now - current dispersion by location
C
C     Variables:
C
C     Calls:       For losses within the compartment:
C                     recirc   compartment_filters = 1;
C                     xntdep   compartment_deposition = 1; and
C                     spry     compartment_sprays = 1.
C
C                  For losses by way of pathways:
C                     pipout   pathway_type = 1, piping;
C                     fout     pathway_type = 2, filtered pathway;
C                     supout   pathway_type = 3, generic (aerosols, elemental, & organic);
C                     cout     pathway_type = 4, air leakage; and
C                     supout   pathway_type = 6, generic (aerosols and Iodine).
C
C                  For gains by way of pathways:
C                     pipin    pathway_type = 1, piping;
C                     filtin   pathway_type = 2, filtered pathway;
C                     supin    pathway_type = 3, generic (aerosols, elemental, & organic);
C                     cin      pathway_type = 4, air leakage; and
C                     supin    pathway_type = 6, generic (aerosols and Iodine).
C
C     Version:     3.1
C
C     Date:        2002
C
C     Revision
C     History:     3.1   Restructure the logic to allow
C                        X/Q to vary with release location
C                        and to follow deposition by nuclide
C
C                  2.01 - July 5, 1996 - support for detailed model
C                  information on printouts added
C
C                  2.0 - February 12, 1996 - modified the gain and loss
C                  by way of pathway algorithms in order to handle
C                  environment/X/Q cases.
C
C                  1.5 - January 31, 1996 - changed all real variables
C                  to double precision for better results and solution
C                  stability.
C
C                  1.4 - October 19, 1995 - added code to update sub-
C                  compartment inventories, ie., recirculating filters,
C                  deposition surfaces, sumps, and overlying pools.
C
C                  1.3 - August 29, 1995 - Added modifications to
C                  support the Brockmann/Bixler pipe models.
C
C                  1.2 - January 11, 1995 - Added modification to
C                  support the Steve Stage/Cline pipe model.
C
C                  1.1 - July 27, 1995 - Successfully passed module
C                  testing.
C
C                  1.0 - February 28, 1994 - Initial Version.
C
C     ------------------------------------------------------------------

      subroutine coeffs(simtim, nstep, deltat, xngrp, grrate, coeff,
     &                  transport_eff)

      include 'full.com'

      double precision simtim
      integer nstep
      double precision deltat(MAXSTEP)
      double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision grrate(MAXCOMP, MAXTGRP)
      double precision coeff(MAXCOMP, MAXCOMP, MAXTGRP)
      double precision transport_eff(MAXTGRP,MAXPATH)

CTJH     October 19, 1995 - code added by TJH to determine sub-
CTJH     compartment inventories.

C        Lines previously from cptran.inc. The other files that
C        previously included this file, also now contain these lines.

C        transport groups removed from compartment atmospheres
C        and deposited into other compartment sub-locations
C        assignments for ctran (compartments):

C        ctran(comp,1,tg)     not defined      atmosphere, revol'n
C        ctran(comp,2,tg)     sprays           comp sump
C        ctran(comp,3,tg)     not defined      comp opool
C        ctran(comp,4,tg)     nat dep          dep surfaces
C        ctran(comp,5,tg)     recirc filter    comp filter

C        transport groups deposited in pathways
C        assignments for ptran (pathways):

C        ptran(path,1,tg)     pipe loss        pipe walls
C        ptran(path,2,tg)     filter loss      pathway filters
C        ptran(path,3,tg)     s-pool loss      s-pool
C        ptran(path,4,tg)     nat convect      no accumulation
C        ptran(path,5,tg)     not defined      -----------

CTJH     Code added by TJH on 19 October 1995.

      double precision ctran(MAXCOMP, MAXCLOC, MAXTGRP)
      double precision ptran(MAXPATH, MAXPLOC, MAXTGRP)
      double precision frac_out(MAXTGRP,MAXPATH)
	double precision xoq_now(MAX_XQS)

      common / cptran / ctran, ptran, frac_out, xoq_now

C        included into following subroutines
C        radcalc             sourcep             coeffs
C        filtin              pipin               supin
C
C        Loop counters, i and ii are used for compartment indices,
C        j and jj are used for pathway indices, and k is used for
C        transport group indices.  kk is used for the compartment
C        from and ll is used for the number of pathways entering 
C        the environment

      integer I, ii, J, jj, k, kk, ll, NXQ

C        ECOMP is the index of the environment compartment

      integer ecomp

C        The list of pathways that go to or come from the present or
C        environment compartment and counters/indices for those lists.

      integer flow_to, flow_from
      integer plist_to(MAXPATH), plist_from(MAXPATH)

C        Indices to paths flowing in and out of the present compartment
C        or environemnt. Indices to compartments that are connected to
C        paths flowing in or out of the present compartment or
C        environment.

      integer path_to, path_from, comp_to, comp_from, path_numb


C        Compartment removal mechanisms, recirculating filters, natural
C        deposition, and suppression pools.

      double precision fltr_rem(MAXTGRP)
      double precision ndep_rem(MAXTGRP)
      double precision spry_rem(MAXTGRP)

C        Pathway flows and removal mechanisms. In and out designations
C        are made with respect to the connected compartment. Eg. pipe
C        flow entering a compartment is pipe_in, pipe flow leaving a
C        compartment is pipe_out.

      double precision pipe_out(MAXTGRP), pipe_in(MAXTGRP)
      double precision fltr_out(MAXTGRP), fltr_in(MAXTGRP)
      double precision supp_out(MAXTGRP), supp_in(MAXTGRP)
      double precision leak_out(MAXTGRP), leak_in(MAXTGRP)

C        The filter intake X/Q for the present time step and the
C        function which finds it .

      double precision xq, lupl2

C        Temporary storage to hold the environement volume during
C        calculations where the environement volume needs to be 1.0
C        The RADTRAD Beta versions do not use the environement volume
C        for anything so it should always be zero.

      double precision environment_volume

      logical losses, gains
      character ctype * 7, error_message * 80

C  ********************************************************************

C        Banner on entry into subroutine.

      if(level_coeffs .ge. 1) then
         write(out_unit, '(1x, a)') 'Subroutine coeffs!'
      end if

      if(level_coeffs .ge. 2) then
         write(out_unit, '(1x, a, i2)')
     &      'number_of_compartments = ', number_of_compartments
         write(out_unit, '(1x, a, i2)')
     &      'number_of_pathways     = ', number_of_pathways
      end if

C        Determine which compartment is the environmental compartment

      ecomp = 0
      do i = 1, number_of_compartments, 1
         if(compartment_type(I) .eq. 2) then
            ecomp = i
            exit
         end if
      end do


      if(level_coeffs .ge. 2) then
         write(out_unit, '(1x, a, i2)')
     &      'The environment compartment = ', ecomp
      end if

C        Save the present environment volume (should be zero). Set the
C        environment compartment volume to 1.0 m^3 so that the fout and 
C        filtin subroutines will fill the fltr_out and fltr_in arrays 
C        with the actual flow_rates instead of transport coeficients.

      environment_volume = compartment_volume(ecomp)
      compartment_volume(ecomp) = 1.0

C        Find the pathways that enter the environment
C        Determine the fraction of the exhaust compartment released


	do J = 1, number_of_pathways, 1
	   if (pathway_to(J) .eq.ecomp) then

	      kk = pathway_from(J)

c        exhaust path decontamination

            if (pathway_type(J) .eq. 1) then
	         CALL pipin (J, simtim, frac_out(1,J))
            else if (pathway_type(J) .eq. 2) then
	         CALL filtin (J, simtim, frac_out(1,J))
            else if (pathway_type(J) .eq. 3 .or. 
     &                             pathway_type(J) .eq. 6) then
	         CALL supin (kk,J, simtim, frac_out(1,J))
            else if (pathway_type(J) .eq. 4) then
	         CALL cin (J, simtim, frac_out(1,J))
            end if

            if (level_coeffs .ge. 2) then
	         write(out_unit, '(a,i2, a,i2, a,i2, a,1p5e20.10)')
     &           ' exhaust path ', exhaust_paths(N_Exhaust),
     &           ' pathway type ', pathway_type(J),
     &           ' from compartment ', kk,
     &           ' flow fraction ', (frac_out(k,J),k=1,maxtgrp)
            end if

	   end if
	end do


C       Determine the atmospheric dispersion, X/Q, for this time step.

      DO i = 1, Numb_XQ_Tables, 1
        xoq_now(i) = 0.0
        IF (location_xq_count(i) .gt.0) THEN
           xq = lupl2(I, simtim, location_xq_time, location_xq,
     &          location_xq_count(i))
	     xoq_now(i) = xq
        END IF
	END DO


C        Initialize the coefficient matrix.

      do i = 1, number_of_compartments, 1
         do ii = 1, number_of_compartments, 1
            do k = 1, MAXTGRP, 1
               coeff(i, ii, k) = 0.0
            end do
         end do
      end do

C  ********************************************************************
 
C        Calculate the loss and gain coefficients for each compartment.
C             Classic 500+ line do loop
C
C         Part A:  determine the coeff for the compartment losses (eg sprays)
C         Part B:  determine the coeff for the pathway losses (eg exhaust)
C         Part C:  determine the coeff for the pathway gains (eg in flow)


      COMPARTMENTS: do I = 1, number_of_compartments, 1

C  ********************************************************************

         if(level_coeffs .ge. 2) then
            write(out_unit, '(1x, 3a)')
     &         'Part A:    Calulating losses within ',
     &         trim(compartment_name(I)), ' compartment.'
         end if

C  ********************************************************************
C                             Part A:
C  ********************************************************************


C           Calculate the losses within compartment.

         losses = .false.

C           First clear out the compartment loss arrays.

         do k = 1, MAXTGRP, 1
            fltr_rem(k) = 0.0
            ndep_rem(k) = 0.0
            spry_rem(k) = 0.0
         end do

C           If a recirculation filter is used in the compartment then
C           CALL the recirc subroutine to calculate the coefficients.

         if(compartment_filters(I) .eq. 1) then

            losses = .true.
            CALL recirc(I, simtim, fltr_rem)

C              Write fltr_rem array returned from recirc subroutine.

            if(level_coeffs .ge. 3) then
               write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &            'fltr_rem(', I, ') =',
     &            (fltr_rem(k), k = 1, MAXTGRP, 1), ' 1/sec'
            end if

         end if

C           If natural deposition occurs in the compartment then
C           CALL the xntdep subroutine to calculate the coefficients.

         if(compartment_deposition(I) .eq. 1) then

            losses = .true.
            CALL xntdep(I, simtim, deltat, nstep, xngrp, ndep_rem)

            do k = 1, MAXTGRP, 1
               deposit_lambda(I,k) = ndep_rem(k)
            end do

C              Write ndep_rem array returned from xntdep subroutine.

            if(level_coeffs .ge. 3) then
               write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &            'ndep_rem(', I, ')    = ',
     &            (ndep_rem(k), k = 1, MAXTGRP, 1), ' 1/sec'
            end if

         end if

C           If sprays are used in the compartment then CALL the
C           spry subroutine to calculate the coefficients.

         if(compartment_sprays(I) .eq. 1) then

            losses = .true.
            CALL spry(I, simtim, nstep, deltat,xngrp, grrate,spry_rem)

C              Write spry_rem array returned from spry subroutine.
            if(level_coeffs .ge. 3) then
               write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &            'spry_rem(', I, ') =',
     &            (spry_rem(k), k = 1, MAXTGRP, 1), ' 1/sec'
            end if
C
C   Add spray lambda's to available output
CTJH
c
            do k = 1, MAXTGRP, 1
               deposit_lambda(I,k) = spry_rem(k)
            end do
         end if

C           Evaluate the on-diagonal elements of the coeff matrix
C           due to compartment removal mechanisms. Losses appear
C           as positive values.

         do k = 1, MAXTGRP, 1

            coeff(I, I, k) = fltr_rem(k) + ndep_rem(k) + spry_rem(k)


C              Will be used later for revolatilization.
            ctran(I, 1, k) = 0.0

            ctran(I, 2, k) = spry_rem(k)

C              Will be used later for overlying pools.
            ctran(I, 3, k) = 0.0

            ctran(I, 4, k) = ndep_rem(k)
            ctran(I, 5, k) = fltr_rem(k)

         end do

         if(level_coeffs .ge. 2) then
            write(out_unit, '(1x, a)') 'Coefficients, step A:'
            if(losses) then
               do k = 1, MAXTGRP, 1
                 if (coeff(I,i,k) .gt.0.0)     
     &             write(out_unit,'(1x, a, i2, a, i2,' //
     &               'a, i2, a,1pe16.7, a, a)')
     &               'coeff(', I, ', ', I, ', ', k, ') = ',
     &                coeff(I, I, k), ' 1/sec', 'loss'
               end do
            else
               write(out_unit, '(1x, a)')
     &            'No internal losses within this compartment.'
            end if
         end if


C  ********************************************************************
C                             Part B:
C  ********************************************************************


C           Calculate losses by way of pathways.

         if(level_coeffs .ge. 2) then
            write(out_unit, '(1x, a)')
     &        'Part B:  Calculating losses by way of pathways!'
         end if

         losses = .false.

C           Calculate the losses in the from compartment for each
C           pathway.

C           If the compartment is not an environment compartment
C           calculate the loss coefficients. The environment
C           has no losses

         if(i .ne. ecomp) then

            PATHWAY_LOSSES: do J = 1, number_of_pathways, 1

C                 If the pathway is from the present from compartment
C                 then calculate the loss rates.

               if(pathway_from(J) .eq. i) then

C                    First clear out any old values in the out
C                    flow arrays.

                  do k = 1, MAXTGRP, 1
                     pipe_out(k) = 0.0
                     fltr_out(k) = 0.0
                     supp_out(k) = 0.0
                     leak_out(k) = 0.0
                  end do

C                    Flow from compartment via piping.

                  if(pathway_type(J) .eq. 1) then
                     losses = .true.
                     CALL pipout(I, J, simtim, pipe_out)

C                    Write pipe_out array returned from pipout subroutine.
C                    
                     if(level_coeffs .ge. 3) then
                        write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                     'pipe_out(', I, ') =',
     &                     (pipe_out(k), k = 1, MAXTGRP, 1), ' 1/sec'
                     end if

C                    Flow from compartment via filter.

                  else if(pathway_type(J) .eq. 2) then

                     losses = .true.
                     CALL fout(I, J, simtim, fltr_out)

C                    Write fltr_out array returned from fout subroutine.
C                    
                     if(level_coeffs .ge. 3) then
                        write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                     'fltr_out(', I, ') =',
     &                     (fltr_out(k), k = 1, MAXTGRP, 1), ' 1/sec'
                     end if

C                    Flow from compartment via generic.

                  else if(pathway_type(J) .eq. 3 .or. 
     &                                  pathway_type(J) .eq. 6) then

                     losses = .true.
                     CALL supout(I, J, simtim, supp_out)

C                    Write supp_out array returned from supout subroutine.
C                    
                     if(level_coeffs .ge. 3) then
                        write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                     'supp_out(', I, ') =',
     &                     (supp_out(k), k = 1, MAXTGRP, 1), ' 1/sec'
                     end if

C                    Flow from compartment via air leakage.

                  else if(pathway_type(J) .eq. 4) then
                     losses = .true.
                     CALL cout(I, J, simtim, leak_out)

C                    Write leak_out array returned from cout subroutine.
C                    
                     if(level_coeffs .ge. 3) then
                        write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                     'leak_out(', I, ') =',
     &                     (leak_out(k), k = 1, MAXTGRP, 1), ' 1/sec'
                     end if

C                    The pathway type must be invalid.

                  else

                     write(error_message, '(1x, 3a, i2)')
     &                  'pathway ', trim(pathway_name(I)),
     &                  'has an invalid pathyway type = ',
     &                   pathway_type(J)

C                    CALL message(error_message)
                     write(out_unit, '(a)') error_message

                  end if

C                    Evaluate additional on-diagonal elements of coeff
C                    matrix due to loss by way of pathways.

                  do k = 1, MAXTGRP, 1

C                    Losses appear as positive values.

                     coeff(I, I, k) = coeff(I, I, k) +
     &                  pipe_out(k) + fltr_out(k) +
     &                  supp_out(k) + leak_out(k)
                   end do

               end if

            end do PATHWAY_LOSSES

            if(level_coeffs .ge. 3) then
               write(out_unit, '(1x, a)') 'Coefficients, step B:'
               if(losses) then
	            do k = 1, MAXTGRP, 1
                     if(coeff(I, I, k) .ne. 0.0) then
                        write(out_unit,'(1x, a, i2, a, i2,' //
     &                  'a, i2, a,1pe16.7, a, a)')
     &                     'coeff(', I, ',', I, ',', k, ') = ',
     &                     coeff(I, I, k), ' 1/sec', 'loss'
                     end if
                  end do
               else
                  write(out_unit, '(1x, a)')
     &               'No pathway losses from this compartment.'
               end if
            end if

         end if


C  ********************************************************************
C                             Part C:
C  ********************************************************************



C           Gains by way of pathways.

         gains = .false.

         if(level_coeffs .ge. 2) then
            write(out_unit,'(1x, a)') 
     &         'Part C:  Gains by way of pathways!'
         end if

C           Initialize the pathway flow to present compartment
C           counter/plist_to array index.

         flow_to = 0

C           Determine all of the pathways that flow to the present
C           compartment.

         do j = 1, number_of_pathways, 1

C              If the pathway flows to the current compartment then
C              increment the flow_to counter and store the index of the
C              pathway in the plist_to array.

            if(pathway_to(j) .eq. i) then
               flow_to = flow_to + 1
               plist_to(flow_to) = j
            end if

         end do

         if(level_coeffs .ge. 2) then
            if(flow_to .lt. 1) then
               write(out_unit, '(1x, a)')
     &            'No pathways flow to this compartment!'
            else
               write(out_unit, '(1x, a)')
     &            'The following pathways flow to this ' //
     &               'compartment:'
               do j = 1, flow_to, 1
                  write(out_unit, '(1x, 4a)') 'The ',
     &               trim(pathway_name(plist_to(j))),
     &              ' flows into compartment ',
     &               trim(compartment_name(I))
               end do
            end if
         end if


C           Determine the coefficients for all pathway gains.

         PATHWAY_GAINS: do J = 1, flow_to, 1

C              Set path_to to the Jth path entering the present
C              compartment.

            path_to = plist_to(J)

C              Set comp_to to the compartment index of the present compartment

            comp_to = pathway_to(path_to)

C              Set comp_from to the compartment index of the compartment
C              that is feeding the present compartment.

            comp_from = pathway_from(path_to)

C              Evaluate the off diagonal elements of the coeff matrix
C              These represent the gains to the compartment from outside
C              Gains appear as negative values in the matrix


C                 First clear out any old values in the out flow arrays.

               do k = 1, MAXTGRP, 1
                  pipe_in(k) = 0.0
                  fltr_in(k) = 0.0
                  supp_in(k) = 0.0
                  leak_in(k) = 0.0
               end do
c
C                 If the pathway flowing into the present compartment is
C                 a pipe then CALL the pipin subroutine to calculate
C                 the coefficients.

               if(pathway_type(path_to) .eq. 1) then

                  gains = .true.
                  CALL pipin(path_to, simtim, pipe_in)

C                    Write pipe_in array returned from pipin
C                    subroutine.
                  if(level_coeffs .ge. 3) then
                     write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                  'pipe_in(', I, ') =',
     &                  (pipe_in(k), k = 1, MAXTGRP, 1), ' 1/sec'
                  end if
	
               end if

C                 If the pathway flowing into the present compartment is
C                 a filter then CALL the filtin subroutine to calculate
C                 the coefficients.
C
C*************************
C
C     filter failure???????
C
C*************************
C
	         if(pathway_type(path_to) .eq. 2) THEN
                  gains = .true.

                  CALL filtin(path_to, simtim, fltr_in)

C               Write arrays returned from filtin subroutine.
C                    
                  if(level_coeffs .ge. 3) then
                     write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                  'fltr_in(', I, ') =',
     &                  (fltr_in(k), k = 1, MAXTGRP, 1), ' 1/sec'
                     write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                  'ptran(', path_to, ') =',
     &                 (ptran(path_to,2,k), k = 1, MAXTGRP, 1), ' 1/sec'
                  end if

C
C               Inflow to compartment I from the environment
C               Adjust coeffs array for all exhaust paths
C
                  if (compartment_type(comp_from) .eq. 2) then

	               do jj = 1, N_Exhaust, 1
                        jpath = exhaust_paths(jj)
	                  nxq = path_xq_table(jpath,path_to)
	                  kk = pathway_from(jpath)
	                  if (nxq .gt. 0) then
                           do k = 1, MAXTGRP, 1
                             transport_eff(k,path_to) = fltr_in(k)                           
                             coeff(I,kk,k) = coeff(I,kk,k) -
     &                        fltr_in(k)*xoq_now(nxq)*frac_out(k,jpath)
                           end do
                      

                           IF (level_coeffs .ge. 3) THEN
                             write(out_unit, '(1x, a,4i3,1pe12.5)')
     &                         ' jj, jpath, nxq, kk, xoq(nxq) = ',
     &                         jj, jpath, nxq, kk, xoq_now(nxq) 
                             write(out_unit, '(1x, a,i2, a,i2, a,
     &                          1p5e20.10, a)') 'coeff(', I,',
     &                          ',pathway_from(jpath), ') =',
     &                          (coeff(I,pathway_from(jpath),k), k = 1,
     &                          MAXTGRP, 1), ' 1/sec'
                           END IF

                        end if
                     end do

C                Control Room Exhaust type = 1 or 5 (Capture everything)

                  else 
	               IIII= mod(compartment_type(comp_from),4)
				   if (compartment_type(comp_to) .eq. 2) then
                       if (IIII .eq. 1) then

                          do k = 1, MAXTGRP, 1                   
                             ptran(path_to,2,k) = fltr_in(1)
                          end do
                          do k = 1, MAXTGRP, 1                   
                             fltr_in(k) = 0.0
                             transport_eff(k,path_to) = 0.0
                          end do
                       end if
                     end if

                  
C                 Normal Filtered Inflow
               
	               do k = 1, MAXTGRP, 1                   
	                  coeff(I,comp_from,k) = coeff(I,comp_from,k) -
     &                                         fltr_in(k)
	                  transport_eff(k,path_to) = fltr_in(k)
	               end do

                  end if
               end if



C                 If the pathway flowing into the present compartment is
C                 a suppression pool then CALL the supp_in subroutine to
C                 calculate the coefficients.

               if(pathway_type(path_to) .eq. 3 .or. 
     &                               pathway_type(path_to) .eq. 6) then

                  gains = .true.
                  CALL supin(comp_from, path_to, simtim, supp_in)

C                    Write supp_in array returned from supin subroutine.
                  if(level_coeffs .ge. 3) then
                     write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &               'supp_in(', I, ') =',
     &               (supp_in(k), k = 1, MAXTGRP, 1), ' 1/sec'
                  end if

               end if

C                 If the pathway flowing into the present compartment is
C                 air leakage then CALL the cin subroutine to calculate
C                 the coefficients.

               if(pathway_type(path_to) .eq. 4) then

                  gains = .true.
                  CALL cin(path_to, simtim, leak_in)

C                    Write leak_in array returned from cin subroutine.
                  if(level_coeffs .ge. 3) then
                     write(out_unit, '(1x, a, i2, a,1p5e20.10, a)')
     &                  'leak_in(', I, ') =',
     &                  (leak_in(k), k = 1, MAXTGRP, 1), ' 1/sec'
                  end if
	
               end if


C                    Evaluate the other off-diagonal elements of coeff 
C                    matrix.  These represent gains to the compartment. 
C                    Gains appear as negative values.

               if (pathway_type(path_to) .ne.2) then
                  do k = 1, MAXTGRP, 1
                     coeff(I, comp_from, k) = coeff(I, comp_from, k) -
     &                   pipe_in(k) - supp_in(k) - leak_in(k)
                     transport_eff(K,path_to) =  
     &                   transport_eff(K,path_to) + pipe_in(k) +
     &                   supp_in(k) + leak_in(k)
                  end do
	         end if

         end do PATHWAY_GAINS

         if(level_coeffs .ge. 3) then
            write(out_unit, '(1x, a)') 'Coefficients, Part C:'
            if(gains) then
               do ii = 1, number_of_compartments, 1
                  do k = 1, MAXTGRP, 1
                     if(i .ne. ii) then
                        if(coeff(I, ii, k) .gt. 0.0) then
                           ctype = ' loss'
                        else if(coeff(I, ii, k) .eq. 0.0) then
                           ctype = ' null'
                        else if(coeff(I, ii, k) .lt. 0.0) then
                           ctype = ' gain'
                        end if
                        if(coeff(I, ii, k) .ne. 0.0) then
                           write(out_unit,
     &                        '(1x, a, i2, a, i2,' //
     &                        'a, i2, a,1pe16.7, a, a)')
     &                        'coeff(', I, ',',ii, ',', k, ') = ',
     &                         coeff(I, ii, k),' 1/sec', trim(ctype)
                        end if
                     end if
                  end do
               end do
            else
               write(out_unit, '(1x, a)')
     &            'No pathway gains into this compartment.'
            end if
         end if

C     *************************************************************


      end do COMPARTMENTS


C     *************************************************************
C        
C                FINAL COEFFS edit
C
      if(level_coeffs .ge. 3) then
         write(out_unit, '(1x, a)') 'Coefficients, Final Edit:'
          do i = 1, number_of_compartments, 1          
            do ii = 1, number_of_compartments, 1
                do k = 1, MAXTGRP, 1
                  if(coeff(I, ii, k) .gt. 0.0) then
                     ctype = ' loss'
                  else if(coeff(I, ii, k) .eq. 0.0) then
                     ctype = ' null'
                  else if(coeff(I, ii, k) .lt. 0.0) then
                     ctype = ' gain'
                  end if
                  if(coeff(I, ii, k) .ne. 0.0) then
                     write(out_unit,
     &                  '(1x, a, i2, a, i2,' //
     &                  'a, i2, a,1pe16.7, a, a)')
     &                  'coeff(', I, ',',ii, ',', k, ') = ',
     &                   coeff(I, ii, k),' 1/sec', trim(ctype)
                  end if
               end do
            end do
         end do
      end if


      return

      end

C     ------------------------------------------------------------------
