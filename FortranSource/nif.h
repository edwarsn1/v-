C     ------------------------------------------------------------------
C
C     Include:     nif.h
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
C     Date:        May 2004
C
C     Revision
C     History:     Modified for multiple inventory files.
C				   Added option of inventory or concentration in input
C
C	Inventory Power  1.0e6   Definition (switch from MWt to Wt)
C   Inventory_Type           1 = Ci/MWt in NIF file
C                            2 = Ci/cc  in NIF file
C                            3 = Ci/hr  in NIF file
C   Nuclide_initial_amount   Ci/MWt read in as source for each file (type=1)
C                            Ci/cc read in as source for each file (type=2)
C   Initial nuclides         atoms/MWt as source for each file
C   Nuclide_Insert_Rate      Ci/hr read in as a source for each file (type=3)
C   Compartment_Inventory_File  file to be used as initial inventory
C                               for this source
C
C     ------------------------------------------------------------------

         double precision
     &      atomic_weight(MAXNUC),
     &      inventory_power_level,
     &      nuclide_initial_amount(MAXNUC, MAXFILES),
     &      nuclide_insert_rate(MAXNUC, MAXFILES),
     &      initial_nuclides(MAXNUC, MAXFILES),
     &      nuclide_concentration(MAXNUC,MAXFILES),
     &      branch_fraction(MAXNUC, MAXDGHTR)

         integer
     &      ngroup(MAXNUC),
     &      inventory_type(MAXFILES),
     &      number_of_nuclides,
     &      Compartment_Inventory_File(MAXSRCE),
     &      Nuclide_edit(MAXNUC)

         character
     &      inventory_name(MAXFILES) * 40,
     &      nuclide_name(MAXNUC) * 7,
     &      nuclide_daughter(MAXNUC, MAXDGHTR) * 7

         common /nif/

     &      atomic_weight,
     &      inventory_power_level,
     &      nuclide_initial_amount,
     &      nuclide_insert_rate,
     &      initial_nuclides,
     &      nuclide_concentration,
     &      branch_fraction,

     &      ngroup,
     &      number_of_nuclides,
     &      inventory_type,
     &      Compartment_Inventory_File,
     &      Nuclide_edit,

     &      inventory_name,
     &      nuclide_name,
     &      nuclide_daughter

C     ------------------------------------------------------------------
