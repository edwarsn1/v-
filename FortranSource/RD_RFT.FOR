C     ------------------------------------------------------------------
C
C     Subroutine:  rd_rft.for
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
C     Assumptions: .
C
C     Version:     3.10
C
C     Date:        May 2004
C
C     Revision
C     History:     Modified for multiple release fraction tables.
C
C
C     ------------------------------------------------------------------

      subroutine rd_rft(NUMB, error_code, inp_out)

C     ------------------------------------------------------------------

      include 'limits.h'
      include 'filename.h'
      include 'rel_time.h'
      include 'simulate.h'
        
      double precision htos
      integer unit_number, error_code
      character*60 skip_name

      logical is_file_there

      parameter (htos = 3600.0d0)

      write(inp_out,'(5x,a,i3)') ' IN RD_RFT,  NUMB =', numb      
      call nextunit(unit_number)
      inquire(file=release_filename(NUMB),exist=is_file_there)
      if(is_file_there .EQV. .FALSE.) then
         write(inp_out, '(1x, 3a)')
     &        'Error in program radtrad, subroutine rd_rft  '
     &        // 'Unable to open file ',
     &        release_filename(NUMB)
         write(inp_out,*) '***********    S T O P   ******************'
         write(out_unit, '(1x, 3a)')
     &        'Error in program radtrad, subroutine rd_rft  '
     &        // 'Unable to open file ',
     &        release_filename(NUMB)
         write(out_unit,*) '***********    S T O P   ******************'

C      *****************    S T O P   ***************************
       error_code = 13
c        STOP
        RETURN
      endif

      open(unit=unit_number, FILE=release_filename(NUMB))
      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
      read(unit_number, '(a60)') release_name(NUMB)
	write(inp_out, '(5x,a60)') release_name(NUMB)
      read(unit_number, '(a60)')  RFT_TITLE_1(NUMB)
	write(inp_out, '(5x,a60)') RFT_TITLE_1(NUMB)
	read(unit_number, *)  duration_gap(NUMB),duration_early(NUMB), 
     &                       duration_ex(NUMB), duration_late(NUMB)

C     Convert hours to seconds.
      duration_gap(NUMB) = duration_gap(NUMB) * htos
      duration_early(NUMB) = duration_early(NUMB) * htos
      duration_ex(NUMB) = duration_ex(NUMB) * htos
      duration_late(NUMB) = duration_late(NUMB) * htos

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) nobles_gap(NUMB), nobles_early(NUMB),
     &                     nobles_ex(NUMB), nobles_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) iodine_gap(NUMB), iodine_early(NUMB),
     &                     iodine_ex(NUMB), iodine_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) cesium_gap(NUMB), cesium_early(NUMB),
     &                     cesium_ex(NUMB), cesium_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) tellurium_gap(NUMB), tellurium_early(NUMB),
     &                     tellurium_ex(NUMB), tellurium_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) strontium_gap(NUMB), strontium_early(NUMB),
     &                     strontium_ex(NUMB), strontium_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) barium_gap(NUMB), barium_early(NUMB),
     &                     barium_ex(NUMB), barium_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) ruthenium_gap(NUMB), ruthenium_early(NUMB),
     &                     ruthenium_ex(NUMB), ruthenium_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) cerium_gap(NUMB), cerium_early(NUMB),
     &                     cerium_ex(NUMB), cerium_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) lanthanum_gap(NUMB), lanthanum_early(NUMB),
     &                     lanthanum_ex(NUMB), lanthanum_late(NUMB)

      read(unit_number, '(a60)')  skip_name
	write(inp_out, '(5x,a60)') skip_name
	read(unit_number, *) aerosol_gap(NUMB), aerosol_early(NUMB),
     &                     aerosol_ex(NUMB), aerosol_late(NUMB)

         close(unit_number)
C
C  if no release tiem then zero out release fraction
C
	if (duration_early(NUMB) .eq. 0.0) THEN
	   nobles_early(NUMB) = 0.0
         iodine_early(NUMB) = 0.0
         cesium_early(NUMB) = 0.0
         tellurium_early(NUMB) = 0.0
         strontium_early(NUMB) = 0.0
         barium_early(NUMB) = 0.0
         ruthenium_early(NUMB) = 0.0
         cerium_early(NUMB) = 0.0
         lanthanum_early(NUMB) = 0.0
         aerosol_early(NUMB) = 0.0
      end if
	if (duration_ex(NUMB) .eq. 0.0) THEN
	   nobles_ex(NUMB) = 0.0
         iodine_ex(NUMB) = 0.0
         cesium_ex(NUMB) = 0.0
         tellurium_ex(NUMB) = 0.0
         strontium_ex(NUMB) = 0.0
         barium_ex(NUMB) = 0.0
         ruthenium_ex(NUMB) = 0.0
         cerium_ex(NUMB) = 0.0
         lanthanum_ex(NUMB) = 0.0
         aerosol_ex(NUMB) = 0.0
      end if
	if (duration_late(NUMB) .eq. 0.0) THEN
	   nobles_late(NUMB) = 0.0
         iodine_late(NUMB) = 0.0
         cesium_late(NUMB) = 0.0
         tellurium_late(NUMB) = 0.0
         strontium_late(NUMB) = 0.0
         barium_late(NUMB) = 0.0
         ruthenium_late(NUMB) = 0.0
         cerium_late(NUMB) = 0.0
         lanthanum_late(NUMB) = 0.0
         aerosol_late(NUMB) = 0.0
      end if

C
C   for each release file (NUMB) determine which group is releasing in this case
C
      NREL_grp_fil(1,numb) = 0
	IF (duration_gap(NUMB)*Nobles_gap(numb) +
     &     + Nobles_early(numb) + Nobles_ex(numb) + Nobles_late(numb)
     &   .GT. 0.0) NREL_grp_fil(1,numb) = 1
      NREL_grp_fil(2,numb) = 0
	IF (duration_gap(NUMB)*Iodine_gap(numb) +
     &     + Iodine_early(numb) + Iodine_ex(numb) + Iodine_late(numb)
     &   .GT. 0.0) NREL_grp_fil(2,numb) = 1
      NREL_grp_fil(3,numb) = 0
	IF (duration_gap(NUMB)*Cesium_gap(numb) +
     &     + Cesium_early(numb) + Cesium_ex(numb) + Cesium_late(numb)
     &   .GT. 0.0) NREL_grp_fil(3,numb) = 1
      NREL_grp_fil(4,numb) = 0
	IF (duration_gap(NUMB)*Tellurium_gap(numb) +
     &     + Tellurium_early(numb) + Tellurium_ex(numb) 
     &     + Tellurium_late(numb)
     &   .GT. 0.0) NREL_grp_fil(4,numb) = 1
      NREL_grp_fil(5,numb) = 0
	IF (duration_gap(NUMB)*Strontium_gap(numb) +
     &     + Strontium_early(numb) + Strontium_ex(numb)
     &     + Strontium_late(numb)
     &   .GT. 0.0) NREL_grp_fil(5,numb) = 1
      NREL_grp_fil(6,numb) = 0
	IF (duration_gap(NUMB)*Barium_gap(numb) +
     &     + Barium_early(numb) + Barium_ex(numb) + Barium_late(numb)
     &   .GT. 0.0) NREL_grp_fil(6,numb) = 1
      NREL_grp_fil(7,numb) = 0
	IF (duration_gap(NUMB)*Ruthenium_gap(numb) +
     &     + Ruthenium_early(numb) + Ruthenium_ex(numb) 
     &     + Ruthenium_late(numb)
     &   .GT. 0.0) NREL_grp_fil(7,numb) = 1
      NREL_grp_fil(8,numb) = 0
	IF (duration_gap(NUMB)*Cerium_gap(numb) +
     &     + Cerium_early(numb) + Cerium_ex(numb) + Cerium_late(numb)
     &   .GT. 0.0) NREL_grp_fil(8,numb) = 1
      NREL_grp_fil(9,numb) = 0
	IF (duration_gap(NUMB)*Lanthanum_gap(numb) +
     &     + Lanthanum_early(numb) + Lanthanum_ex(numb) 
     &     + Lanthanum_late(numb)
     &   .GT. 0.0) NREL_grp_fil(9,numb) = 1
      NREL_grp_fil(10,numb) = 0
	IF (duration_gap(NUMB)*Aerosol_gap(numb) +
     &     + Aerosol_early(numb) + Aerosol_ex(numb) + Aerosol_late(numb)
     &   .GT. 0.0) NREL_grp_fil(10,numb) = 1

         return

      end

C     ------------------------------------------------------------------
