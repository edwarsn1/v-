C     ------------------------------------------------------------------
C
C     Subroutine:  rd_nif.for
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872-1089
C
C     Description:
C
C     Usage:
C
C     Inputs:   LEVEL = 2, USED to call it without reading in data
C               NUMB  = file number being read
C
C     Outputs:    Initial_Nuclides(i,NUMB)  Ci/MWt
C                 nuclide_initial_amount(i,NUMB)   Atoms/ MWt
C
C
C     Variables:
C
C     Calls:
C
C     Assumptions: .
C
C     Version:     3.10
C
C     Date:        May, 2004
C
C     Revision     
C     History:     3.10 - adjusted for multiple inventories
C					    adjusted for inventories or concentrations
C                  1.2 - Free Format reads
C                  1.1 - File format changed; this routine has been 
C                        adjusted to match 
C                  1.0 - Initial version.
C
C
C     ------------------------------------------------------------------

      subroutine rd_nif(level,NUMB, error_code, inp_out)

      integer level, NUMB, NRLSE, New_Number

      include 'limits.h'
      include 'filename.h'
      include 'nif.h'
      include 'dose.h'
      include 'compart.h'
      include 'flags.h'
      include 'source.h'
      include 'constant.h'
      include 'rel_time.h'
      include 'simulate.h'
C
      character*80 skip_name
      integer unit_number, i, j, inew, ii, error_code
      integer INUC, JDTR, KNUC
      logical is_file_there

      character*1  in_first(15)
      data in_first /15*' '/     

      write(inp_out, '(1x, 2a)')
     &    'subroutine RD_NIF opening file: ',inventory_filename(NUMB)
      write(inp_out, '(1x, 2a)') 
     &    

      is_file_there = .TRUE.
      call nextunit(unit_number)
      inquire(file=inventory_filename(NUMB),exist=is_file_there)
      if(is_file_there .EQV. .FALSE.) then
         write(inp_out, '(1x, 3a)')
     &          'Error in program radtrad, subroutine rd_nif  '
     &          // 'Unable to open file ',
     &          inventory_filename(NUMB)
         write(inp_out,*) '***********    S T O P   ******************'
         write(out_unit, '(1x, 3a)')
     &          'Error in program radtrad, subroutine rd_nif  '
     &          // 'Unable to open file ',
     &          inventory_filename(NUMB)
         write(out_unit,*) '***********    S T O P   ******************'

C      *****************    S T O P   ***************************

        error_code =17
c        STOP
        return
      endif
      open(unit=unit_number, FILE=inventory_filename(NUMB))

      read(unit_number,'(15a1)') in_first
C
C   check if new inventory file
C
      inew = 0
      do i = 1, 10
        if (in_first(i).ne. ' ') then
          if (in_first(i).eq.'3' .and. in_first(i+1).eq.'.' .and.
     &       in_first(i+2).eq.'1' .and. in_first(i+3).eq.'0') inew = 1
        end if
      end do
        write(inp_out, '(1x, a, I4)')
     &  ' Old inventory = 0, New inventory =1, this file is ', inew

      read(unit_number, '(1x, a40)') inventory_name(NUMB)

          write(inp_out, '(1x, 2a)')
     &      'inventory_name = ', inventory_name(NUMB)
          write(inp_out, '(1x, 2a)')
     &      'inventory_filename = ', inventory_filename(NUMB)
          write(inp_out, '(1x, a, I4)')
     &      'File Number = ', NUMB

      read(unit_number,'(a60)') skip_name
      IF (NUMB .gt. 1) THEN
        read(unit_number,'(a60)') skip_name
      ELSE
	  dt_decay = 1.0e6
        read(unit_number, *) inventory_power_level

          write(inp_out, '(1x, a, e11.4, a)')
     &      'inventory_power_level = ', inventory_power_level, ' MW'

C       Convert power level to watts

        inventory_power_level = inventory_power_level * MWTOW

          write(inp_out, '(1x, a, e11.4, a)')
     &      'inventory_power_level = ', inventory_power_level, ' W'

	END IF
C
c   if this is a new NIF file then it can have either
C      specific inventory, concentrations, or rates in the input stream
C
      IF (INEW.eq.1) THEN

        read(unit_number,'(a60)') skip_name
        ii = Inventory_Type(NUMB)
        read(unit_number, *) Inventory_type(NUMB)
c        IF (ii.ne.Inventory_type(NUMB)) THEN
c          write(out_unit, '(1x, a, I4, a, I4, a, I4,/ 5x, a)')
c     &       '  inventory type in NIF input file = ', ii,
c     &       '  is not the same as on NIF file ', NUMB, 
c     &       ' which has a ', Inventory_type(NUMB),
c     &        ' 1 = Nuclide Inventory (Ci/MWt), '
c     &     // ' 2 = Nuclide Concentration (Ci/cc), '
c     &     // ' 3 = Nuclide Insertion Rate (Ci/hr) '
c        END IF

          write(inp_out, '(1x, a, I4, a)')
     &     'inventory_type = ', inventory_type(NUMB), 
     &        ' 1 = Nuclide Inventory (Ci/MWt), '
     &     // ' 2 = Nuclide Concentration (Ci/cc), '
     &     // ' 3 = Nuclide Insertion Rate (Ci/hr) '

      END IF


      read(unit_number,'(a60)') skip_name
      IF (NUMB .gt. 1) THEN
        read(unit_number,*) New_Number
        IF (New_Number .ne. number_of_nuclides) Then
	    write(out_unit, '(1x, 3a, I4, / 1x, a, I4, /1x, a)')
     &      'ERROR-(RD_NIF)-number of nuclides in file ', 
     &       Trim(Inventory_Filename(NUMB)),' is =',  New_Number,
     &      ' The first file contained =',  number_of_nuclides,
     &      ' These must have the same value  '//
     &      '..hence the code terminates ' 
	    write(inp_out, '(1x, 3a, I4, / 1x, a, I4, /1x, a)')
     &      'ERROR-(RD_NIF)-number of nuclides in file ', 
     &       Trim(Inventory_Filename(NUMB)),' is =',  New_Number,
     &      ' The first file contained =',  number_of_nuclides,
     &      ' These must have the same value  '//
     &      '..hence the code terminates ' 

          write(out_unit,'(a)') '**********  S T O P ******************'
         error_code = 18

C      *****************    S T O P   ***************************
C          STOP
           RETURN
        END IF
      ELSE
        read(unit_number, *) number_of_nuclides
      END IF

          write(inp_out, '(1x, a, I6)')
     &      'number_of_nuclides = ', number_of_nuclides

	if (number_of_nuclides .ge. MAXNUC) then
	    write(out_unit, '(1x, 3a, I4, / 1x, a, I4, /1x, a)')
     &      'ERROR-(RD_NIF)-number of nuclides in file ', 
     &       Trim(Inventory_Filename(NUMB)),' is =',  
     &       number_of_nuclides,'  this exceeds the allowable ',
     &          MAXNUC-1, ' code terminates'
	    write(inp_out, '(1x, 3a, I4, / 1x, a, I4, /1x, a)')
     &      'ERROR-(RD_NIF)-number of nuclides in file ', 
     &       Trim(Inventory_Filename(NUMB)),' is =',  
     &       number_of_nuclides,'  this exceeds the allowable ',
     &          MAXNUC-1, ' code terminates'


          write(*,*) '***********    S T O P   *******************'

          error_code = 19
C      *****************    S T O P   ***************************
C          STOP
          RETURN
	end if
c

      IF (level .EQ. 2) THEN
C
C     if one is on a second or third inventory file then the only thing of
C     interest is the specific inventory.  However, the code should verify
C     that the number of nuclides is in line (see above)
C
        IF (number_of_nuclides .gt. 0) THEN
          do i = 1, number_of_nuclides, 1
C  skip nuclide number
            read(unit_number,'(a60)') skip_name

	      IF (NUMB .gt. 1) then
              read(unit_number,'(a60)') skip_name
              read(unit_number,'(a60)') skip_name
              read(unit_number,'(a60)') skip_name
              read(unit_number,'(a60)') skip_name
            ELSE

              read(unit_number,*) nuclide_name(i)
                write(inp_out, '(1x, a, i3, 2a)')
     &            'nuclide_name(', i, ') = ', nuclide_name(i)

              read(unit_number, *) ngroup(i)
                write(inp_out, '(1x, 2(a, i3))')
     &              'ngroup(', i, ') = ', ngroup(i)

              read(unit_number,*) decay_constant(i)
              if (dt_decay .gt. decay_constant(i)) 
     &                    dt_decay = decay_constant(i)
              decay_constant(i) = log(2.d0) / decay_constant(i)
   
              read(unit_number, *) atomic_weight(i)
                write(inp_out, '(1x, a, i3, a, e11.4)')
     &            'atomic_weight(', i, ') = ', atomic_weight(i)
            END IF
C
C 
C     set inventories
C 
            IF (ngroup(i) .LT. 10) THEN
              Initial_Nuclides(i,NUMB) = 0.0
              Nuclide_Concentration(i,NUMB) = 0.0
              Nuclide_Insert_Rate(i,NUMB) = 0.0
              IF (inventory_type(NUMB) .eq. 1) THEN
C                                     Ci/MWt  
                read(unit_number, *)  Initial_Nuclides(i,NUMB)       
              ELSE IF (inventory_type(NUMB) .eq. 2) THEN
C                                     Ci/cc  
                read (unit_number, *) Nuclide_Concentration(i,NUMB)	
c
c                 load concentration in SOURCE
              ELSE
C                                     Ci/hr  
                read (unit_number, *) Nuclide_Insert_Rate(i,NUMB)
C
C   assume that the release time is the gap duration time from 
C                the first release table using that inventory 
C
                DO NS = 1, Number_of_Sources
                   IF (Compartment_Inventory_File(NS) .EQ. NUMB) THEN
                      IK = Inventory_Release(NS)
                      Initial_Nuclides(i,NUMB) = 
     &                         Nuclide_Insert_Rate(i,NUMB) *
     &                         duration_gap(IK) / htos /
     &                         (Plant_Power_Level/inventory_power_level)
                      EXIT
                   END IF
	          END DO   
              END IF
C     setup aerosol input in kg & switch to Curies/MWt (Initial_Nuclides)
C      note the new inventory system inputs a decay of 10^10 sec.
            ELSE
c.              IF (INEW. EQ. 0) then
c.	           write(out_unit, '(1x, 3a, I4, / 1x, a, I4, /1x, a)')
c.     &               'ERROR-(RD_NIF)- Group number 10 ??? ', 
c.     &                Trim(Inventory_Filename(NUMB)),  
c.     &               'nuclide number =',i,
c.     &               'Has an invalid group number',NGROUP(I),
c.     &                ' code terminates'
c.
c.         write(*,*) '***********    S T O P   *******************'
c.
C      *****************    S T O P   ***************************
c.          STOP
             

c.              ELSE
c  reset decay constant (1/s) to reflect non-radioactive nuclide
                 decay_constant(i) = log(2.d0) / 1.0e+25

		       read(unit_number, *)  Initial_Nuclides(i,NUMB)
                 Initial_Nuclides(i,NUMB) = Initial_Nuclides(i,NUMB) /
     &               atomic_weight(i) * (AVOGADRO*1000.) *
     &               decay_constant(i) / CITOBQS /
     &               (Plant_Power_Level/inventory_power_level)
c.              END IF
            END IF


              write(inp_out, '(1x, a, 2i3, a, e11.4, a)')
     &            'Initial_Nuclides(', i,NUMB, ') = ',
     &            Initial_Nuclides(i,NUMB), ' Ci/MWt'
              IF (inventory_type(NUMB) .eq. 2) 
     &            write(inp_out, '(1x, a, 2i3, a, e11.4, a)')
     &            'Nuclide_Concentration(', i,NUMB, ') = ',
     &            Nuclide_Concentration(i,NUMB), ' Ci/cc'
              IF (inventory_type(NUMB) .eq. 3)
     &            write(inp_out, '(1x, a, 2i3, a, e11.4, a)')
     &            'Nuclide_Insert_Rate(', i,NUMB, ') = ',
     &            Nuclide_Insert_Rate(i,NUMB), ' Ci/hr'

C             Convert Curies/MWt to atoms/MWt.
  
                write(inp_out, '(1x, a, i3, a, e11.4, a)')
     &            'decay_constant(', i, ') = ',
     &            decay_constant(i), ' 1/sec'

              nuclide_initial_amount(i,NUMB) = initial_nuclides(i,NUMB) 
     &           * CITOBQS/decay_constant(i) 
			   
                write(inp_out, '(1x, a, i3, a, e11.4, a)')
     &            'nuclide_initial_amount(', i, ') = ',
     &            nuclide_initial_amount(i,NUMB), ' atoms/MWt'

   
            do j = 1, MAXDGHTR, 1
              IF (NUMB .EQ. 1) THEN  
                read(unit_number, *)
     &            nuclide_daughter(i, j), branch_fraction(i, j)
  
                if(level_rd_nif .ge. j) then
                  write(out_unit,
     &              '(1x, 2(a, i3), 2a, 1x, 2(a, i3), a, e11.4)')
     &              'nuclide_daughter(', i, ', ', j, ') = ',
     &              nuclide_daughter(i, j),
     &              'branch_fraction(', i, ', ', j, ') = ',
     &              branch_fraction(i, j)
                end if
              ELSE
                read(unit_number,'(a60)') skip_name
              END IF
            end do
          end do
        END IF
      END IF
           
        close(unit_number)
        return
      end
