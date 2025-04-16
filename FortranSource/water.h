C     ------------------------------------------------------------------
C
C     Include:     water.h
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
     &      water_leakage_time(MAXPATH, MAXCOUNT),
     &      water_leakage_rate(MAXPATH, MAXCOUNT)

         integer
     &      water_leakage_model(MAXPATH),
     &      water_leakage_count(MAXPATH)

         common /water/

     &      water_leakage_time,
     &      water_leakage_rate,

     &      water_leakage_model,
     &      water_leakage_count

C     ------------------------------------------------------------------
