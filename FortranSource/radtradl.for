
	subroutine DLL_RADTRAD( plantfile, scenariofile,
     1	outputfile, error_message)
         !DEC$ ATTRIBUTES DLLEXPORT :: DLL_RADTRAD
         !DEC$ ATTRIBUTES ALIAS:'DLL_RADTRADA' :: DLL_RADTRAD
      
#ifdef WIN32
	USE DFLIB
#endif  
	include 'limits.h'
	include 'filename.h'
	include 'source.h'
	
	character error_message * 256 , action * 4
	
	character*(*) plantfile, scenariofile, outputfile

	integer error_code, i
	logical is_file_there, file_opened
		
c       Entry point from Visual Basic: frmCalc.cmdMain_Click
C       Initialize error_code and error_message.
	
	error_code = -1
	write(error_message, '(4a)')
     &      'Error in program radtrad.',
     &      char(10), char(13),
     &      'Program logic error, error variables never set.'
	   

C       Parse the command line and perform any necessary actions and
C       change any specified program parameters.

c       call parse_cl(action, error_code, error_message)
C       If the user has specified batch mode, then run the calculation
C       replace parsing command line with arguments from VB Interface
              
 


	inquire(file=plantfile,exist=is_file_there)
	if(is_file_there .EQV. .FALSE.) then
	   write(error_message, '(1x,3a)')
     1	    'Error in program radtrad.  '
     2	    // 'Unable to open file ',
     3	    plantfile
	   goto 10
	endif
C       
C       get SDF file name
C       
	inquire(file=scenariofile,exist=is_file_there)

C
C       get output file name
C
	
	inquire(file=outputfile,exist=is_file_there)
	if(is_file_there .EQV. .TRUE.) then
	   write(error_message, '(1x, 3a)')
     &                 'Error in program radtrad.  '
     &                  // 'Unable to write over file ',
     &                  outputfile
	   goto 10
	endif

c
c ok - files seem to exist, print some info and try to read the 
c      files specified
c    
      write(plant_filename,'(a)') trim(plantfile)
      write(scenario_filename,'(a)') trim(scenariofile)
      write(output_filename,'(a)') trim(outputfile)

	     call nextunit(out_unit)
	     write(error_message,*) out_unit, trim(output_filename)
           open(unit=out_unit,FILE=output_filename)

C
C      zero common
C 
      call rad_data
	    
      error_code = -1 
      error_message = "call rd_psf"
	write(action,'(a)') 'none'

      call rd_psf(action,error_code,error_message, inp_out)

      IF(error_code .GT. 0) THEN
	   write(error_message,'(a,i4)') "rd_psf failed.. error code = ", 
     &                                                  error_code
      ELSE

         call radcalc('batc', error_code,error_message, inp_out)
      
         if(error_code .GT. 0) then
	      write(error_message,'(a,i4)')"radcalc failed error code = ", 
     &                                                   error_code
         else 
		  write (error_message, *)  
     $    'Click on Read Output to see text file ',trim(output_filename)
         end if

      END IF
 
c      Necessary to close all files before returning, or rerun won't work
   10    continue
         do i = 0, 25, 1
            inquire(unit = i, opened = file_opened)
            if(file_opened) then
               close(i)
            end if
         end do
c      Return to Visual Basic 
	return
	end


C     ------------------------------------------------------------------
