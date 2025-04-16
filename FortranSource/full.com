C     ##################################################################
C     ############################ FULL.COM ############################
C     ##################################################################

C     Type and common block declarations are found in include
C     statements, which contain similar code used in both the
C     interface and model code.

      include 'limits.h'
      include 'brkbix.h'
      include 'compart.h'
      include 'constant.h'
      include 'convect.h'
      include 'c_filter.h'
      include 'dose.h'
      include 'filename.h'
C         include 'names.h'
      include 'nat_dep.h'
      include 'nif.h'
      include 'op.h'
      include 'op_vol.h'
      include 'pathway.h'
      include 'piping.h'
      include 'p_filter.h'
      include 'rel_time.h'
      include 'simulate.h'
      include 'source.h'
      include 'sp.h'
      include 'sprays.h'
      include 'sp_vol.h'
      include 'sump_vol.h'
      include 'water.h'

C     Level-of-detail flags for diagnostic output.

      include 'flags.h'

C     ##################################################################
C     ############################ FULL.COM ############################
C     ##################################################################
