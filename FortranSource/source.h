C     ------------------------------------------------------------------
C
C     Include:     source.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C                
C                  Terry Heames
C                  ALION/ITSO
C                  505-872-1089
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
C
c
c       source_term_fraction(MAXSRCE)  fraction of this inventory source (NS)
c                                      for compartment Source_Term_On(NS)
C       No_Decay          = 1 then No Decay or daughtering  
C                         = 2 then Decay (any compartment_decay > 0)
C       NSRC_TYPE         = 1 then TID
C                         = 2 then 1465
C                         = 3 then user defined
C
C     ------------------------------------------------------------------

         double precision
     &      plant_power_level,
     &      i_fraction_aerosol(MAXSRCE),
     &      i_fraction_organic(MAXSRCE),
     &      i_fraction_elemental(MAXSRCE),
     &      source_term_fraction(MAXSRCE)

         integer
     &      Number_of_Sources,
     &      No_Decay,
     &      calculate_daughters,
     &      NSRC_TYPE(MAXSRCE),
     &      Source_Term_On(MAXSRCE)

         common /sourcec/

     &      plant_power_level,
     &      i_fraction_aerosol,
     &      i_fraction_organic,
     &      i_fraction_elemental,
     &      source_term_fraction,
     &      Number_of_Sources,
     &      No_Decay,
     &      calculate_daughters,
     &      NSRC_TYPE,
     &      Source_Term_On



C     ------------------------------------------------------------------
