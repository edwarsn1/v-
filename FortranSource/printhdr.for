C     ------------------------------------------------------------------
C     
C     Subroutine: print_header 
C     
C     ------------------------------------------------------------------
C     
C     Author(s):
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
C     Version:
C     
C     Date:  
C     
C     Revision
C     History: 
C     
C     ------------------------------------------------------------------

      subroutine print_header(ihead)

c     include 'mcode\full.com'
      include 'full.com'
C
C     added common to verify dataset consistency
C
      COMMON / NUC_DCF / NUMNUC, NUC_NAME_1
      INTEGER NUMNUC
	CHARACTER*10 NUC_NAME_1
      
      character, save :: banner * 72
      character format_string * 8
      character dr*8,tr*10, yr*4
      character line*260
      integer unit_number
      integer, SAVE :: timeflag=0
      integer ihead
#ifdef WIN32
      INTEGER(2) tmpday, tmpmonth, tmpyear
      INTEGER(2) tmphour, tmpminute, tmpsecond,tmphund
#endif
      Character(11) dummystring
      Character(14) dummystring2

      DATA yr /'2006'/

c      if( ihead.eq.1) then
#ifdef WIN32
         CALL GETDAT(tmpyear, tmpmonth, tmpday)
         CALL GETTIM(tmphour, tmpminute, tmpsecond, tmphund)

         WRITE (dummystring, 900) tmpmonth, tmpday, tmpyear
         WRITE (dummystring2, 901) tmphour,tmpminute,tmpsecond
 900     FORMAT(I2, '/', I2.2, '/', I4.4)
 901     FORMAT(I2, ':', I2.2, ':', I2.2)
C
C  test for year shutdown
C
c        if (tmpyear .gt. 2100) then
c          write(out_unit,'(a)') 
c    &     '  This is only a temporary vesion of RADTRAD 3.10, '
c    &    // 'contact  T. Heames at Alion for a current version'
c            write(out_unit,*) '***********    S T O P  ****************'
c
C      *****************    S T O P   ***************************
c        STOP ! <<===============================================STOP

c         end if
#else
         call date_and_time(dr, tr)
         write(dummystring,900) dr(5:6), dr(7:8), dr(1:4)
         write(dummystring2,901) tr(1:2),tr(3:4),tr(5:6)
 900     FORMAT(a2, '/', a2, '/', a4)
 901     FORMAT(a2, ':', a2, ':', a2)
C
C  test for year shutdown
C
C         if (dr(1:4) .ne. yr) write(out_unit,'(a)') '  SHUTDOWN 2 '
#endif
         banner = 'ALION RADTRAD Version 3.10 (Fall 2006) run on '
     &        //dummystring//' at '//dummystring2
 
         timeflag=1
c      END IF

      write(format_string, '(a, i2, a)')
     &     '(', ((74 - len_trim(banner)) / 2), 'x, a)'

      write(out_unit, '(1x, 2a)')
     &     '###################################',
     &     '####################################'

      write(out_unit, format_string) banner(1:len_trim(banner))
      write(out_unit, '(1x, 2a)')
     &     '###################################',
     &     '####################################'

      if (ihead .gt. 1) return

      write(out_unit,'(/,10x,a80)') case_name

      write(out_unit, '(/,1x, 2a)')
     &     '###################################',
     &     '####################################'
      write(out_unit, '(21x, a)')
     &     'File information'
      write(out_unit, '(1x, 2a)')
     &     '###################################',
     &     '####################################'

      write(out_unit, '(/, 1x, 2a)')
     &     'Input File Name      = ', trim(plant_filename)
      write(out_unit, '( 1x, 2a,/)')
     &     'Output File Name     = ', trim(output_filename)      

      DO IK = 1, Number_Inventory_Files
        write(out_unit, '(1x, 2a)')
     &     'Inventory file       = ', trim(inventory_filename(IK))
      END DO
C++      write(out_unit, '(1x, 2a)')
C++     &     'Scenario file name        = ', scenario_filename
      DO IK = 1, Number_Release_Files
        write(out_unit, '(1x, 2a)')
     &     'Release file         = ', trim(release_filename(IK))
      END DO
      write(out_unit, '(1x, 2a,/)')
     &     'Dose Conversion file = ', trim(dcf_inp_filename)
C
C   verify inventory and dose conversion files are the same
C
      if (number_of_nuclides .ne. numnuc) then
	    write(out_unit, '(/, 1x, 1a,/,3a,/)') 
     &  '***  inventory and dose files are inconsistent  ***', 
     &  '***  first nuclide in files are: ',
     &        nuclide_name(1), nuc_name_1
	end if
C
      write(out_unit, '(///)')
      write(out_unit, '(5x, 1a)')
     &  '#####    ####   #####    #  #     #  #####   #    #  ##### ',
     &  '#    #  #       #        #  ##    #  #    #  #    #    #   ',
     &  '#    #  #       #        #  # #   #  #    #  #    #    #   ',
     &  '#####    ####   ####     #  #  #  #  #####   #    #    #   ',
     &  '#            #  #        #  #   # #  #       #    #    #   ',
     &  '#            #  #        #  #    ##  #       #    #    #   ',
     &  '#        ####   #        #  #     #  #        ####     #   '
      write(out_unit, '(/)')

      call nextunit(unit_number)
      open (unit=unit_number, FILE=trim(plant_filename), err=10)

      do l = 1, 10000
         read (unit_number, '(a257)', end = 20) line
         write (out_unit, '(a)') trim(line)
      end do
	go to 20
 10   write (out_unit, '(2a)') 'Error opening ', trim(plant_filename)
 20   continue
c      write (out_unit, '(a)') char(12)
      return
      end
