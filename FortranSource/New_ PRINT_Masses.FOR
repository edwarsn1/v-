C     ------------------------------------------------------------------
C
C     Subroutine:  New_PRINT_MASSES
C
C     ------------------------------------------------------------------
C
C     Author(s):   Terry Heames
C                  ALION / ITSO
C                  (505) 872-1089
C
C     Description: This routine is called when iclass = 0 and 
C                  edits the detail mass distribution.
C                  output contains information about nuclide, and
C                  transport group inventories for each compartment for
C                  which detailed output is requested.
C
C     Usage:       call new_print_masses(nstep, ncycle, ecomp, simtim, 
C                     deltat, time, endtim, total_release_time, exposure,  
C                     xn, xn_release, xngrp, xngrp_release, path, pthgrp)  
C
C     Inputs:
C
C     Outputs:
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
C
c                  iclass = 1  version 1.0-3.03 
C                           0  version 3.10
c                  iunits = 0  version 1.0-3.03
C                           1  only Curies edited (version 3.10)
c                          -1  switch to compare with original results using
c                             input stream
C
C                  xn_release = total amount of each nuclide released 
C                               to the environment (atoms) 
C
C     Calls:
C
C     Assumptions:
C
C     Version:     3.10
C
C     Date:        June 2004
C
C     Revision
C     History:     
C
C
C     ------------------------------------------------------------------

      SUBROUTINE NEW_PRINT_MASSES (nstep, ncycle, ecomp, simtim, 
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
      double precision exposure(MAXNUC, MAXCOMP)

      integer total_steps
      integer name_length, tempcount, temp_index

      character* 21 printname1, printname2, printname3
      character* 100 line

      double precision delta_time, current_time, end_time

      integer number_of_steps, index_current, index_end, istep

      integer i, j, icmp, dcomp, ecomp, k, kd, kdep

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
      dimension  npath(MAX_DETAIL)
	character*13 xname(MAX_DETAIL)
      character*13 xname_comp, xname_path, xname_expos, xname_decay

	dimension xngrp_net(MAXCLOC), pthgrp_net(MAXPATH)
      double precision xngrp_net, pthgrp_net, tot_nucl, xmass, xnedit
      double precision expos_net

      integer locc, iuc, ilc

C     setup dose equivalent I 131 calculation, find thyroid dose for both 
C                                      ICRP2 (TID-14844) and from input .NIF file
C
      double precision raw_i, dumm1
      double precision de_I131(2), dcf_I131(2), dcf_icrp2(5)
	integer iatmwt 
	data dcf_icrp2 / 4.014e-7, 1.447e-8, 1.073e-7, 6.857e-9, 3.338e-8/




C     check for last step (turn on additional edits)  class = 0 is new edits
C
      Last_step = 0
	if (simtim+deltat(nstep) .ge. endtim) then
         Last_Step=1
	end if
c
	xname_comp = ' Compartment'
	xname_path = ' Pathway '
      xname_expos = '  Exposure  '
      xname_decay = '   Decays '

c          EDIT the mass deposited around the compartments
C
      do DCOMP = 1, Number_of_Compartments, 1

        IF(compartment_detail(DCOMP) .EQ. 1  .OR.
     &      (compartment_detail(DCOMP).EQ.2.and.Last_Step.eq.1)) THEN
c
C               new V310 edits were chosen 

            if (dcomp.ne.ecomp) then
C     not environment
C
c        determine number of compartment deposition locations (kdep)
c
               expos_net = 0.0
               do n_nuc = 1, NUMBER_OF_NUCLIDES, 1
                  expos_net = expos_net + exposure(n_nuc,dcomp)
               end do
               kdep = 0
               do jj = 1, MAXCLOC, 1
			   xngrp_net(jj) = 0.0
                 if (jj.eq.1) xngrp_net(jj) = expos_net
			   do kk = 1, MAXTGRP, 1 
			      xngrp_net(jj) = xngrp_net(jj) + 
     &				                  xngrp2(kk,dcomp,jj)
		       end do 
			   if (xngrp_net(jj).gt.0.0) then
			     kdep = kdep + 1
	             npath(kdep) = jj
                   if (jj.eq.1) then
                           xname(kdep) = '  Atomsphere '
                           kdep = kdep + 1
	                     npath(kdep) = jj
                           xname(kdep) = '    (Ci-hr)  '
                           IF (No_Decay .GT. 1) THEN
                              kdep = kdep + 1
                              xname(kdep) = '    (Bq-s)   '
                           END IF
                   end if
                   if (jj.eq.2) xname(kdep) = '     Sump    '
                   if (jj.eq.4) xname(kdep) = ' Dep Surfaces'
                   if (jj.eq.5) xname(kdep) = ' Recirc Filtr'
	           end if
	         end do          	   
 
C       kdep should = 2 (atm/ecpos) + 1 for decay + 1 (per dep location)  
C                    i.e. is between 2 and 4.
	   
c       determine number of deposition pathways (jdep > = 0)
c
               kdep = max(2,kdep)

               jdep = 0
			 do ipth = 1, NUMBER_OF_PATHWAYS, 1
			   pthgrp_net(ipth) = 0.0

c       check if IPTH is connected to the compartment DCOMP

	           if (pathway_from(ipth) .eq. dcomp .or.
     &                 pathway_to(ipth) .eq. dcomp) then
                   lnam = 0
				 do kk = 1, MAXTGRP, 1
				   pthgrp_net(ipth) = pthgrp_net(ipth) + 
     &                                          pthgrp2(kk,ipth,nstep)  
                   end do
	           end if
	           if (pthgrp_net(ipth) .gt. 0.0) then 
			     jdep = jdep + 1
	             npath(jdep+kdep) = ipth
	             lnam = pathway_type(ipth)
                   if (lnam.eq.1) xname(jdep+kdep) = '  Pipe Walls '
                   if (lnam.eq.2) xname(jdep+kdep) = '    Filter   '
                   if (lnam.eq.3) xname(jdep+kdep) = '    Generic  '
                   if (lnam.eq.4) xname(jdep+kdep) = '  Convection '
                   if (lnam.eq.5) xname(jdep+kdep) = '             '
	           end if

	         end do

c        I haven't decided what to do if I have more than MAX_DETAIL 
C        deposition locations related to compartment DCOMP       

               ndep_tot = min(MAX_DETAIL,jdep+kdep)
c
c       initialize edited mass (xmass)
c
               K=0
         	     tot_nucl(1) = 0.0d0
               expos_net = 0.0
               do n_nuc = 1, NUMBER_OF_NUCLIDES, 1
                  expos_net = expos_net + exposure(n_nuc,dcomp)
                  xmass(n_nuc,1) = 0.0
               end do

               do jj = 1, MAXCLOC, 1
                 IF( xngrp_net(jj) .gt.0) THEN
                   K=K+1
           	     tot_nucl(K) = 0.0d0
                   do n_nuc = 1, NUMBER_OF_NUCLIDES, 1
                      xmass(n_nuc,K) = xn2(n_nuc,dcomp,jj) 
           	        tot_nucl(K) = tot_nucl(K) + xmass(n_nuc,K)
                   end do
                   IF (K.eq.1) THEN
                      K = 2
           	        tot_nucl(K) = 0.0d0
                      IF (No_Decay.eq.2) THEN
                         K=3
                         tot_nucl(K) = 0.0d0
                      END IF
                      KD = K+1
                   END IF
                 END IF
			 end do	            
               K = MAX(2,K)

			 do ipth = 1, NUMBER_OF_PATHWAYS, 1
	           if (pthgrp_net(ipth) .gt. 0.0 .and. K.lt.8) then
                   K=K+1
           	     tot_nucl(K) = 0.0d0
                   do n_nuc = 1, NUMBER_OF_NUCLIDES, 1
                      xmass(n_nuc,K) = path2(n_nuc,ipth,NSTEP)
           	        tot_nucl(K) = tot_nucl(K) + xmass(n_nuc,K)
                   end do
			   end if
               end do
               write (out_unit, '(/,1x,2a,f9.4)'), 
     &              trim(compartment_name(dcomp)),
     &              ' Compartment Nuclide Inventory (Ci) '
     &              //' at Time (h) =', time 
               if (kdep.eq.2) write(out_unit,
     &           '(/,1x,3a, 7(1x,a9,I2,1x))') ' Nuclide   ',
     &            xname_comp,xname_expos,
     &            (xname_path,npath(j+kdep),j=1,jdep)
               IF (No_Decay .eq. 1) THEN
                 if (kdep.eq.3) write(out_unit,
     &             '(/,1x,4a, 7(1x,a9,I2,1x))') ' Nuclide   ',
     &              xname_comp,xname_expos,xname_comp,
     &              (xname_path,npath(j+kdep),j=1,jdep)
                 if (kdep.eq.4) write(out_unit,
     &             '(/,1x,5a, 7(1x,a9,I2,1x))') ' Nuclide   ', 
     &              xname_comp,xname_expos,xname_comp,xname_comp,
     &              (xname_path,npath(j+kdep),j=1,jdep)
                 write(out_unit,'(11x,8a13)') (xname(j),j=1,ndep_tot)
               ELSE
                 if (kdep.eq.3) write(out_unit,
     &             '(/,1x,4a, 7(1x,a9,I2,1x))') ' Nuclide   ',
     &              xname_comp,xname_expos,xname_decay,
     &              (xname_path,npath(j+kdep),j=1,jdep)
                 if (kdep.eq.4) write(out_unit,
     &             '(/,1x,5a, 7(1x,a9,I2,1x))') ' Nuclide   ',
     &              xname_comp,xname_expos,xname_decay,xname_comp,
     &              (xname_path,npath(j+kdep),j=1,jdep)
                 if (kdep.eq.5) write(out_unit,
     &             '(/,1x,6a, 7(1x,a9,I2,1x))') ' Nuclide   ', 
     &              xname_comp,xname_expos,xname_decay,xname_comp,
     &              xname_comp,(xname_path,npath(j+kdep),j=1,jdep)
                 write(out_unit,'(11x,8a13)') (xname(j),j=1,ndep_tot)
               END IF
	         do n_nuc = 1, NUMBER_OF_NUCLIDES, 1
				 xnedit = xmass(n_nuc,1)+xmass(n_nuc,ndep_tot)
                   if (ndep_tot.gt.3) xnedit = xnedit + 
     &                              xmass(n_nuc,ndep_tot-1)
 
                   if(abs(exposure(n_nuc,dcomp)).gt.1.0d-4
     &                .or. xnedit .gt. 1.0e-6)then 
                     IF (No_Decay.eq.1 .OR. KDEP .eq.2) THEN
                       write(out_unit,'(3x,a7,1p8e13.4,1x)')
     &                 nuclide_name(n_nuc),xmass(n_nuc,1),
     &                 exposure(n_nuc,dcomp),
     &                 (xmass(n_nuc,K),K=KD,ndep_tot)
                     ELSE
                       write(out_unit,'(3x,a7,1p8e13.4,1x)')
     &                 nuclide_name(n_nuc),xmass(n_nuc,1),
     &                 exposure(n_nuc,dcomp),gamma_beta(n_nuc,dcomp),
     &                 (xmass(n_nuc,K),K=KD,ndep_tot)
                     END IF
	             end if
               end do
               write(out_unit,'(2x,a8,1p8e13.4,1x)')
     &              ' Total  ',(tot_nucl(KD),KD=1,ndep_tot)

C
C     determine does equivalent of first iodine isotope
C
               de_i131(1) = 0.0
               de_i131(2) = 0.0
		     raw_i      = 0.0
               IF (tot_nucl(1) .gt. 1.0d-6) THEN
                 do j = 1, number_of_nuclides, 1
	              temp_index = atomic_weight(j) - 130
c
c     verify that nuclide is I-131, I-132, I-133, I-134, or I-135
c
	              IF (temp_index.gt.0 .and. temp_index.lt.6 
     &                                  .and. ngroup(j).eq.2) THEN
                       if (temp_index .eq.1) then
			     	    dcf_i131(1) = dcf_inhale(j,6)
	                    iatmwt = atomic_weight(j)
	                 end if

    	                 de_i131(1) = de_i131(1) + dcf_inhale(j,6)*
     &		     	    xn(j, dcomp, 1, nstep)* decay_constant(j)
	                 de_i131(2) = de_i131(2) + dcf_icrp2(temp_index)*
     &		     	    xn(j, dcomp, 1, nstep)* decay_constant(j)
	                 raw_i = raw_i + xn(j, dcomp, 1, nstep)* 
     &                     decay_constant(j) / CITOBQS
                    END IF
                 end do

                 de_i131(1) = de_I131(1)/CITOBQS / dcf_I131(1)
                 de_i131(2) = de_I131(2)/CITOBQS / dcf_icrp2(1)

	           write(out_unit,'(/ 1x,a,i3,a,11x,1pe12.4)') 
     &             'Dose Effective (Ci/cc) I-',iatmwt,' (Thyroid)', 
     &              de_I131(1)/(compartment_volume(dcomp)*1.0e6) 

	           write(out_unit,'(1x,a,i3,a,3x,1pe14.4)') 
     &             'Dose Effective (Ci/cc) I-',iatmwt,' (ICRP2 Thyroid)'
     &             ,de_I131(2)/(compartment_volume(dcomp)*1.0e6) 
	           write(out_unit,'(1x,a,36x,1pe12.4)') 
     &             'Total I  (Ci)', raw_i 
               END IF

            else
C      Environment

               write(out_unit, '(/, 1x, 2a)')
     &              trim(compartment_name(dcomp)),
     &              ' Integral Nuclide Release:'
               write(out_unit, '(/, 1x, a, f9.4, 6x, a)')
     &            'Time (h) =', time,
     &            ' Ci           kg         Atoms       Ci-hr'

		     do j = 1, number_of_nuclides, 1
                   xnedit = xn_release(j)* decay_constant(j) / CITOBQS
                   tot_nucl(1) = tot_nucl(1) + xnedit
                   IF (dabs(exposure(j,dcomp)).gt.1.0d-4
     &                .or. xnedit .gt. 1.0e-6)then 

                        write(out_unit, '(3x, a7, 12x, 1p4e12.4)')
     &                     nuclide_name(j),
     &                     xn_release(j)* decay_constant(j) / CITOBQS,
     &                     xn_release(j) / AVOGADRO *
     &                           atomic_weight(j) / 1.0d3,
     &                     xn_release(j) ,
     &                     exposure(j,dcomp)
                    END IF
               end do
            end if     !  all compartments with Detail on



            if (tot_nucl(1) .gt. 1.0e-6) write(out_unit, '(/, 1x, 2a)')
     &            trim(compartment_name(dcomp)),
     &            ' Compartment Group Inventory Distribution:'

C              If it is an environement compartment then print out
C              the present release, release rate and total released.
            if(dcomp .eq. ecomp) then
C     Environment
               IF (tot_nucl(1) .gt. 1.0d-6) THEN
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
                    write(out_unit, '(1x, a, 4x, 1p2e12.4)')
     &                  'Aerosol I (atoms)',
     &                  xngrp_release(4),
     &                   xngrp_release(4) / total_release_time
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
                    write(out_unit, '(1x, a, 4x, 1p2e12.4)')
     &                  'Aerosol I (Ci)   ',
     &                  xngrp_release(4),
     &                   xngrp_release(4) / total_release_time
                    write(out_unit, '(1x, a, 8x, 1p2e12.4)')
     &                   'Aerosols (Ci)',
     &                 xngrp_release(5),
     &                 xngrp_release(5) / total_release_time

                  END IF
               END IF

             else
C     Not environment
C                 edit atmosphere and spray deposition (into sump)

               IF (tot_nucl(1) .gt.1.0d-6) THEN
                  IF (IUNITS .EQ. 0) THEN
                    write(out_unit, '(/ 1x, a, f9.4, 4x, a)')
     &                 'Time (h) =',time,
     &                 '  Atmosphere      Sump     '
                    write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                 'Noble gases (atoms)',
     &                 xngrp(1, dcomp, 1, NSTEP),
     &                 xngrp(1, dcomp, 2, NSTEP)
                    write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                 'Elemental I (atoms)',
     &                 xngrp(2, dcomp, 1, NSTEP),
     &                 xngrp(2, dcomp, 2, NSTEP)
                    write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                 'Organic I (atoms)',
     &                 xngrp(3, dcomp, 1, NSTEP),
     &                 xngrp(3, dcomp, 2, NSTEP)
                    write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                   'Aerosol I (atoms)',
     &                   xngrp(4, dcomp, 1, NSTEP),
     &                   xngrp(4, dcomp, 2, NSTEP)
                    write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 1, NSTEP),
     &                   xngrp(5, dcomp, 2, NSTEP)
                  ELSE
                    write(out_unit, '(/ 1x, a, f9.4, 4x, a)')
     &                 'Time (h) =',time,
     &                 '  Atmosphere      Sump     '
                    write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                 'Noble gases (Ci)   ',
     &                 xngrp2(1, dcomp, 1),
     &                 xngrp2(1, dcomp, 2)
                    write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                 'Elemental I (Ci)   ',
     &                 xngrp2(2, dcomp, 1),
     &                 xngrp2(2, dcomp, 2)
                    write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                 'Organic I (Ci)   ',
     &                 xngrp2(3, dcomp, 1),
     &                 xngrp2(3, dcomp, 2)
                    write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                   'Aerosol I (Ci)   ',
     &                   xngrp2(4, dcomp, 1),
     &                   xngrp2(4, dcomp, 2)
                    write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                   'Aerosols (Ci)',
     &                   xngrp2(5, dcomp, 1),
     &                   xngrp2(5, dcomp, 2)
                    write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 1, NSTEP),
     &                   xngrp(5, dcomp, 2, NSTEP)
                  END IF


c             test if recirculating or deposition turned on
c
                  if (c_filter_eff_model(dcomp) +
     &                    deposit_aerosol_model(dcomp).gt.0) then

                    IF (IUNITS .EQ. 0) THEN
                      write(out_unit, '(/, 24x, a)')
     &                   '  Deposition  Recirculating'
                      write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                   'Time (h) =',time,
     &                   '  Surfaces      Filter'
                      write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                   'Noble gases (atoms)',
     &                   xngrp(1, dcomp, 4, NSTEP),
     &                   xngrp(1, dcomp, 5, NSTEP)
                      write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                   'Elemental I (atoms)',
     &                   xngrp(2, dcomp, 4, NSTEP),
     &                   xngrp(2, dcomp, 5, NSTEP)
                      write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                   'Organic I (atoms)',
     &                   xngrp(3, dcomp, 4, NSTEP),
     &                   xngrp(3, dcomp, 5, NSTEP)
                      write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                    'Aerosol I (atoms)',
     &                    xngrp(4, dcomp, 4, NSTEP),
     &                    xngrp(4, dcomp, 5, NSTEP)
                      write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 4, NSTEP),
     &                   xngrp(5, dcomp, 5, NSTEP)
                    ELSE
                      write(out_unit, '(/, 24x, a)')
     &                   '  Deposition  Recirculating'
                      write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                   'Time (h) =',time,
     &                   '  Surfaces      Filter'
                      write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                   'Noble gases (Ci)   ',
     &                   xngrp2(1, dcomp, 4),
     &                   xngrp2(1, dcomp, 5)
                      write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                   'Elemental I (Ci)   ',
     &                   xngrp2(2, dcomp, 4),
     &                   xngrp2(2, dcomp, 5)
                      write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                   'Organic I (Ci)   ',
     &                   xngrp2(3, dcomp, 4),
     &                   xngrp2(3, dcomp, 5)
                      write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                    'Aerosol I (Ci)   ',
     &                    xngrp2(4, dcomp, 4),
     &                    xngrp2(4, dcomp, 5)
                      write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                   'Aerosols (Ci)',
     &                   xngrp2(5, dcomp, 4),
     &                   xngrp2(5, dcomp, 5)
                      write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                   'Aerosols (kg)',
     &                   xngrp(5, dcomp, 4, NSTEP),
     &                   xngrp(5, dcomp, 5, NSTEP)
                    END IF

                  end if
               END IF
             END IF
	    end if
      END DO

C              Print out transport group detail for any pathways
C              with sub-compartments entering or exiting this
C              compartment. (dcomp)
C
      DO NPTH = 1, number_of_pathways, 1
         IF (Pathway_detail(NPTH) .EQ. 2  .OR.
     &      (Pathway_detail(NPTH).EQ.3.and.Last_Step.eq.1) ) THEN
C
C         edit path nuclide distribution
C
	      lnam = pathway_type(NPTH)
            if (lnam.eq.1) xname(MAX_DETAIL) = '  Pipe Walls '
            if (lnam.eq.2) xname(MAX_DETAIL) = '    Filter   '
            if (lnam.eq.3) xname(MAX_DETAIL) = '    Generic  '
            if (lnam.eq.4) xname(MAX_DETAIL) = '  Convection '
            write (out_unit, '(/,1x,2a,f9.4)'), 
     &           trim(pathway_name(NPTH)),
     &           ' Pathway Nuclide Inventory (Ci) '
     &            //' at Time (h) =', time 
            IF (No_Decay .eq. 1) THEN
              write(out_unit,'(/,1x,2a)')   ' Nuclide   ',
     &              xname(MAX_DETAIL)
              do n_nuc = 1, number_of_nuclides, 1
                 xnedit = path(n_nuc,NPTH,NSTEP)
                 IF (dabs(xnedit) .gt. 1.0d4) 
     &              write(out_unit, '(3x, a7, 1pe14.4, 2x)')
     &              nuclide_name(n_nuc),path2(n_nuc,NPTH,NSTEP)
              end do
            ELSE
              write(out_unit,'(/,1x,3a)')   ' Nuclide   ',
     &              xname(MAX_DETAIL),xname_decay
              do n_nuc = 1, number_of_nuclides, 1
                 xnedit=path(n_nuc,NPTH,NSTEP)+gamma_beta_p(n_nuc,NPTH)
                 IF (dabs(xnedit) .gt. 1.0d4) 
     &              write(out_unit, '(3x, a7, 1pe14.4, e12.4)')
     &              nuclide_name(n_nuc),path2(n_nuc,NPTH,NSTEP),
     &              gamma_beta_p(n_nuc,NPTH)
              end do
            END IF
         END IF

         IF (Pathway_detail(NPTH) .EQ. 1  .OR.
     &       Pathway_detail(NPTH) .EQ. 2  .OR.
     &      (Pathway_detail(NPTH).EQ.3.and.Last_Step.eq.1) ) THEN

	            IF (pathway_type(NPTH) .eq. 1) THEN
                         IF (IUNITS.EQ.0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 1x, a, f9.4, 4x, a)')
     &                        'Time (h) =',time,
     &                        '  Pipe Walls   Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1,NPTH, nstep),pthgrp(1,NPTH, 3)
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2,NPTH, nstep),pthgrp(2,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3,NPTH, nstep),pthgrp(3,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (atoms)',
     &                        pthgrp(4,NPTH, nstep),pthgrp(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 1x, a, f9.4, 4x, a)')
     &                        'Time (h) =',time,
     &                        '  Pipe Walls   Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1,NPTH, nstep),pthgrp2(1,NPTH, 3)
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2,NPTH, nstep),pthgrp2(2,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3,NPTH, nstep),pthgrp2(3,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (Ci)   ',
     &                        pthgrp2(4,NPTH, nstep),pthgrp2(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5,NPTH, nstep),pthgrp2(5,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         END IF

                  ELSE IF (pathway_type(NPTH) .eq. 2) THEN

                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 25x, a)')
     &                        '   Pathway'
                           write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                        'Time (h) =',time,
     &                        '  Filtered    Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1,NPTH, nstep),pthgrp(1,NPTH, 3)
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2,NPTH, nstep),pthgrp(2,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3,NPTH, nstep),pthgrp(3,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (atoms)',
     &                        pthgrp(4,NPTH, nstep),pthgrp(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(/, 25x, a)')
     &                        '   Pathway'
                           write(out_unit, '(1x, a, f9.4, 5x, a)')
     &                        'Time (h) =',time,
     &                        '  Filtered    Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1,NPTH, nstep),pthgrp2(1,NPTH, 3)
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2,NPTH, nstep),pthgrp2(2,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3,NPTH, nstep),pthgrp2(3,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (Ci)   ',
     &                        pthgrp2(4,NPTH, nstep),pthgrp2(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5,NPTH, nstep),pthgrp2(5,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         END IF

	                ELSE IF (pathway_type(NPTH) .eq. 3) THEN

                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        ' Generic    Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1,NPTH, nstep),pthgrp(1,NPTH, 3)
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2,NPTH, nstep),pthgrp(2,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3,NPTH, nstep),pthgrp(3,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (atoms)',
     &                        pthgrp(4,NPTH, nstep),pthgrp(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        ' Generic    Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1,NPTH, nstep),pthgrp2(1,NPTH, 3)
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2,NPTH, nstep),pthgrp2(2,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3,NPTH, nstep),pthgrp2(3,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (Ci)   ',
     &                        pthgrp2(4,NPTH, nstep),pthgrp2(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5,NPTH, nstep),pthgrp2(5,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         END IF

	                ELSE IF (pathway_type(NPTH) .eq. 6) THEN
                         all_iodine_g = pthgrp(2,NPTH, nstep) +
     &                      pthgrp(3,NPTH,nstep) + pthgrp(4,NPTH,nstep)
                         all_iodine_t = pthgrp(2,NPTH, 3) +
     &                      pthgrp(3,NPTH,3) + pthgrp(4,NPTH,3)
                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        ' Generic    Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (atoms)',
     &                        pthgrp(1,NPTH, nstep),pthgrp(1,NPTH, 3)
                           write(out_unit, '(1x, a, 4x, 1p2e13.4)')
     &                        'All Iodine (atoms)',
     &                        all_iodine_g,all_iodine_t
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (atoms)',
     &                        pthgrp(4,NPTH, nstep),pthgrp(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 7x, a)')
     &                        'Time (h) =',time,
     &                        ' Generic    Transported'
                           write(out_unit, '(1x, a, 3x, 1p2e13.4)')
     &                        'Noble gases (Ci)   ',
     &                        pthgrp2(1,NPTH, nstep),pthgrp2(1,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'All Iodine (Ci)  ',
     &                        all_iodine_g,all_iodine_t
                           write(out_unit, '(1x, a, 5x, 1p2e13.4)')
     &                        'Aerosol I (Ci)   ',
     &                        pthgrp2(4,NPTH, nstep),pthgrp2(4,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5,NPTH, nstep),pthgrp2(5,NPTH, 3)
                           write(out_unit, '(1x, a, 9x, 1p2e13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, nstep),pthgrp(5,NPTH, 3)
                         END IF

                  ELSE IF (pathway_type(NPTH) .eq. 4) THEN

                         IF (IUNITS .EQ. 0) THEN
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 2x, a)')
     &                        'Time (h) =',time,
     &                        '  Leakage Transport'
                           write(out_unit, '(/, 1x, a, 5x, 1pe13.4)')
     &                        'Noble gases (atoms)',
     &                         pthgrp(1,NPTH, 3)
                           write(out_unit, '(1x, a, 5x, 1pe13.4)')
     &                        'Elemental I (atoms)',
     &                        pthgrp(2,NPTH, 3)
                           write(out_unit, '(1x, a, 7x, 1pe13.4)')
     &                        'Organic I (atoms)',
     &                        pthgrp(3,NPTH, 3)
                           write(out_unit, '(1x, a, 7x, 1pe13.4)')
     &                        'Aerosol I (atoms)',
     &                        pthgrp(4,NPTH, 3)
                           write(out_unit, '(1x, a, 11x, 1pe13.4)')
     &                        'Aerosols (kg)',
     &                        pthgrp(5,NPTH, 3)
                         ELSE
                           write(out_unit, '(/, 1x, 2a)')
     &                        trim(pathway_name(NPTH)),
     &                        ' Transport Group Inventory:'
                           write(out_unit, '(1x, a, f9.4, 2x, a)')
     &                        'Time (h) =',time,
     &                        '  Leakage Transport'
                           write(out_unit, '(/, 1x, a, 4x, 1pe13.4)')
     &                        'Noble gases (Ci)   ',
     &                         pthgrp2(1,NPTH, 3)
                           write(out_unit, '(1x, a, 4x, 1pe13.4)')
     &                        'Elemental I (Ci)   ',
     &                        pthgrp2(2,NPTH, 3)
                           write(out_unit, '(1x, a, 6x, 1pe13.4)')
     &                        'Organic I (Ci)   ',
     &                        pthgrp2(3,NPTH, 3)
                            write(out_unit, '(1x, a, 6x, 1pe13.4)')
     &                        'Aerosol I (Ci)   ',
     &                        pthgrp2(4,NPTH, 3)
                           write(out_unit, '(1x, a, 10x, 1pe13.4)')
     &                        'Aerosols (Ci)',
     &                        pthgrp2(5,NPTH, 3)
                         END IF

                  END IF

        END IF      ! NO DETAIL
      END DO


C                    End of Detailed prints of nuclide results


C                     end of NEW_PRINT_MASSES

      end
