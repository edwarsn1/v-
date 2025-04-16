C     ------------------------------------------------------------------
C
C     Include:     limits.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories

C
C                  Terry Heames
C                  ALION/ITSO
C                  (505) 872-1089
C
C     Description: This include file contains the maximum number of
C                  most all of the items that are stored in arrays.
C                  most of all the other include files and fortran
C                  source files require limits.h for array dimensions,
C                  loop counters, etc.
C
C     Usage:       include 'limits.h'
C
C     Variables:   This include file contains all of the 'MAX'
C                  variables. See below for more information.
C
C     Assumptions: The normal assumption would be that the values below
C                  are used wherever needed instead of hard-coding their
C                  values in. This isn't a valid assumption yet, but
C                  we're getting there. Another false assumption would
C                  be that all of the files that depend on these
C                  variables are re-compiled whenever this file changes.
C                  This hasn't been checked in a long time so you should
C                  remove all of the object files and recompile whever
C                  this file is changed.
C
C     Version:     3.10
C
C     Date:        May 2005
C
C     Revision
C     History:     3.10 Added path dependent X/Q's increased number of 
C                  source terms to 10
C
C                  1.5 - February 27, 1996 - removed MAXIODINE
C                  parameter, no one was using it. Probably left over
C                  from the old MSIV days.
C
C                  1.4 - January 29, 1996 - added MAXPLOC parameter.
C                  MAXPLOC is equal to the maximum number of pathway
C                  sub-locations which can have a nuclide inventory.
C
C                  1.3 - January 18, 1996 - added variable dt_max to
C                  allow for a user specified maximum allowable time
C                  step. This was needed to prevent the overly
C                  conservative dose estimates that occured after a
C                  long time step due to the absence of decay during
C                  that time period.
C
C                  1.2 - January 3, 1996 - changes for time step
C                  architecture to only keep previous and current
C                  results by changing size of MAXSTEP and adding a new
C                  parameter for the user time zones.
C
C                  1.1 - February 12, 1995 - Incorporated changes made
C                  by Steven A. Stage, PNL on January 11, 1995.
C
C                  1.0 - December 15, 1994 - Initial version.
C
C     ------------------------------------------------------------------

         integer
     &      MAXCOMP, MAXCLOC,  MAXPATH, MAXPLOC, 
     &      MAXDOSE, MAXCOUNT, MAXSTEP, MAXZONE,
     &      MAXNUC,  MAXDGHTR, MAXTGRP, MAXCGRP,
     &      MAXORG,  MAXROUTE, MAX_XQS, MAXFILES,
     &      MAXSRCE

         parameter
     &   (
     &      MAXCOMP   =    20,   ! Maximum number of compartments.
     &      MAXCLOC   =     5,   ! Maximum number of locations for
                                 ! activity within a compartment.
     &      MAXPATH   =    40,   ! Maximum number of paths.
     &      MAXPLOC   =     5,   ! Maximum number of locations for
                                 ! activity within a pathway.
     &      MAXDOSE   =    10,   ! Maximum number of dose Locations.

     &      MAXCOUNT  =    12,   ! Maximum number of time dependent
                                 ! entries per input parameter.
     &      MAXSTEP   =     2,   ! Number of time steps stored.
     &      MAXZONE   =  1000,   ! Maximum number of time steps.

     &      MAXNUC    =   101,   ! Maximum number of nuclides.
     &      MAXDGHTR  =     3,   ! Maximum number of daughters per
                                 ! nuclide.
     &      MAXTGRP   =     5,   ! Maximum number of transport groups.
     &      MAXCGRP   =    10,   ! Maximum number of chemical groups.

     &      MAXORG    =    20,   ! Maximum number of dose organs.
     &      MAXROUTE  =     3,   ! Max Dose Routes (injest, shine, deposit)

     &      MAX_XQS   =    10,   ! Maximum number of X/Q Tables.

     &      MAXFILES  =     5,   ! Maximum Number of Inventory and 
                                 ! Release Fraction tables.

     &      MAXSRCE   =    10    ! Maximum Number of sources

     &   )

C     ------------------------------------------------------------------
