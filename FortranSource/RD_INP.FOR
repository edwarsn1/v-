C     ##################################################################
C     ------------------------------------------------------------------
C
C     Subroutine:  rd_inp.for
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
C     History:     Minor changes for Dose coversion factor input.
C
C
C     ------------------------------------------------------------------
      SUBROUTINE RD_INP (error_code, inp_out)
C     ##################################################################

C  Reads the Dose Conversion Factor Input  (DCF's)

CSLH  Added call and modified code to use next available file unit.
C      switch to free format reads

C     include statement
      INCLUDE 'full.com'
C
C     added common to verify dataset consistency
C
      COMMON / NUC_DCF / NUMNUC, NUC_NAME_1
      INTEGER INUC, JORG, I, K, NUMNUC, unit_number, error_code

      double precision DFCTVAL(7)

      logical is_file_there

      CHARACTER*18 DFCTNAM(7)
C     CHARACTER*10 ORGAN_NAME(MAXORG)
      CHARACTER*10 NUC_NAME_1
	CHARACTER*10 NUCNAM(MAXNUC)
      CHARACTER*10 ORGLAB
      CHARACTER*10 NUCLAB
C     CHARACTER*10 CHAR10
      CHARACTER*80 CHAR80
      CHARACTER*72 CHAR72
      CHARACTER*30 CHAR30



      IF ( LEVEL_RDINPD .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A18)') 'SUBROUTINE RDINPD!'
      END IF

C     specify dose factor names
      DFCTNAM(1) = 'CLOUDSHINE        '
      DFCTNAM(2) = 'GROUNDSHINE 8hr   '
      DFCTNAM(3) = 'GROUNDSHINE 7d    '
      DFCTNAM(4) = 'GROUNDSHINE RATE  '
      DFCTNAM(5) = 'INHALATION ACUTE  '
      DFCTNAM(6) = 'INHALATION CHRONIC'
      DFCTNAM(7) = 'INGESTION         '

C     open data file for input

      call nextunit(unit_number)

C\\\\\OPEN( UNIT = unit_number, FILE = 'DUMMY.INP' )
C     #######################################
      inquire(file=dcf_inp_filename,exist=is_file_there)
      if(is_file_there .EQV. .FALSE.) then
         write(inp_out, '(1x,3a)')
     &        'Error in program radtrad. (RDINPD)  '
     &        // 'Unable to open file ',
     &        dcf_inp_filename
         write(inp_out,*) '***********    S T O P   *******************'
         write(out_unit, '(1x,3a)')
     &        'Error in program radtrad. (RDINPD)  '
     &        // 'Unable to open file ',
     &        dcf_inp_filename
         write(out_unit,*) '***********    S T O P   ******************'

C      *****************    S T O P   ***************************
       error_code = 14
c        STOP
         RETURN
      endif
      OPEN( UNIT = unit_number, FILE = dcf_inp_filename )
C     #######################################

C     read two header lines
      DO I = 1, 2
         READ(unit_number,*) CHAR72
         if(level_rdinpd .ge. 3) then
            WRITE(out_unit,*) CHAR72
         end if
      END DO

C     read number of organs defined in file
      READ(unit_number,*) ORGAN_COUNT, CHAR30

      if(level_rdinpd .ge. 3) then
         WRITE(out_unit,*)
     &      'NUMBER OF ORGANS = ', ORGAN_COUNT, char30
      end if

C     read names of all organs
      DO I = 1, ORGAN_COUNT
        READ(unit_number,*) ORGAN_NAME(I)

        if(level_rdinpd .ge. 3) then
           WRITE(out_unit,*) I, ORGAN_NAME(I)
        end if
      END DO

C     read number of nuclides defined in file
      READ(unit_number,*) NUMNUC, CHAR30
      IF (NUMNUC .GT. MAXNUC) THEN
         WRITE(out_unit,'(a,i4,a,i4 )') 'Number of nuclides =', 
     &   NUMNUC,' exceeds allowable =',MAXNUC
         error_code = 15
      END IF
      if(level_rdinpd .ge. 3) then
         WRITE(out_unit,*) 
     &      'NUMBER OF NUCLIDES = ', NUMNUC, char30
      end if

      IF (NUMNUC .NE. number_of_nuclides) THEN
         WRITE(out_unit,'(a,i4,2a,/a,i4,2a,/a )') 'Number of nuclides =' 
     &     ,NUMNUC,' on DCF file ',trim(dcf_inp_filename),
     &     ' does not equal', number_of_nuclides,
     &     ' from the inventory file = ', trim(inventory_filename(1)),
     &     '     (RD_INP)'
         
C..	   CALL QUIT (jonathan_error)
         error_code = 15
c	   STOP
c               **************  STOP  ************************
         RETURN
	END IF


C     read names of all nuclides
      DO I = 1, NUMNUC
         READ(unit_number,*) NUCLAB

         if(level_rdinpd .ge. 3) then
            WRITE(out_unit,*) I, NUCLAB
         end if
      END DO
C
      NUC_NAME_1 = NUCNAM(1)
C
C     read two column headings
      DO I = 1, 2
         READ(unit_number,*) CHAR80

         if(level_rdinpd .ge. 3) then
            WRITE(out_unit,*) CHAR80
         end if
      END DO

C     do-loop for each nuclide label
      DO INUC = 1, NUMNUC

C        read nuclide label
         READ(unit_number,*) NUCNAM(INUC)

         IF (nuclide_name(INUC) .ne. NUCNAM(INUC)) THEN
           WRITE(out_unit,'(4a,/ 4a,/a )') ' nuclide = ', 
     &       NUCNAM(INUC),' on DCF file ',trim(dcf_inp_filename),
     &       ' does not equal ', nuclide_name(INUC),
     &       ' from the inventory file = ',trim(inventory_filename(1)),
     &       '     (RD_INP)'

         error_code =16
c	     STOP
c               **************  STOP  ************************
           RETURN
	   END IF

         if(level_rdinpd .ge. 3) then
C           write nuclide label
            WRITE(out_unit,*) NUCNAM(INUC)
         end if

C        do-loop for each organ label
         DO JORG = 1, ORGAN_COUNT

C           read organ label and dose factor values
C   Normally one could do this with a randome format
C   as the others are done.  However, in the MACCS system
C   when they did not want a value (like inhaled acute)
C   they set it to -1.0, However this value in combination with
C   K. Erickson's write logic results in no space between
C   adjacent numbers, hence a free form  format gets lost.
C
            READ(unit_number,'(A10,7E10.3)') ORGLAB,(DFCTVAL(K),K=1,7)

C           ####### select dose factors of interest #######

C           cloudshine
            DCF_CSHINE(INUC,JORG) = DFCTVAL(1)
C           groundshine, 8 hours
C           DCF_GSH8HR(INUC,JORG) = DFCTVAL(2)
C           groundshine, 7 days
C           DCF_GSH7DA(INUC,JORG) = DFCTVAL(3)
C           groundshine rate
C           DCF_GSHRAT(INUC,JORG) = DFCTVAL(4)
C           inhalation, acute
C           DCF_INHACU(INUC,JORG) = DFCTVAL(5)
C           inhalation, chronic
C           DCF_INHCHR(INUC,JORG) = DFCTVAL(6)
C           inhalation, chronic
            DCF_INHALE(INUC,JORG) = DFCTVAL(6)
C           ingestion
C           DCF_INGEST(INUC,JORG) = DFCTVAL(7)

            if(level_rdinpd .ge. 3) then
C              write organ label
               WRITE(out_unit,'(1X,A10)') ORGLAB
C              write nuclide and organ labels
               WRITE(out_unit,'(1X,A10,A5,A10)') NUCLAB, '     ', ORGLAB
C              write dose factors selected
               WRITE(out_unit,'(1X,2(A14,I2,A1,I2,A4,E13.4))')
     *            'DCF_CSHINE(', INUC, ',', JORG, ') = ',
     *            DCF_CSHINE(INUC,JORG),
     *            'DCF_INHALE(', INUC, ',', JORG, ') = ',
     *            DCF_INHALE(INUC,JORG)

               WRITE(out_unit,'(1X,2A12,2E15.4)')
     *            NUCLAB, ORGLAB, DCF_CSHINE(INUC,JORG),
     *            DCF_INHALE(INUC,JORG)

C              write dose factor name and value
               WRITE(out_unit,'(1X,A18,A5,E10.3,A7,A18,A5,E10.3)')
     *            DFCTNAM(1), '     ', DFCTVAL(1), '       ',
     *            DFCTNAM(2), '     ', DFCTVAL(2)
               WRITE(out_unit,'(1X,A18,A5,E10.3,A7,A18,A5,E10.3)')
     *            DFCTNAM(3), '     ', DFCTVAL(3), '       ',
     *            DFCTNAM(4), '     ', DFCTVAL(4)
               WRITE(out_unit,'(1X,A18,A5,E10.3,A7,A18,A5,E10.3)')
     *            DFCTNAM(5), '     ', DFCTVAL(5), '       ',
     *            DFCTNAM(6), '     ', DFCTVAL(6)
               WRITE(out_unit,'(1X,A18,A5,E10.3)')
     *            DFCTNAM(7), '     ', DFCTVAL(7)
            end if

         END DO
C        end do-loop for each organ label

      END DO
C     end do-loop for each nuclide label

C     close data file for input
      CLOSE ( UNIT = unit_number, ERR = 900 )

C     return to caller
 900  RETURN

C     end of subroutine rdinpd
      END

C..      SUBROUTINE QUIT (addr_data)
C..      REAL*8 addr_data
C..      call addr_data
C..	return
C..	end
