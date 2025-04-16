C     ------------------------------------------------------------------
C
C     Include:     convect.h
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
C     Date:        03/2005
C
C     Revision
C     History:     added time pointers to reset time step.
C
C
C     ------------------------------------------------------------------

         double precision
     &      convection_time(MAXPATH, MAXCOUNT),
     &      convection_flow_rate(MAXPATH, MAXCOUNT),
     &      reset_dt1, reset_dt2, reset_dt3, reset_dt4

         integer
     &      convection_model(MAXPATH),
     &      convection_count(MAXPATH)

         common /convect/

     &      convection_time,
     &      convection_flow_rate,
     &      reset_dt1, reset_dt2, reset_dt3, reset_dt4,

     &      convection_model,
     &      convection_count

C     ------------------------------------------------------------------
