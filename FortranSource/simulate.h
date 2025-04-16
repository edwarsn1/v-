C     ------------------------------------------------------------------
C
C     Include:     simulate.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames
C
C     Description: The variable dt_max allows a user specified maximum
C                  allowable time step. This was needed to prevent the
C                  overly conservative dose estimates that occured after
C                  a long time step due to the absence of decay during
C                  that time period.
C
C     Usage:       include 'simulate.h'
C
C     Variables:   
C                  XN2     mass in curies by nuclide,
C                          compartment, and location
C				   XNGRP2  mass in Curies by group,
C                          compartment, and location
C                  PATH2   mass in Curies by nuclide
C                          and path
C                  PTHGRP2 mass in Curies by group and 
C                          and path
c                  iclass = 1 (version 1.0-3.03) 
C                           0  Version 3.10
c                  iunits = 0 (version 1.0-3.03) 
C                         = 1  Masses in Curies
C
C     Assumptions:
C
C     Version:     3.10
C
C     Date:        June, 2004
C
C     Revision
C     History:     added a few variables to allow more control of the edits
C
C                  1.1 - March 7, 1996 - added the integer variables
C                  batch_mode, show_plant, and show_scenario and the
C                  logical variables on_zone and on_step to the simulate
C                  common block.
C
C                  1.0 - February, 2 1996 - initial version.
C
C     ------------------------------------------------------------------
c
      double precision

     &   ONSET_GAP_RELEASE, start_accident, duration_accident,
     &   dt_max(MAXCOUNT),  dt_decay,
     &   dt_max_time(MAXCOUNT)

      double precision 

     &   xn2(MAXNUC, MAXCOMP, MAXCLOC),
     &   xngrp2(MAXTGRP, MAXCOMP, MAXCLOC),
     &   path2(MAXNUC, MAXPATH, MAXSTEP+1),
     &   pthgrp2(MAXTGRP, MAXPATH, MAXSTEP+1)


      integer

     &   dt_max_count,
     &   batch_mode,  iunits,       iclass,  
     &   show_plant, show_scenario, show_event, show_step, show_model

      logical

     &   on_event, on_step


      common / simulate /

     &   ONSET_GAP_RELEASE, START_ACCIDENT, duration_accident,
     &   dt_max,  dt_decay,
     &   dt_max_time,
     &   xn2, xngrp2, path2, pthgrp2,

     &   dt_max_count,
     &   batch_mode,   iunits,      iclass,  
     &   show_plant, show_scenario, show_event, show_step,show_model,
     &   on_event, on_step

C     ------------------------------------------------------------------
