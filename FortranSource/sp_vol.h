C     ------------------------------------------------------------------
C
C     Include:     sp_vol.h
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
     &      sp_volatilization_ph(MAXPATH, MAXCOUNT),
     &      sp_volatilization_area(MAXPATH, MAXCOUNT),
     &      sp_volatilization_time(MAXPATH, MAXCOUNT),
     &      sp_volatilization_tempp(MAXPATH, MAXCOUNT),
     &      sp_volatilization_tempa(MAXPATH, MAXCOUNT),
     &      sp_volatilization_fraction(MAXPATH, MAXCOUNT)

         integer
     &      sp_volatilization_model(MAXPATH),
     &      sp_volatilization_count(MAXPATH)

         common /sp_vol/

     &      sp_volatilization_ph,
     &      sp_volatilization_area,
     &      sp_volatilization_time,
     &      sp_volatilization_tempp,
     &      sp_volatilization_tempa,
     &      sp_volatilization_fraction,

     &      sp_volatilization_model,
     &      sp_volatilization_count

C     ------------------------------------------------------------------
