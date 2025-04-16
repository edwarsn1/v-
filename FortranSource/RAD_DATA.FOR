C     ------------------------------------------------------------------
C
C     Block data:  rad_data
C
C     ------------------------------------------------------------------
C
C     Author(s)
C                  Terry Heames
C                  ALION Science & Technology
C                 (505) 872-1089
C
C     Description:
C      Subroutine needed to re-zero commons values between runs
C
C
C     Version:     3.10
C
C     Date:          2004
C
C     Revision
C     History:     September 2002  added, path dependent X/Q's
C                       September switched it to a called subroutine
C
C
C     ------------------------------------------------------------------

      Subroutine rad_data

         include 'limits.h'
         include 'brkbix.h'
         include 'c_filter.h'
         include 'compart.h'
         include 'convect.h'
         include 'dose.h'
         include 'filename.h'
C            include 'names.h'
         include 'nat_dep.h'
         include 'nif.h'
         include 'op.h'
         include 'op_vol.h'
         include 'p_filter.h'
         include 'pathway.h'
         include 'piping.h'
         include 'rel_time.h'
         include 'simulate.h'
         include 'source.h'
         include 'sp.h'
         include 'sp_vol.h'
         include 'sprays.h'
         include 'sump_vol.h'
         include 'water.h'

        show_step = 0 
        show_event = 1 
        dt_max_count = 0 
        ion_elem = 0
        ion_aero = 0

C        plant_filename = 'NEW_PSF.PSF' 
C        scenario_filename = 'NEW_SDF.SDF' 
C        output_filename = 'OUTPUT.TXT' 

        Number_Dose_Locations = 0 
        Numb_XQ_Tables = 0 

         
      number_of_compartments = 0 
      DO II = 1, MAXCOMP, 1
          compartment_name(II) = 'Unused' 
          compartment_type(II) =   0 
          compartment_volume(II) =   0.0d0
          compartment_sprays(II) =  0
          compartment_sump(II) =  0
          compartment_filters(II) =  0
          compartment_deposition(II) =  0
          compartment_detail(II) =  0
          compartment_decay(II) =  0
          compartment_opool(II) =  0
          sprays_aerosol_model(II) =  0
          sprays_organic_model(II) =  0
          sprays_elemental_model(II) =  0
          deposit_aerosol_model(II) =  0
          deposit_elemental_model(II) =  0
          c_filter_eff_model(II) = 0
      END DO   
C
      DO II = 1, MAXSRCE, 1
	    Source_Term_On(II) =  0
          Source_Term_Fraction(II) =  0.0d0
          Compartment_Inventory_File(II) =  0
          Inventory_Release(II) = 0
      END DO

      DO II= 1, MAXNUC, 1
        DO JJ = 1, MAXFILES, 1
          Nuclide_Initial_Amount(II,JJ) = 0
          Initial_Nuclides(II,JJ) = 0
          Nuclide_Insert_Rate(II,JJ) = 0
        END DO
      END DO
C
      DO II = 1, MAXCOUNT, 1
          dt_max(II) = 0.0d0
          dt_max_time(II) = 0.0d0
      END DO

      DO II = 1, MAXFILES, 1
          Inventory_Release(II) = 0 
C          inventory_filename(II) =  '             '  
C          release_filename(II) =  '             '  
      END DO
    
      DO II = 1, MAXDOSE, 1
          location_name(II) = 'Unused' 
          location_compartment_number(II) = 0
      END DO

      DO II = 1, MAX_XQS, 1
          location_xq_model(II) = 0
          location_xq_count(II) = 0
          Location_XQ_name(II) = 'Unused'
        DO JJ = 1, MAXCOUNT, 1
            location_xq_time(II,JJ) = 0.0d0 
            location_xq(II,JJ) = 0.0d0
        END DO
      END DO

      DO II = 1, MAXPATH, 1
        DO JJ = 1, MAXPATH, 1
            Path_XQ_Table(II,JJ) = 0 
        END DO
        Inflow_Paths(II) = 0
        Exhaust_Paths(II) = 0
      END DO

      DO II = 1, MAXDOSE, 1
          location_breathing_rate_model(II) = 0
          location_breathing_rate_count(II) = 0
          location_occupancy_factor_model(II) = 0 
          location_occupancy_factor_count(II) = 0
        DO JJ = 1, MAXCOUNT, 1
          location_breathing_rate_time(II,JJ) = 0.0d0
          location_breathing_rate(II,JJ) = 0.0d0
          location_occupancy_factor_time(II,JJ) = 0.0d0
          location_occupancy_factor(II,JJ) = 0.0d0
        END DO
      END DO

          number_of_pathways = 0 
      DO II = 1, MAXPATH, 1
          pathway_name(II) = 'Unused'
          pathway_from(II) = 0
          pathway_to(II) = 0
          pathway_type(II) = 0
          pathway_detail(II) = 0
          pathway_decay(II) = 0
          pathway_pipe_number(II) = -1
          P_Filter_Failure(II) = 0
          water_leakage_model(II) = 0
          sp_aerosol_model(II) = 0
          sp_organic_model(II) = 0
          sp_elemental_model(II) = 0
          piping_aerosol_model(II) = 0
          piping_organic_model(II) = 0
          piping_elemental_model(II) = 0
          p_filter_eff_model(II) = 0
          convection_model(II) = 0
      END DO
          plant_power_level = 0.0d0 

      DO II = 1, MAXNUC, 1
        DO JJ = 1, MAXSTEP, 1
          op_nuc_inv(II,JJ) = 0.0d0
        END DO
      END DO
      DO II = 1, MAXTGRP, 1
        DO JJ = 1, MAXSTEP, 1
          op_grp_inv(II,JJ) = 0.0d0
        END DO
      END DO

      return
      end

C     ----------------------------------------------------------
