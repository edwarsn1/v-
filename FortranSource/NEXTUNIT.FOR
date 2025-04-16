C     ------------------------------------------------------------------
C
C     Subroutine:  nextunit
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C                  Accident Analysis / Consequence Assessment Department
C                  (505) 844-7223
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
C     Assumptions: A memory resident interface identical or compatible
C                  with the Hi-Screen Pro II Display Module, Version
C                  5.13B, is installed.
C
C     Version:     1.0
C
C     Date:        
C
C     Revision
C     History:     None - Initial version.
C
C
C     ------------------------------------------------------------------

      subroutine nextunit(unit_number)
#ifdef WIN32
      use dfport
#endif
      integer unit_number

      logical file_opened
      integer MIN_UNIT, MAX_UNIT, i, error_code
      character error_message * 256, cr * 1
      
C     Set MIN_UNIT to the lowest unit that you want to use. 0 will
C     probably work on most MS-DOS, PC-compatible machines (although
C     it will probably be always assigned to the console i/o device).
C     Just to be on the safe side I set MIN_UNIT to 10 which should
C     be well above STDIN and STDOUT (usually 5 and 6) and any other
C     auxiliary devices (1-4, 6+) lurking about. Note: setting
C     MIN_UNIT to a value higher than 0 does not effect the number
C     of files that can be open at any give time. 
      
      parameter(MIN_UNIT = 10)
      
C        The maximum possible unit number is 32767. F77L-EM/32
C        FORTRAN 77 Version 5.11, Lahey FORTRAN Language Reference,
C        Section 9.12, Revision C, January 1992.

         parameter(MAX_UNIT = 32767)

 5       continue
         do i = MIN_UNIT, MAX_UNIT, 1
            inquire(i, opened = file_opened)
            if(.not. file_opened) then
               unit_number = i
C              Check if another file can be opened.
               open(unit_number, iostat = error_code, 
     &                           status = 'scratch', err = 10)
               close(unit_number)
               return
            end if
         end do

C        There was an error opening the file (probably ran out of file
C        handles). Close all open files, reset the user's graphics mode,
C        turn off test mode, print the error message, then exit.

   10    do i = MIN_UNIT, MAX_UNIT, 1
            inquire(unit = i, opened = file_opened)
            if(file_opened) then
               close(i)
            end if
         end do
	   

c   Content of error prefix added. Erickson 1/99. We should never be
c   here using radtradl as dll entry point because all possible file units
c   are closed just before returning to Visual Basic interface.
c
          cr = "Error in nextunit. OK to restart. "
c *******************************************************
c         Chester Gingrich - 10/30/98
c         iostat_msg has been comment out
c         Its functionality can be replaced w/'iosdef.for'
c		see visual fortran help for details on how.
c		I am also commenting out the write statment that
c		follows since it won't contain anything useful
c *******************************************************

c         call iostat_msg(error_code, error_message)
	   
c write commented out - Erickson 1/99
c         write(*, '(/, 1x, a)') trim(error_message)
          call perror(cr)

C        Exit with the iostat error code so that it can be read by
C        a DOS batch program via the if errorlevel DOS batch command.

c- will not work for dll - Erickson 1/99
         call exit(error_code) 
          

      end

C     ------------------------------------------------------------------
