C     ##################################################################
      DOUBLE COMPLEX FUNCTION SUMPWR ( KTG, INUM, JDZ, NNUM, NDENRED,
     *   ZNUM, ZDEN, MULTDEN, NORDER )
C     ##################################################################

C     This function is called by subroutine RESADER.
C     It evaluates the sum of inverse powers for the zeros of the
C     numerator and denominator.

C     SUMPWR(n) is the sum of the inverse numerator powers, less the sum
C     of the inverse denominator powers.

C     Each numerator power is of the form (s-zn)**(-n), where s is equal
C     to the given denominator zero for which the residues are being
C     determined. If s happens to equal zn, then the term is excluded
C     from the sum. In this case a numerator multiplicity is said to
C     occur, and the SUMPWR will apply to the reduced function. Each
C     denominator power if of the form (s-zd)**(-n) and is multiplied
C     by its denominator multiplicity. When s happens to equal zd, then
C     the term is excluded.

C                                 1                mult(j)
C             SUMPWR(n) = Sum ----------- - Sum' -----------
C                          i  (s-n(i))**n    j   (s-d(j))**n

C     ------------------------------------------------------------------
C     CREATED BY DKM, JUNE 1995
C     ------------------------------------------------------------------

C     include statement
      INCLUDE 'full.com'

      INTEGER INUM, IZN, IZD
      INTEGER JDZ
      INTEGER KTG, KNZ, KDZ
      INTEGER MULTDEN(MAXCOMP+1)
      INTEGER NDENRED, NNUM(MAXCOMP), NORDER

      DOUBLE COMPLEX ZDEN(MAXCOMP+1), ZNUM(MAXCOMP,MAXCOMP)
      DOUBLE COMPLEX ZDIFFR, CUNITY, CZERO
      DOUBLE COMPLEX SUMTOP, SUMBOT

C     initialize complex unity
      CUNITY = CMPLX( 1.0, 0.0 )

C     initialize complex zero
      CZERO = CMPLX( 0.0, 0.0 )

C     write banner on entry into function
      IF ( KTG .EQ. 2 ) THEN
      IF ( LEVEL_RESIDUE .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A16)') 'FUNCTION SUMPWR!'
        WRITE(out_unit,'(1X,A16)') '----------------'
      END IF
      END IF

C     write zeros of current numerator
      IF ( KTG .EQ. 2 ) THEN
      IF ( LEVEL_RESIDUE .GE. 2 ) THEN
        DO IZN = 1, NNUM(INUM)
          WRITE(out_unit,'(1X,A6,I2,A1,I2,A4,2E13.4)')
     *     ' ZNUM(', INUM, ',', IZN, ') = ', ZNUM(INUM,IZN)
        END DO
      END IF
      END IF

C     write zeros of denominator
      IF ( KTG .EQ. 2 ) THEN
      IF ( LEVEL_RESIDUE .GE. 2 ) THEN
        DO IZD = 1, NDENRED
          WRITE(out_unit,'(1X,1X,A6,I2,A4,2E13.4)')
     *     ' ZDEN(', IZD, ') = ', ZDEN(IZD)
        END DO
      END IF
      END IF

C     evaluate sum of terms for numerator
      SUMTOP = CZERO
      DO KNZ = 1, NNUM(INUM)
        ZDIFFR = ZDEN(JDZ) - ZNUM(INUM,KNZ)
        IF ( ZDIFFR .NE. CZERO ) THEN
          SUMTOP = SUMTOP + CUNITY / ZDIFFR**NORDER
        END IF
      END DO
C     if multnum = 0 then entire summation evaluated
C     if multnum > 0 then reduced summation evaluated

C     evaluate sum of terms for denominator
      SUMBOT = CZERO
      DO KDZ = 1, NDENRED
        IF ( KDZ .NE. JDZ ) THEN
          ZDIFFR = ZDEN(JDZ) - ZDEN(KDZ)
          SUMBOT = SUMBOT + MULTDEN(KDZ) / ZDIFFR**NORDER
        END IF
      END DO

C     sum of inverse powers
C     value to be returned by function
      SUMPWR = SUMTOP - SUMBOT

C     return to caller
      RETURN

C     end of function SUMPWR
      END
