C     ------------------------------------------------------------------
C
C     Include:     dose.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872-1089
C     Description:
C
C     Usage:
C
C     Variables:
C
C     Version:     3.10
C
C     Date:        2004
C
C     Revision
C     History:     May 2004  finished path dependent X/Q's
C                  September 2002  added, path dependent X/Q's
C
C                  October 9, 1995 - Added special location for the
C                  environment effective volume calculations.
C
C                  October 1, 1995 - Restructuring of dose arrays. No
C                  consideration of separate pathway doses. Doses are
C                  now calculated using all paths into the compartmment.
C                  The consideration of individual pathways was not an
C                  NRC requirement and significantly decreased the
C                  accuracy of the dose calculations.
C
C                  August 28, 1995 - Initial version.
C
C
C    
C  Numb XQ Tables        Number of XQ tables, for each table:
C    location XQ model   0   old control room model
C						 1   offsite dilution model
C                        2   new dilution model
C    location XQ name    XQ table name
C    location XQ count   Number of time and XQ entries.      
C
C  N Inflow              Number of inflow paths 
C    Inflow Paths        Pathways that are inflow
C  N Exhaust             Number of exhaust paths 
C    Exhaust Paths       Pathways that are exhaust
C  Path_XQ_Table         a matrix with the XQ table number for all 
C                          possible pathways by all possible pathways
C                          (II,JJ) II=exhaust, JJ=inflow
C      MAXDOSE  =  5      Maximum number of dose locations.
C      MAX_XQS = 10      Maximum number of X/Q Tables
C      MAXPATH = 40      Maximum number of pathways.
C      MAXCOUNT=  5      Maximum number of time dependent
C                          entries in a table.
C      J_DOSE_ROOM = 1,4 Compartment is a dose room
C                        1 = No exhaust to environment
C                        4 = Exhaust to Environment
C
C    Gamma_Beta          Number of decays of nuclide in the atmosphere
C    Gamma_Beta_P        Number of decays of nuclide in the pathway
C
C     ------------------------------------------------------------------


       double precision
     &   location_xq(MAX_XQS, MAXCOUNT),
     &   location_xq_time(MAX_XQS, MAXCOUNT),
     &   location_breathing_rate(MAXDOSE, MAXCOUNT),
     &   location_occupancy_factor(MAXDOSE, MAXCOUNT),
     &   location_breathing_rate_time(MAXDOSE, MAXCOUNT),
     &   location_occupancy_factor_time(MAXDOSE, MAXCOUNT)

       integer
     &   Number_Dose_Locations,
     &   location_xq_model(MAX_XQS),
     &   location_xq_count(MAX_XQS),
     &   location_compartment_number(MAXDOSE),
     &   location_breathing_rate_model(MAXDOSE),
     &   location_breathing_rate_count(MAXDOSE),
     &   location_occupancy_factor_model(MAXDOSE),
     &   location_occupancy_factor_count(MAXDOSE),
     &   Inflow_Paths(MAXPATH),
     &   Exhaust_Paths(MAXPATH),
     &   Path_XQ_Table(MAXPATH,MAXPATH)

       character
     &   location_name(MAXDOSE) * 40,
     &   location_xq_name(MAX_XQS) * 40

       common /dose_locations/

     &   location_xq,
     &   location_xq_time,
     &   location_breathing_rate,
     &   location_occupancy_factor,
     &   location_breathing_rate_time,
     &   location_occupancy_factor_time,
     &   Number_Dose_Locations,
     &   Numb_XQ_Tables,
     &   N_Inflow, 
     &   N_Exhaust,
     &   J_Dose_Room,
     &   location_xq_model,
     &   location_xq_count,
     &   location_compartment_number,
     &   location_breathing_rate_model,
     &   location_breathing_rate_count,
     &   location_occupancy_factor_model,
     &   location_occupancy_factor_count,
     &   Inflow_Paths,
     &   Exhaust_Paths,
     &   Path_XQ_Table,
     &   location_name, location_xq_name 

       double precision
     &   decay_constant(MAXNUC),
     &   dcf_cshine(MAXNUC, MAXORG),
     &   dcf_inhale(MAXNUC, MAXORG),
     &   gamma_beta(MAXNUC, MAXCOMP),
     &   gamma_beta_p(MAXNUC, MAXPATH)

       integer organ_count  

       character organ_name(MAXORG) * 10   

       common /dose_calculations/

     &   decay_constant,
     &   dcf_cshine,
     &   dcf_inhale,
     &   gamma_beta, 
     &   gamma_beta_p,
     &   organ_count,

     &   organ_name

C     ------------------------------------------------------------------
