C     ------------------------------------------------------------------
C
C     Include:     sump_vol.h
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
     &      sump_volatilization_ph(MAXCOMP, MAXCOUNT),
     &      sump_volatilization_time(MAXCOMP, MAXCOUNT),
     &      sump_volatilization_area(MAXCOMP, MAXCOUNT),
     &      sump_volatilization_tempp(MAXCOMP, MAXCOUNT),
     &      sump_volatilization_tempa(MAXCOMP, MAXCOUNT)

         integer
     &      sump_volatilization_model(MAXCOMP),
     &      sump_volatilization_count(MAXCOMP)

         common /sump_vol/

     &      sump_volatilization_ph,
     &      sump_volatilization_time,
     &      sump_volatilization_area,
     &      sump_volatilization_tempp,
     &      sump_volatilization_tempa,

     &      sump_volatilization_model,
     &      sump_volatilization_count

C     ------------------------------------------------------------------
