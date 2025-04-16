C     ------------------------------------------------------------------
C
C     Include:     sp.h
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
C     History:     Extended the suppression pool model to separate the flow 
C                  and df for all chemical forms (noble, org, elem, aero, all aero)
C
C
C     ------------------------------------------------------------------

         double precision
     &      sp_initial_volume(MAXPATH),
     &      sp_aerosol_percentile(MAXPATH),
     &      sp_aerosol_df(MAXPATH, MAXCOUNT),
     &      sp_organic_df(MAXPATH, MAXCOUNT),
     &      sp_elemental_df(MAXPATH, MAXCOUNT),
     &      sp_aerosol_time(MAXPATH, MAXCOUNT),
     &      sp_organic_time(MAXPATH,MAXCOUNT),
     &      sp_elemental_time(MAXPATH, MAXCOUNT),
     &      sp_nobelgas_time(MAXPATH, MAXCOUNT),
     &      sp_aerosol_flow_rate(MAXPATH, MAXCOUNT),
     &      sp_organic_flow_rate(MAXPATH, MAXCOUNT),
     &      sp_elemental_flow_rate(MAXPATH, MAXCOUNT),
     &      sp_nobelgas_flow_rate(MAXPATH, MAXCOUNT)

         integer
     &      sp_aerosol_model(MAXPATH),
     &      sp_aerosol_count(MAXPATH),
     &      sp_organic_model(MAXPATH),
     &      sp_organic_count(MAXPATH),
     &      sp_elemental_model(MAXPATH),
     &      sp_elemental_count(MAXPATH),
     &      sp_nobelgas_count(MAXPATH)

         common /sp/

     &      sp_initial_volume,
     &      sp_aerosol_percentile,
     &      sp_aerosol_df,
     &      sp_organic_df,
     &      sp_elemental_df,
     &      sp_aerosol_time,
     &      sp_organic_time,
     &      sp_elemental_time,
     &      sp_nobelgas_time,
     &      sp_aerosol_flow_rate,
     &      sp_organic_flow_rate,
     &      sp_elemental_flow_rate,
     &      sp_nobelgas_flow_rate,

     &      sp_aerosol_model,
     &      sp_aerosol_count,
     &      sp_organic_model,
     &      sp_organic_count,
     &      sp_elemental_model,
     &      sp_elemental_count,
     &      sp_nobelgas_count

C     ------------------------------------------------------------------
