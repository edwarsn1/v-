C     ------------------------------------------------------------------
C
C     Include:     op_vol.h
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
C     Version:     1.2
C
C     Date:        January 31, 1996
C
C     Revision
C     History:     1.2 - January 31, 1996 - changed all reals to double
C                  precision and put all doule precision variables first
C                  in the common block.
C
C                  1.1 - January 17, 1996 - corrected op_grp_inv, now
C                  uses MAXTGRP instead of MAXNUC - kew 
C
C                  1.0 - Initial version.
C
C     ------------------------------------------------------------------

         double precision
     &      op_nuc_inv(MAXNUC, MAXSTEP),
     &      op_grp_inv(MAXTGRP, MAXSTEP),
     &      op_volatilization_ph(MAXCOUNT), 
     &      op_volatilization_time(MAXCOUNT),
     &      op_volatilization_area(MAXCOUNT),
     &      op_volatilization_tempp(MAXCOUNT),
     &      op_volatilization_tempa(MAXCOUNT)

         integer
     &      op_volatilization_model,
     &      op_volatilization_count

         common /op_vol/

     &      op_nuc_inv,
     &      op_grp_inv,
     &      op_volatilization_ph,
     &      op_volatilization_time,
     &      op_volatilization_area,
     &      op_volatilization_tempp,
     &      op_volatilization_tempa,

     &      op_volatilization_model,
     &      op_volatilization_count

C     ------------------------------------------------------------------
