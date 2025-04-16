C     ------------------------------------------------------------------
C
C     Include:     nat_dep.h
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
     &      deposit_height(MAXCOMP, MAXCOUNT),
     &      deposit_aerosol(MAXCOMP, MAXCOUNT),
     &      deposit_aerosol_percentile(MAXCOMP),
     &      deposit_elemental(MAXCOMP, MAXCOUNT),
     &      deposit_aerosol_time(MAXCOMP, MAXCOUNT),
     &      deposit_part_density(MAXCOMP, MAXCOUNT),
     &      deposit_elemental_time(MAXCOMP, MAXCOUNT),
     &      deposit_lambda(MAXCOMP,MAXTGRP)

         integer
     &      deposit_aerosol_model(MAXCOMP),
     &      deposit_aerosol_count(MAXCOMP),
     &      deposit_aerosol_reactor(MAXCOMP),
     &      deposit_elemental_model(MAXCOMP),
     &      deposit_elemental_count(MAXCOMP)

         common /nat_dep/

     &      deposit_height,
     &      deposit_aerosol,
     &      deposit_aerosol_percentile,
     &      deposit_elemental,
     &      deposit_aerosol_time,
     &      deposit_part_density,
     &      deposit_elemental_time,
     &      deposit_lambda,

     &      deposit_aerosol_model,
     &      deposit_aerosol_count,
     &      deposit_aerosol_reactor,
     &      deposit_elemental_model,
     &      deposit_elemental_count

C     ------------------------------------------------------------------
