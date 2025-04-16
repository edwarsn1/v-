C     ------------------------------------------------------------------
C
C     Include:     pathway.h
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
C     Version:     1.1
C
C     Date:        February 12, 1995
C
C     Revision
C     History:     1.1 - February 12, 1995 - Inclusion of the variable
C                  pathway_pipe_number which was added by Steven A.
C                  Stage, PNL on January 10, 1995.
C
C                  1.0 - December 15, 1994 - Initial version.
C
C     ------------------------------------------------------------------

         integer
     &      number_of_pathways,
     &      pathway_from(MAXPATH),
     &      pathway_to(MAXPATH),
     &      pathway_type(MAXPATH),
     &      pathway_detail(MAXPATH),
     &      pathway_decay(MAXPATH),
     &      pathway_pipe_number(MAXPATH)

         character
     &      pathway_name(MAXPATH) * 50

         common /pathway/

     &      number_of_pathways,
     &      pathway_from,
     &      pathway_to,
     &      pathway_type,
     &      pathway_detail,
     &      pathway_decay,
     &      pathway_pipe_number,

     &      pathway_name
C     ------------------------------------------------------------------
