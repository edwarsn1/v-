C     ------------------------------------------------------------------
C
C     Subroutine:  xnupdt
C
C     ------------------------------------------------------------------
C
C     Author(s):   David Monroe
C                  Steven Humphreys
C                  Sandia National Laboratories
C 
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872 1089
C
C     Description:
C
C     Usage:
C
C     Inputs:
C
C     Outputs:
C
C     Variables:
C
C     Calls:
C
C     Assumptions:
C
C     Version:     3.1
C
C     Date:        2002
C
C     Revision
C     History:     3.1  allow X/Q to vary with pathway
C                       follow deposition by nuclide
C
C                  2.2 - March 12, 1996 - corrected iodine source term
C                  rate contribution calculations. The previous version
C                  multiplied the source term rate by the iodine
C                  fractions of the source term compartment instead of
C                  the source term iodine release fractions as is done
C                  now. Also removed all of the unused code.
C
C                  2.1 - January 6, 1996 - changed nuc_total dimension
C                  to only one. Since its not used anywhere but here
C                  this  was done primarily to avoid confusion with the
C                  new architecture.
C
C                  2.0 - November 1, 1995 - changes made here for the
C                  monster 11/1/95 nuclide inventory hack. Also deleted
C                  all of the Steve Stage/Cline MSIV pipe model code.
C
C                  xnupdt still does not update compartment sub-
C                  locations. This is not a difficult fix. I could use
C                  the same equations that are used in CTRAN.FOR and
C                  PTRAN.FOR.
C
C                  1.1 - October 13, 1995 - made major modifications to
C                  the iodine elemental, organic, and aerosol fractions
C                  calcuations.
C
C                  1.0 - - initial version.
C
C     ------------------------------------------------------------------

      subroutine xnupdt(DELTAT, NSTEP, SIMTIM, rrate, inventory_cf, 
     1                 source_cf, xn, path, TRANSPORT_EFF)
#ifdef WIN32
      use dfport
#endif
 
	
      include 'full.com'
      integer nstep
      double precision deltat(MAXSTEP)
      double precision rrate(MAXNUC, MAXCOMP)
      double precision source_cf(MAXTGRP, MAXCOMP, MAXCOMP)
      double precision inventory_cf(MAXTGRP, MAXCOMP, MAXCOMP)
      double precision xn(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision path(MAXNUC, MAXPATH, MAXSTEP+1)
      double precision simtim

         integer i, icmp, j, jloc, nucl, ecomp, path_from, path_to

         double precision iodine_elem(MAXCOMP, MAXCLOC)
         double precision iodine_orga(MAXCOMP, MAXCLOC)
         double precision iodine_aero(MAXCOMP, MAXCLOC)
         double precision iodine_total(MAXCOMP, MAXCLOC)
         double precision i_frc_elem(MAXCOMP, MAXCLOC)
         double precision i_frc_orga(MAXCOMP, MAXCLOC)
         double precision i_frc_aero(MAXCOMP, MAXCLOC)
C        Save iodine fractions for each compartment location.
C tjh  save the fractions and re-order the above for transferring
c
         common / ifraction/ i_frc_elem, i_frc_orga, i_frc_aero


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
	double precision xoq_now(MAX_XQS), xngave(MAXTGRP)

      common / cptran / ctran, ptran, frac_out, xoq_now

C     included into following subroutines
C     radcalc             sourcep             coeffs
C     filtin              pipin               supin
C     xnupdt
C     add transport effectivenss to the output (1/01)

      double precision transport_eff(MAXTGRP,MAXPATH), xnn

	double precision xq, lupl2



         if(LEVEL_XNUPDT .ge. 1) then
            write(out_unit, '(1x, a)') 'Subroutine xnupdt!'
         end if

C        Print out input variables.

         if(LEVEL_XNUPDT .ge. 3) then
            write(out_unit, '(1x, a, i1, a, e11.4, a)')
     &         'nstep = ', nstep, ' deltat = ',  deltat, ' h'
            write(out_unit, '(1x, a)') 'release rates:'
	      DO NSRC = 1, Number_of_Sources, 1
               icmp = Source_Term_On(NSRC)
               do nucl = 1, number_of_nuclides, 1
                  if((LEVEL_NUCLIDE .eq. 0) .or.
     &               (LEVEL_NUCLIDE .eq. nucl)) then
                     write(out_unit, '(1x, a, i2, a, e11.4, a)')
     &                  'rrate(', nucl, ') = ', rrate(nucl,NSRC), 
     &                                 ' atoms/sec'
                  end if
               end do
            END DO

            write(out_unit, '(1x, a)')
     &         'Inventory Contribution Factors:'
            do icmp = 1, number_of_compartments, 1
               do j = 1, number_of_compartments, 1
                  write(out_unit,
     &               '(1x, a, 2(i2, a), 4(e14.6))')
     &               'inventory_cf(1-4,', icmp, ', ', j, ') = ',
     &               (inventory_cf(i, icmp, j),  i = 1, 4)
               end do
            end do
            write(out_unit, '(1x, a)')
     &         'Source Term Contribution Factors:'
            do icmp = 1, number_of_compartments, 1
               do j = 1, number_of_compartments, 1
                  write(out_unit,
     &               '(1x, a, 2(i2, a), 4(e14.6))')
     &               'source_cf(1-4,', icmp, ', ', j,')     = ',
     &               (source_cf(i, icmp, j),  i = 1, 4)
               end do
            end do
         end if

C        Zero out the nuclide inventory array, xn for the current
C        time step.


      do nucl = 1, number_of_nuclides, 1
         do icmp = 1, number_of_compartments, 1
            IF (NSTEP.EQ.1) THEN
                xn(nucl, icmp, 1, 2) = xn(nucl, icmp, 1, NSTEP)
            ELSE
	         do jloc = 1, maxcloc, 1
                  xn(nucl, icmp, jloc, nstep) = 0.0d0
               end do
            END IF
         end do
      end do

C        Initialize the iodine fractions.

C        Only the source term comartment will have any iodine fractions
C        to speak of on the first time step. These iodine fractions will
C        initially be set the fractions of the released source term. All
C        other compartments will have fraction of 0.0 because they have
C        no iodine at all. (Actually because of this last fact any value
C        could be used for the initial iodine fractions. However, to be
C        consistent with later calculations which set the fraction to
C        0.0 if there is no iodine related to that particular transport
C        group, we'll set the fractions to 0.0 here also.)


         do i = 1, number_of_compartments, 1
            do j = 1, MAXCLOC, 1
                iodine_elem(i, j) = 0.0d0
                iodine_orga(i, j) = 0.0d0
                iodine_aero(i, j) = 0.0d0
                iodine_total(i, j) = 0.0d0
            end do
         end do
         if (nstep .eq. 1) then  
            do i = 1, number_of_compartments, 1
               do j = 1, MAXCLOC, 1
                  i_frc_elem(i, j) = 0.0d0
                  i_frc_orga(i, j) = 0.0d0
                  i_frc_aero(i, j) = 0.0d0
               end do
            end do
            do NS = 1, number_of_sources, 1
	         i = Source_Term_ON(NS)
               i_frc_elem(i, 1) = i_fraction_elemental(NS)
               i_frc_orga(i, 1) = i_fraction_organic(NS)
               i_frc_aero(i, 1) = i_fraction_aerosol(NS)

               iodine_elem(i, 1) = i_fraction_elemental(NS)
               iodine_orga(i, 1) = i_fraction_organic(NS)
               iodine_aero(i, 1) = i_fraction_aerosol(NS)
               iodine_total(i, 1) = 1.0
            end do
         end if

C        Update the nuclide inventory in the atmosphere (MAXCLOC=1).

C        1. Update inventories using previous compartment inventories
C           and the inventory and source term contribution factors.
C        2. Only worry about nuclides in the atmosphere. Other
C           compartment sub-locations are being handled elsewhere.
C        3. The only source term rate available right now per nuclide
C           is the primary source term from the vessel. It shouldn't
C           be at all hard to add the pool source terms later.

         Compartments: do icmp = 1, number_of_compartments, 1

            if(LEVEL_XNUPDT .ge. 2) then
               write(out_unit, '(1x, a)')
     &            'Previous Iodine atmospheric fractions ' //
     &            '(elem, orgn, aero):'
               write(out_unit, '(1x, a, i2, a, 3f13.5)')
     &            'compartment(', icmp, ') = ',
     &            i_frc_elem(icmp, 1),
     &            i_frc_orga(icmp, 1),
     &            i_frc_aero(icmp, 1)
            end if

            Nuclides: do nucl = 1, number_of_nuclides, 1

C              The nobles chemical family and transport group.

               if(ngroup(nucl) .eq. 1) then

C                 Update the number of nuclides in the nobles family.
C                 The new amount is equal to the sum of all of the other
C                 compartments inventory times the contribution factor
C                 for each compartment plus the source term.

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, 3a)')
     &                     'Nuclide = ', nuclide_name(nucl),
     &                     ', chemical group = nobles, ' //
     &                     'transport group = nobles.'
                        if(nstep .eq. 1) then
                           write(out_unit, '(1x, a, 1pe11.4, a)')
     &                        'Previous nuclide amount = ',
     &                        xn(nucl, icmp, 1, nstep), ' atoms'
                        else
                           write(out_unit, '(1x, a, 1pe11.4, a)')
     &                        'Previous nuclide amount = ',
     &                        xn(nucl, icmp, 1, nstep - 1), ' atoms'
                        end if
                     end if
                  end if

                  do i = 1, number_of_compartments, 1
                     if(nstep .gt. 1) then
                        xn(nucl, icmp, 1, nstep) =
     &                      xn(nucl, icmp, 1, nstep) +
     &                      inventory_cf(1, icmp, i) *
     &                      xn(nucl, i, 1, nstep - 1)
                     end if                 

                     do ns = 1, number_of_sources
                       icmp2 = Source_Term_On(ns)	       
                       IF (i .EQ. ICMP2) THEN
                           xn(nucl, icmp, 1, nstep) =
     &                        xn(nucl, icmp, 1, nstep) +
     &                        source_cf(1,icmp,i) * rrate(nucl,ns) *
     &                        source_term_fraction(ns)
                       END IF
                     end do
                  end do

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, a, 1pe11.4, a)')
     &                     'New nuclide amount      = ',
     &                     xn(nucl, icmp, 1, nstep), ' atoms'
                     end if
                  end if

C              The iodine chemical family and elemental iodine, organic
C              iodine, and aerosol (iodine's portion) transport groups.

               else if(ngroup(nucl) .eq. 2) then

C                 Update the number of nuclides in the iodine family,
C                 elemental form. The new amount is equal to the sum of
C                 all of the other compartments inventory times the
C                 contribution factor for each compartment plus the
C                 source term.

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, 3a)')
     &                     'Nuclide = ', nuclide_name(nucl),
     &                     ', chemical group = iodine, ' //
     &                     'transport groups = elemental, ' //
     &                     'organic, and aerosol iodine.'
                        if(nstep .eq. 1) then
                           write(out_unit, '(1x, a, 1pe11.4, a)')
     &                        'Previous nuclide amount = ',
     &                        xn(nucl, icmp, 1, nstep), ' atoms'
                        else
                           write(out_unit, '(1x, a, 1pe11.4, a)')
     &                        'Previous nuclide amount = ',
     &                        xn(nucl, icmp, 1, nstep - 1), ' atoms'
                        end if
                     end if
                  end if

                  do i = 1, number_of_compartments, 1

C                    Add all of the other compartments' contribution of
C                    their initial inventories from the beginning of the
C                    time step.

                     if(nstep .gt. 1) then
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     inventory_cf(2, icmp, i) *
     &                     xn(nucl, i, 1, nstep - 1) * i_frc_elem(i, 1)
                        iodine_elem(icmp, 1) = iodine_elem(icmp, 1) +
     &                     inventory_cf(2, icmp, i) *
     &                     xn(nucl, i, 1, nstep - 1) * i_frc_elem(i, 1)
                     end if

C                    Add the source term compartment's source term rate
C                    contribution. Note: the release fractions are used
C                    here instead of the compartment fractions. This is
C                    because the newly released source term stuff does
C                    not mix with the compartment before running off to
C                    contribute nuclides to the connecting compartments.
C
                     do ns = 1, number_of_sources
                       icmp2 = Source_Term_On(ns)	       
                       IF (i .EQ. ICMP2) THEN
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     source_cf(2, icmp, i) * rrate(nucl,ns) *
     &                     i_fraction_elemental(ns) *
     &                     source_term_fraction(ns)
                        iodine_elem(icmp, 1) = iodine_elem(icmp, 1) +
     &                     source_cf(2, icmp, i) * rrate(nucl,ns) *
     &                     i_fraction_elemental(ns) *
     &                     source_term_fraction(ns)
                       END IF
                     end do

                  end do

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, a, 1pe11.4, a)')
     &                     'New nuclide amount      = ',
     &                     xn(nucl, icmp, 1, nstep), ' atoms'
                     end if
                  end if

C                 Update the number of nuclides in the iodine family,
C                 organic form. The new amount is equal to the sum of
C                 all of the other compartments inventory times the
C                 contribution factor for each compartment plus the
C                 source term.

                  do i = 1, number_of_compartments, 1

                     if(nstep .gt. 1) then
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     inventory_cf(3, icmp, i) *
     &                     xn(nucl, i, 1, nstep - 1) * i_frc_orga(i, 1)
                        iodine_orga(icmp, 1) = iodine_orga(icmp, 1) +
     &                     inventory_cf(3, icmp, i) *
     &                     xn(nucl, i, 1, nstep - 1) * i_frc_orga(i, 1)
                     end if
                  

                     do ns = 1, number_of_sources
                       icmp2 = Source_Term_On(ns)	       
                       IF (i .EQ. ICMP2) THEN
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     source_cf(3, icmp, i) * rrate(nucl,ns) *
     &                     i_fraction_organic(ns) *
     &                     source_term_fraction(ns)
                        iodine_orga(icmp, 1) = iodine_orga(icmp, 1) +
     &                     source_cf(3, icmp, i) * rrate(nucl,ns) *
     &                     i_fraction_organic(ns) *
     &                     source_term_fraction(ns)
                       END IF
                     end do

                  end do

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, a, 1pe11.4, a)')
     &                     'New nuclide amount      = ',
     &                     xn(nucl, icmp, 1, nstep), ' atoms'
                     end if
                  end if

C                 Update the number of nuclides in the iodine family,
C                 aerosol form. The new amount is equal to the sum of
C                 all of the other compartments inventory times the
C                 contribution factor for each compartment plus the
C                 source term.

                  do i = 1, number_of_compartments, 1

                     if(nstep .gt. 1) then
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     inventory_cf(4, icmp, i) *
     &                     xn(nucl, i, 1, nstep - 1) * i_frc_aero(i, 1)
                        iodine_aero(icmp, 1) = iodine_aero(icmp, 1) +
     &                     inventory_cf(4, icmp, i) *
     &                     xn(nucl, i, 1, nstep - 1) * i_frc_aero(i, 1)
                     end if
                  

                     do ns = 1, number_of_sources
                       icmp2 = Source_Term_On(ns)	       
                       IF (i .EQ. ICMP2) THEN
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     source_cf(4, icmp, i) * rrate(nucl,ns) *
     &                     i_fraction_aerosol(ns) *
     &                     source_term_fraction(ns)
                        iodine_aero(icmp, 1) = iodine_aero(icmp, 1) +
     &                     source_cf(4, icmp, i) * rrate(nucl,ns) *
     &                     i_fraction_aerosol(ns) *
     &                     source_term_fraction(ns)
                       END IF
                     end do

                  end do

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, a, 1pe11.4, a)')
     &                     'New nuclide amount      = ',
     &                     xn(nucl, icmp, 1, nstep), ' atoms'
                     end if
                  end if

C              The cesium, tellurium, strontium, barium, ruthenium,
C              cerium, and lanthannum chemical families and aerosol
C              (minus iodine) transport group.

               else if((ngroup(nucl) .ge. 3) .and.
     &            (ngroup(nucl) .le. MAXCGRP)) then

C                 Update the number of nuclides in the remaining
C                 families. The new amount is equal to the sum of
C                 of the other compartments inventory times the
C                 contribution factor for each compartment plus the
C                 source term.

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, 3a)')
     &                     'Nuclide = ', nuclide_name(nucl),
     &                     ', chemical group = other, ' //
     &                     'transport group = aerosols.'
                        if(nstep .eq. 1) then
                           write(out_unit, '(1x, a, e11.4, a)')
     &                        'Previous nuclide amount = ',
     &                        xn(nucl, icmp, 1, nstep), ' atoms'
                        else
                           write(out_unit, '(1x, a, e11.4, a)')
     &                        'Previous nuclide amount = ',
     &                        xn(nucl, icmp, 1, nstep - 1), ' atoms'
                        end if
                     end if
                  end if

                  do i = 1, number_of_compartments, 1

                     if(nstep .gt. 1) then
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     inventory_cf(4, icmp, i) *
     &                     xn(nucl, i, 1, nstep - 1)
                     end if
                  

                     do ns = 1, number_of_sources
                       icmp2 = Source_Term_On(ns)	       
                       IF (i .EQ. ICMP2) THEN
                        xn(nucl, icmp, 1, nstep) =
     &                     xn(nucl, icmp, 1, nstep) +
     &                     source_cf(4, icmp, i) * rrate(nucl,ns) *
     &                     source_term_fraction(ns)
                       END IF
                     end do

                  end do

                  if(LEVEL_XNUPDT .ge. 3) then
                     if((LEVEL_NUCLIDE .eq. 0) .or.
     &                  (LEVEL_NUCLIDE .eq. nucl)) then
                        write(out_unit, '(1x, a, 1pe11.4, a)')
     &                     'New nuclide amount      = ',
     &                     xn(nucl, icmp, 1, nstep), ' atoms'
                     end if
                  end if

               else

C                  call message('Unrecognized chemical family. ' //
C     &               'Check your nuclide inventory file.')
                  write(out_unit, '(1x, a)')
     &               'Unrecognized chemical family. (XNUPDT)' //
     &               'Check your nuclide inventory file.'
                  call perror('Error in')
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
        STOP 

               end if

            end do nuclides

         end do compartments

C        Evaluate iodine elemental, organic, aerosol fractions. This
C        must be done after all nuclides are updated since the previous
C        fractions are used in the solution above.

         do icmp = 1, number_of_compartments, 1

C           Number of nuclides in iodine family, all forms.

            iodine_total(icmp, 1) = iodine_elem(icmp, 1) +
     &         iodine_orga(icmp, 1) + iodine_aero(icmp, 1)

            if(iodine_total(icmp, 1) .eq. 0.0) then

               i_frc_elem(icmp, 1) = 0.0
               i_frc_orga(icmp, 1) = 0.0
               i_frc_aero(icmp, 1) = 1.0

            else

               i_frc_elem(icmp, 1) =
     &            iodine_elem(icmp, 1) / iodine_total(icmp, 1)
               i_frc_orga(icmp, 1) =
     &            iodine_orga(icmp, 1) / iodine_total(icmp, 1)
               i_frc_aero(icmp, 1) =
     &            iodine_aero(icmp, 1) / iodine_total(icmp, 1)

            end if

            if(LEVEL_XNUPDT .ge. 2) then
               write(out_unit, '(1x, a)')
     &            'New Iodine atmospheric fractions ' //
     &            '(elem, orgn, aero):'
               write(out_unit, '(1x, a, i2, a, 3f13.5)')
     &            'compartment(', icmp, ') = ',
     &            i_frc_elem(icmp, 1),
     &            i_frc_orga(icmp, 1),
     &            i_frc_aero(icmp, 1)
            end if

         end do
c
c     atomsphere for each compartment has been evaluated
c     use average value for determining deposition
c
c     now get the quantities deposited within each compartment
c     skip the atmosphere (iloc=1)
c
C     find environment compartment (ecomp)

      ecomp = 0
	do icmp = 1, number_of_compartments, 1
	   if( compartment_type(icmp) .eq.2) ecomp = icmp

	   do nucl = 1, number_of_nuclides, 1

            inuc = ngroup(nucl)
            itg = 4
            IF (inuc .eq. 1) itg = 1
            IF (inuc .gt. 2) itg = 5
	      xngave(itg) = 0.5*(xn(nucl,icmp,1,2) + xn(nucl,icmp,1,1))

            do iloc = 2, maxcloc
c     nobles
	        if (inuc .eq. 1) then
                xn(nucl,icmp,iloc,nstep) = xn(nucl,icmp,iloc,3-nstep) +
     &                  xngave(itg)*ctran(icmp,iloc,itg)*deltat(nstep)
	        end if

C     aerosols
	        if (inuc .gt. 2) then
                xn(nucl,icmp,iloc,nstep) = xn(nucl,icmp,iloc,3-nstep) +
     &                  xngave(itg)*ctran(icmp,iloc,itg)*deltat(nstep)
	        end if

c     iodine
	        if (inuc .eq. 2) then
                xn(nucl,icmp,iloc,nstep) = xn(nucl,icmp,iloc,3-nstep) +
     &                  xngave(4)*i_frc_elem(icmp,1) *
     &                  ctran(icmp,iloc,2) * deltat(nstep)
                xn(nucl,icmp,iloc,nstep) = xn(nucl,icmp,iloc,nstep) +
     &                  xngave(4)*i_frc_orga(icmp,1) *
     &                  ctran(icmp,iloc,3) * deltat(nstep)
                xn(nucl,icmp,iloc,nstep) = xn(nucl,icmp,iloc,nstep) +
     &                  xngave(4)*i_frc_aero(icmp,1) *
     &                  ctran(icmp,iloc,4) * deltat(nstep)
              end if

	      end do
         end do
      end do

         if(LEVEL_XNUPDT .ge. 2) then
            do icmp = 1, number_of_compartments, 1
               do nucl = 1, number_of_nuclides, 1
                  if((LEVEL_NUCLIDE .eq. 0) .or.
     &               (LEVEL_NUCLIDE .eq. nucl)) then
                     if(xn(nucl, icmp, 1, nstep) .ne. 0.0d0) then
                        write(out_unit,
     &                     '(1x, 3(a, i2), a, 1pe11.4, a)')
     &                     'xn(', nucl, ', ', icmp, ', 1, ', nstep,
     &                     ') = ', xn(nucl, icmp, 1, nstep), ' atoms'
                     end if
                  end if
               end do
            end do
         end if
c
c     atomsphere for each compartment has been evaluated
c     use average value for determining deposition
c
c     now get the quantities deposited within each pathway
C     from the upstream compartment atmosphere values.
C

      do ipth = 1, number_of_pathways, 1
	   icmp = pathway_from(ipth)
	   path_to = pathway_to(ipth)
	   do nucl = 1, number_of_nuclides, 1
           do itg = 1, MAXTGRP, 1
	        xngave(itg) = 0.0
           end do
           inuc = ngroup(nucl)
           itg = 4
           IF (inuc .eq. 1) itg = 1
           IF (inuc .gt. 2) itg = 5
           path(nucl,ipth,nstep) = path(nucl,ipth,3-nstep)

C      Get the source compartment atoms (xngave)

	     xngave(itg) = 0.5*(xn(nucl,icmp,1,2) + xn(nucl,icmp,1,1))

           If (itg .eq.4) then
              xngave(2) = xngave(4)*i_frc_elem(icmp,1) 
              xngave(3) = xngave(4)*i_frc_orga(icmp,1) 
              xngave(4) = xngave(4)*i_frc_aero(icmp,1) 
           End if

	     if (compartment_type(icmp).eq.2) then 

C      IF it is an environment compartment then one needs a X/Q and a
C      source rate.  First look for the paths that feed the environment.
C      Then skip it if it is the same path and doesn't go to the environment
C      skip paths that start at same compartment as ipth ends at
C
             xngave(itg) = 0.0
             If (itg .eq.4) then
               xngave(2) = xngave(4) 
               xngave(3) = xngave(4) 
             End if
             DO kpth = 1, number_of_pathways, 1
	         IF (kpth .ne. ipth .and. pathway_to(kpth) .eq. ecomp .and.
     &           path_to .ne. pathway_from(kpth) ) THEN
                 nxq = Path_XQ_Table(kpth,ipth)
	           xq = 0.0
	           IF (nxq .gt. 0) THEN
                    IF( location_xq_count(nxq) .GT. 0) THEN
                        xq = lupl2(nxq, simtim, location_xq_time,
     &                    location_xq, location_xq_count(nxq))
                    END IF
                 END IF
c..                 IF (NUCL.eq.33 .or. nucl.eq.38) THEN
c..	             path_from = pathway_from(kpth)
c..                 END IF
	           path_from = pathway_from(kpth)
                 XNN = xq * xn(nucl,path_from,1,nstep)
                 If (itg .ne. 4) then
                   xngave(itg) = xngave(itg) +  
     &                              transport_eff(itg,kpth) * xnn
                 else
                   xngave(2) = xngave(2) + i_frc_elem(path_from,1) *
     &                              transport_eff(2,kpth) * xnn
                   xngave(3) = xngave(3) + i_frc_orga(path_from,1) *
     &                              transport_eff(3,kpth) * xnn
                   xngave(4) = xngave(4) + i_frc_aero(path_from,1) *
     &                              transport_eff(4,kpth) * xnn
                 end if
               END IF
             END DO
	     end if
C     transport groups deposited in pathways
C     assignments for ptran (pathways):

C     ptran(path,1,tg)     pipe loss        pipe walls
C     ptran(path,2,tg)     filter loss      pathway filters
C     ptran(path,3,tg)     generic loss     generic
C     ptran(path,4,tg)     nat convect      no accumulation
C     ptran(path,5,tg)     not defined      -----------
C
		  iloc = PATHWAY_TYPE(ipth)
            if (iloc .eq. 6) iloc = 3
c     nobles
	      if (inuc .eq. 1) then
			 itg = 1
               path(nucl,ipth,nstep) = path(nucl,ipth,nstep) +
     &             xngave(itg)*ptran(ipth,iloc,itg)*deltat(nstep)
               path(nucl,ipth,3) = path(nucl,ipth,3) +
     &             xngave(itg)*transport_eff(itg,ipth)*deltat(nstep)
	      end if

C     aerosols
	      if (inuc .gt. 2) then
		     itg = 5
               path(nucl,ipth,nstep) = path(nucl,ipth,nstep) +
     &             xngave(itg)*ptran(ipth,iloc,itg)*deltat(nstep)
               path(nucl,ipth,3) = path(nucl,ipth,3) +
     &             xngave(itg)*transport_eff(itg,ipth)*deltat(nstep)
            end if

c     iodine
	      if (inuc .eq. 2) then
		     itg = 4
               path(nucl,ipth,nstep) = path(nucl,ipth,nstep) +
     &             deltat(nstep) * (xngave(2)*ptran(ipth,iloc,2) +
     &             xngave(3)*ptran(ipth,iloc,3) +
     &             xngave(4)*ptran(ipth,iloc,4) )
               path(nucl,ipth,3) = path(nucl,ipth,3) +
     &             deltat(nstep) *  (xngave(2)*transport_eff(2,ipth) +
     &             xngave(3)*transport_eff(3,ipth) +
     &             xngave(4)*transport_eff(4,ipth) )
            end if
c..            IF (NUCL.eq.33 .or. nucl.eq.38) THEN
c..             write(out_unit,'(2a,5i6,f10.5,1p2e13.4,/14x,5e13.4)') 
c..     &          'xnupdt ',nuclide_name(nucl),NUCL, ipth, inuc,  
c..     &          icmp, path_to, simtim/3600.,
c..     &          path(nucl,ipth,1),path(nucl,ipth,2),path(nucl,ipth,3),
c..     &          ptran(ipth,iloc,4),i_frc_aero(icmp,1),xngave(itg),
c..     &          transport_eff(4,ipth)	     
c..            END IF
         end do
      end do


      return

      end

C     ------------------------------------------------------------------
