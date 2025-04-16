C     ------------------------------------------------------------------
C
C     Subroutine: print_psf  
C
C     ------------------------------------------------------------------
C
C     Author(s): Brian Lewis   
C                David Monroe
C                Steven Humphreys
C
C                Terry Heames
C                ALION/ITSO
C                (505) 872-1089
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
C     Version:         3.1    
C
C     Date:            2002      
C
C     Revision
C     History:      Modified to have multiple compartments with 
C                   a dose calculation.  
C                   Setup Compartment type > 10 for not in mass balance
C
C     ------------------------------------------------------------------

      subroutine print_psf()

      include 'full.com'

      integer i, j


      write(out_unit,'(/,10x,a80)') case_name
      write(out_unit, '()')
      write(out_unit, '(1x, 2a)')
     &   '###################################',
     &   '####################################'

      write(out_unit, '(21x, a)')
     &   'Plant Description'
      write(out_unit, '(1x, 2a)')
     &   '###################################',
     &   '####################################'

      write(out_unit,'(/,1x, a,i3)') 'Number of Nuclides = ',
     &   number_of_nuclides
      write(out_unit, '(/,1x, a, 1pe12.4,a)')
     &   'Inventory Power = ',(inventory_power_level/1.0E6),
     &   ' MWth'
      write(out_unit, '(1x,a,1pe12.4,a)') 'Plant Power Level = ',
     &   (plant_power_level/1.0E6),' MWth'
      write(out_unit, '(/,1x, a, i3)')
     &   'Number of compartments    = ', number_of_compartments
      write(out_unit, '(/,1x, a)') 'Compartment information'

      do i=1, number_of_compartments, 1

         if (i .eq. 1) then
            write(out_unit, '(1x)')
         endif

         write (out_unit,'(1x, a, i2)') 'Compartment number ',i

         write (out_unit,'(1x, 2a)') 'Name: ',compartment_name(i)
         if (compartment_type(i) .NE. 2) then
            write (out_unit, '(1x, a, 1pe12.4,a)')
     &         'Compartment volume = ',(compartment_volume(i)
     &         * M3TOF3),' (Cubic feet)'
         endif

        IF ( compartment_type(i) .EQ. 1 ) THEN
          WRITE(out_unit,'(1X,A)') 'Compartment type is Control Room'
        END IF
        IF ( compartment_type(i) .EQ. 2 ) THEN
          WRITE(out_unit,'(1X,A)') 'Compartment type is Environment '
        END IF
        IF ( compartment_type(i) .EQ. 3 ) THEN
          WRITE(out_unit,'(1X,A)') 'Compartment type is Normal'
        END IF
        IF ( compartment_type(i) .EQ. 4 ) THEN
          WRITE(out_unit,'(1X,A)') 'Compartment type is Normal with'
     &      // ' a Dose Calculation'
        END IF
        IF ( compartment_type(i) .EQ. 5 ) THEN
          WRITE(out_unit,'(1X,A)') 'Compartment type is Control Room'
     &      // ' but NO Dose Calculation'
        END IF


         if((compartment_sprays(i) + compartment_sump(i) + 
     &      compartment_filters(i) + compartment_deposition(i) +
     &      compartment_opool(i)) .NE. 0) then

            write (out_unit,'(1x, a)') 
     &         'Removal devices within compartment:'

            if (compartment_sprays(i) .ne. 0) then
                write (out_unit,'(1x, a)') '     Spray(s)'
            endif

            if (compartment_sump(i) .ne. 0) then
               write (out_unit, '(1x, a)') '     Sump(s)' 
            endif

            if (compartment_filters(i) .ne. 0) then
               write (out_unit, '(1x, a)') '     Filter(s)' 
            endif 

            if (compartment_deposition(i) .ne. 0) then
               write (out_unit,'(1x, a)') '     Deposition'
            endif

            if (compartment_opool(i) .ne. 0) then 
               write (out_unit, '(1x, a)') '     Suppression pool'
            endif

         endif

         if (number_of_pathways .gt. 0) then

            write(out_unit,'(1x,a, i2)')
     &         'Pathways into and out of compartment ', i

            do j=1, number_of_pathways,1
               if (pathway_to(j) .eq. i) then
                  write (out_unit, '(1x, a, i3, 2a)')
     &            '   Inlet Pathway Number ', J,
     &                  ': ',pathway_name(j) 
               endif
            end do

            do j=1,number_of_pathways,1
               if (pathway_from(j) .eq. i) then
                  write (out_unit,'(1x, a, i3, 2a)') 
     &            '   Exit Pathway Number  ', J,
     &                 ': ',pathway_name(j)
               endif
            end do

         endif

         write(out_unit,'(1x)')

      end do
      
      write(out_unit, '(1x, a, i3, /)')
     &   'Total number of pathways = ', number_of_pathways

      end
