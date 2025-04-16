C     ------------------------------------------------------------------
C
C     Include:     piping.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C     Description: This include file contains the definition of the
C                  PIPING common block which is used to store the piping
C                  parameters obtained from the user interface.
C
C     Usage:       
C
C     Variables:   
C
C     Assumptions: 
C     Version:     2.0
C
C     Date:        November 14, 1995
C
C     Revision
C     History:     2.0 - November 14, 1995 - changed the piping data
C                  structure (predominately used for user defined pipe
C                  pathways) to more closely resemble the user defined
C                  filter pathways. This was done to make user defined
C                  pipe flow rates independent from the transport
C                  groups and allow for the transport of nobles.
C
C                  1.0 - None - initial version.
C
C
C     ------------------------------------------------------------------

         double precision
     &      piping_time(MAXPATH, MAXCOUNT),
     &      piping_flow(MAXPATH, MAXCOUNT),
     &      piping_organic_df(MAXPATH, MAXCOUNT),
     &      piping_aerosol_df(MAXPATH, MAXCOUNT),
     &      piping_elemental_df(MAXPATH, MAXCOUNT),
     &      piping_organic_vel(MAXPATH),
     &      piping_elemental_vel(MAXPATH)


         integer
     &      piping_count(MAXPATH), 
     &      piping_aerosol_model(MAXPATH),
     &      piping_organic_model(MAXPATH),
     &      piping_elemental_model(MAXPATH)

         common /piping/

     &      piping_time,
     &      piping_flow,
     &      piping_organic_df,
     &      piping_aerosol_df,
     &      piping_elemental_df,
     &      piping_organic_vel,
     &      piping_elemental_vel,

     &      piping_count,
     &      piping_organic_model,
     &      piping_aerosol_model,
     &      piping_elemental_model

C     ------------------------------------------------------------------
