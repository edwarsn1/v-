C     ------------------------------------------------------------------
C
C     Include:     constant.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Brian Lewis
C                  Sandia National Laboratories
C
C                  Terry Heames
C                  ALION Science and Technology
C
C     Description: This include file contains constants that are used in
C                  in the RADTRAD code for various puposes. Examples are
C                  physical constants, conversion factors, and error
C                  tolerences for aboslute and relative errors.
C                  Constants that are used to dimension arrays are found
C                  in limit.h Eventually I hope to make this a block
C                  data file and link it in as a library so that changes
C                  in this file won't require recompilation of all the
C                  sources that might depend on these values. So don't
C                  put any parameters in here that could affect your
C                  object code other than by the value of the parameter
C                  itself.
C
C     Usage:       include 'icode\constant.h'
C
C     Variables:   This include file contains all of the constants used
C                  by RADTRAD other than the 'MAX' parameters found in
C                  the limits.h file.
C
C     Assumptions: The values below will be used wherever needed instead
C                  of hard-coding their values into the software.
C
C     Version:     3.10
C
C     Date:        May 2004
C
C     Revision
C     History:     1.3 - December 3, 1996 - added additional unit
C                  conversion factors. Made all of the parameters double
C                  precision.
C
C                  1.2 - August 19, 1996 - added unit conversion
C                  factors.
C
C                  1.1 - March 11, 1996 - added the constant AVOGADRO,
C                  Avogadro's number and GAS_CONSTANT, the molar gas
C                  constant.
C
C                  1.0 - February 27, 1996 - initial version.
C
C     ------------------------------------------------------------------

C        Define ABS_EPSILON and REL_EPSILON, absolute and relative
C        epsilons for doing absolute and relative comparisons between
C        floating point values in RADTRAD. If the absolute difference
C        between two values is less less than ABS_EPSILON then the two
C        numbers are considered to be close enough to be equal. Usually
C        only used when comparing the magnitude of a number to 0.0
C        If the relative difference of two numbers is less than
C        REL_EPSILON then the two numbers are considered close enough to
C        be equal. The value of REL_EPSILON effectively determines the
C        number of digits that are considered significant.

C        References:

C           G. H. Golub, C. F. Van Loan, "Matrix Computations, 2nd Ed.,"
C           The John Hopkins University Press, Baltimore, MD, 1993,
C           p. 54.

C           D. Kahaner, C. Moler, S. Nash, "Numerical Methods and
C           Software," Prentice Hall, Englewood Cliffs, NJ, 1989,
C           p. 249.
C
C    EPS_TIME to avoid roundoff in table lookup calculations
C
         double precision

     &      ABS_EPSILON, REL_EPSILON, EPS_TIME

         parameter
     &   (
     &      ABS_EPSILON  = 1.0D-20,

     &      REL_EPSILON  = 1.0D-10,

     &      EPS_TIME     = 1.0D-6
     &   )


C        Define AVOGADRO, Avogadro's number and GAS_CONSTANT, the molar
C        gas constant.

C        Reference:

C           E. R. Cohen, B. N. Taylor, "The 1986 Adjustment of the
C           Fundamental Physical Constants," report of the Committee on
C           Data for Science and Technology (CODATA) Task Group on
C           Fundamental Constants, CODATA Bulletin 63, Pergammon Press,
C           Elmsford, NY, 1986.

         double precision

     &      AVOGADRO, GAS_CONSTANT

         parameter
     &   (                                     !    -1
     &      AVOGADRO     = 6.0221367D+23,      ! mol  

     &                                         !      -1  -1
     &      GAS_CONSTANT = 8.314510D+00        ! J mol   K
     &   )


         double precision

     &      GMTOCFM, CFMTOGM,
     &      M3STOCFM, CFMTOM3S,
     &      MTOF, FTOM,
     &      M2TOF2, F2TOM2,
     &      IM2TOIF2, IF2TOIM2,
     &      M3TOF3, F3TOM3,
     &      KGM3TOGCM3, GCM3TOKGM3,
     &      ISTOIH, IHTOIS,
     &      HTOS, RADTODEG,DEGTORAD,
     &      MWTOW, CITOBQS

         parameter
     &   (                                     !        -1      3    -1
     &      GMTOCFM      = 0.13368055D+00,     ! gal min   to ft  min

     &                                         !   3    -1           -1
     &      CFMTOGM      = 7.4805195D+00,      ! ft  min   to gal min

     &                                         !  3  -1      3    -1
     &      M3STOCFM     = 2.11888001295D+03,  ! m  s   to ft  min 

     &                                         !    3   -1     3  -1
     &      CFMTOM3S     = 4.71947441048D-04, ! ft  min  to m  s

     &      MTOF         = 3.28083989501D+00, ! m to ft

     &      FTOM         = 0.3048000D+00,      ! ft to m

     &                                         !  2      2
     &      M2TOF2       = 10.7639104167D+00,  ! m  to ft

     &                                         !   2     2
     &      F2TOM2       =  0.09290304D+00,    ! ft  to m
    
     &                                         !  -2      -2
     &      IM2TOIF2     =  0.09290304D+00,    ! m   to ft

     &                                         !   -2     -2
     &      IF2TOIM2     = 10.7639104167D+00,  ! ft   to m

     &                                         !   3     3
     &      F3TOM3       = 0.0283168465D+00,    ! ft  to m

     &                                         !  3      3
     &      M3TOF3       = 35.3146668362D+00,  ! m  to ft

     &                                         !     -3        -3
     &      KGM3TOGCM3   = 0.00100D+00,        ! kg m   to g cm

     &                                         !     -3        -3
     &      GCM3TOKGM3   = 1000.0000D+00,      ! g cm   to kg m

     &                                         !  -1     -1
     &      ISTOIH       = 3600.0,             ! s   to h

     &                                         !  -1     -1
     &      IHTOIS       = 0.2777778D-03,      ! h   to s

     &      HTOS         = 3600.0,             ! h to s

     &      DEGTORAD     = .0174532925,        ! Degrees to radians

     &      RADTODEG     = 57.2957795131,      ! Radians to degrees
     
     &      MWTOW        = 1.0e+06,            ! mwatt to watt
                                               !               -1
     &      CITOBQS      = 3.7e10              ! Curies to Bq s

     &   )
C     ------------------------------------------------------------------
