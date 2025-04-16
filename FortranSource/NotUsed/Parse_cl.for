C     ------------------------------------------------------------------
C     
C     Subroutine:  parse_cl
C     
C     ------------------------------------------------------------------
C     
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
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
C     Version:     1.1
C     
C     Date:        12 July, 1996
C     
C     Revision
C     History:     1.1 - July 12, 1996 - Support for batch mode added 
C     
C     1.0 - Initial version.
C     
C     
C     ------------------------------------------------------------------

      subroutine parse_cl(action, error_code, error_message, inp_out)
#ifdef WIN32
      USE DFLIB
#endif
      INTEGER(4) count
      INTEGER(2) status 
      CHARACTER(80) buf 

      integer error_code
      character * (*) action, error_message

      INCLUDE 'Limits.h'
      include 'filename.h'

      integer char_number, i

      character * 127 command_line, e*256
      character * 256 temp_psf, temp_sdf, temp_out
      character switch * 3 

      logical is_file_there

C         DEC$	reference ATTRIUBUTES Jonathan_error

C     Initialize error_code and error_message.

      write(action, '(a)') 'quit'
      error_code = 0
      write(error_message, '(4a)')
     &     'Error in program parse_cl.',
     &     char(10), char(13),
     &     'Program logic error, error variables never set.'

C     
C     replacment fortran for lahey command line processing
C     
C     this might be DV Fortran specific -Chester Gingrich, 11/3/98
C     
C     Added ifdefs for unix command line parsing - Chester Gingrich, 12/27/99
C     
C     

C     get the number of arguments

#ifdef WIN32
      count = NARGS( )
#else 
      count = iargc()
#endif
C
C      zero common
C      
      CALL RAD_DATA

#ifdef WIN32
      CALL GETARG(1, buf, status)
      switch=buf(1:status)
#else 
      call getarg(1,buf)
      switch=trim(buf)
#endif

      select case(switch)
      case('  ')
         write(action, '(a)') 'Cnsl'
         error_code = 0
         write(error_message, '(a)') 'ok'
C
C     CONSOLE CONTROL
C
         plant_filename = 'D:\RAD_310\Console\test_inp.psf'
         scenario_filename = plant_filename
         output_filename = 'D:\RAD_310\Console\test_out.out'

         error_code = -1

         call rd_psf(action, error_code, error_message, inp_out)
         
         write(action, '(a)') 'batc'

         write(error_message, '(a)') 'ok'


C
C
      case('/s', '/S')
         write(action, '(a)') 'none'
         error_code = 0
         write(error_message, '(a)') 'ok'
      case('/h', '/H')
         write(*,*) 'USAGE: RT /h     = Help, this message'
         write(*,*) '          /s     = Unknown'
         write(*,*) 
     1    '          /b     = Batch operation. Batch mode requires'
         write(*,*) 
     1    '                   two additional arguments (in order):'
         write(*,*) '                   1) PSF file name'
         write(*,*) '                   2) output file name'
         write(*,*) '                   example: '
         write(*,*) 
     1    '                   radtrad /b psffile outfile'
         write(*,*) ' '
         write(*,*) '         NOTE: to use the old PMF and SDF'
         write(*,*) '               file convention, just '
         write(*,*) '               concatenate the SDF to the'
         write(*,*) '               end of the PMF file and'
         write(*,*) '               rename the resulting file'
         write(*,*) '               with a .psf extenstion'
         write(*,*) ' '
         write(action, '(a)') 'none'
         error_code = 0
         write(error_message, '(a)') 'ok'
      case('/b', '/B')
c     write(*,*) 'batch - action'
C     
C     batch operation - check for filenames on command line
C     
C     
C     get PSF file name
         
C     
#ifdef WIN32
         CALL GETARG(2, buf, status)
         temp_psf=buf(1:status)
#else 
         call getarg(2,buf)
         temp_psf=trim(buf)
#endif
         inquire(file=temp_psf,exist=is_file_there)
         if(is_file_there .EQV. .FALSE.) then
            write(*, '(1x,3a)')
     &           'Error in program radtrad. (PARSE_CL)  '
     &           // 'Unable to open file ',
     &           temp_psf
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
      error_code = 1
c        STOP
         endif
C     
C     get output file name
C     
#ifdef WIN32
         CALL GETARG(3, buf, status)
         temp_out=buf(1:status)
#else 
         call getarg(3,buf)
         temp_out=trim(buf)
#endif
         inquire(file=temp_out,exist=is_file_there)
         if(is_file_there .EQV. .TRUE.) then
            write(*, '(1x, 3a)')
     &           'Error in program radtrad. (PARSE_CL)  '
     &           // 'Unable to write over file ',
     &           temp_out
      write(*,*) '***********    S T O P   *******************'

C      *****************    S T O P   ***************************
      error_code = 1
c        STOP
         endif

c     
c     ok - files seem to exist, print some info and try to read the 
c     files specified
c 


C     
C     get set up name
C     
      IF (ERROR_CODE .GT. 0) RETURN

c         jonathan_error = Arg5
	   
	      
         write(plant_filename,'(a)') trim(temp_psf)

            write(output_filename,'(a)') trim(temp_out)
	      call nextunit(out_unit)
	      write(error_message,*) out_unit, trim(output_filename)
            open(unit=out_unit,FILE=output_filename)

        call rd_psf(action, error_code, error_message, inp_out)

         
         write(action, '(a)') 'batc'
c         error_code = 0
         write(error_message, '(a)') 'ok'
      case default
         write(action, '(a)') 'quit'
         error_code = 1
         write(error_message, '(6a)')
     &        'Error in program radtrad.',
     &        char(10), char(13),
     &        'Unrecognized command line option = ',
     &        switch, '.'
      end select

      IF (ERROR_CODE .gt. 0) close (out_unit)      

      return

      end
