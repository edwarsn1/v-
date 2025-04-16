C     ------------------------------------------------------------------
C
C     Include:     c_filter.h
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
     &      c_filter_time(MAXCOMP, MAXCOUNT),
     &      c_filter_flow_rate(MAXCOMP, MAXCOUNT),
     &      c_filter_aerosol_eff(MAXCOMP, MAXCOUNT),
     &      c_filter_organic_eff(MAXCOMP, MAXCOUNT),
     &      c_filter_elemental_eff(MAXCOMP, MAXCOUNT)

         integer
     &      c_filter_eff_model(MAXCOMP),
     &      c_filter_eff_count(MAXCOMP),
     &      c_filter_failure(MAXCOMP)

         common /c_filter/

     &      c_filter_time,
     &      c_filter_flow_rate,
     &      c_filter_aerosol_eff,
     &      c_filter_organic_eff,
     &      c_filter_elemental_eff,

     &      c_filter_eff_model,
     &      c_filter_eff_count,
     &      c_filter_failure

C     ------------------------------------------------------------------
