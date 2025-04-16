C     ------------------------------------------------------------------
C     
C     Subroutine:  radcalc
C     
C     ------------------------------------------------------------------
C     
C     Author(s): 
C
C     David Monroe
C     Steven Humphreys
C     Ken Washington
C     Nathan Bixler
C     Sandia National Laboratories
C     (505) 845-3144
C
C     Terry Heames
C     ALION/ITSO
C     (505) 872-1089   
C     
C     
C     Description: The RADionuclide Transport, Removal, And Dose code
C     (RADTRAD) calculates doses to receptors having
C     locations defined by the user. Locations may be at
C     the site boundary, in the low-population zone, and
C     in the control room.
C     
C     RADTRAD assumes a single-source compartment. Default
C     source terms are for BWRs and PWRs, described in
C     NUREG-1465. Material is transported through the
C     containment building, as well as through other
C     buildings.
C     
C     Credit is taken for removal mechanisms. Containment
C     sprays may remove aerosols, elemental iodine, and
C     organic iodine. The flow between buildings or rooms
C     may be through HEPA filters or a suppression pool.
C     Leakage to the environment may occur.
C     
C     Decay and ingrowth of daughters is calculated as the
C     material is transported to the environment, although
C     decay is no longer considered after the material is
C     released to the environment. Simple models are
C     available for these different removal mechanisms, or,
C     the user may elect to input time-dependent values for
C     the removal coefficients.
C     
C     Usage:       call radcalc
C     
C     Inputs:      common blocks defined in full.com
C     
C     Outputs:     common blocks defined in full.com
C     
C     Variables:
C     
C     Calls:       rdflag
C     initall
C     necsteps
C     source
C     coeffs
C     sourcep
C     invmat
C     coenum
C     zerodn
C     resader
C     xnupdt
C     dkngro
C     doses
C     printout
C     
C     
C     A completely and correctly defined plant model and
C     scenario description loaded before calling radcalc
C     (i.e. pressing the calculate button.) radcalc does
C     some error checking but not an extensive amount. In
C     nearly all cases where an error is discovered a
C     message is printed out to the output file, a message
C     is also sometimes printed at the bottom of the
C     screen, and then the program stops. Sometimes there
C     will be a traceback printed on the screen.
C     
C     Version:     3.10
C     
C     Date:        May 2005
C     
C     Revision
C     History:     3.6 - December 8, 1997 - removed call to opflag.
C     These flags are now printed out if the level_rdflag
C     flag is set to 3 or greater in the rdflag subroutine.
C     
C     3.5 - July 15, 1996 - modified to make compatible
C     with command line execution.
C     
C     3.4 - March 12, 1996 - deleted the eff_vol call which
C     is no longer needed to estimate the derivative of the
C     release into the environment. Instead the
C     contribution to the control room resulting from paths
C     going through the environment is taken care of in the
C     coeffs subroutine.
C     
C     3.3 - March 7, 1996 - made the on_event (previously
C     onzone) and on_step (previously onstep) variables
C     global. They are declared in the simulate.h include
C     file.
C     
C     3.2 - January 31, 1996 - changed solver variables to
C     double precision.
C     
C     3.1 - January 28, 1996 - seprated the subroutines
C     autodt, tshift, and zrinv from the radcalc subroutine
C     file. Moved all normal output to the output
C     subroutine.
C     
C     3.0 - January 6, 1996 - implemented architecture fix
C     for storing only two time results auto time step is
C     calculated throughout the run on 1/6/95 successful
C     test with exact match to baseline including a test
C     where subcycle steps were forced.
C     
C     2.0 - November, 1, 1995 - added the calcuations to
C     determine the contribution factors used to update the
C     nuclide invnetory.
C     
C     1.3 - October 19, 1995 - added the code and include
C     file statements to calculate inventory in filters and
C     pipes. Code not completed or tested yet.
C     
C     1.2 - August 29, 1995 - added the modifications
C     necessary to implement the brockman/bixler pipe code.
C     
C     1.1 - May 23, 1995 - added call and modified code to
C     use next available file unit.
C     
C     1.0 - December 16, 1994 - Initial version.
C     
C     ------------------------------------------------------------------

      subroutine radcalc(mode,error_code,error_message, inp_out)
      character * 4 mode
      integer error_code
      character * (*) error_message

      include 'full.com'

      integer numsteps, nstep

C     engine_number = 2  -->  ASH solver from K. Washington

      integer i, j

C     Contribution factors used to update the nuclide inventory.

      double precision source_cf(MAXTGRP, MAXCOMP, MAXCOMP)
      double precision inventory_cf(MAXTGRP, MAXCOMP, MAXCOMP)

      integer ic, icmp, ipth, iloc, itg, inuc, irow, ii
      integer jc, jcmp, jcol, jtg, jj
      integer kk, ktg
      integer nn
      integer ncycle

      double precision xngdot(MAXCOMP)
      double precision xngbeg(MAXCOMP)
      double precision sysmtx(MAXCOMP, MAXCOMP)
      double precision coeff(MAXCOMP, MAXCOMP, MAXTGRP)

      double precision xn(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision path(MAXNUC, MAXPATH, MAXSTEP+1)
      double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision pthgrp(MAXTGRP, MAXPATH, MAXSTEP+1)
      double precision xngrp_total(MAXCLOC), pthgrp_total
      double precision simtim, deltat(MAXSTEP)

C     Changed MAXNUC to include 1 extra nuclide to contain non-
C     radioactive aerosol inventory. Changed all occurences of
C     MAXNUC + 1 to MAXNUC to reflect this change.

      double precision rrate(MAXNUC, MAXCOMP)
      double precision grrate(MAXCOMP, MAXTGRP)

C     kew
C     Dimension the time zone holder
C     and add a few new variables.

      double precision minstep(MAXZONE), endtim, dt_new

C     kew
C     Define a variable for determining if we are on a print zone.

      double precision dose_wbod(MAXDOSE, MAXSTEP)
      double precision dose_skin(MAXDOSE, MAXSTEP)
      double precision dose_thyr(MAXDOSE, MAXSTEP)
      double precision dose_tede(MAXDOSE, MAXSTEP)
      double precision accd_wbod(MAXDOSE)
      double precision accd_skin(MAXDOSE)
      double precision accd_thyr(MAXDOSE)
      double precision accd_tede(MAXDOSE)

C     Code added by TJH October 19, 1995.
C++

C++
C     Lines previously from cptran.inc. The other files that
C     previously included this file, also now contain these lines.

C     transport groups removed from compartment atmospheres
C     and deposited into other compartment sub-locations
C     assignments for ctran (compartments):

C     ctran(comp,1,tg)     not defined      atmosphere, revol'n
C     ctran(comp,2,tg)     sprays           comp sump
C     ctran(comp,3,tg)     not defined      comp opool
C     ctran(comp,4,tg)     nat dep          dep surfaces
C     ctran(comp,5,tg)     recirc filter    comp filter

C     transport groups deposited in pathways
C     assignments for ptran (pathways):

C     ptran(path,1,tg)     pipe loss        pipe walls
C     ptran(path,2,tg)     filter loss      pathway filters
C     ptran(path,3,tg)     s-pool loss      s-pool
C     ptran(path,4,tg)     nat convect      no accumulation
C     ptran(path,5,tg)     not defined      -----------

C     TJH     Code added by TJH on 19 October 1995.

      double precision ctran(MAXCOMP, MAXCLOC, MAXTGRP)
      double precision ptran(MAXPATH, MAXPLOC, MAXTGRP)
      double precision frac_out(MAXTGRP,MAXPATH)
	double precision xoq_now(MAX_XQS)

      common / cptran / ctran, ptran, frac_out, xoq_now

C     included into following subroutines
C     radcalc             sourcep             coeffs
C     filtin              pipin               supin
C     xnupdt


C     add transport effectivenss to the output (1/01)

      double precision transport_eff(MAXTGRP,MAXPATH)

C     NEB     Code added by NEB on 9 September 1998.
C     Parameters used for Runge-Kutta or Gear time integrator

      integer icomp
      integer nrkf

      common /rhsc/ sysmtx, xngdot

C     NEB     Code added by NEB on 18 September 1998.
C     Parameters used for Ash time integrator

      double precision bwork(MAXCOMP,MAXCOMP)
      double precision cwork(MAXCOMP,MAXCOMP)
      double precision dwork(MAXCOMP,MAXCOMP)
      double precision esoln(MAXCOMP,MAXCOMP)
      double precision fsoln(MAXCOMP,MAXCOMP)
      double precision xng(MAXCOMP)
      double precision s_times(2)
      integer sv_flag, nsoln, neps, mmax, iprint
      data sv_flag/1/, neps/6/, mmax/20/, iprint/0/
      parameter (nsoln = 2)



C     Read debug output control flag for each subroutine.
C
      call rdflag
C
C     Call initialization subroutine to read data files.
C
      call initall (error_code, inp_out)     
      if (error_code .ne. 0) return
C
C     Edit the input
C
      write(out_unit, '()')
c      call print_header(1)
      if (show_plant .eq. 1) then
         write (out_unit, '(a)') char(12)
         call print_header(2)
         call print_psf()
      endif

      if (show_scenario .eq. 1) then
         write (out_unit, '(a)') char(12)
         call print_header(2)
         call print_sdf()
      endif

C     Write banner announcing entry into radcalc.
      
      if(level_radcalc .ge. 1) then
         write(out_unit, '(1x, a)') 'Subroutine radcalc!'
      end if

C     Initialize dose arrays so that multiple runs of RADTRAD can
C     be performed.

      nrkf = number_of_compartments
      do i = 1, MAXDOSE, 1
         accd_wbod(i) = 0.0
         accd_skin(i) = 0.0
         accd_thyr(i) = 0.0
         accd_tede(i) = 0.0
         do j = 1, MAXSTEP, 1
            dose_wbod(i, j) = 0.0
            dose_skin(i, j) = 0.0
            dose_thyr(i, j) = 0.0
            dose_tede(i, j) = 0.0
         end do
      end do

C     Find time steps necessary to capture changes in input.

      call necsteps(numsteps, minstep)
      
C     Initialize primary loop.

C     Initialize the new simulation time variables and get the first
C     calculational time step.

      nstep = 1
      ncycle = 1
      simtim = 0.0
      dt_new = 0.0
      endtim = minstep(numsteps)

      call autodt(numsteps, minstep, simtim, dt_new)
      

      deltat(nstep) = dt_new

C     Initialize xngrp, gamma_beta

      do ii = 1, MAXTGRP, 1
         do jj = 1, MAXCOMP, 1
	      if (ii.eq.1) then
	         do kk = 1, MAXNUC, 1
	            gamma_beta(kk,jj) = 0.0
	         end do
            end if
            do kk = 1, MAXCLOC, 1
               do nn = 1, MAXSTEP, 1
                  xngrp(ii, jj, kk, nn) = 0.0
               end do
            end do
         end do
      end do

C     Initialize pthgrp, gamma_beta_p, path.

      do ii = 1, MAXTGRP, 1
         do jj = 1, MAXPATH, 1
            do kk = 1, MAXSTEP, 1
               pthgrp(ii, jj, kk) = 0.0
            end do
         end do
      end do
      DO II= 1, MAXNUC, 1
        DO JJ = 1, MAXPATH, 1
           gamma_beta_p(II,JJ) = 0.0d0
           DO KK = 1, MAXSTEP+1, 1
              path(II, JJ, KK) = 0.0d0
           END DO
        END DO
      END DO

C     Initialize overlying pool transport group and nuclide
C     inventories.

      do i = 1, MAXSTEP, 1
         do j = 1, MAXTGRP, 1
            op_grp_inv(j, i) = 0.0
         end do
         do j = 1, MAXNUC, 1
            op_nuc_inv(j, i) = 0.0
         end do
      end do

C     Top of primary calculation loop. Exit the primary loop if the
C     end time of the simulation has been reached or we've exceeded
C     then maximum number of time steps. (Don't know how to check for
C     the latter yet but it is a good idea to help prevent an
C     infinite loop in case something goes wrong with simtim or
C     endtim.

      primary_loop: do while(simtim .lt. endtim)

C     kew
C     Initialize the time constants for this time step
C     to something big so they wont be used unless needed.

      do jj = 1, maxcomp, 1
         time_constant(jj) = 1.0e20
      end do

C     Select value of simulation time, sec.

C     simtim = minstep(nstep)

C     kew
C     No longer do this here since we will select simtim
C     for the next step at the end of this step based on
C     the automatic time step.

C     Added by TJH October 19, 1995.
C     Initialize ctran, ptran AND TRANSPORT_EFF

      do ii = 1, MAXCOMP, 1
         do jj = 1, MAXCLOC, 1
            do kk = 1, MAXTGRP, 1
               ctran(ii, jj, kk) = 0.0
            end do
         end do
      end do

      do ii = 1, MAXPATH, 1
         do jj = 1, MAXPLOC, 1
            do kk = 1, MAXTGRP, 1
               ptran(ii, jj, kk) = 0.0
            end do
         end do
      end do

      do ii = 1, MAXTGRP, 1
         do jj = 1, MAXPATH, 1
            TRANSPORT_EFF(ii, jj) = 0.0
         end do
      end do

C     Calculate sources into each compartment.

      call source(simtim, nstep, deltat, xn, xngrp, path, pthgrp,
     &     rrate, grrate)

C     Values returned: rrate(MAXNUC,MAXCOMP)
C     grrate(MAXCOMP, MAXTGRP)
C     path(MAXNUC, MAXPATH, MAXSTEP+1)

      if(level_radcalc .ge. 2) then
         write(out_unit, '(1x, a)')
     &        'Group release rates (sources) = '
         do icmp = 1, number_of_compartments, 1
            write(out_unit, '(1x, 5e15.8)')
     &           (grrate(icmp, jtg), jtg = 1, MAXTGRP, 1)
         end do
      end if

C     Calculate the coefficients for the transport and removal of
C     the following four transport groups:
C     1. Noble gases,
C     2. Elemental halogens,
C     3. Organic halogens,
C     4. Halogen aerosols,
C     5. All Aerosols (includes halogens).

      call coeffs(simtim, nstep, deltat, xngrp, grrate, coeff,
     &            transport_eff )
      
C     Values returned: coeff(n,n,tg), xoq_now(loc), frac_out(group,path)
C      n = number_of_compartments.

C     Write transport-and-removal coefficient matrices

      if(level_radcalc .ge. 3) then
         write(out_unit, '(1x, a)') 'Results of call to coeffs:'
         do icmp = 1, number_of_compartments, 1
            do jcmp = 1, number_of_compartments, 1
               write(out_unit, '(1x, a, i2, a, i2, a, 5e15.8)')
     &              'coeff(', icmp, ', ', jcmp, ') = ',
     &              (coeff(icmp, jcmp, ktg), ktg = 1, MAXTGRP, 1)
            end do
         end do
      end if

C     At this point in time (January 28, 1996) it appears that the
C     sourcep subroutine doesn't really do anything in the absence
C     of the MSIV pipe model. Therefore this part of the code is
C     completely commented out for the time being. It appears that
C     it's original purpose was to calculate the release rate of
C     a pipe's resuspended iodine into the connected destination
C     compartment. It is unclear to me whether or not this
C     routine, if is used again, should be before the above call
C     to coeffs.

C     Calculate sources due to flow from pipes into compartments.
C     
C     call sourcep(simtim, nstep, deltat, grrate)
C     
C     Values returned: grrate(compartment, transport_group)
C     
C     if(level_radcalc .ge. 2) then
C     write(out_unit, '(1x, a)')
C     &            'Group release rates (sourcep) = '
C     do icmp = 1, number_of_compartments, 1
C     write(out_unit, '(1x, 4e15.8)')
C     &               (grrate(icmp, jtg), jtg = 1, MAXTGRP)
C     end do
C     end if

C     Begin the loop over the 5 transport groups.

      transport_groups: do itg = 1, maxtgrp, 1

C     Write the number and name of transport group.

      if(level_radcalc .ge. 2) then
         write(out_unit, '(1x, a)')
     &        '====================================='
         if(itg .eq. 1) then
            write(out_unit, '(1x, a, i1, a)')
     &           'Transport group ', itg, ', Noble gases'
         else if(itg .eq. 2) then
            write(out_unit, '(1x, a, i1, a)')
     &           'Transport group ', itg, ', Elemental Halogens'
         else if(itg .eq. 3) then
            write(out_unit, '(1x, a, i1, a)')
     &           'Transport group ', itg, ', Organic Halogens'
         else if(itg .eq. 4) then
            write(out_unit, '(1x, a, i1, a)')
     &           'Transport group ', itg, ', Halogen Aerosols'
         else if(itg .eq. 5) then
            write(out_unit, '(1x, a, i1, a)')
     &           'Transport group ', itg, ', All Aerosols'
         else
            write(out_unit, '(1x, a, i1, a)')
     &           'Transport group ', itg, ', Undefined'
         end if
         write(out_unit, '(1x, a)')
     &        '====================================='
      end if

C     Load coefficient matrix for current transport group.

      do irow = 1, MAXCOMP, 1
         do jcol = 1, MAXCOMP, 1
            if(irow .le. number_of_compartments) then
               if(jcol .le. number_of_compartments) then
C     Change of sign due to change in inversion
C     algorithm
                  sysmtx(irow, jcol) = -coeff(irow, jcol, itg)
               else
                  sysmtx(irow, jcol) = 0.0
               end if
            end if
         end do
      end do

C     Write system matrix components.

      if(level_radcalc .ge. 3) then
         write(out_unit, '(1x, a)')
     &        'System matrix coefficients ='
         do ic = 1, number_of_compartments, 1
            write(out_unit, '(1x, 1p7e12.4)')
     &         (sysmtx(ic, jc), jc = 1,number_of_compartments, 1)
         end do
      end if


C     Values passed: sysmtx(n, n),
C     where n = number_of_compartments.
      
C     Note: at this point in time n actualy equal MAXCOMP and
C     the inverse is solved for a MAXCOMP X MAXCOMP matrix.
C     I don't know if this affects the results but it certainly
C     affects the execution speed.
      
      s_times(2) = deltat(nstep)
      call SOLVER(sysmtx,bwork,cwork,dwork,esoln,fsoln,
     &     MAXCOMP,number_of_compartments,sv_flag,s_times,
     &     nsoln,neps,mmax,iprint)

      if(level_radcalc .ge. 3) then
        write (out_unit, *) 'components of esoln with deltat',
     &               deltat(nstep)
        do irow = 1,number_of_compartments,1
            write(out_unit, '(1x, 1p7e12.4)' )
     &        (esoln(irow,jcol),jcol = 1,number_of_compartments,1)
        end do
        write (out_unit, *) 'components of fsoln'
        do irow = 1,number_of_compartments,1
            write(out_unit, '(1x, 1p7e12.4)' )
     &        (fsoln(irow,jcol),jcol = 1,number_of_compartments,1)
        end do
      END IF
      
C     Values returned: pcoeff(0:n)
C     qcoeff(0:n-1, n, n)
      

C     Calculate the contribution factors from each
C     compartment's source term and inventory to each
C     compartment's inventory at the end of the time step.
C     These contributions will then be used by XNUPDT to update
C     the nuclide inventories in each compartment. This method
C     is an exact solution based on the fact that our source
C     terms are constant functions and that our differential
C     equations are linear. If our source terms become more
C     complex then we may need to calculate more contribution
C     factors to determine the source term's effect on
C     compartment inventories. Right now we are calculating 2
C     contribution factors for each compartment. The first one
C     is for calculating the contribution of compartment N's
C     inventory at time n-1 to all of the compartments during
C     time n. The second factor is used to calculate the same
C     for compartment N's source term. 

C     I'll have to loop through this for each compartment.
C     There are more efficient ways to do this but right now
C     I'm just trying to prove the concept in a minimum amount
C     of development time (one night instead of 4 months).
C     This method enables me to use the routines below without
C     modification.


C     Initialize XNGRP for this time step and initialize the
C     contribution factor arrays.

      do i = 1, number_of_compartments, 1
         xngrp(itg, i, 1, nstep) = 0.0
         do j = 1, number_of_compartments, 1
            source_cf(itg, i, j) = 0.0
            inventory_cf(itg, i, j) = 0.0
         end do
      end do

C     Calculate the contribution from each compartment's
C     inventory to every other compartment for the current
C     transport group.

      do icmp = 1, number_of_compartments, 1

C     Initialize present inventories and source term rates
C     to 0.0 except for the present compartment. The present
C     compartment inventory will be set to 1.0 to calculate
C     its inventory contribution factors.

         do i = 1, number_of_compartments, 1
            xngbeg(i) = 0.0
            xngdot(i) = 0.0
         end do
         xngbeg(icmp) = 1.0

         if(level_radcalc .ge. 4) then
            write(out_unit, '(1x, a)')
     &           'Inventory Contribution Factors - ' //
     &           'Initial Values:'
            write(out_unit, '(10(e15.8))')
     &           (xngbeg(i), i = 1, number_of_compartments)
            write(out_unit, '(1x, a)')
     &           'Source Term Contribution Factors - ' //
     &           'Initial Values:'
            write(out_unit, '(10(e15.8))')
     &           (xngdot(i), i = 1, number_of_compartments)
         end if

         call MVMUL2(esoln,fsoln,xngbeg,xngdot,xng,1,
     &        MAXCOMP,number_of_compartments,1)
         do icomp = 1, number_of_compartments, 1
            xngrp(itg, icomp, 1, nstep) = xng(icomp)
         end do
         
C     Return with inventory contribution factors stored 
C     in xngrp(itg, icmp, kloc, nstep) where kloc = 1 = 
C     the compartment atmosphere.

C     Okay, I know it's somewhat dangerous to use XNGRP 
C     for this purpose since it is the array that is used 
C     to contain our solution. I think that this should 
C     be alright though since the value of XNGRP for time 
C     n is calculated based on its value at time n-1. As 
C     long as we initialize it after each use and use it 
C     for its original intended purpose after these 
C     calculations, then we should be okay in terms of the 
C     solution and stuff we print out. The down side to 
C     using another variable right now is that XNGRP is 
C     HUGE and I really don't want to create another array 
C     of its size and I'm not about to modify the RESADER 
C     subroutine.

C     Move the inventory contribution factors into the array
C     to be passed to XNUPDT and reinitialize XNGRP for this
C     time step.

         do i = 1, number_of_compartments, 1
            inventory_cf(itg, i, icmp) =
     &           xngrp(itg, i, 1, nstep)
            xngrp(itg, i, 1, nstep) = 0.0
         end do

         if(level_radcalc .ge. 4) then
            write(out_unit, '(1x, a, i2, a)')
     &           'Inventory Contribution Factors ' //
     &           'From Compartment ', icmp, ':'
            do i = 1, number_of_compartments, 1
               write(out_unit, '(1x, a, 3(i2, a), e15.8)')
     &              'inventory_cf(', itg, ', ', i, ' ,',
     &              icmp, ') = ', inventory_cf(itg, i, icmp)
            end do
         end if

C     Now do the same thing except do it for the source
C     terms. Initialize present inventories and source term
C     rates to 0.0 except for the present compartment. The
C     present compartment source term will be set to 1.0 to
C     calculate its source term contribution factors.

         do i = 1, number_of_compartments, 1
            xngbeg(i) = 0.0
            xngdot(i) = 0.0
         end do
         xngdot(icmp) = 1.0

         if(level_radcalc .ge. 4) then
            write(out_unit, '(1x, a)')
     &           'Inventory Contribution Factors - ' //
     &           'Initial Values:'
            write(out_unit, '(10(e15.8))')
     &           (xngbeg(i), i = 1, number_of_compartments)
            write(out_unit, '(1x, a)')
     &           'Source Term Contribution Factors - ' //
     &           'Initial Values:'
            write(out_unit, '(10(e15.8))')
     &           (xngdot(i), i = 1, number_of_compartments)
         end if
c
c     performs xng = esoln*xngbeg + fsoln*xngdot
c
         call MVMUL2(esoln,fsoln,xngbeg,xngdot,xng,1,
     &        MAXCOMP,number_of_compartments,1)
         do icomp = 1, number_of_compartments, 1
            xngrp(itg, icomp, 1, nstep) = xng(icomp)
         end do
         
C     Return with source term contribution factors stored in
C     xngrp(itg, icmp, kloc, nstep) where kloc = 1 = the
C     compartment atmosphere.
         
C     Warning, Warning, Danger, Danger - see note on XNGRP
C     use above.
         
C     Move the source term contribution factors into the
C     array to be passed to XNUPDT and reinitialize XNGRP
C     for this time step.
         
         do i = 1, number_of_compartments, 1
            source_cf(itg, i, icmp) = xngrp(itg, i, 1, nstep)
            xngrp(itg, i, 1, nstep) = 0.0
         end do
         
         if(level_radcalc .ge. 4) then
            write(out_unit, '(1x, a, i2, a)')
     &           'Source Term Contribution Factors ' //
     &           'From Compartment ', icmp, ':'
            do i = 1, number_of_compartments, 1
               write(out_unit, '(1x, a, 3(i2, a), e15.8)')
     &              'source_cf(', itg, ', ', i, ' ,',
     &              icmp, ') = ', source_cf(itg, i, icmp)
            end do
         end if
         
      end do
      
C     End of the contribution factor calculations.
      
C     Calculate the initial values and rates for the transport
C     groups.

C     Set the initial amount of the current transport group.
C     This is the value at the beginning of the current time
C     step. Note that the release rate for this time step is
C     accounted for separately (see below) and so does not need
C     to be included into the initial amount that is being set
C     here.

      do ic = 1, number_of_compartments, 1
         if(nstep .eq. 1) then
            xngbeg(ic) = 0.0
         else
            xngbeg(ic) = xngrp(itg, ic, 1, nstep-1)
         end if
      end do

C     Set the rate of increase for the current transport group.

      do ic = 1, number_of_compartments, 1
         xngdot(ic) = grrate(ic, itg)
      end do

      if(level_radcalc .ge. 2) then
         write(out_unit, '(1x, a)')
     &        'Transport-group initial values:'
         write(out_unit, '(1x, 10e15.8)')
     &        (xngbeg(ic), ic = 1, number_of_compartments, 1)
         write(out_unit, '(1x, a)')
     &        'Transport-group rates:'
         write(out_unit, '(1x, 10e15.8)')
     &        (xngdot(ic), ic = 1, number_of_compartments, 1)
      end if

      call MVMUL2(esoln,fsoln,xngbeg,xngdot,xng,1,
     &     MAXCOMP,number_of_compartments,1)
      do icomp = 1, number_of_compartments, 1
         xngrp(itg, icomp, 1, nstep) = xng(icomp)
      end do
      
C     Total transport group for all compartment atmospheres.

      xngrp_total(1) = 0.0
      do jcmp = 1, number_of_compartments, 1
         xngrp_total(1) = xngrp_total(1) +
     &        xngrp(itg, jcmp, 1, nstep)
      end do

	   if(level_radcalc .ge. 3) then
         write(out_unit, '(1x, a)')
     &        'xngrp values at end of tg-loop (comp atmos):'
         do jcmp = 1, number_of_compartments, 1
            if(itg .eq. MAXTGRP) then
               write(out_unit,
     &              '(1x, a, i1, 2(a, i2), a, e15.8, a)')
     &              'xngrp(', itg, ', ', jcmp, ', 1, ', nstep,
     &              ') = ', xngrp(itg, jcmp, 1, nstep), ' kg'
            else
               write(out_unit,
     &              '(1x, a, i1, 2(a, i2), a, e15.8, a)')
     &              'xngrp(', itg, ', ', jcmp, ', 1, ', nstep,
     &              ') = ', xngrp(itg, jcmp, 1, nstep), 
     &              ' atoms'
            end if
         end do
         if(itg .eq. MAXTGRP) then
            write(out_unit, '(1x, a, e15.8, a)')
     &           'xngrp_total(1) = ', xngrp_total(1), ' kg'
         else
            write(out_unit, '(1x, a, e15.8, a)')
     &           'xngrp_total(1) = ', xngrp_total(1), ' atom'
         end if
      end if

C      Determine deposition in compartments and pathways
C
        call deposition (ITG, DELTAT, NSTEP, SIMTIM, XNGRP,
     &   XNGDOT, SYSMTX, XNGBEG, PTHGRP, TRANSPORT_EFF)


C
      end do transport_groups
C

      call xnupdt(DELTAT, NSTEP, SIMTIM, rrate, inventory_cf,
     &          source_cf, xn, path, TRANSPORT_EFF)

C     Values returned: xn(inuc, jcmp, kloc, nstep)

      if(level_radcalc .ge. 3) then
         write(out_unit, '(1x, a)')
     &        '========================================='
         write(out_unit, '(1x, a)')
     &        'xn values that are not zero, after xnupdt'
         do inuc = 1, number_of_nuclides, 1
            do icmp = 1, number_of_compartments, 1
               do iloc = 1, maxcloc, 1
                  if(xn(inuc, icmp, iloc, nstep) .ne. 0.0) then
                     write(out_unit,
     &                    '(1x, 4(a, i2), a, e15.8, a)')
     &                    'xn(', inuc, ', ', icmp, ', ',
     &                    iloc, ', ', nstep, ') = ',
     &                    xn(inuc,icmp,iloc,nstep), ' atoms'
                  end if
               end do
            end do
         end do
      end if

C     Calculate doses at the specified locations.

      call doses(simtim, deltat, nstep, xn, dose_wbod,
     &     dose_skin, dose_thyr, dose_tede)

C     Values returned: dose_wbod, dose_skin, dose_thyr, and dose_tede.

C     kew
C     Accumulate dose information now rather than waiting until
C     the end.

      do iloc = 1, Number_Dose_Locations, 1

C     Accumulated whole-body cloudshine dose, Sv.

         accd_wbod(iloc) = accd_wbod(iloc) +
     &        dose_wbod(iloc, nstep)

C     Accumulated skin cloudshine dose, Sv.

         accd_skin(iloc) = accd_skin(iloc) +
     &        dose_skin(iloc, nstep)

C     Accumulated thyroid chronic inhalation dose, Sv.

         accd_thyr(iloc) = accd_thyr(iloc) +
     &        dose_thyr(iloc, nstep)

C     Accumulated TEDE chronic inhalation and cloudshine
C     dose, Sv.

         accd_tede(iloc) = accd_tede(iloc) +
     &        dose_tede(iloc, nstep)

      end do

C     Calculate the decay and ingrowth of nuclides in the
C     compartment atmospheres.

      call dkngro(nstep, deltat, xn, xngrp, path, pthgrp)

C     Values returned: xn(inuc, jcmp, kloc, nstep).
C     Values returned: xngrp(ngrp, jcmp, kloc, nstep).
C
      if(level_radcalc .ge. 3) then
         write(out_unit, '(1x, a)')
     &        '========================================='
         write(out_unit, '(1x, a)')
     &        'xn-values that are not zero, after dkngro'
         do inuc = 1, number_of_nuclides, 1
            do icmp = 1, number_of_compartments, 1
               do iloc = 1, maxcloc, 1
                  if(xn(inuc, icmp, iloc, nstep) .ne. 0.0) then
                     write(out_unit,
     &                    '(1x, 4(a, i2), a, e15.8, a)')
     &                    'xn(', inuc, ', ', icmp, ', ',
     &                    iloc, ', ', nstep, ') = ',
     &                    xn(inuc, icmp, iloc, nstep), ' atoms'
                  end if
               end do
            end do
         end do
      end if

C     All normal (non-debug) print out should be done in the
C     following printout routine.

      call printout(nstep, ncycle, simtim, deltat,
     &     dose_wbod, dose_skin, dose_thyr, dose_tede, 
     &     accd_wbod, accd_skin, accd_thyr, accd_tede, 
     &     xn, xngrp, path, pthgrp, endtim)

C     kew
C     Implement time step architecture change here by keeping the
C     step number set to 2 and incrementing a new one. This is so
C     that the printout gives an idea of number of steps taken.
C     We also increment nstep to 2 later just before loop repeat.
C     This is so that we are sure to use the correct time step in
C     simtim.

      if(level_radcalc .ge. 7) then
         write(out_unit, '(1x, a, i2)') 'ncycle = ', ncycle
      end if

C     kew
C     check for simulation termination based on time rather than
C     cycles since we will have no idea apriori how many cycles
C     will be needed

C     Prepare for another time step.
C     The auto time step routine handles checking time zone
C     boundaries. It also returns a flag telling us if we crossed
C     a user zone.

      call autodt(numsteps, minstep, simtim, dt_new)

C     Call routine to zero the inventories in the environment
C     to simulate the plume flying away.

      call zrinv(nstep, xn, xngrp)

C     kew
C     Shift all results from the 2nd time element to the 1st
C     if we have finished the second step.
C     
      if(ncycle .gt. 1) then
         call tshift(deltat, xn, xngrp, path, pthgrp,
     &        dose_wbod, dose_skin, dose_thyr, dose_tede)
      end if

C     kew
C     Set the new cycle and time step after the shift.
C     Setting nstep to 2 is the magic that makes this fix work.

      nstep = 2
      ncycle = ncycle + 1
      deltat(nstep) = dt_new

      end do primary_loop

      call printout(nstep, ncycle, simtim, deltat,
     &     dose_wbod, dose_skin, dose_thyr, dose_tede, 
     &     accd_wbod, accd_skin, accd_thyr, accd_tede, 
     &     xn, xngrp, path, pthgrp, endtim)

C     Simulation completed, write banner.

      if(level_radcalc .ge. 1) then
         write(out_unit, '(1x, a)')
     &        '======================================'
         write(out_unit, '(1x, a)')
     &        'Normal radcalc subroutine termination!'
         write(out_unit, '(1x, a)')
     &        '======================================'
      end if

      IF (ERROR_CODE .EQ.0) THEN
	    close(inp_out, status='DELETE')
cc          close(11, status='DELETE')
      END IF
      IF (ERROR_CODE .GT.0) close(inp_out)

      return
 1000 format('1x, a, 2(i2, a)e15.8,1h,,e15.8,a')
      end

C     ------------------------------------------------------------------
