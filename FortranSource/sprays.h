C     ------------------------------------------------------------------
C
C     Include:     sprays.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C                   Terry Heames (ALION)
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
C     History:     added spray DF limits
C
C
C     ------------------------------------------------------------------

         double precision
     &      fresh_water_fraction(MAXCOMP),
     &      sprays_aerosol(MAXCOMP, MAXCOUNT),
     &      sprays_organic(MAXCOMP, MAXCOUNT),
     &      sprays_aerosol_percentile(MAXCOMP),
     &      sprays_elemental(MAXCOMP, MAXCOUNT),
     &      sprays_aerosol_flux(MAXCOMP, MAXCOUNT),
     &      sprays_aerosol_time(MAXCOMP, MAXCOUNT),
     &      sprays_organic_time(MAXCOMP, MAXCOUNT),
     &      sprays_aerosol_alpha(MAXCOMP, MAXCOUNT),
     &      sprays_aerosol_height(MAXCOMP, MAXCOUNT),
     &      sprays_elemental_time(MAXCOMP, MAXCOUNT),
     &      sprays_time_marker(MAXZONE),
     &      sprays_lambda(MAXCOMP),
     &      sprays_aerosol_DF_limit, 
     &      sprays_aerosol_lambda_limit, 
     &      sprays_elemental_DF_limit

         integer
     &      sprays_aerosol_model(MAXCOMP),
     &      sprays_aerosol_count(MAXCOMP),
     &      sprays_organic_model(MAXCOMP),
     &      sprays_organic_count(MAXCOMP),
     &      sprays_elemental_model(MAXCOMP),
     &      sprays_elemental_count(MAXCOMP),
     &      ion_elem, ion_aero 

         common /sprays/

     &      fresh_water_fraction,
     &      sprays_aerosol,
     &      sprays_organic,
     &      sprays_aerosol_percentile,
     &      sprays_elemental,
     &      sprays_aerosol_flux,
     &      sprays_organic_time,
     &      sprays_aerosol_time,
     &      sprays_aerosol_alpha,
     &      sprays_aerosol_height,
     &      sprays_elemental_time,
     &      sprays_time_marker,
     &      sprays_lambda,
     &      sprays_aerosol_DF_limit, 
     &      sprays_aerosol_lambda_limit, 
     &      sprays_elemental_DF_limit,

     &      sprays_aerosol_model,
     &      sprays_aerosol_count,
     &      sprays_organic_model,
     &      sprays_organic_count,
     &      sprays_elemental_model,
     &      sprays_elemental_count,
     &      ion_elem, ion_aero     

C     ------------------------------------------------------------------
