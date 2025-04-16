C     ------------------------------------------------------------------
C
C     Subroutine:  printout
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C                  Accident Analysis / Consequence Assessment Department
C                  Albuquerque, NM 87185-0748
C                  (505) 844-7223
C
C                  Terry Heames
C                  Innovative Technology Solutions Corporation
C                  (505) 872-1089
C
C     Description: This routine handles all user requested radtrad
C                  output. All other output from all other routines
C                  should be for debug purposes only. This debug output
C                  will be interspersed amount the normal descriptive
C                  and dose output but should be completely turned off
C                  for most runs. Compartment detail output will be
C                  stored or printed after the dose output. The detail
C                  output contains information about nuclide, and
C                  transport group inventories for each compartment for
C                  which detailed output is requested.
C
C                  The descriptive information will describe the
C                  software, model, and scenario used to obtain the
C                  resulting output.
C
C                  The dose information will be the organ, whole body,
C                  and TEDE doses in Sv at the end of each user defined
C                  time step. Both doses acquired during the time step
C                  and accumulated will be given.
C
C                  If requested nuclide inventories will be given in
C                  atoms, kg, Ci, and Bq at the end of each user time
C                  step. Transport group inventories will be given in
C                  atoms and kg.
C
C     Usage:       call printout(nstep, ncycle, simtim, deltat,
C                     dose_wbod, dose_skin, dose_thyr, dose_tede,
C                     accd_wbod, accd_skin, accd_thyr, accd_tede,
C                     xn, xngrp, path,      pthgrp,    endtim)
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

      subroutine printout(nstep, ncycle, simtim, deltat,
     &   dose_wbod, dose_skin, dose_thyr, dose_tede,
     &   accd_wbod, accd_skin, accd_thyr, accd_tede,
     &   xn, xngrp, path,      pthgrp,    endtim)
C
      include 'full.com'
      integer nstep, ncycle
      double precision endtim
      double precision time
      double precision simtim, deltat(MAXSTEP)
      double precision dose_wbod(MAXDOSE, MAXSTEP)
      double precision dose_skin(MAXDOSE, MAXSTEP)
      double precision dose_thyr(MAXDOSE, MAXSTEP)
      double precision dose_tede(MAXDOSE, MAXSTEP)
      double precision accd_wbod(MAXDOSE)
      double precision accd_skin(MAXDOSE)
      double precision accd_thyr(MAXDOSE)
      double precision accd_tede(MAXDOSE)
      double precision xn(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision path(MAXNUC, MAXPATH, MAXSTEP+1)
      double precision pthgrp(MAXTGRP, MAXPATH, MAXSTEP+1)

C     This block of variables is used for the table output at 
C     the end of this file;  this is only done once at the end
C     of each run.

      integer ARRAY_SIZE, LOC_EAB, ION_EDIT
      integer Number_Dose_Edits, IPR_DUM(MAXDOSE+2), II1, II2, II3
      parameter(ARRAY_SIZE = 3000)
      double precision final_times(ARRAY_SIZE),time_edit
      double precision value_thyroid(MAXDOSE,ARRAY_SIZE)
      double precision value_tede(MAXDOSE, ARRAY_SIZE)
      double precision value_skin(MAXDOSE, ARRAY_SIZE)
      double precision value_wbod(MAXDOSE, ARRAY_SIZE)
      double precision value_i131(MAXCOMP,ARRAY_SIZE)

      integer total_steps
      integer name_length, tempcount, temp_index

      character* 21 printname1, printname2, printname3
      character* 100 line

      double precision delta_time, current_time, end_time
      double precision current_wbod, current_skin
      double precision current_thyroid, current_tede
      double precision end_wbod, end_skin, end_thyroid, end_tede
      double precision frac, fracm
C      double precision time_wbod(MAXDOSE)
C      double precision time_thyroid(MAXDOSE)
      double precision time_tede(MAXDOSE)
      double precision wbod_max(MAXDOSE)
      double precision skin_max(MAXDOSE)
      double precision thyroid_max(MAXDOSE)
      double precision tede_max(MAXDOSE)
      integer number_of_steps, index_current, index_end, istep

      integer i, j, icmp

C     These variables will be used to accumulated the doses from
C     one user defined time step to the next.

      double precision on_event_wbod(MAXDOSE)
      double precision on_event_skin(MAXDOSE)
      double precision on_event_thyr(MAXDOSE)
      double precision on_event_tede(MAXDOSE)
      save on_event_wbod, on_event_skin, on_event_thyr, on_event_tede

C     These variables will be used to accumulate the release to the
C     environment from one supplemental time step to the next.

      integer ecomp, detail_count
      double precision total_release_time
      double precision xn_release(MAXNUC)
      double precision xngrp_release(MAXTGRP)
      double precision exposure(MAXNUC, MAXCOMP)

      save detail_count
      save ecomp
      save xn_release, xngrp_release, exposure
C TJH save time_edit
      save time_edit

C    location the EAB
      integer locc, iuc, ilc

C     character banner * 72, format_string * 8
C     character date_result * 11, time_result * 11

      save total_steps, final_times, value_thyroid
      save value_tede, value_skin, value_wbod, value_i131



C     If this is the first cycle through the primary radcalc
C     calculation loop then initialize any printout variables,
C     open the appropriate scratch files, and print out the
C     descriptive software, model and scenario information.

      IF (ncycle .eq. 1) then

C        Clear the time step dose accumulators.

         if(Number_Dose_Locations .ge. 1) then
            Number_Dose_Edits = 0
            total_steps = 0
	      IPR_DUM(Number_Dose_Locations+1) = 99
	      IPR_DUM(Number_Dose_Locations+2) = 99
            do i = 1, Number_Dose_Locations, 1
               on_event_wbod(i) = 0.0d0
               on_event_skin(i) = 0.0d0
               on_event_thyr(i) = 0.0d0
               on_event_tede(i) = 0.0d0
	         IPR_DUM(i) = 99
               IF (location_xq_count(i) .ge. 1) THEN
                  Number_Dose_Edits = Number_Dose_Edits + 1
	            IPR_DUM(Number_Dose_Edits) = i
               END IF
            end do
         end if

C        Determine the environment compartment (ecomp is set to
C        zero if there is no environment).

         ecomp = 0
         detail_count = 0
         if (Number_of_Compartments .ge. 1) then
            do icmp = 1, Number_of_Compartments, 1
               if (compartment_detail(icmp) .gt.0) 
     &                               detail_count = detail_count + 1
               if(compartment_type(icmp) .eq. 2) ecomp = icmp
            end do
         end if
         if (Number_of_Pathways .gt. 0) then
            do npath = 1, Number_of_Pathways, 1	     
               if (pathway_detail(npath) .gt.0) 
     &                               detail_count = detail_count + 1
            end do
         end if


C        Clear the total release time and release accumulators.

         total_release_time = 0.0d0


	   write (out_unit, '(a)') char(12)
	   call print_header(2)
	   write (out_unit, '(////)')
         write(out_unit, '(5x, 1a)')
     &      ' ####   #    #  #####  #####   #    #  ##### ',
     &      '#    #  #    #    #    #    #  #    #    #   ',
     &      '#    #  #    #    #    #    #  #    #    #   ',
     &      '#    #  #    #    #    #####   #    #    #   ',
     &      '#    #  #    #    #    #       #    #    #   ',
     &      '#    #  #    #    #    #       #    #    #   ',
     &      ' ####    ####     #    #        ####     #   '
	   write (out_unit, '()')
         write(out_unit,'(/,10x,a80)') case_name

         if(detail_count .lt. 1) then
            write(out_unit, '(/,1x, 2a)')
     &         '##################################',
     &         '##################################'
            write(out_unit, '(31x, a)')
     &         'Dose Output'
         else
            write(out_unit, '(/,1x, 2a)')
     &         '##################################',
     &         '##################################'
            write(out_unit, '(12x, a)')
     &         'Dose, Detailed model and Detailed '
     &         // 'Inventory Output'
         end if
         write(out_unit, '(1x, 2a)')
     &      '##################################',
     &      '##################################'
c
c      Initialize final table edits
c
         ion_edit=1
         time_edit = simtim
         
         do i = 1, array_size
            final_times(i) = 0.0
         end do
C
C        Clear the exposure array.

         do icmp = 1, number_of_compartments, 1
            do n_nuc = 1, number_of_nuclides, 1
              exposure(n_nuc,icmp) = 0.0d0
	      end do
         end do
       
         do i = 1, number_of_nuclides, 1
            xn_release(i) = 0.0d0
         end do

         do i = 1, MAXTGRP, 1
            xngrp_release(i) = 0.0d0
         end do

      END IF
C 
C     end of first time step initialization 
C
C  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  
C
      IF (simtim .lt. endtim) THEN


C     For each time step, we'll update the time variable

        time = (simtim+deltat(nstep)+start_accident)/ 3.6d3

C     For each time step we'll next accumulate our on_event doses
C     and environment release, then we'll print stuff out if we are at
C     a user defined event or supplemental time step and the user has
C     requested ouput at either/or both time steps.

        total_release_time = total_release_time + deltat(nstep)

        if (Number_Dose_Locations .ge. 1) then

          do i = 1, Number_Dose_Locations, 1
            on_event_wbod(i) = on_event_wbod(i) + dose_wbod(i, nstep)
            on_event_skin(i) = on_event_skin(i) + dose_skin(i, nstep)
            on_event_thyr(i) = on_event_thyr(i) + dose_thyr(i, nstep)
            on_event_tede(i) = on_event_tede(i) + dose_tede(i, nstep)
          end do
        end if

        if (ecomp .ge. 1) then
          do i = 1, number_of_nuclides, 1
            xn_release(i) =
     &         xn_release(i) + xn(i, ecomp, 1, nstep)
          end do
         
          do i = 1, MAXTGRP, 1
             dum1 = xngrp2(i, ecomp, 1)
             IF (IUNITS .EQ. 0) dum1 = xngrp(i, ecomp, 1, NSTEP)
             xngrp_release(i) = xngrp_release(i) + dum1
          end do
        end if
C
C        fill the exposure array.(Ci*hr)

      do icmp = 1, number_of_compartments, 1
         do n_nuc = 1, number_of_nuclides, 1
           exposure(n_nuc,icmp) = exposure(n_nuc,icmp) + 
     &               deltat(nstep)/3600.* xn(n_nuc,icmp,1,nstep)*
     &                      decay_constant(n_nuc) / CITOBQS
	   end do
      end do
C
c
c  setup extra edits (for end tables only) for first 10 hours
c
        ion_edit = 0
        if (simtim .gt. time_edit-10.) then 
          ion_edit = 1
        endif

c
        IF (((show_event.eq.1).and.on_event).or.(ion_edit .eq. 1)) THEN
          if (total_steps .LT. ARRAY_SIZE) then
            total_steps = total_steps + 1
            time_edit = simtim + 900.
          endif
c
C TJH  adjust checked time
          if (simtim .gt. 10.0*3600.) time_edit = 1000.*3600.

          final_times(total_steps) = time
c
          do icmp = 1, number_of_compartments, 1
            do j = 1, number_of_nuclides, 1
               if (nuclide_name(j) .EQ. "I-131") then
                  if(icmp .eq.ecomp) then
                     value_i131(icmp,total_steps)=xn_release(j) *
     &                    decay_constant(j) / CITOBQS
                  else
                     value_i131(icmp,total_steps)=xn(j,icmp,1,nstep)*
     &                    decay_constant(j) / CITOBQS
                  end if
               end if
            end do
          end do
c 
C   Initialize dose values at first step to be 0.0
c
          if (total_steps .eq. 1) then
	      final_times(total_steps) = start_accident/3.60d3
	      do i = 1, Number_Dose_Locations, 1
              value_thyroid(i,total_steps)= 0.0
              value_tede(i,total_steps)= 0.0
              value_skin(i,total_steps)= 0.0
              value_wbod(i,total_steps)= 0.0
            end do
	    else       
            do i = 1, Number_Dose_Locations, 1
              value_thyroid(i,total_steps)=accd_thyr(i)*100.
              value_tede(i,total_steps)=accd_tede(i)*100.
              value_skin(i,total_steps)=accd_skin(i)*100.
              value_wbod(i,total_steps)=accd_wbod(i)*100.
            end do
	    end if
        END IF 
C
c 
c         check if this step is one that gets edited
c
        IF ( ((show_event .eq. 1) .and. on_event) .or. 
     &     ((show_step  .eq. 1) .and. on_step))   THEN
C
           IF (Show_Model .eq.1) THEN
C
C   MODEL   MODEL   MODEL   MODEL   MODEL   MODEL   MODEL   MODEL  
C
             Call PRINT_MODELS (nstep, simtim, deltat,
     &                          xn, xngrp, path, pthgrp, time)

           END IF


C   DOSE TIME    DOSE TIME    DOSE TIME    DOSE TIME    DOSE TIME    
C
C        Second  Print out the dose results by location and 
C                clear the on_event accumulators.
c
           if (Number_Dose_Locations .ge. 1) then

             IF (DETAIL_COUNT .gt.0) write(OUT_UNIT, '(/,a)')
     &   ' ********************************************************'
             do i = 1, Number_Dose_Locations, 1
               j = location_compartment_number(i)
c          skip normal compartments
CCCCC	         IF (compartment_type(j).ne.3) THEN
C   test for environment
	           IF (compartment_type(j).eq.2) THEN
                   IF (location_xq_count(i) .gt.0) THEN

                      write(out_unit, '(/, 1x, 2a)')
     &                  trim(location_name(i)), ' Doses:'
                      write(out_unit, '(/, 1x, a, f9.4, 4x, a)')
     &                  'Time (h) =', time,
     &                  'Whole Body   Thyroid       TEDE'
                   END IF
                 ELSE
C   must be an enclosed compartment
                   write(out_unit, '(/, 1x, 2a)')
     &              trim(location_name(i)), ' Doses:'
                   IF (ICLASS .EQ. 0) THEN
                     write(out_unit, '(/, 1x, a, f9.4, 4x, a)')
     &                'Time (h) =', time,
     &                'Whole Body   Thyroid       TEDE        Skin '
                   ELSE
                     write(out_unit, '(/, 1x, a, f9.4, 4x, a)')
     &                'Time (h) =', time,
     &                'Whole Body   Thyroid       TEDE '
                   END IF
                 END IF
                 if (LEVEL_PRINTOUT .LT. 1) then
                   if (on_event_wbod(i) .LT. 0) then
                     on_event_wbod(i) = 0
                   endif
                   if (on_event_skin(i) .LT. 0) then
                     on_event_skin(i) = 0
                   endif
                   if (on_event_thyr(i) .LT. 0) then
                     on_event_thyr(i) = 0
                   endif
                   if (on_event_tede(i) .LT. 0) then
                     on_event_tede(i) = 0
                   endif
                   if ( accd_wbod(i) .LT. 0) then
                     accd_wbod(i) = 0
                   endif
                   if ( accd_skin(i) .LT. 0) then
                     accd_skin(i) = 0
                   endif
                   if (accd_thyr(i) .LT. 0) then
                     accd_thyr(i) = 0
                   endif
                   if (accd_tede(i) .LT. 0) then
                     accd_tede(i) =0
                   endif
                 endif
C   test for environment
	           IF (compartment_type(j).eq.2) THEN
                   IF (location_xq_count(i) .gt.0) THEN
                      write(out_unit, '(1x, a, 6x, 1p3e12.4)')
     &                  'Delta dose (rem)', on_event_wbod(i)*100,
     &                  on_event_thyr(i)*100, on_event_tede(i)*100
                      write(out_unit, '(1x, a, 1p3e12.4)')
     &                  'Accumulated dose (rem)',
     &                  accd_wbod(i)*100,accd_thyr(i)*100,
     &                  accd_tede(i)*100
                   END IF
                 ELSE
C   must be an enclosed compartment
                   IF (ICLASS .EQ. 1) THEN
                     write(out_unit, '(1x, a, 6x, 1p3e12.4)')
     &                'Delta dose (rem)', on_event_wbod(i)*100,
     &                on_event_thyr(i)*100, on_event_tede(i)*100
                     write(out_unit, '(1x, a, 1p3e12.4)')
     &                'Accumulated dose (rem)',
     &                accd_wbod(i)*100,accd_thyr(i)*100,
     &                accd_tede(i)*100
                   ELSE
                     write(out_unit, '(1x, a, 6x, 1p4e12.4)')
     &                'Delta dose (rem)', on_event_wbod(i)*100,
     &                on_event_thyr(i)*100, on_event_tede(i)*100,
     &                on_event_skin(i)*100
                     write(out_unit, '(1x, a, 1p4e12.4)')
     &                'Accumulated dose (rem)',
     &                accd_wbod(i)*100,accd_thyr(i)*100,
     &                accd_tede(i)*100,accd_skin(i)*100
                   END IF
                 END IF
                 on_event_wbod(i) = 0.0d0
                 on_event_skin(i) = 0.0d0
                 on_event_thyr(i) = 0.0d0
                 on_event_tede(i) = 0.0d0
CCCCCCC               END IF
             end do         !  all dose locations
             IF (DETAIL_COUNT .gt.0) write(OUT_UNIT, '(/,a)')
     &   ' ********************************************************'
           end if

C   DOSE TIME    DOSE TIME    DOSE TIME    DOSE TIME    DOSE TIME    
C

c
C     Print the nuclide information
C
         IF (ICLASS .eq.1) THEN
            Call PRINT_MASSES (nstep, ncycle, ecomp, simtim,
     &             deltat, time, endtim, total_release_time, exposure,  
     &             xn, xn_release, xngrp, xngrp_release, path, pthgrp)  
         ELSE
            Call NEW_PRINT_MASSES (nstep, ncycle, ecomp, simtim,
     &             deltat, time, endtim, total_release_time, exposure,  
     &             xn, xn_release, xngrp, xngrp_release, path, pthgrp)  
         END IF	         


C                    End of Detailed prints of nuclide results
        end if

C      Last step, called from bottom of RADCALC

      else 
        write(out_unit, '(/,1x,i7)') ncycle
        write(out_unit, '(/,1x, 2a)')
     &    '##################################',
     &    '##################################'
        write(out_unit, '(30x, a)')
     &    "I-131 Summary"
        write(out_unit, '(1x, 2a)')
     &    '##################################',
     &    '##################################'
        do icmp = 1, number_of_compartments,3
          write(out_unit, '(1x)')
          name_length = len(compartment_name(icmp))
          do while(compartment_name(icmp)(name_length:name_length)
     &      .EQ." ")
            name_length = name_length - 1
          end do
          if (name_length .GE. 21) then
            printname1(1:21) = compartment_name(icmp)(1:21)
          else
            tempcount = ((21 - name_length) / 2)  + 1
            do j = 1, tempcount, 1
              printname1(j:j) = " "
            end do
            printname1(tempcount:(tempcount+name_length-1)) =
     &        compartment_name(icmp)(1:name_length)
            do j =(tempcount + name_length), 21, 1
              printname1(j:j) = " "
            end do
          endif
          temp_index = icmp + 1
          if (temp_index .LE. number_of_compartments) then
            name_length = len(compartment_name(temp_index))
            do while(compartment_name(temp_index)
     &        (name_length:name_length).EQ." ")
              name_length = name_length - 1
            end do
            if (name_length .GE. 21) then
              printname2(1:21)=compartment_name(temp_index)(1:21)
            else
              tempcount = ((21 - name_length) / 2)  + 1
              do j = 1, tempcount, 1
                printname2(j:j) = " "
              end do
              printname2(tempcount:(tempcount+name_length-1)) =
     &        compartment_name(temp_index)(1:name_length)
              do j =(tempcount + name_length), 21, 1
                printname2(j:j) = " "
              end do
            endif
          endif
          temp_index = icmp + 2
          if (temp_index .LE. number_of_compartments) then
            name_length = len(compartment_name(temp_index))
            do while(compartment_name(temp_index)
     &        (name_length:name_length).EQ." ")
              name_length = name_length - 1
            end do 
            if (name_length .GE. 21) then
              printname3(1:21)=compartment_name(temp_index)(1:21)
            else
              tempcount = ((21 - name_length) / 2)  + 1
              do j = 1, tempcount, 1
                printname3(j:j) = " "
              end do
              printname3(tempcount:(tempcount+name_length-1)) =
     &        compartment_name(temp_index)(1:name_length)
              do j =(tempcount + name_length), 21, 1
                printname3(j:j) = " "
              end do
            endif
          endif
          if ((icmp+2) .LE. number_of_compartments) then
            write(out_unit, '(11x,5a)') printname1," ",
     &        printname2," ",printname3
            write(out_unit, '(1x, a)')
     &        "Time (hr)    I-131 (Curies)         I-131 "
     &        //"(Curies)       I-131 (Curies)" 
          else if ((icmp+1) .LE. number_of_compartments) then
            write(out_unit, '(11x, 3a)') printname1," ",
     &        printname2
            write(out_unit, '(1x, a)')
     &        "Time (hr)    I-131 (Curies)         I-131 "
     &        //"(Curies)" 
          else
            write(out_unit, '(11x,1a)') printname1
            write(out_unit, '(1x, a)')
     &        "Time (hr)    I-131 (Curies)"
          endif
          do j = 1, (total_steps), 1
            if ((icmp+2) .LE. number_of_compartments) then
              write(out_unit,'(1x,f8.3,5x,1pe12.4,11x,e12.4,9x,e12.4)') 
     &          final_times(j),value_i131(icmp,j),
     &          value_i131(icmp+1,j),value_i131(icmp+2,j)
            else if ((icmp+1) .LE. number_of_compartments) then
              write(out_unit,'(1x,f8.3,5x,1pe12.4,11x,e12.4)') 
     &          final_times(j),value_i131(icmp,j),
     &          value_i131(icmp+1,j)
            else
              write(out_unit,'(1x,f8.3,5x,1pe12.4)') 
     &          final_times(j), value_i131(icmp,j)
            endif
          end do
        end do
        write(out_unit, '(/,1x, 2a)')
     &    '##################################',
     &    '##################################'
        write(out_unit, '(25x, a)')
     &    "Cumulative Dose Summary"
        write(out_unit, '(1x, 2a)')
     &    '##################################',
     &    '##################################'

        do II = 1, Number_Dose_Edits,3
           II1 = IPR_DUM(II)
           II2 = IPR_DUM(II + 1)
           II3 = IPR_DUM(II + 2)

             write(out_unit, '(1x)')
             name_length = len(location_name(II1))
             do while(location_name(II1)(name_length:name_length)
     &            .EQ." ")
                name_length = name_length - 1
             end do
             if (name_length .GE. 21) then
                printname1(1:21) = location_name(II1)(1:21)
             else
                tempcount = ((21 - name_length) / 2)  + 1
                do j = 1, tempcount, 1
                   printname1(j:j) = " "
                end do
                printname1(tempcount:(tempcount+name_length-1)) =
     &               location_name(II1)(1:name_length)
                do j =(tempcount + name_length), 21, 1
                   printname1(j:j) = " "
                end do
             endif

             if (II2 .LE. Number_Dose_Locations) then
                name_length = len(location_name(II2))
                do while(location_name(II2)
     &               (name_length:name_length).EQ." ")
                   name_length = name_length - 1
                end do
                if (name_length .GE. 21) then
                   printname2(1:21) = location_name(II2)(1:21)
                else
                   tempcount = ((21 - name_length) / 2)  + 1
                   do j = 1, tempcount, 1
                      printname2(j:j) = " "
                   end do
                   printname2(tempcount:(tempcount+name_length-1)) =
     &                  location_name(II2)(1:name_length)
                   do j =(tempcount + name_length), 21, 1
                      printname2(j:j) = " "
                   end do
                endif
             endif

             if (II3 .LE. Number_Dose_Locations) then
                name_length = len(location_name(II3))
                do while(location_name(II3)
     &               (name_length:name_length).EQ." ")
                   name_length = name_length - 1
                end do 
                if (name_length .GE. 21) then
                   printname3(1:21) = location_name(II3)(1:21)
                else
                   tempcount = ((21 - name_length) / 2)  + 1
                   do j = 1, tempcount, 1
                      printname3(j:j) = " "
                   end do
                   printname3(tempcount:(tempcount+name_length-1)) =
     &                  location_name(II3)(1:name_length)
                   do j =(tempcount + name_length), 21, 1
                      printname3(j:j) = " "
                   end do
                endif
             endif
             if (II3 .LE. Number_Dose_Locations) then
                write(out_unit, '(10x,5a)') printname1," ",
     &               printname2," ",printname3
                write(out_unit, '(1x, a)')
     &               "  Time    Thyroid      TEDE     Thyroid"
     &               //"      TEDE     Thyroid      TEDE"
                write(out_unit, '(1x, a)')
     &               "  (hr)     (rem)       (rem)     (rem) "
     &               //"      (rem)     (rem)       (rem)"
             else if (II2 .LE. Number_Dose_Locations) then
                write(out_unit, '(10x,3a)') printname1," ",
     &               printname2
                write(out_unit, '(1x, a)')
     &               "  Time    Thyroid      TEDE     Thyroid"
     &               //"      TEDE"
                write(out_unit, '(1x, a)')
     &               "  (hr)     (rem)       (rem)     (rem) "
     &               //"      (rem)"
             else
                write(out_unit, '(10x,1a)') printname1
                write(out_unit, '(1x, a)')
     &               "  Time    Thyroid      TEDE"
                write(out_unit, '(1x, a)')
     &               "  (hr)     (rem)       (rem)"
             endif

             do j = 1, (total_steps), 1
                if (II3 .LE. Number_Dose_Locations) then
                   write(out_unit,'(1x,f8.3,3(1x,1pe10.4,1x,1pe10.4))') 
     &                final_times(j),
     &                value_thyroid(II1,j),value_tede(II1,j),
     &                value_thyroid(II2,j),value_tede(II2,j),
     &                value_thyroid(II3,j),value_tede(II3,j)
                else if (II2 .LE. Number_Dose_Locations) then
                   write(out_unit,'(1x,f8.3,2(1x,1pe10.4,1x,1pe10.4))') 
     &                final_times(j),
     &                value_thyroid(II1,j),value_tede(II1,j),
     &                value_thyroid(II2,j),value_tede(II2,j)
                else
                   write(out_unit,'(1x,f8.3,1x,1pe10.4,1x,1pe10.4)') 
     &                final_times(j),
     &                value_thyroid(II1,j),value_tede(II1,j)
                endif
             end do

c          END IF
        end do

CNEB    Calculate doses during worst 2 hour period

        delta_time = 0.1d0
        number_of_steps = final_times(total_steps)/delta_time
        number_of_steps = number_of_steps - 2.0d0/delta_time + 1
	  number_of_steps = max(total_steps,number_of_steps)
C
C                 for each offsite dose location
C
        do II = 1, Number_Dose_Edits, 1
          J = IPR_DUM(II)
	    LOCC = LOCATION_COMPARTMENT_NUMBER(J)
          IF (COMPARTMENT_TYPE(LOCC) .EQ. 2) THEN
c      ENVIRONMENT
              current_time = start_accident/3600.0
              index_current = 1
              index_end = 1
              time_tede(j) = 0.0d0
              wbod_max(j) = 0.0d0
              thyroid_max(j) = 0.0d0
              tede_max(j) = 0.0d0

            do istep = 1, number_of_steps, 1
   10         continue
              if (final_times(index_current+1) .le. current_time) then
                 index_current = index_current + 1
                 if (index_current .lt. total_steps - 1) go to 10
	           exit
              end if
              if (current_time .lt. final_times(index_current)) then
                 current_wbod = value_wbod(j,index_current)
                 current_thyroid = value_thyroid(j,index_current)
                 current_tede = value_tede(j,index_current)
              else
                 frac = current_time - final_times(index_current)
                 frac = frac/(final_times(index_current+1) 
     &                   - final_times(index_current))
	           if (frac.gt.1.0d0) frac = 1.0d0
                 fracm = 1.0d0 - frac
                 current_wbod = value_wbod(j,index_current)*fracm
     &                     + value_wbod(j,index_current+1)*frac
                 current_thyroid = value_thyroid(j,index_current)*fracm
     &                        + value_thyroid(j,index_current+1)*frac
                 current_tede = value_tede(j,index_current)*fracm
     &                     + value_tede(j,index_current+1)*frac
              end if


              end_time = current_time + 2.0d0

   20         continue
              if (final_times(index_end+1) .lt. end_time) then
                 index_end = index_end + 1
                 if (index_end .lt. total_steps) go to 20
C
C     last computed time interval < current time + 2.

                 end_wbod = max(0.0,value_wbod(j,total_steps))
                 end_thyroid = max(0.0,value_thyroid(j,total_steps))
                 end_tede = max(0.0,value_tede(j,total_steps))
                 if (tede_max(j)+1.d-10 .lt. end_tede-current_tede) then                 time_tede(j) = current_time
                   time_tede(j) = current_time
                   wbod_max(j) = max(0.0,end_wbod-current_wbod)
                   thyroid_max(j) = max(0.0,end_thyroid-current_thyroid)
                   tede_max(j) = end_tede - current_tede
                 end if
	           exit
              end if
              if (end_time .lt. final_times(index_end)) then
                 end_wbod = value_wbod(j,index_end)
                 end_thyroid = value_thyroid(j,index_end)
                 end_tede = value_tede(j,index_end)
              else
                 frac = end_time - final_times(index_end)
                 frac = frac/(final_times(index_end+1) 
     &                   - final_times(index_end))
	           if (frac.gt.1.0d0) frac = 1.0d0
                 fracm = 1.0d0 - frac
                 end_wbod = value_wbod(j,index_end)*fracm
     &                 + value_wbod(j,index_end+1)*frac
                 end_thyroid = value_thyroid(j,index_end)*fracm
     &                    + value_thyroid(j,index_end+1)*frac
                 end_tede = value_tede(j,index_end)*fracm
     &                 + value_tede(j,index_end+1)*frac
              end if

C
              if (tede_max(j)+1.0d-10 .lt. end_tede-current_tede) then
                 time_tede(j) = current_time
                 wbod_max(j) = max(0.0,end_wbod - current_wbod)
                 thyroid_max(j) = max(0.0,end_thyroid - current_thyroid)
                 tede_max(j) = end_tede - current_tede
              end if

C
              current_time = current_time + delta_time
	        if (end_time .gt. time+0.1) exit

            end do
	    END IF
        end do

C
C
C   move final doses to top of output file
C
      
C      open(unit= 33, FILE=DUMMY, ,STATUS='UNKNOWN')
C      write(out_unit,'(a)') 'OUT_UNIT_ENDS'
C      rewind (out_unit)
c
C      DO IJK = 1, 9999999
C	  READ(OUT_UNIT

	   write (out_unit, '(a)') char(12)
	   call print_header(2)

        write(out_unit,'(/,10x,a80)') case_name

        write(out_unit, '(/,1x, 2a)')
     &    '##################################',
     &    '##################################'
        write(out_unit, '(25x, a)')
     &    "Worst Two-Hour Doses"
C
        write(out_unit, '(1x, 2a)')
     &    '##################################',
     &    '##################################'

C     determine location of EAB
c
c ... find EAB location by looking for an E
c
           loc_eab = 0
           do i=1,Number_Dose_Locations
	        LOCC = LOCATION_COMPARTMENT_NUMBER(i)
              IF (COMPARTMENT_TYPE(LOCC) .EQ. 2) THEN
c      ENVIRONMENT
	           ilc = Index(adjustl(location_name(i)),'e')
	           iuc = Index(adjustl(location_name(i)),'E')
	           if(ilc.eq.0) ilc =100
		       if(iuc.eq.0) iuc =100
	           iii=min(ilc,iuc)
	           if (iii.lt.3) then
		          if (loc_eab .eq. 0) loc_eab = i

C     assume largest X/Q at start time, choose largest 
C
	              if (location_xq(loc_eab,1) .lt. location_xq(i,1)) 
     &                              loc_eab=i
                 end if
              END IF
           end do

           j = loc_eab

C
          IF (j.gt.0) THEN
	    write(out_unit, '(/,1x, a)') location_name(j)(1:37)
          write(out_unit, '(1x, a)')
     &      "   Time   Whole Body    Thyroid        TEDE"
          write(out_unit, '(1x, a)')
     &      "   (hr)     (rem)        (rem)         (rem)"
          write(out_unit,'(1x,f7.1,3(3x,1pe10.4))') 
     &      time_tede(j), wbod_max(j), thyroid_max(j), tede_max(j)
          END IF

C
C
        write(out_unit, '(/,1x, 2a)')
     &    '##################################',
     &    '##################################'
        write(out_unit, '(25x, a)')
     &    "Final Doses"
C
        write(out_unit, '(1x, 2a)')
     &    '##################################',
     &    '##################################'
        jstep = total_steps
        do i = 1, Number_Dose_Locations, 1
          IF (i.gt.3 .OR. location_xq_count(i).gt.0) THEN
	       if(i .ne. loc_eab) then
	         write(out_unit, '(/,1x, a)') location_name(i)(1:37)
               write(out_unit, '(1x, a)')
     &           "   Time   Whole Body    Thyroid        TEDE"
               write(out_unit, '(1x, a)')
     &           "   (hr)     (rem)        (rem)         (rem)"
               write(out_unit,'(1x,f7.1,3(3x,1pe10.4))') 
     &              final_times(jstep), value_wbod(i,jstep), 
     &              value_thyroid(i,jstep),value_tede(i,jstep)
             end if
          END IF
        end do
C

      endif


      end
