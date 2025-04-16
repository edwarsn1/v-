C     ------------------------------------------------------------------
C
C     Include:     rel_time.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames 
C                  ALION/ITSO
C                  505-872-1089 
C
C     Description: This file contains the global variables associated
C                  with the release nuclide fractions and timing.
C
C     Usage:       include 'icode\rel_time.h'
C
C     Variables:   
C
C     Assumptions: There is at least one and at most four releases. Each
C                  release begins at the completion of the previous
C                  release with the exception of the fourth release (if
C                  there is one) which begins concurrently with the
C                  third release.
C
C     Version:     3.10
C
C     Date:        May 2004
C
C     Revision
C     History:     3.10  allow input edit to be simpler
C                  3.10  Multiple tables included moved timing to simulate.h
C                  1.1 - March 6, 1996 - added variable to allow for
C                  cases where the release(s) begin some time after
C                  reactor shutdown. The variable ONSET_GAP_RELEASE
C                  contains the time that the first release begins.
C
C
C
C     ------------------------------------------------------------------

      DOUBLE PRECISION

     &   duration_gap(MAXFILES),  duration_early(MAXFILES), 
     &   duration_ex(MAXFILES),   duration_late(MAXFILES),
     &   nobles_gap(MAXFILES),    nobles_early(MAXFILES), 
     &   nobles_ex(MAXFILES),     nobles_late(MAXFILES),
     &   iodine_gap(MAXFILES),    iodine_early(MAXFILES),  
     &   iodine_ex(MAXFILES),     iodine_late(MAXFILES),
     &   cesium_gap(MAXFILES),    cesium_early(MAXFILES),  
     &   cesium_ex(MAXFILES),     cesium_late(MAXFILES),
     &   tellurium_gap(MAXFILES), tellurium_early(MAXFILES),  
     &   tellurium_ex(MAXFILES),  tellurium_late(MAXFILES),
     &   strontium_gap(MAXFILES), strontium_early(MAXFILES),  
     &   strontium_ex(MAXFILES),  strontium_late(MAXFILES),
     &   barium_gap(MAXFILES),    barium_early(MAXFILES),  
     &   barium_ex(MAXFILES),     barium_late(MAXFILES),
     &   ruthenium_gap(MAXFILES), ruthenium_early(MAXFILES),  
     &   ruthenium_ex(MAXFILES),  ruthenium_late(MAXFILES),
     &   cerium_gap(MAXFILES),    cerium_early(MAXFILES),  
     &   cerium_ex(MAXFILES),     cerium_late(MAXFILES),
     &   lanthanum_gap(MAXFILES), lanthanum_early(MAXFILES),  
     &   lanthanum_ex(MAXFILES),  lanthanum_late(MAXFILES),
     &   aerosol_gap(MAXFILES),   aerosol_early(MAXFILES),  
     &   aerosol_ex(MAXFILES),    aerosol_late(MAXFILES)

      INTEGER NREL_grp_fil(MAXCGRP,MAXFILES)

      CHARACTER
     &   release_name(MAXFILES) * 60, RFT_TITLE_1(MAXFILES)*60
  
      COMMON /rel_time/
     &   duration_gap,  duration_early,  duration_ex,  duration_late,
     &   nobles_gap,    nobles_early,    nobles_ex,    nobles_late,
     &   iodine_gap,    iodine_early,    iodine_ex,    iodine_late,
     &   cesium_gap,    cesium_early,    cesium_ex,    cesium_late,
     &   tellurium_gap, tellurium_early, tellurium_ex, tellurium_late,
     &   strontium_gap, strontium_early, strontium_ex, strontium_late,
     &   barium_gap,    barium_early,    barium_ex,    barium_late,
     &   ruthenium_gap, ruthenium_early, ruthenium_ex, ruthenium_late,
     &   cerium_gap,    cerium_early,    cerium_ex,    cerium_late,
     &   lanthanum_gap, lanthanum_early, lanthanum_ex, lanthanum_late,
     &   aerosol_gap,   aerosol_early,   aerosol_ex,   aerosol_late,
     &   NREL_grp_fil,
     &   release_name,  RFT_TITLE_1

C     ------------------------------------------------------------------
