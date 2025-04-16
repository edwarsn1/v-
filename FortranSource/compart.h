C     ------------------------------------------------------------------
C
C     Include:     compart.h
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
C     Date:        
C
C     Revision
C     History:     None - Initial version.
c                  1.1  - kew added time constant for dt control
c                  for each compartment for calculating on the fly
C
C
C     ------------------------------------------------------------------

         double precision
     &      time_constant(MAXCOMP),
     &      compartment_volume(MAXCOMP)

         integer
     &      number_of_compartments,
     &      compartment_type(MAXCOMP),
     &      compartment_sump(MAXCOMP),
     &      compartment_decay(MAXCOMP),
     &      compartment_opool(MAXCOMP),
     &      compartment_detail(MAXCOMP),
     &      compartment_sprays(MAXCOMP),
     &      compartment_filters(MAXCOMP),
     &      compartment_deposition(MAXCOMP)

         character
     &      compartment_name(MAXCOMP) * 40

         common /compart/

     &      time_constant,
     &      compartment_volume,

     &      number_of_compartments,
     &      compartment_type,
     &      compartment_sump,
     &      compartment_decay,
     &      compartment_opool,
     &      compartment_detail,
     &      compartment_sprays,
     &      compartment_filters,
     &      compartment_deposition,

     &      compartment_name

C     ------------------------------------------------------------------
