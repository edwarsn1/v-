C     ------------------------------------------------------------------
C
C     Subroutine:  print_sdf
C
C     ------------------------------------------------------------------
C
C     Author(s): Brian Lewis   
C                David Monroe
C                Steven Humphreys
C
C                Terry Heames
C                ALION/ITSO
C                (505) 872-1089
C
C     Description: 
C
C     Usage:  
C
C     Inputs:
C
C     Outputs:
C
C     Variables:
C
C     Calls:
C
C     Assumptions:
C
C     Version: 3.1 
C
C     Date:    2002 
C
C     Revision
C     History:     3.10  allow X/Q to vary with pathway
C                  3.02   Modified the suppression pool edit to line it up 
C                  1.1 - Various formatting changes for readability
C                  1.0 - Initial  Version (11 June, 1996) 
C
C     ------------------------------------------------------------------

      subroutine print_sdf()

      include 'full.com'

      integer i, j, numb_path, jlocation, NXQ, II, JJ

      CHARACTER*7 REACTOR_TYPE


      write(out_unit,'(/,10x,a80)') case_name

      write (out_unit, '(/,1x, 2a)')
     &   '###################################',
     &   '####################################'
      write (out_unit, '(21x, a)')
     &   'Scenario Description'
      write (out_unit, '(1x, 2a)')
     &   '###################################',
     &   '####################################'

      write(out_unit, '(/,1x, a, f10.0, a)') 'Inventory Power = ',
     &    plant_power_level/inventory_power_level, ' MWt'

      if (start_accident .GT. 0) then
        write (out_unit, '(1x, a)') " "
        write (out_unit, '(/,1x, a, 1pe12.4,a)')
     &     "Time between shutdown and accident start = ",
     &     (start_accident / 3600 ),' (Hours)' 
      endif

      if (onset_gap_release .GT. 0) then
        write (out_unit, '(1x, a)') " "
        write (out_unit, '(/,1x, a, 1pe12.4,a)')
     &     "Time between shutdown and first release  = ",
     &     (onset_gap_release / 3600 ),' (Hours)' 
      endif

      write (out_unit, '(1x, a)') " "
      write (out_unit, '(/,1x, a, 1pe12.4,a)')
     &     "End Time                                 = ",
     &     (duration_accident / 3600 ),' (Hours)'

      if (No_Decay .EQ. 2) then
         write (out_unit, '(1x, a)')" "
         write (out_unit, '(1x, a)')
     &      "Radioactive Decay is enabled"
	else
         write (out_unit, '(1x, a)')" "
         write (out_unit, '(1x, a)')
     &      "No Radioactive Decay in this analysis"
      endif
      if (calculate_daughters .EQ. 1) then
         write (out_unit,'(1x, a)')
     &   "Calculation of Daughters is enabled"
      endif

C
C   edit the source locations data
C
      DO NS = 1, number_of_sources
	   NCOMP = Source_Term_On(NS)
         IJ = Compartment_Inventory_File(NS)
         IK = Inventory_Release(NS)

 	   write(out_unit,'(/ 1x,a,I2,a,I2,2x,a)') 
     &      'Source Number ',NS,' is used in Compartment ', NCOMP,
     &       compartment_name(NCOMP)

         IL = Inventory_Type(IJ)
         IF (IL .eq.1) write(out_unit,'(1x,a)') 
     &             '   Nuclide Distribution given in Ci/MWt'
         IF (IL .eq.2) write(out_unit,'(1x,a)') 
     &             '   Nuclide Distribution given in Ci/cc'
         IF (IL .eq.3) write(out_unit,'(1x,a)') 
     &             '   Nuclide Distribution given in Ci/hr'
c..         write(out_unit,'(1x,a,I2)') 
c..     &          '   Release File Number ',Inventory_Release(NS)
         IF (Source_Term_Fraction(NS) .gt. 1.0) THEN
            write(out_unit,'(1x,a,f10.2)') 
     &        'Fraction of Nuclide Distribution in this Compartment',
     &          Source_Term_Fraction(NS)
         ELSE 
            write(out_unit,'(1x,a,f10.5)') 
     &        'Fraction of Nuclide Distribution in this Compartment',
     &          Source_Term_Fraction(NS)
         END IF
C
C   edit iodine chemical type distribution
C
         if ((i_fraction_aerosol(NS) + i_fraction_elemental(NS) +
     &       i_fraction_organic(NS)) .ne. 0.0) then
           write (out_unit, '(1x, a)') " "
           write (out_unit, '(1x,a,I2)') 
     &                   'Iodine fractions for source number',NS
           write (out_unit, '(1x, a, 1pe12.4)') "     Aerosol     = ",
     &       i_fraction_aerosol(NS)
           write (out_unit, '(1x, a, 1pe12.4)') "     Elemental   = ",
     &       i_fraction_elemental(NS)
           write (out_unit, '(1x, a, 1pe12.4)') "     Organic     = ",
     &       i_fraction_organic(NS)
         endif
C
C   adjust edit for active nuclides only
C
      DO i = 1, number_of_nuclides, 1 
           Nuclide_edit(i) = 0
      END DO

      DO INUC = 1, number_of_nuclides, 1 
C  Does this nuclide have a quantity to release
        IF(Initial_Nuclides(INUC,IJ)+Nuclide_Concentration(INUC,IJ)+
     &     Nuclide_Insert_Rate(INUC,IJ).gt.0) THEN
C  is this nuclide in release mode
           IF(NREL_grp_fil(Ngroup(INUC),IK).gt.0) THEN           
             Nuclide_edit(INUC) = 1
		   IF (Calculate_Daughters .eq.1) THEN
                do JDTR = 1, MAXDGHTR, 1
                  IF (branch_fraction(INUC, JDTR) .GT. 0.0) THEN
                     DO KNUC = 1, NUMBER_OF_NUCLIDES
C             if name of daughter equals name of nuclide then
                        IF ( NUCLIDE_DAUGHTER(INUC,JDTR) .EQ. 
     &                          NUCLIDE_NAME(KNUC) ) THEN
                           Nuclide_edit(KNUC) = 1
                        END IF
                     END DO
                  END IF
                end do 
             END IF
          END IF
        END IF
      END DO    
	   CALL PRINT_RFT(IJ,IK,NS)


      END DO

      if (((op_aerosol_model + op_elemental_model + op_organic_model)
     &  .GT. 0) .OR. (op_decay .EQ. 1) .OR. (op_initial_volume
     &  .NE. 0)) then
        write (out_unit, '(1x, a)') " "
        write (out_unit, '(1x, a)') "Overlying pool characteristics"
        if (op_decay .eq. 1) then
          write (out_unit, '(1x, a)') " "
          write (out_unit, '(1x, a)') "     Pool decay enabled"
        endif
        if (op_initial_volume .ne. 0) then
          write (out_unit, '(1x, a)') " "
          write (out_unit,'(1x,a,1pe12.4,a)') "     Pool volume = ",
     &      (op_initial_volume * M3TOF3), " (ft^3)"
        endif
        if (op_aerosol_model .eq. 1) then
          if (op_aerosol_count .GT. 0) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Aerosal Removal Data:"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          DF"
            do i=1, op_aerosol_count,1
              write (out_unit,'(1x,2(a,1pe12.4))') "     ",
     &          (op_aerosol_time(i) + start_accident)
     &          / 3600,
     &          "        ",op_aerosol_df(i)
            end do
          endif
        else if (op_aerosol_model .eq. 2) then
          if (op_aerosol_count .GT. 0) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Aerosal Removal Data (Powers' model):"
            write(out_unit,'(1x, a)')" "
            write (out_unit,'(1x, a, i3,a)')
     &        "     Percentile = ",int(op_aerosol_percentile)," (%)" 
            write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, a)') 
     &          "      Time (hr)          Height (ft) "
     &          //"       Pool Temperature (F)"
            do i = 1, op_aerosol_count, 1
              write (out_unit,'(1x,3(a,1pe12.4))') "     ",
     &          (op_aerosol_time(i) + start_accident)
     &          / 3600,"        ",op_aerosol_height(i) * MTOF,
     &          "             ",
     &          (212-(1.8 * op_aerosol_cooling(i)))
            end do
          endif
        endif

        if (op_elemental_model .eq. 1) then
          if (op_elemental_count .GT. 0) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Elemental Removal Data:"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          DF"
            do i=1, op_elemental_count,1
              write (out_unit,'(1x,2(a,1pe12.4))') "     ",
     &          (op_elemental_time(i) + start_accident)
     &          / 3600,
     &          "        ",op_elemental_df(i)
            end do
          endif
        endif

        if (op_organic_model .eq. 1) then
          if (op_elemental_count .GT. 0) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Organic Removal Data:"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          DF"
            do i=1, op_organic_count, 1
              write (out_unit,'(1x,2(a,1pe12.4))') "     ",
     &          (op_organic_time(i) + start_accident)
     &          / 3600,
     &          "        ",op_organic_df(i)
            end do
          endif
        endif
      endif

      write (out_unit, '(1x, a)') " "
      write (out_unit, '(1x, a)') "COMPARTMENT DATA"

      do i=1, number_of_compartments,1

        write (out_unit,'(1x, a)')" "
        write (out_unit,'(1x, a, i3,2a)')
     &    "Compartment number ", i ,": ",
     &    compartment_name(i)


        if (sprays_aerosol_model(i) .eq. 1) then
          if (sprays_aerosol_count(i) .ge. 1) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Sprays:  Aerosal Removal Data"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          Removal Coef. (hr^-1)"
            do j=1, sprays_aerosol_count(i),1
               write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &           (sprays_aerosol_time(i,j) + start_accident)
     &           / 3600,
     &            "        ",(sprays_aerosol(i,j) * ISTOIH)
            end do
            write(out_unit,'(/6x, a, 1pe12.4)')
     &         "DF_aerosol value when RADTRAD divides lambda by 10 = ",
     &         sprays_aerosol_lambda_limit 
            write(out_unit,'(/6x, a, 1pe12.4)')
     &         "DF_aerosol value when RADTRAD sets lambda to 0.0 = ",
     &         sprays_aerosol_DF_limit 

          endif
        else if (sprays_aerosol_model(i) .eq. 2) then
          write(out_unit,'(1x, a)')" "
          write(out_unit,'(1x, a)') 
     &      "     Sprays:  Aerosal Removal Data"
          write(out_unit,'(1x, a)') " "
          write (out_unit, '(a, 1pe12.4)')
     &      "       alpha = ",sprays_aerosol_alpha(i,1)
          write (out_unit, '(a, i3.0)')"       percentile = ",
     &      int(sprays_aerosol_percentile(i))
          write(out_unit,'(1x, a)') " "
          if (sprays_aerosol_count(i) .ge. 1) then
            write(out_unit,'(1x, 2a)') 
     &        "      Time (hr)          Flux (cfm*ft^-2)",
     &        "   Height (ft)"
            do j = 1, sprays_aerosol_count(i),1
              write (out_unit,'(1x,3(a,1pe12.4))')
     &          "     ",(sprays_aerosol_time(i,j) + 
     &          start_accident) / 3600,
     &          "            ",(sprays_aerosol_flux(i,j) * M3STOCFM 
     &          * IM2TOIF2),'          ',
     &          (sprays_aerosol_height(i,j) * MTOF)
            end do
          endif
        endif
        if (sprays_elemental_model(i) .eq. 1) then
          if (sprays_elemental_count(i) .ge. 1) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Sprays:  Elemental Removal Data"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          Removal Coef. (hr^-1)"
            do j = 1, sprays_elemental_count(i),1
              write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &          (sprays_elemental_time(i,j) + start_accident)
     &          / 3600,'        ',
     &          (sprays_elemental(i,j) * ISTOIH)
            end do
          endif
            write(out_unit,'(/6x, a, 1pe12.4)')
     &         "DF elemental value when RADTRAD sets lambda to 0.0 =",
     &         sprays_elemental_DF_limit 

        endif
        if (sprays_organic_model(i) .eq. 1) then
          if (sprays_organic_count(i) .ge. 1) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Sprays:  Organic Removal Data"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          Removal Coef. (hr^-1)"
            do j = 1, sprays_organic_count(i), 1
              write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &          (sprays_organic_time(i,j) + start_accident)
     &          / 3600,'        ',
     &          (sprays_organic(i,j) * ISTOIH)
            end do
          endif
        endif
        if (c_filter_eff_model(i) .eq. 1) then
          write(out_unit,'(1x, a)')" "
          write(out_unit,'(1x, a)') 
     &      "     Compartment Filter Data"
          write(out_unit,'(1x, a)')" "
          if (c_filter_eff_count(i) .ge. 1) then
            write(out_unit,'(a)') 
     &        "       Time (hr)      Flow Rate         "
     &        //" Filter Efficiencies (%)"
            write(out_unit,'(1x, a)') 
     &        "                       (cfm)        Aerosol"
     &        //"     Elemental    Organic"
            do j = 1, c_filter_eff_count(i), 1
              write (out_unit, '(5(a,1pe12.4))')"      ",
     &          (c_filter_time(i,j)+start_accident)/3600,
     &          "  ",(c_filter_flow_rate(i,j) * M3STOCFM),
     &          " ",c_filter_aerosol_eff(i,j),
     &          " ",c_filter_elemental_eff(i,j),
     &          " ",c_filter_organic_eff(i,j) 
            end do 
          endif
        endif
        if (deposit_aerosol_model(i) .eq. 1) then
          if (deposit_aerosol_count(i) .ge. 1) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Natural Deposition: Aerosol data"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          Removal Coef. (hr^-1)"
            do j=1, deposit_aerosol_count(i), 1
              write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &          (deposit_aerosol_time(i,j) + start_accident)
     &          / 3600,"        ",
     &          (deposit_aerosol(i,j) * ISTOIH)
            end do
          endif
        else if (deposit_aerosol_model(i) .eq. 2) then
          if (deposit_aerosol_count(i) .ge. 1) then
            write(out_unit,'(1x, a)') 
     &        "     Natural Deposition (Henry's model): "
     &        //"Aerosol data"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          Height (ft) "
     &        //"       Density (g*cm^-3)"
            do j=1, deposit_aerosol_count(i), 1
              write (out_unit,'(1x,3(a,1pe12.4))') "     ",
     &          (deposit_aerosol_time(i,j) + start_accident)
     &          / 3600,"        ",deposit_height(i,j) * MTOF,
     &          "           ",deposit_part_density(i,j)*KGM3TOGCM3
            end do
          endif
        else if (deposit_aerosol_model(i) .eq. 3) then
          write (out_unit, '(1x, a)')
     &      "Natural Deposition (Powers' model):  "
     &      //"Aerosol data"

          IF ( DEPOSIT_AEROSOL_REACTOR(I) .EQ. 1) THEN
            REACTOR_TYPE = 'PWRDBA'
          ELSE IF ( DEPOSIT_AEROSOL_REACTOR(I) .EQ. 2) THEN
            REACTOR_TYPE = 'PWRSA'
          ELSE IF ( DEPOSIT_AEROSOL_REACTOR(I) .EQ. 3) THEN
            REACTOR_TYPE = 'BWRDBA'
          ELSE IF ( DEPOSIT_AEROSOL_REACTOR(I) .EQ. 4) THEN
            REACTOR_TYPE = 'BWRSA'
          ELSE IF ( DEPOSIT_AEROSOL_REACTOR(I) .EQ. 5) THEN
            REACTOR_TYPE = 'APWRDBA'
          ELSE
            REACTOR_TYPE = '   '
          END IF
 
          write (out_unit, '(1x, 2a)')
     &      "      Reactor type: ", Reactor_Type
          write (out_unit, '(1x, a, i3,a)')
     &      "      Percentile = ",
     &      int(deposit_aerosol_percentile(i)), " (%)"
        endif
        if (deposit_elemental_model(i) .eq. 1) then 
          if (deposit_elemental_count(i) .ge. 1) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Natural Deposition:  Elemental Removal Data"
            write(out_unit,'(1x, a)') 
     &        "      Time (hr)          Removal Coef. (hr^-1)"
            do j = 1, deposit_elemental_count(i), 1
              write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &          (deposit_elemental_time(i,j) + start_accident)
     &          / 3600,"        ",deposit_elemental(i,j)*ISTOIH
            end do
          endif
        endif
      end do
      if ( number_of_pathways .ge. 1) then
        write(out_unit,'(1x, a)')" "
        write (out_unit, '(1x, a)') "PATHWAY DATA"
        do i=1, number_of_pathways, 1
          write(out_unit,'(1x, a)')" "
          write (out_unit, '(1x, a, i2,2a)') 
     &      'Pathway number ',i, ': ',pathway_name(i)

c          if (pathway_decay(i) .eq. 1) then
c            write (out_unit, '(1x, a)')
c     &            '     Radioactive decay is enabled for this pathway.'
c          endif

          if (pathway_type(i) .EQ. 1) then
            if (piping_aerosol_model(i) .eq. 1) then
              write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, a)') 
     &          "     Piping:  Removal Data"
              write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, a)') 
     &          "        Time (hr)     Flow Rate            "
     &          //"       DF"
              write(out_unit,'(1x, a)')   
     &          "                       (cfm)        Aerosol    "
     &          //" Elemental    Organic" 
              do j=1, piping_count(i), 1
                write (out_unit,'(5(a,1pe12.4))') "      ",
     &            (piping_time(i,j) + start_accident)
     &            / 3600,"  ",piping_flow(i,j)*M3STOCFM,
     &            " ",piping_aerosol_df(i,j), " ",
     &            piping_elemental_df(i,j), " ",
     &            piping_organic_df(i,j)
              end do
            else if (piping_aerosol_model(i) .gt. 1) then
              write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, a)') 
     &          "     Piping : Aerosol Removal Data"
              IF (piping_aerosol_model(i) .EQ. 2) THEN
                 write(out_unit,'(10x, a)') " Slug Deposition Model"
              ELSE IF (piping_aerosol_model(i) .EQ. 3) THEN
                 write(out_unit,'(10x, a)') 
     &                               " Homogeneous Deposition Model"
              END IF
              write(out_unit,'(1x, a)')" "
              write (out_unit, '(1x, a, 1pe12.4,a)')
     &          "     Volume            = ", 
     &          (brock_volume(i,1) * M3TOF3)," (ft^3)" 
              write (out_unit, '(1x, a, 1pe12.4,a)')
     &          "     Surface area      = ",
     &          (brock_surface(i,1) * M2TOF2)," (ft^2)" 
              write (out_unit, '(1x, a, 1pe12.4,a)')
     &          "     Bend angle        = ",
     &          (brock_angle(i,1) * RADTODEG)," (Degrees)" 
              pieval = 4.0 * ATAN( 1.00 )
              pipe_diameter = 4*brock_volume(i,1)/brock_surface(i,1)
              pipe_length = brock_surface(i,1)/pipe_diameter/pieval
              write (out_unit, '(6x, a, 1pe12.4,a)')
     &          "Pipe Length       = ",pipe_length * MTOF," (ft)"
              write (out_unit, '(6x, a, 1pe12.4,a)')
     &          "Pipe Diameter     = ",pipe_diameter * MTOF," (ft)"


              IF (VERSION .lt. 3.10) THEN
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "      Time (hr)     Flow Rate (cfm)"
     &            //"     Pressure (Atm)    Temperature (F)"
                do j=1, brock_count(i), 1
                  write (out_unit,'(1x,4(a,1pe12.4))') "     ",
     &            (brock_time(i,j) + start_accident)
     &            / 3600,"     ",brock_flow(i,j)*M3STOCFM,
     &            "         ",brock_pressure(i,j),
     &            "       ",(1.8*(brock_temp(i,j)-273.15))+32
                end do
              ELSE
                write (out_unit, '(1x, a, f8.4,a)')
     &            "     Pipe Temperature  = ",
     &            (1.8*(brock_temp(i,1)-273.15))+32, " (F)" 
                write (out_unit, '(1x, a, f8.4,a)')
     &            "     Pressure          = ",
     &                  brock_pressure(i,1), " (Atm)"
                write (out_unit, '(1x, a, 1pe12.4,a)')
     &            "     Settling Velocity = ",
     &                  brock_Velocity(i), " (m/s)"
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "      Time (hr)     Flow Rate (cfm)"

                do j=1, brock_count(i), 1
                  write (out_unit,'(1x,2(a,1pe12.4))') "     ",
     &            (brock_time(i,j) + start_accident)/ 3600,
     &            "     ",brock_flow(i,j)*M3STOCFM
                end do
              END IF

C elemental and organic deposition
              IF (piping_elemental_model(i) .eq. 1) THEN
                 write (out_unit, '(/6x,a)') 
     &                  'No Elemental iodine deposition'
              ELSE IF (piping_elemental_model(i) .EQ. 2) THEN
                 write (out_unit, '(/6x,a /16x,a)') 
     &             'Temperature Dependent Correlational Model'
     &             //' (Bixler)', 'for Elemental Iodine Deposition'
              ELSE IF (piping_elemental_model(i) .EQ. 3) THEN
                 write (out_unit, '(/6x,a /16x,a,1pe12.5)') 
     &             'Constant Depostion Velocity Model'
     &             , 'for Elemental Iodine Deposition, Vel =', 
     &             piping_Elemental_vel(i)
              END IF
              IF (piping_Organic_model(i) .eq. 1) THEN
                 write (out_unit, '(6x,a)') 
     &                  'No Organic Iodine deposition'
              ELSE IF (piping_Organic_model(i) .EQ. 2) THEN
                 write (out_unit, '(6x,a /16x,a)') 
     &             'Temperature Dependent Correlational Model'
     &             //' (Bixler)', 'for Organic Iodine Deposition'
              ELSE IF (piping_Organic_model(i) .EQ. 3) THEN
                 write (out_unit, '(6x,a, /16x,a,1pe12.5)') 
     &             'Constant Depostion Velocity Model'
     &             ,'for Organic Iodine Deposition, Vel =', 
     &             piping_Organic_vel(i)
              END IF
            endif
          else if (pathway_type(i) .EQ. 2) then
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "     Pathway Filter: Removal Data"
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') 
     &        "       Time (hr)      Flow Rate         "
     &        //" Filter Efficiencies (%)"
            write(out_unit,'(1x, a)') 
     &        "                       (cfm)        Aerosol"
     &        //"     Elemental    Organic"
            do j = 1, p_filter_eff_count(i), 1
              write (out_unit, '(5(a,1pe12.4))')"      ",
     &          (p_filter_time(i,j)+start_accident)/3600,
     &          "  ",(p_filter_flow_rate(i,j) * M3STOCFM),
     &          " ",p_filter_aerosol_eff(i,j),
     &          " ",p_filter_elemental_eff(i,j),
     &          " ",p_filter_organic_eff(i,j) 
            end do

            IF (P_Filter_Failure(i) .eq.1) THEN
              write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, a)') 
     &           "     Pathway Filter: Failure Data"  
              J_Plus =  p_filter_eff_count(i) + 1         
              write(out_unit,'(/ 1x, a)') 
     &          "       Time (hr)      Flow Rate "
     &        //"                   Fraction Released "
              write(out_unit,'(1x, a)') 
     &          "                       (cfm)        Aerosol"
     &            //"     Elemental    Organic"
              write (out_unit, '(5(a,1pe12.4))')"      ",
     &           (p_filter_time(i,J_Plus)+start_accident)/3600,
     &           "  ",p_filter_flow_rate(i,J_PLUS),
     &           " ",p_filter_aerosol_eff(i,J_Plus),
     &           " ",p_filter_elemental_eff(i,J_Plus),
     &           " ",p_filter_organic_eff(i,J_Plus) 
              write(out_unit,'(/ 1x, a, / 1x, a)') 
     &          "     Shutdown Time    Flow Rate ",
     &          "         (hr)          (cfm)   "
              write (out_unit, '( 6x,1pe12.4, 1pe14.4)')
     &           (p_filter_time(i,J_Plus+1)+start_accident)/3600,
     &            p_filter_flow_rate(i,J_PLUS+1)

            END IF                


          else if (pathway_type(i).EQ.3) then
            if (sp_aerosol_model(i) .eq. 1) then
              if (sp_aerosol_count(i) .GE. 0) then
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "     GENERIC:  All Aerosol Removal Data"
                write(out_unit,'(1x, a)') 
     &            "        Time (hr)         Flow Rate (cfm) "
     &            //"        DF"
                do j=1, sp_aerosol_count(i), 1
                  write (out_unit,'(3(a,1pe12.4))') "      ",
     &              (sp_aerosol_time(i,j) + start_accident)
     &              / 3600, "         ", sp_aerosol_flow_rate(i,j) 
     &              *GMTOCFM, "        ", sp_aerosol_df(i,j)
                end do
              endif
              if (sp_elemental_count(i) .ge. 1) then               
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "     GENERIC: Elemental Iodine Removal Data"
                write(out_unit,'(1x, a)') 
     &            "        Time (hr)         Flow Rate (cfm) "
     &            //"        DF"
                do j=1, sp_elemental_count(i),1
                  write (out_unit,'(3(a,1pe12.4))') "      ",
     &              (sp_elemental_time(i,j) + start_accident)
     &              / 3600, "         ", sp_elemental_flow_rate(i,j) 
     &              *GMTOCFM, "        ", sp_elemental_df(i,j)
                end do
              endif
              if (sp_organic_count(i) .ge. 1) then               
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "     GENERIC: Organic Iodine Removal Data"
                write(out_unit,'(1x, a)') 
     &            "        Time (hr)         Flow Rate (cfm) "
     &            //"        DF"
                do j=1, sp_organic_count(i),1
                  write (out_unit,'(3(a,1pe12.4))') "      ",
     &              (sp_organic_time(i,j) + start_accident)
     &              / 3600, "         ", sp_organic_flow_rate(i,j) 
     &              *GMTOCFM, "        ", sp_organic_df(i,j)
                end do
              endif
              if (sp_nobelgas_count(i) .ge. 1) then
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "     Generic: Noble Gas Data"
                write(out_unit,'(1x, a)') 
     &            "        Time (hr)         Flow Rate (cfm) "
                do j=1, sp_nobelgas_count(i),1
                  write (out_unit,'(2(a,1pe12.4))') "      ",
     &              (sp_nobelgas_time(i,j) + start_accident)
     &              / 3600, "         ", sp_nobelgas_flow_rate(i,j) 
     &              *GMTOCFM
                end do
              endif
            end if

          else if (pathway_type(i).EQ.6) then
            if (sp_aerosol_model(i) .eq. 1) then
              if (sp_aerosol_count(i) .GE. 0) then
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "     GENERIC:  Non-Iodine Aerosol Removal Data"
                write(out_unit,'(1x, a)') 
     &            "        Time (hr)         Flow Rate (cfm) "
     &            //"        DF"
                do j=1, sp_aerosol_count(i), 1
                  write (out_unit,'(3(a,1pe12.4))') "      ",
     &              (sp_aerosol_time(i,j) + start_accident)
     &              / 3600, "         ", sp_aerosol_flow_rate(i,j) 
     &              *GMTOCFM, "        ", sp_aerosol_df(i,j)
                end do
              endif
              if (sp_elemental_count(i) .ge. 1) then               
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "     GENERIC: All Iodine Forms Removal Data"
                write(out_unit,'(1x, a)') 
     &            "        Time (hr)         Flow Rate (cfm) "
     &            //"        DF"
                do j=1, sp_elemental_count(i),1
                  write (out_unit,'(3(a,1pe12.4))') "      ",
     &              (sp_elemental_time(i,j) + start_accident)
     &              / 3600, "         ", sp_elemental_flow_rate(i,j) 
     &              *GMTOCFM, "        ", sp_elemental_df(i,j)
                end do
              endif

              if (sp_nobelgas_count(i) .ge. 1) then
                write(out_unit,'(1x, a)')" "
                write(out_unit,'(1x, a)') 
     &            "     Generic: Noble Gas Data"
                write(out_unit,'(1x, a)') 
     &            "        Time (hr)         Flow Rate (cfm) "
                do j=1, sp_nobelgas_count(i),1
                  write (out_unit,'(2(a,1pe12.4))') "      ",
     &              (sp_nobelgas_time(i,j) + start_accident)
     &              / 3600, "         ", sp_nobelgas_flow_rate(i,j) 
     &              *GMTOCFM
                end do
              endif
            endif

          else if (pathway_type(i) .EQ. 4) then 
            if (convection_model(i) .eq. 1) then
              write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, a)') 
     &          "     Convection Data"
              write(out_unit,'(1x, a)') 
     &          "      Time (hr)          Flow Rate (% / day)"
              do j = 1, convection_count(i), 1
                write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &            (convection_time(i,j) + start_accident)
     &            / 3600,"            ",
     &            convection_flow_rate(i,j)*100*24*3600
              end do
            endif
          endif

        end do
      endif

C      Dose compartment edit

      IF (Number_Dose_Locations .ge. 1) THEN
        write(out_unit,'(1x, a)')" "
        write(out_unit, '(1x, a)') 'DOSE INFORMATION'
        write(out_unit, '(1x, a, i3)') 'Number_Dose_Locations =', 
     &          Number_Dose_Locations

        DO i = 1, Number_Dose_Locations, 1

          IF (location_xq_count(i) .ge. 1) THEN
            Jlocation = location_compartment_number(i)
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, 2a)') 'Dose Location Name = ', 
     &        trim(location_name(i))
            write(out_unit,'(10x,a,i2,2a)') 'Located in compartment ', 
     &        Jlocation, ' the ',
     &        trim(compartment_name(Jlocation))

c
C      Edit breathing rates and occupancy factors by location
C
            if (location_breathing_rate_model(i) .eq. 1) then
              write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, 2a)') 
     &          trim(location_name(i))," Breathing Rate Data"
              write(out_unit,'(1x, a)') 
     &          "        Time (hr)         "
     &          //"Breathing Rate (m^3 * sec^-1)"
              do j=1, location_breathing_rate_count(i), 1
                write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &            (location_breathing_rate_time(i,j)
     &            +start_accident)/ 3600,
     &            "               ",location_breathing_rate(i,j)
              end do
            endif

            if (location_occupancy_factor_model(i) .eq. 1) then
              write(out_unit,'(1x, a)')" "
              write(out_unit,'(1x, 2a)') 
     &            trim(location_name(i))," Occupancy Factor Data"
              write(out_unit,'(1x, a)') 
     &          "        Time (hr)         "
     &          //"Occupancy Factor"
              do j=1, location_occupancy_factor_count(i), 1
                write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &            (location_occupancy_factor_time(i,j)
     &            +start_accident)/ 3600,
     &            "          ",location_occupancy_factor(i,j)
              end  do
            endif
          END IF
        END DO
      END IF

C      X/Q, atmospheric dispersion edit

      if (Numb_XQ_tables .ge. 1) then
        write(out_unit,'(1x, a)')" "
        write(out_unit, '(1x, a)') 
     &            'X/Q, ATMOSPHERIC DISPERSION INFORMATION'

        do i = 1, Numb_XQ_tables, 1
          if (location_xq_count(i) .ge. 1) then

            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, 2a)') 'X/Q Table Name = ', 
     &          trim(location_xq_name(i))
            write(out_unit,'(1x, a)')" "
            write(out_unit,'(1x, a)') "     Location X/Q Data"
            write(out_unit,'(1x, a)') 
     &             "      Time (hr)         X/Q (s * m^-3)"
            do j=1, location_xq_count(i), 1
              write (out_unit,'(1x,a,1pe12.4,a,1pe12.4)') "     ",
     &            (location_xq_time(i,j) + start_accident)
     &            / 3600,"        ",location_xq(i,j)
            end do
          end if

          ICNT_R = 0
          DO JJ = 1, number_of_pathways
             do II = 1, number_of_pathways
                IF (Path_XQ_Table(II,JJ) .eq. i) THEN
                  IF (ICNT_R .eq. 0) THEN
				   write(out_unit,'(1x, a)') 
     &            'This X/Q Table is used for these connected pathways'
                     ICNT_R = ICNT_R + 1
                  END IF
                  write(out_unit,'(1x, a,i3,2x,3a,i3,2x,a)')  
     &                ' Path', II ,trim(Pathway_name(II)), ' and',
     &                ' Path', JJ ,trim(Pathway_name(JJ))
                END IF
             end do
          END DO

        end do
      end if

c
c       iclass = 1 (version 1.0-3.03) or new edit (iclass=0)
c       iunits = 0 (version 1.0-3.03) or all in Curies (iunits=1)
C	 

      if(dt_max_count .GT. 0) then
        write(out_unit,'(1x, a)')" "
        write(out_unit,'(1x,a)')'USER SPECIFIED TIME STEP DATA -'
     &    // ' SUPPLEMENTAL TIME STEPS'
        write(out_unit,'(6x,a)')
     &    "   Time (hr)      Time step (hr)"
        do i=1, dt_max_count, 1
          write(out_unit,'(6x, 1pe12.4, a, 1pe12.4)') 
     &      dt_max_time(i)/3600,'      ', dt_max(i)/3600
          IF (dt_max(i)/3600. .lt. .001 .and. dt_max(i) .gt. 0.0)
     &           write(out_unit,'(/,a)')
     &      '    THIS SMALL TIME STEP MAY RESULT IN EXCESSIVE'
     &      //' CLOCK TIME FOR THIS CALCULATION '
        end do
      endif 

      IF (SHOW_EVENT .eq. 0) THEN
        write(out_unit,'(/,1x,a)') ' DO NOT EDIT EACH MAJOR TIME STEP'
      ELSE
        write(out_unit,'(/,1x,a)') ' EDIT EACH MAJOR TIME STEP'
      END IF

      IF (SHOW_STEP .eq. 0) THEN
        write(out_unit,'(1x,a)') ' DO NOT EDIT SUPPLEMENTAL TIME STEPS'
      ELSE
        write(out_unit,'(1x,a)') ' EDIT SUPPLEMENTAL TIME STEPS'
      END IF

      IF (SHOW_MODEL .eq. 0) THEN
        write(out_unit,'(1x,a)') ' DO NOT EDIT MODEL DECONTAMINATION'
      ELSE
        write(out_unit,'(1x,a)') ' EDIT MODEL DECONTAMINATION RESULTS'
      END IF

      IF (IUNITS.eq.0) write(out_unit,'(/ 6x,a)')
     &                ' Masses in Atoms and kg in detailed output'
      IF (IUNITS.eq.1) write(out_unit,'(/ 6x,a)')
     &                ' Masses in Curies in detailed output'


      end
