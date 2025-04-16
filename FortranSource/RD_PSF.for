C     ------------------------------------------------------------------
C     
C     Subroutine:  rd_psf.for
C     
C     ------------------------------------------------------------------
C     
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C     
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872 1089
C
C     Description:	Reads first part of input
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
C     Version:         3.10    
C
C     Date:            2004      
C
C     Revision
C     History:      Modified to obtain version number
C                   Modified to have multiple compartments with 
C                   a dose calculation.  
C                   Setup Compartment type > 10 for not in mass balance

C     
C     ------------------------------------------------------------------

      subroutine rd_psf(action, error_code, error_message, inp_out)
      character * (*) action, error_message
	character *7 name1
      integer error_code

      include 'limits.h'
      include 'compart.h'
      include 'constant.h'
      include 'filename.h'
      include 'nif.h'
      include 'pathway.h'
      include 'simulate.h'
      include 'source.h'

      character line*260
      CHARACTER look_4_comments*1
      EQUIVALENCE (line,look_4_comments)

	character*80 skip_name
      integer unit_number, unit_number_pf, i, j, ecomp
C
C   setup a dummy output file
	     call nextunit(inp_out)
           open(unit=inp_out,FILE='inp_out.txt')


C     Initialize error_code and error_message.

      error_code = 0
      write(error_message, '(2a)')
     &     'Error in program radtrad.',
     &     'Program logic error, error variables never set.'

C
C     eliminate comment cards (& in column 1) from input deck
C
      call nextunit(unit_number_pf)
      open (unit=unit_number_pf, FILE=trim(plant_filename), err=11)

      call nextunit(unit_number)
      open (unit=unit_number, STATUS='UNKNOWN', 
     &               FILE='No_Ampersand.Inp', err=11)


      kk = 0
      do l = 1, 10000
         read (unit_number_pf, '(a257)', end = 20) line
         IF (look_4_comments .NE.'&') THEN
             write (unit_number, '(a)') trim(line)
         ELSE
c            commented out another line
             kk = kk + 1
         END IF            
      end do
 20   continue

      CLOSE (unit_number_pf)
 	REWIND (unit_number)    

c     
      
C     set version number
c     iclass = 1 (version 1.0-3.03) or 
C            = 0 (version 3.10) new models including decay & edit
C	 
	ICLASS = 0
      VERSION = 3.10
      read(unit_number,*) name1, VERSION 
      write(inp_out,'(5x,f10.3)') VERSION
      read(unit_number,'(a80)', err=10) case_name
      write(inp_out,'(a80)') case_name

C
C     set number of input files
C
	Number_Release_Files = 1
      Number_Inventory_Files = 1
      IF (VERSION .LT. 3.10) THEN
C       pre version 3.10 input
        ICLASS = 1
        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number, '(a100)',err=10) inventory_filename(1)
        Inventory_Type(1) = 1
      ELSE
C       version 3.10 input modifications (read all filenames)
C
        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number,'(a100)',err=10) dcf_inp_filename
        write(inp_out,'(a100)') dcf_inp_filename
        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number,*) Number_Release_Files
        IF (Number_Release_Files .gt. 0) THEN
          DO IK = 1,Number_Release_Files
             read(unit_number,'(a100)') Release_Filename(IK)
             write(inp_out,'(a100)') Release_Filename(IK)
          END DO
        END IF
 
        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number,*) Number_Inventory_Files
        IF (Number_Inventory_Files .gt. 0) THEN
          DO IK = 1,Number_Inventory_Files
             read(unit_number,'(i4,a100)') Inventory_Type(IK), 
     &                           Inventory_Filename(IK)
             IF (Inventory_Type(IK) .lt. 1) THEN
               write(inp_out,'(a)') ' Inventory type error, data < 1'
               write(inp_out,*) '********    S T O P   **************'
               write(out_unit,'(a)')' Inventory type error, data < 1'
               write(out_unit,*) '********    S T O P   **************'
               error_code = 2
               error_message = 'rd_psf failed'
             ELSE IF (Inventory_Type(IK) .gt. 3) THEN
               write(inp_out,'(a)') ' Inventory type error, data > 3'
               write(inp_out,*) '********    S T O P   **************'
               write(out_unit,'(a)')' Inventory type error, data > 3'
               write(out_unit,*) '********    S T O P   **************'
               error_code = 2
               error_message = 'rd_psf failed'
             END IF
             write(inp_out,'(5x,a100)') Inventory_Filename(IK)
          END DO
        END IF
      END IF
C
      CALL PRINT_HEADER(1)
C
C       determine the plant power and power normalization factors
C              switch power from MWt to W
C
      read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
	read(unit_number, *, err=10) plant_power_level
      plant_power_level = plant_power_level * 1.0e+06

      read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
      read(unit_number, *, err=10) number_of_compartments
      IF (number_of_compartments .lt. 1 .OR. 
     &               number_of_compartments .gt. MAXCOMP) THEN
         ERROR_CODE = 3
         write(out_unit,'(a,i3,a,I3)') ' Number of Compartments =',
     &        number_of_compartments , ' < 0 or > ', MAXCOMP	
      END IF

      if(number_of_compartments .gt. 0) then
        do i = 1, number_of_compartments, 1
         read(unit_number,'(a80)') skip_name
         write(inp_out,'(a80)') skip_name
         read(unit_number,'(a40)', err=10) compartment_name(i)
         compartment_name(i) = adjustl(compartment_name(i))
         read(unit_number, *, err=10) compartment_type(i)
         read(unit_number, *, err=10) compartment_volume(i)
         compartment_volume(i) = compartment_volume(i) * F3TOM3

         read(unit_number, *, err=10) compartment_sprays(i)
         read(unit_number, *, err=10) compartment_sump(i)
         read(unit_number, *, err=10) compartment_filters(i)
         read(unit_number, *, err=10) compartment_deposition(i)
         read(unit_number, *, err=10) compartment_opool(i)
        end do
      end if

      read(unit_number,'(a80)') skip_name
      write(inp_out,'(a80)') skip_name
      read(unit_number, *, err=10) number_of_pathways
      IF (number_of_pathways .lt. 1 .OR. 
     &               number_of_pathways .gt. MAXPATH) THEN
         ERROR_CODE = 3
         write(out_unit,'(a,I3,a,I3)') ' Number of Pathways =',
     &          number_of_pathways, ' < 0 or > ', MAXPATH	
      END IF
      if(number_of_pathways .gt. 0) then
         do i = 1, number_of_pathways, 1
            read(unit_number, '(a80)', err=10) skip_name
            write(inp_out,'(a80)') skip_name
            read(unit_number,'(a50)', err=10) pathway_name(i)
            pathway_name(i) = adjustl(pathway_name(i))
            read(unit_number, *, err=10) pathway_from(i)
            read(unit_number, *, err=10) pathway_to(i)
            read(unit_number, *, err=10) pathway_type(i)
            IF (pathway_from(i) .lt.1 .or. 
     &              pathway_from(i) .gt. number_of_compartments) THEN
               ERROR_CODE = 3
               write(out_unit,'(a,i3,a,i3,a)') ' Path',i,			
     &              ' Pathway_From =',pathway_from(i), '  ERROR'
            END IF
            IF (pathway_to(i) .lt.1 .or. 
     &              pathway_to(i) .gt. number_of_compartments) THEN
               ERROR_CODE = 3
               write(out_unit,'(a,i3,a,i3,a)') ' Path',i,			
     &              ' Pathway_to =',pathway_to(i), '  ERROR'
            END IF
         end do
      end if

      ecomp = 0
      do i = 1, number_of_compartments, 1
	   if (compartment_type(i) .eq. 2) ecomp = i   
      end do

	do j = 1, number_of_pathways, 1
	   i = pathway_from(j)
	   if (compartment_type(i) .eq. 2) then
	      i = pathway_to(j)
         end if
	end do



c     read 'end of plant model'
      read(unit_number,*) error_message 

c     read 'Scenario model input'

      call rd_sdf(action, error_code,inp_out,error_message, unit_number)


      if (error_code.eq.0) then

         error_message='rd_sdf OK'
      else
         error_message = 'rd_sdf failed'
      endif
      
      go to 13
c     plant file errors
 10   continue
      line = 'bad file format'
      goto 12
 11   continue
      line = ' error opening file'
      goto 12
   12 continue
      write(action, '(a)') 'form'
      error_code = 12
      error_message = trim(plant_filename)//':'//trim(line)
      
 13   continue
      
      return

      end

C     ------------------------------------------------------------------
