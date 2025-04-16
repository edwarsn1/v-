C     ------------------------------------------------------------------
C
C     Include:     op.h
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
C     Variables:   
C
C     Assumptions: 
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

         double precision
     &      op_initial_volume,
     &      op_aerosol_percentile,
     &      op_organic_df(MAXCOUNT),
     &      op_aerosol_df(MAXCOUNT),
     &      op_elemental_df(MAXCOUNT),
     &      op_organic_time(MAXCOUNT),
     &      op_aerosol_time(MAXCOUNT),
     &      op_aerosol_height(MAXCOUNT),
     &      op_elemental_time(MAXCOUNT),
     &      op_aerosol_cooling(MAXCOUNT)

         integer
     &      op_decay,
     &      op_organic_model,
     &      op_organic_count,
     &      op_aerosol_model,
     &      op_aerosol_count,
     &      op_elemental_model,
     &      op_elemental_count

        common /op/

     &      op_initial_volume,
     &      op_aerosol_percentile,
     &      op_aerosol_df,
     &      op_organic_df,
     &      op_elemental_df,
     &      op_organic_time,
     &      op_aerosol_time,
     &      op_aerosol_height,
     &      op_elemental_time,
     &      op_aerosol_cooling,

     &      op_decay,
     &      op_organic_model,
     &      op_organic_count,
     &      op_aerosol_model,
     &      op_aerosol_count,
     &      op_elemental_model,
     &      op_elemental_count

C     ------------------------------------------------------------------
