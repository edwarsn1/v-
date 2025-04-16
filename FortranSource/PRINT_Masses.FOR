C     ------------------------------------------------------------------
C
C     Subroutine:  PRINT_MASSES
C
C     ------------------------------------------------------------------
C
C     Author(s):   Terry Heames
C                  ALION / ITSO
C                  (505) 872-1089
C
C     Description: This routine is called when ICASE = 1 and
C                  edits the detail mass distribution
C                  output contains information about nuclide, and
C                  transport group inventories for each compartment for
C                  which detailed output is requested.
C
C     Usage:       call print_masses(nstep, ncycle, ecomp, simtim,
C                     deltat, time, endtim, total_release_time, exposure,  
C                     xn, xn_release, xngrp, xngrp_release, path, pthgrp)  
C
C     Inputs:
C
C     Controls:    Compartment_Detail
C                     0    Do not edit this compartment mass info
C                     1    Edit at major steps
C                     2    Edit on last step only
C                  Pathway_Detail
C                     0    Do not edit this pathways mass info
C                     1    Edit group information at major steps
C                     2    Edit group & inventory information at major steps
C                     3    Edit on last step only
C
C     Variables:   
C                  XN2     mass in curies by nuclide,
C                          compartment, and location
C				 XNGRP2  mass in Curies by group,
C                          compartment, and location
C                  PATH2   mass in Curies by nuclide
C                          and path
C                  PTHGRP2 mass in Curies by group and 
C                          and path
c                  iclass = 1 (version 1.0-3.03) 
C                           0  Version 3.10
c                  iunits = 0 (version 1.0-3.03) 
C                         = 1  Masses in Curies
C                  xn_release = total amount of each nuclide released 
C                               to the environment (atoms) 
C
C     Calls:
C
C     Assumptions:
C
C     Version:     3.10
C
C     Date:        March, 2002
C
C     Revision
C     History:     2.3   March 1999 - Complete rework of the output format (NEB)
C
C                  2.2   August 1998 - miscellaneous changes to enhance the
C                  readability of the output  (NEB & TJH)
C
C                  1.4 - 13 August, 1996 - changed sv to rem, 
C                  added the df for the model info -btl
C
C                  1.3 - 8 July, 1996 - added the model info to printout -btl 
C                  
C                  1.2 - June, 1995 - made model and scenario description 
C                  printout code into two seperate functions  -btl
C
C                  1.1 - March 7, 1996 - made the on_event (previously
C                  onzone) and on_step (previously onstep) variables
C                  global. They are declared in the simulate.h include
C                  file. Also changed the variable show_time_steps to
C                  show_step.
C
C                  1.0 - January 29, 1996 - initial version.
C
C
C     ------------------------------------------------------------------

      SUBROUTINE PRINT_MASSES (nstep, ncycle, ecomp, simtim,
     &             deltat, time, endtim, total_release_time, exposure,  
     &             xn, xn_release, xngrp, xngrp_release, path, pthgrp)  

C     ------------------------------------------------------------------
C
      include 'full.com'
      integer nstep, ncycle
      double precision endtim
      double precision time
      double precision simtim, deltat(MAXSTEP)
C
      double precision xn(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision path(MAXNUC, MAXPATH, MAXSTEP+1)
      double precision PTHGRP(MAXTGRP, MAXPATH, MAXSTEP+1)

      integer total_steps
      integer name_length, tempcount, temp_index

      character* 21 printname1, printname2, printname3
      character* 100 line

      double precision delta_time, current_time, end_time

      integer number_of_steps, index_current, index_end, istep

      integer i, j, icmp, dcomp, ecomp

C     These variables will be used to accumulate the release to the
C     environment from one supplemental time step to the next.

      double precision total_release_time
      double precision xn_release(MAXNUC)
      double precision xngrp_release(MAXTGRP)

C
C     setup for the V3.10 detailed compartment deposition output
C
      parameter (MAX_DETAIL = 20 )
      dimension  xmass(MAXNUC,MAX_DETAIL), tot_nucl(MAX_DETAIL) 
	character*13 xname(MAX_DETAIL), xname_comp, xname_path

	dimension xngrp_net(MAXCLOC), pthgrp_net(MAXPATH)
      double precision xngrp_net, pthgrp_net, tot_nucl, xmass, xnedit

      integer locc, iuc, ilc

C     setup dose equivalent I 131 calculation, find thyroid dose for both 
C                                      ICRP2 (TID-14844) and from input .NIF file
C
      double precision raw_i, dumm1
      double precision de_I131(2), dcf_I131(2), dcf_icrp2(5)
	integer iatmwt 
	data dcf_icrp2 / 4.014e-7, 1.447e-8, 1.073e-7, 6.857e-9, 3.338e-8/

C
C     check for last step (turn on additional edits)  
C
      Last_step = 0
	if (simtim+deltat(nstep) .ge. endtim) then
         Last_Step=1
	end if

c          EDIT the mass deposited around the compartments
C
      do DCOMP = 1, Number_of_Compartments, 1
        IF(compartment_detail(DCOMP) .EQ. 1  .OR.
     &      (compartment_detail(DCOMP).EQ.2.and.Last_Step.eq.1)) THEN

C        V 3.03 print out the nuclide and transport group inventory results

            if (dcomp.eq.ecomp) then
C      Environment

                 write(out_unit, '(/, 1x, 2a)')
     &              trim(compartment_name(dcomp)),
     &              ' Integral Nuclide Release:'
                 write(out_unit, '(/, 1x, a, f9.4, 6x, a)')
     &            'Time (h) =', time,
     &            ' Ci           kg         Atoms         Bq'
            else
                 write(out_unit, '(/, 1x, 2a)')
     &              trim(compartment_name(dcomp)),
     &              ' Compartment Nuclide Inventory:'
                   write(out_unit, '(/, 1x, a, f9.4, 6x, a)')
     &              'Time (h) =', time,
     &              ' Ci           kg         Atoms      Decay'
            end if

		  do j = 1, number_of_nuclides, 1
	            dumm1 = dabs(xn(j,dcomp,1,NSTEP))*1.0d-8

                  IF (dabs(xn_release(j)) .gt. 1.0d4 .and.
     &                                     dcomp .eq.ecomp) then
C     Environment
                     IF (IUNITS .EQ. 0) THEN
                        write(out_unit, '(1x, a7, 14x, 1p4e12.4)')
     &                     nuclide_name(j),
     &                     xn_release(j)* decay_constant(j) / CITOBQS,
     &                     xn_release(j) / AVOGADRO *
     &                           atomic_weight(j) / 1.0d3,
     &                     xn_release(j) ,
     &                     xn_release(j) * decay_constant(j)
                     ELSE
                        write(out_unit, '(1x, a7, 14x, 1p4e12.4)')
     &                     nuclide_name(j),
     &                     xn_release(j),
     &                     xn_release(j) * CITOBQS / decay_constant(j)
     &                           / AVOGADRO * atomic_weight(j) / 1.0d3,
     &                     xn_release(j) * CITOBQS / decay_constant(j),
     &                     xn_release(j) * CITOBQS
                     END IF
                  END IF

                  IF (gamma_beta(j, dcomp).gt.1.0d-4 .and. 
     &                                       dcomp.ne.ecomp) then 
C     NOT Environment
                     IF (IUNITS .EQ. 0) THEN
                       dumm1 =  xn(j, dcomp, 1, nstep) *
     &                                decay_constant(j) / CITOBQS
	                 dumm2 =  xn(j, dcomp, 1, nstep) / AVOGADRO *
     &                          atomic_weight(j) / 1.0d3
 	                 dumm3 =  xn(j, dcomp, 1, nstep)
                       dumm4 =  gamma_beta(j, dcomp)
                     ELSE
                       dumm1 =  xn2(j, dcomp, 1)
	                 dumm2 =  xn2(j, dcomp, 1) / decay_constant(j) *
     &                    CITOBQS / AVOGADRO * atomic_weight(j) / 1.0d3
 	                 dumm3 =  xn2(j, dcomp, 1)/ decay_constant(j) *
     &                    CITOBQS
                       dumm4 =  gamma_beta(j, dcomp)
                     END IF
                     write(out_unit, '(1x, a7, 14x, 1p4e12.4)')
     &                    nuclide_name(j),
     &                    dumm1, dumm2, dumm3, dumm4                    
                   END IF

               end do
C
C
C     determine does equivalent of first iodine isotope
C
          de_i131(1) = 0.0
          de_i131(2) = 0.0
		raw_i      = 0.0
		do j = 1, number_of_nuclides, 1
	         temp_index = atomic_weight(j) - 130
c
c     verify that nuclide is I-131, I-132, I-133, I-134, or I-135
c
	         if (temp_index.gt.0 .and. temp_index.lt.6 .and. 
     &                ngroup(j).eq.2) then
                    if (temp_index .eq.1) then
				     dcf_i131(1) = dcf_inhale(j,6)
	                 iatmwt = atomic_weight(j)
	              end if
                    if (dcomp.eq.ecomp) then
C     Environment
    	                de_i131(1) = de_i131(1) + dcf_inhale(j,6)*
     &				   xn_release(j)* decay_constant(j)
	                de_i131(2) = de_i131(2) + dcf_icrp2(temp_index)*
     &				   xn_release(j)* decay_constant(j)
	                raw_i = raw_i + xn_release(j)* 
     &                     decay_constant(j) / CITOBQS
                    else
    	                de_i131(1) = de_i131(1) + dcf_inhale(j,6)*
     &				   xn(j, dcomp, 1, nstep)* decay_constant(j)
	                de_i131(2) = de_i131(2) + dcf_icrp2(temp_index)*
     &				   xn(j, dcomp, 1, nstep)* decay_constant(j)
	                raw_i = raw_i + xn(j, dcomp, 1, nstep)* 
     &                     decay_constant(j) / CITOBQS
                    end if
               end if
          end do

          de_i131(1) = de_I131(1)/CITOBQS / dcf_I131(1)
          de_i131(2) = de_I131(2)/CITOBQS / dcf_icrp2(1)


          write(out_unit, '(/, 1x, 2a)')
     &            trim(compartment_name(dcomp)),
     &            ' Transport Group Inventory:'
C              If it is an environement compartment then print out
C              the present release, release rate and total released.
             if(dcomp .eq. ecomp) then
                  write(out_unit, '(/, 25x, a)')
     &               ' Total      Release     '
                  write(out_unit, '(1x, a, f9.4, 5x, a)')
     &               'Time (h) =',time,
     &               'Release     Rate/s    '

                  IF (IUNITS .EQ. 0) THEN
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Noble gases (atoms)',
     &                 xngrp_release(1),
     &                 xngrp_release(1) / total_release_time
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Elemental I (atoms)',
     &                 xngrp_release(2),
     &                 xngrp_release(2) / total_release_time
                    write(out_unit, '(1x, a, 4x, 1p2e12.4)')
     &                 'Organic I (atoms)',
     &                 xngrp_release(3),
     &                 xngrp_release(3) / total_release_time
                    write(out_unit, '(1x, a, 8x, 1p2e12.4)')
     &                 'Aerosols (kg)',
     &                 xngrp_release(5),
     &                 xngrp_release(5) / total_release_time

                  ELSE
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Noble gases (Ci)   ',
     &                 xngrp_release(1),
     &                 xngrp_release(1) / total_release_time
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Elemental I (Ci)   ',
     &                 xngrp_release(2),
     &                 xngrp_release(2) / total_release_time
                    write(out_unit, '(1x, a, 4x, 1p2e12.4)')
     &                 'Organic I (Ci)   ',
     &                 xngrp_release(3),
     &                 xngrp_release(3) / total_release_time
                    write(out_unit, '(1x, a, 8x, 1p2e12.4)')
     &                   'Aerosols (Ci)',
     &                 xngrp_release(5),
     &                 xngrp_release(5) / total_release_time

                  END IF
	            write(out_unit,'(1x,a,i3,a,7x,1pe12.4)') 
     &              'Dose Effective (Ci) I-',iatmwt,' (Thyroid)', 
     &              de_I131(1) 
	            write(out_unit,'(1x,a,i3,a,1pe13.4)') 
     &              'Dose Effective (Ci) I-',iatmwt,
     &              ' (ICRP2 Thyroid)',
     &              de_I131(2) 
	            write(out_unit,'(1x,a,33x,1pe12.4)') 'Total I (Ci)'
     &             , raw_i
             else

C                 edit atmosphere and spray deposition (into sump)

                  IF (IUNITS .EQ. 0) THEN
                    write(out_unit, '(1x, a, f9.4, 4x, a)')
     &                 'Time (h) =',time,
     &                 'Atmosphere     Sump     '
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Noble gases (atoms)',
     &                 xngrp(1, dcomp, 1, NSTEP),
     &                 xngrp(1, dcomp, 2, NSTEP)
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Elemental I (atoms)',
     &                 xngrp(2, dcomp, 1, NSTEP),
     &                 xngrp(2, dcomp, 2, NSTEP)
                    write(out_unit, '(1x, a, 4x, 1p2e12.4)')
     &                 'Organic I (atoms)',
     &                 xngrp(3, dcomp, 1, NSTEP),
     &                 xngrp(3, dcomp, 2, NSTEP)
                   write(out_unit, '(1x, a, 8x, 1p2e12.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 1, NSTEP),
     &                   xngrp(5, dcomp, 2, NSTEP)
                  ELSE
                    write(out_unit, '(1x, a, f9.4, 4x, a)')
     &                 'Time (h) =',time,
     &                 'Atmosphere     Sump     '
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Noble gases (Ci)   ',
     &                 xngrp2(1, dcomp, 1),
     &                 xngrp2(1, dcomp, 2)
                    write(out_unit, '(1x, a, 2x, 1p2e12.4)')
     &                 'Elemental I (Ci)   ',
     &                 xngrp2(2, dcomp, 1),
     &                 xngrp2(2, dcomp, 2)
                    write(out_unit, '(1x, a, 4x, 1p2e12.4)')
     &                 'Organic I (Ci)   ',
     &                 xngrp2(3, dcomp, 1),
     &                 xngrp2(3, dcomp, 2)
                   write(out_unit, '(1x, a, 8x, 1p2e12.4)')
     &                   'Aerosols (Ci)',
     &                   xngrp2(5, dcomp, 1),
     &                   xngrp2(5, dcomp, 2)
                    write(out_unit, '(1x, a, 8x, 1p2e12.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 1, NSTEP),
     &                   xngrp(5, dcomp, 2, NSTEP)
                  END IF

	            write(out_unit,'(/ 1x,a,i3,a,11x,1pe12.4)') 
     &              'Dose Effective (Ci/cc) I-',iatmwt,' (Thyroid)', 
     &               de_I131(1)/(compartment_volume(dcomp)*1.0e6) 

	            write(out_unit,'(1x,a,i3,a,3x,1pe14.4)') 
     &              'Dose Effective (Ci/cc) I-',iatmwt,
     &              ' (ICRP2 Thyroid)',
     &               de_I131(2)/(compartment_volume(dcomp)*1.0e6) 
	            write(out_unit,'(1x,a,36x,1pe12.4)') 
     &              'Total I  (Ci)', raw_i 

c             test if recirculating or deposition turned on
c
                  if (c_filter_eff_model(dcomp) +
     &                    deposit_aerosol_model(dcomp).gt.0) then

                    IF (IUNITS .EQ. 0) THEN
                      write(out_unit, '(/, 24x, a)')
     &                   'Deposition Recirculating'
                      write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                   'Time (h) =',time,
     &                   'Surfaces     Filter'
                      write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                   'Noble gases (atoms)',
     &                   xngrp(1, dcomp, 4, NSTEP),
     &                   xngrp(1, dcomp, 5, NSTEP)
                      write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                   'Elemental I (atoms)',
     &                   xngrp(2, dcomp, 4, NSTEP),
     &                   xngrp(2, dcomp, 5, NSTEP)
                      write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                   'Organic I (atoms)',
     &                   xngrp(3, dcomp, 4, NSTEP),
     &                   xngrp(3, dcomp, 5, NSTEP)
                     write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 4, NSTEP),
     &                   xngrp(5, dcomp, 5, NSTEP)
                    ELSE
                      write(out_unit, '(/, 24x, a)')
     &                   'Deposition Recirculating'
                      write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                   'Time (h) =',time,
     &                   'Surfaces     Filter'
                      write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                   'Noble gases (Ci)   ',
     &                   xngrp2(1, dcomp, 4),
     &                   xngrp2(1, dcomp, 5)
                      write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                   'Elemental I (Ci)   ',
     &                   xngrp2(2, dcomp, 4),
     &                   xngrp2(2, dcomp, 5)
                      write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                   'Organic I (Ci)   ',
     &                   xngrp2(3, dcomp, 4),
     &                   xngrp2(3, dcomp, 5)
                     write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                   'Aerosols (Ci)',
     &                   xngrp2(5, dcomp, 4),
     &                   xngrp2(5, dcomp, 5)
                      write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 4, NSTEP),
     &                   xngrp(5, dcomp, 5, NSTEP)
                    END IF

                  end if

	    end if

C              Print out transport group detail for any pathways
C              with sub-compartments entering or exiting this
C              compartment. (dcomp)
C
          do j = 1, number_of_pathways, 1
              if ((pathway_to(j) .eq. dcomp) .or.
     &                  (pathway_from(j) .eq. dcomp)) then

                    IF (pathway_type(j) .eq. 1) THEN
                         IF (IUNITS.EQ.0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 1x, a, f9.4, 4x, a)')
     &                        'Time (h) =',time,
     &                        'Pipe Walls  Transported'
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1, j, nstep),pthgrp(1, j, 3)
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2, j, nstep),pthgrp(2, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3, j, nstep),pthgrp(3, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 1x, a, f9.4, 4x, a)')
     &                        'Time (h) =',time,
     &                        'Pipe Walls  Transported'
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1, j, nstep),pthgrp2(1, j, 3)
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2, j, nstep),pthgrp2(2, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3, j, nstep),pthgrp2(3, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5, j, nstep),pthgrp2(5, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         END IF

                    ELSE IF (pathway_type(j) .eq. 2) THEN

                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 25x, a)')
     &                        ' Pathway'
                           write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                        'Time (h) =',time,
     &                        'Filtered   Transported'
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1, j, nstep),pthgrp(1, j, 3)
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2, j, nstep),pthgrp(2, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3, j, nstep),pthgrp(3, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 25x, a)')
     &                        ' Pathway'
                           write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                        'Time (h) =',time,
     &                        'Filtered   Transported'
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1, j, nstep),pthgrp2(1, j, 3)
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2, j, nstep),pthgrp2(2, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3, j, nstep),pthgrp2(3, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5, j, nstep),pthgrp2(5, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         END IF

                    ELSE IF (pathway_type(j) .eq. 3) THEN

                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        'Generic  Transported'
                           write(out_unit, '(/, 1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1, j, nstep),pthgrp(1, j, 3)
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2, j, nstep),pthgrp(2, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3, j, nstep),pthgrp(3, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        'Generic  Transported'
                           write(out_unit, '(/, 1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1, j, nstep),pthgrp2(1, j, 3)
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2, j, nstep),pthgrp2(2, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3, j, nstep),pthgrp2(3, j, 3)
                         write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5, j, nstep),pthgrp2(5, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         END IF

                    ELSE IF (pathway_type(j) .eq. 6) THEN
                         all_iodine_g = pthgrp(2,j, nstep) +
     &                           pthgrp(3,j,nstep) + pthgrp(4,j,nstep)
                         all_iodine_t = pthgrp(2,j, 3) +
     &                           pthgrp(3,j, 3) + pthgrp(4,j, 3)
                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        'Generic  Transported'
                           write(out_unit, '(/, 1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1, j, nstep),pthgrp(1, j, 3)
                           write(out_unit, '(1x, a, 2x, 1p3e12.4)')
     &                        'All Iodine (atoms) ',
     &                        all_iodine_g, all_iodine_t
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        'Generic  Transported'
                           write(out_unit, '(/, 1x, a, 2x, 1p3e12.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1, j, nstep),pthgrp2(1, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'All Iodine (atoms) ',
     &                        all_iodine_g, all_iodine_t
                         write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5, j, nstep),pthgrp2(5, j, 3)
                           write(out_unit, '(1x, a, 8x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, nstep),pthgrp(5, j, 3)
                         END IF


                    ELSE IF (pathway_type(j) .eq. 4) THEN

                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 2x, a)')
     &                        'Time (h) =',time,
     &                        'Leakage Transport'
                           write(out_unit, '(/, 1x, a, 4x, 1p3e12.4)')
     &                        'Noble gases (atoms)',
     &                         pthgrp(1, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2, j, 3)
                           write(out_unit, '(1x, a, 6x, 1p3e12.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3, j, 3)
                          write(out_unit, '(1x, a, 10x, 1p3e12.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5, j, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(j)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 2x, a)')
     &                        'Time (h) =',time,
     &                        'Leakage Transport'
                           write(out_unit, '(/, 1x, a, 4x, 1p3e12.4)')
     &                        'Noble gases (Ci)   ',
     &                         pthgrp2(1, j, 3)
                           write(out_unit, '(1x, a, 4x, 1p3e12.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2, j, 3)
                           write(out_unit, '(1x, a, 6x, 1p3e12.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3, j, 3)
                           write(out_unit, '(1x, a, 10x, 1p3e12.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5, j, 3)

                         END IF

                     END IF
              end if
          end do

        end if      ! NO DETAIL
      end do

C                   end all detailed compartments

C                    End of Detailed prints of nuclide results




      end
