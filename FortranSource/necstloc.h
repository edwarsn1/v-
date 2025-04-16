C     necstloc.h

C     March 6, 1996 - added control room occupancy factor check.

C     ###########################################################
C     ############ Top of do-loop over all locations ############
C     ############ determine time steps from x/q arrays #########
C     ###########################################################

      if(level_necsteps .ge. 2) then
         write(out_unit, '(1x, a, i2)')
     &   'Number_Dose_Locations =', Number_Dose_Locations
      end if

   
      do i = 1, Number_Dose_Locations, 1

         if(level_necsteps .ge. 2) then
            write(out_unit, '(1x, a, i2, 2a)')
     &      'location_name(', i, ') = ', location_name(i)
         end if

         comp_n = location_compartment_number(i)


         if(level_necsteps .ge. 2) then
            write(out_unit, '(1x, 2(a, i2))')
     &        'location_breathing_rate_count(', i,  ') = ',
     &         location_breathing_rate_count(i)
         end if

         do j = 1, location_breathing_rate_count(i), 1

            if(level_necsteps .ge. 2) then
               write(out_unit, '(1x, 2(a, i2), a, e14.8, a)')
     &            'location_breathing_rate_time(', i, ', ', j,
     &            ') = ', location_breathing_rate_time(i, j) /
     &            3600.0, ' hrs'
            end if

            if(level_necsteps .ge. 2) then
               write(out_unit, '(1x, 2(a, i2), a, e14.8, a)')
     &            'location_breathing_rate(', i, ',', j, ') = ',
     &            location_breathing_rate(i, j), 'm3/s'
            end if

C              Store the time step in the minstep array.

            minstep(kount) = location_breathing_rate_time(i, j)

            if(level_necsteps .ge. 2) then
               write(out_unit, '(1x, a, i5, a, e14.8, a)')
     &            'minstep(', kount, ') = ',
     &            minstep(kount) / 3600.0, ' hrs'
            end if

C              Increment the time step counter.

            kount = kount + 1

         end do


C  ############### Dose room location, check occupancy ################

         if(compartment_type(comp_n) .eq. 1 .or.
     &      compartment_type(comp_n) .eq. 4 ) then

            if(level_necsteps .ge. 2) then
               write(out_unit, '(1x, 2(a, i2))')
     &         'compartment_type(', i, ') = ',
     &         compartment_type(comp_n)
            end if



            do j = 1, location_occupancy_factor_count(i), 1

               if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, 2(a, i2), a, e14.8, a)')
     &               'location_occupancy_factor_time(', i, ', ', j,
     &               ') = ', location_occupancy_factor_time(i, j) /
     &               3600.0, ' hrs'
               end if

               if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, 2(a, i2), a, e14.8)')
     &               'location_occupancy_factor(', i, ',', j, ') = ',
     &               location_occupancy_factor(i, j)
               end if

C              Store the time step in the minstep array.

               minstep(kount) = location_occupancy_factor_time(i, j)

               if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, a, i5, a, e14.8, a)')
     &               'minstep(', kount, ') = ',
     &               minstep(kount) / 3600.0, ' hrs'
               end if

C              Increment the time step counter.

               kount = kount + 1

            end do

C   set dose room dilution time intervals (3.03 only)

            IF (VERSION .lt. 3.10) THEN

              if(level_necsteps .ge. 2) then
                 write(out_unit, '(1x, 2(a, i2))')
     &            'location_xq_count(', i, ') = ',location_xq_count(i)
              end if

              do j = 1, location_xq_count(i), 1

                if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, 2(a, i2), a, e14.8, a)')
     &              'location_xq_time(', i, ', ', j, ') = ',
     &               location_xq_time(i, j) / 3600.0, ' hrs'
                end if

                if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, 3(a, i2), a, e14.8, a)')
     &              'location_xq(', i, ', ', j, ') = ',
     &              location_xq(i, j), 's/m3'
                end if

C              Store the time step in the minstep array.

                minstep(kount) = location_xq_time(i, j)

                if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, a, i5, a, e14.8, a)')
     &              'minstep(', kount, ') = ',
     &              minstep(kount) / 3600.0, ' hrs'
                end if

C              Increment the time step counter.

                kount = kount + 1

              end do

            END IF
         end if 
C                (control room)
      end do
C
C     check the X/Q tables for time steps
C
      do nxq = 1, numb_xq_tables, 1

         if(level_necsteps .ge. 2) then
            write(out_unit, '(1x, 2(a, i2))')
     &        'location_xq_count(', nxq, ') = ',location_xq_count(nxq)
         end if

         IF (location_xq_count(nxq) .GT. 0) THEN
            do j = 1, location_xq_count(nxq), 1

               if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, 2(a, i2), a, e14.8, a)')
     &               'location_xq_time(', nxq, ', ', j, ') = ',
     &                location_xq_time(nxq, j) / 3600.0, ' hrs'
               end if

               if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, 3(a, i2), a, e14.8, a)')
     &               'location_xq(', nxq, ', ', j, ') = ',
     &               location_xq(nxq, j), 's/m3'
               end if

C              Store the time step in the minstep array.

               minstep(kount) = location_xq_time(nxq, j)

               if(level_necsteps .ge. 2) then
                  write(out_unit, '(1x, a, i5, a, e14.8, a)')
     &               'minstep(', kount, ') = ',
     &               minstep(kount) / 3600.0, ' hrs'
               end if

C              Increment the time step counter.

               kount = kount + 1

            end do
         END IF
      end do

C
 


C     ###########################################################
C     ############ End of do-loop over all locations ############
C     ###########################################################

C     necstloc.h
