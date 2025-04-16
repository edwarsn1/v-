C     ------------------------------------------------------------------
C
C     Include:     p_filter.h
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
C     Version:     3.10
C
C     Date:        
C
C     Revision
C     History:     None - Initial version.
C
C
C     ------------------------------------------------------------------

         double precision
     &      p_filter_time(MAXPATH, MAXCOUNT),
     &      p_filter_flow_rate(MAXPATH, MAXCOUNT),
     &      p_filter_aerosol_eff(MAXPATH, MAXCOUNT),
     &      p_filter_organic_eff(MAXPATH, MAXCOUNT),
     &      p_filter_elemental_eff(MAXPATH, MAXCOUNT)

         integer
     &      p_filter_eff_model(MAXPATH),
     &      p_filter_eff_count(MAXPATH),
     &      P_Filter_Failure(MAXPATH)

         common /p_filter/

     &      p_filter_eff_model,
     &      p_filter_eff_count,
     &      P_Filter_Failure,

     &      p_filter_time,
     &      p_filter_flow_rate,
     &      p_filter_aerosol_eff,
     &      p_filter_organic_eff,
     &      p_filter_elemental_eff

C     ------------------------------------------------------------------
