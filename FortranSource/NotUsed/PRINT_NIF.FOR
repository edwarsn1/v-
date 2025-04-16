C     ##################################################################
      SUBROUTINE PRINT_NIF (NUMB)
C     ##################################################################

C     output nuclide inventory file data

C     include statement
      INCLUDE 'full.com'
      
      INTEGER I
CDKM  INTEGER INUC, IGRP

      double precision CURIE

C     curie, disintegrations per second
      CURIE = 3.7E+10

C     write banner on subroutine entry
      WRITE(out_unit,'(1X,A18)') 'SUBROUTINE PRINT_NIF!'


C     write name of input file
      IF ( LEVEL_NIFOUT .GE. 3 ) THEN            
        WRITE(out_unit,'(1X,A21,A21)') 
     *   'INVENTORY_FILENAME = ', INVENTORY_FILENAME(NUMB)
      END IF

C     write nuclide inventory name
      IF ( LEVEL_NIFOUT .GE. 2 ) THEN              
        WRITE(out_unit,'(1X,A17,A40)')
     *   'INVENTORY_NAME = ', INVENTORY_NAME
      END IF

C     write inventory power level
      IF ( LEVEL_NIFOUT .GE. 2 ) THEN                    
        WRITE(out_unit,'(1X,A24,F11.4,A12)')
     *   'INVENTORY_POWER_LEVEL = ', 
     *    INVENTORY_POWER_LEVEL / 1.0E+06, 'MW-thermal'
      END IF

C     write number of nuclides
      IF ( LEVEL_NIFOUT .GE. 2 ) THEN              
        WRITE(out_unit,'(1X,A21,I3)')
     *   'NUMBER_OF_NUCLIDES = ', NUMBER_OF_NUCLIDES
      END IF

C     do for each nuclide data block
      DO I = 1, NUMBER_OF_NUCLIDES

        IF ( NUCLIDE_INITIAL_AMOUNT(I,NUMB) .NE. 0.0 ) THEN
        IF ( LEVEL_NIFOUT .GE. 2 ) THEN

C         write nuclide name and group number
          WRITE(out_unit,'(1X,A13,I2,A4,A7,A19,I2,A4,I3)') 
     *     'NUCLIDE_NAME(', I, ') = ', NUCLIDE_NAME(I),
     *     'NUCLIDE GROUP(', I, ') = ', NGROUP(I)

C         write nuclide group
C         WRITE(out_unit,'(1X,A14,I2,A4,I3)')
C    *     'NUCLIDE GROUP(', I, ') = ', NGROUP(I)

C         write atomic weight
          WRITE(out_unit,'(1X,A15,I2,A4,F11.4,A10)')
     *    ' ATOMIC_WEIGHT(', I, ') = ', ATOMIC_WEIGHT(I), ' kgm/kmole'

C         write nuclide initial amount
          WRITE(out_unit,'(1X,A16,I2,A4,E11.4,A6,E11.4,A8,E11.4,A6)')
     *    ' INITIAL_AMOUNT(', I, ') = ',
     *      NUCLIDE_INITIAL_AMOUNT(I,NUMB) * DECAY_CONSTANT(I) / CURIE, 
     *     ' Ci = ',
     *      NUCLIDE_INITIAL_AMOUNT(I,NUMB), ' atom = ',
     *      NUCLIDE_INITIAL_AMOUNT(I,NUMB) / AVOGADRO / 1.0d3, ' kmole'

C         write nuclide daughters
          WRITE(out_unit,'(1X,A18,I2,A4,3A11)')
     *    ' NUCLIDE_DAUGHTER(', I, ') = ', NUCLIDE_DAUGHTER(I,1),
     *      NUCLIDE_DAUGHTER(I,2), NUCLIDE_DAUGHTER(I,3)

C         write branching fractions
          WRITE(out_unit,'(1X,A17,I2,A4,3E11.4)')
     *    ' BRANCH_FRACTION(', I, ') = ', 
     *      BRANCH_FRACTION(I,1), BRANCH_FRACTION(I,2), 
     *      BRANCH_FRACTION(I,3)

        END IF
        END IF

      END DO
C     end do for each nuclide data block

C     return to caller
 900  RETURN

C     end of subroutine PRINT_NIF
      END


