C     ------------------------------------------------------------------
C     
C     Subroutine:  rd_sdf.for
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
C     Version:     3.10
C
C     Date:        May, 2004
C     
C     Revision
C     History:     March, 2002  3.10  allow X/Q to vary with pathway
C
C                  Radtrad 3.00 2/1999: error code contains unit 
c                  number of open psf input file. Continue reading 
c                  from rd_psf via radtradl
C     
C     ------------------------------------------------------------------

      subroutine rd_sdf(action, error_code, inp_out, error_message, 
     &                unit_number)
C
      character * (*) action, error_message
      integer error_code, level_rd_sdf, I_IN1, I_IN2, I_IN3
      integer Location_C_Room, NHOLDR(40)
      
      include 'limits.h'
      include 'brkbix.h'
      include 'c_filter.h'
      include 'compart.h'
      include 'constant.h'
      include 'convect.h'
      include 'dose.h'
      include 'filename.h'
      include 'nif.h'
      include 'nat_dep.h'
      include 'op_vol.h'
      include 'op.h'
      include 'p_filter.h'
      include 'pathway.h'
      include 'piping.h'
      include 'rel_time.h'
      include 'simulate.h'
      include 'sprays.h'
      include 'sump_vol.h'
      include 'source.h'
      include 'sp_vol.h'
      include 'sp.h'
      include 'water.h'
      
      integer unit_number, i, j, II, IJ, IK, IL, JJ
	integer eff_vol_xq_model, comp_to, comp_from
      integer location_type, location_cr n

      double precision TIME_XQ_END

      character*80 skip_name
	character*256 e
C     Initialize error_code and error_message.

      level_rd_sdf = 0
      
      write(error_message, '(4a)')
     &     'Error in program radtrad.',
     &     char(10), char(13),
     &     'Program logic error, error variables never set.'
c     don't need another open; psf file is already open
c     call nextunit(unit_number)
c     open(unit=unit_number, FILE=scenario_filename, err=11)
c     
c  
 
      IF (VERSION .LT. 3.10) THEN
C       scenario description
        read(unit_number, '(a80)', err=10) skip_name
        read(unit_number, '(a80)', err=10) skip_name
        write(inp_out,'(a80)') skip_name
c     plant model filename: not curently used, usually blank
        read(unit_number, '(a80)', err=10) skip_name
        read(unit_number, '(a80)', err=10) skip_name
        write(inp_out,'(a80)') skip_name
	END IF

c     Source Term Input
      read(unit_number,'(a80)') skip_name
      write(inp_out,'(a80)') skip_name
      read(unit_number, *, err=10) number_of_sources   
      if (level_rd_sdf .ge. 3)  write(*,'(1x,a,I6)') 
     &       'number of sources  =',number_of_sources 
      if (number_of_sources .LT. 1) then
	   write(inp_out,'(/ 1x, a)') 'NO source (RD_SDF) was input'
	   write(out_unit,'(/ 1x, a)') 'NO source (RD_SDF) was input'
         error_code = 3
c               **************  STOP  ************************
      else if (number_of_sources .GT. MAXSRCE) then
	   write(inp_out,'(/ 1x, a)') 'too many sources (RD_SDF) input'
	   write(out_unit,'(/ 1x, a)') 'too many sources (RD_SDF) input'
         error_code = 3
c               **************  STOP  ************************
      endif
C
      IF (VERSION .GE. 3.10) THEN
         write(inp_out,'(5x,a)') ' Srce_Compt Inven_File    RFT_File  '
     &     // '  frac'
         do NS = 1, number_of_sources, 1
C read source compartment (IN1), Inventory file (IN2), Release file (IN3), Fraction (dum1)
           read(unit_number, *, err=5) I_IN1, I_IN2, I_IN3, dum1
           write(inp_out,'(3(10x,I2),f12.4)') I_IN1, I_IN2, I_IN3, dum1
           Source_Term_On(NS) = I_IN1
           Compartment_Inventory_File(NS) = I_IN2

           IF (I_IN2.gt.Number_Inventory_Files)  THEN
              ERROR_CODE=4
              WRITE(inp_out,'(/ 1x, a, i2, a, i2, a)') 
     &          'Inventory file number', I_IN2, " Chosen for source",
     &          NS, ' Is Illegal, exceeds maximum number input(RD_SDF)'
	        WRITE(out_unit,'(/ 1x, a, i2, a, i2, a)') 
     &          'Inventory file number', I_IN2, " Chosen for source",
     &          NS, ' Is Illegal, exceeds maximum number input(RD_SDF)'
           END IF

           IF (I_IN3.gt.Number_Release_Files)  THEN
              ERROR_CODE=5
              WRITE(inp_out,'(/ 1x,a,i2,a )') 
     &          "Release file number", I_IN3, " Chosen for source",
     &          NS, " Is Illegal, exceeds maximum number input(RD_SDF)"
              WRITE(out_unit,'(/ 1x,a,i2,a )') 
     &          "Release file number", I_IN3, " Chosen for source",
     &          NS, " Is Illegal, exceeds maximum number input(RD_SDF)"
           END IF

           Inventory_Release(NS) = I_IN3
           source_term_fraction(NS) = dum1
           if (level_rd_sdf .ge. 3) then
             write(*,'(1x,a,I6)') 'Source Term Compartment = ',
     &                 Source_Term_On(NS)
             write(*,'(1x,a,I6)') '  Inventory File Number = ',
     &                 Compartment_Inventory_File(NS)
             write(*,'(1x,a,I6)') '  Inventory Release File Number = ',
     &                 Inventory_Release(I_IN2)
             write(*,'(1x,a,F10.5)') '   Source Term Fraction = ',
     &                 source_term_fraction(NS)
           endif
         end do 
c
c
c  still may need to check and see if the user has put different release files
c  with the same inventory type, probably only real with different inventory types
c
c
      ELSE
      
C     pre version 3.10 input
         Inventory_Release(1) = 1
         do NS = 1, number_of_sources, 1
           read(unit_number, *, err=5) I_IN1, dum1
           Source_Term_On(NS) = I_IN1
           source_term_fraction(NS) = dum1
           Compartment_Inventory_File(NS) = 1
           if (level_rd_sdf .ge. 3) then
             write(*,'(1x,a,I6)') 'Source Term Compartment = ',
     &                 Source_Term_On(NS)
             write(*,'(1x,a,I6)') '  Inventory File Number = ',
     &                 Compartment_Inventory_File(NS)
             write(*,'(1x,a,I6)') '  Inventory Release File Number = ',
     &                 Inventory_Release(1)
             write(*,'(1x,a,F10.5)') '   Source Term Fraction = ',
     &                 source_term_fraction(NS)
           endif
         end do
         read(unit_number, '(1x,a80)') dcf_inp_filename
         read(unit_number, '(1x,a80)', err=10) release_filename(1)
      END IF


      read(unit_number, *, err=10) onset_gap_release

      onset_gap_release = onset_gap_release * 3600.0d0
      if (level_rd_sdf .ge. 3) then
         write(*,*) 'onset_gap_release = ', onset_gap_release
      endif

      start_accident = onset_gap_release/3600.0d0
      duration_accident = 720.0d0 + onset_gap_release/3600.0d0
      IF (VERSION .GE. 3.10) read(unit_number, *, err=10) 
     &                         start_accident, duration_accident
      IF (start_accident .gt. onset_gap_release/3600.) 
     &       onset_gap_release = start_accident*3600. 

c     reset for noisy input
      IF (dabs(duration_accident-720.0d0) .le. 0.001) 
     &          duration_accident = duration_accident + start_accident
c     reset for poor input
      IF (dabs(duration_accident-start_accident) .le. 0.0001)
     &          duration_accident = duration_accident + 2.0d0
      start_accident = start_accident * 3600.0d0
      duration_accident = duration_accident * 3600.0d0

      if (start_accident .gt. onset_gap_release) then
          write(*, '(1x, a, 1pe12.4, a)')
     &       ' Start Release is less than Start Accident'
     &        // '    Code will reset start accident to ',
     &        onset_gap_release/3600.0d0 , ' hr '
	     start_accident = onset_gap_release
      end if 
	                                           
      if (level_rd_sdf .ge. 3) then
         write(*,*) 'start_accident = ', start_accident
         write(*,*) 'duration_accident = ', duration_accident
      endif

C       NSRC_TYPE         = 1 then TID
C                         = 2 then 1465
C                         = 3 then user defined

      read(unit_number, *, err=10) calculate_daughters
	NS=1
      IF (VERSION .GE. 3.10) THEN

        DO NS = 1, number_of_sources, 1

          read(unit_number, *, err=10) NSRC_TYPE(NS),
     &       i_fraction_aerosol(NS), i_fraction_elemental(NS),
     &       i_fraction_organic(NS) 

          IF (NSRC_TYPE(NS) .lt. 1) THEN
            write(out_unit,'(/5x,a,I1,a)') 'NSRC_TYPE (',NS,
     &                                    ') < 1 Input error' 
            write(inp_out,'(/5x,a,I1,a)') 'NSRC_TYPE (',NS,
     &                                    ') < 1 Input error' 
            write(inp_out,'(/5x,a)') 
     &         'There is no reason to continue, (RD_SDF)'
            write(inp_out,'(/5x,a)')
     &         '***********    S T O P   *******************'
            ERROR_CODE = 6
          END IF 
 
          IF (dabs(i_fraction_aerosol(NS) + i_fraction_elemental(NS) +
     &         i_fraction_organic(NS)-1.0d0) .gt. 1.0d-4) then
	       write (out_unit, '(/5x,a,i2)') 
     &            'sum of iodine fractions not equal 1 for source =',NS
	       write (inp_out, '(/5x,a,i2)') 
     &            'sum of iodine fractions not equal 1 for source =',NS
             write(inp_out,'(/5x,a)') 
     &            'There is no reason to continue, (RD_SDF)'
             write(inp_out,'(/5x,a)')
     &            '***********    S T O P   *******************'
             ERROR_CODE = 6
          END IF
	  END DO      
      ELSE 
        NSRC_TYPE(1) = 1
        read(unit_number, *, err=10) i_fraction_aerosol(1),
     &        i_fraction_elemental(1), i_fraction_organic(1),
     &        dum1
        if (dabs(i_fraction_aerosol(1) + i_fraction_elemental(1) +
     &         i_fraction_organic(1)-1.0d0) .gt. 1.0d-4) then
	     write (out_unit, '(/5x,a,i2)') 
     &             'sum of iodine fractions not equal 1 for source =',1
           write(inp_out,'(/5x,a)') 
     &         'There is no reason to continue, (RD_SDF)'
           write(inp_out,'(/5x,a)')
     &         '***********    S T O P   *******************'
           ERROR_CODE = 6
	  end if
      END IF


C
C     removed OVERLYING POOL input, left integer input to maintain
C     historical method
C
      read(unit_number,'(a80)') skip_name
      write(inp_out,'(a80)') skip_name
      read(unit_number, *, err=10) op_decay
      read(unit_number, *, err=10) op_initial_volume
      op_initial_volume = op_initial_volume * F3TOM3

      read(unit_number, *, err=10) op_aerosol_model
      
      read(unit_number, *, err=10) op_elemental_model
      
      read(unit_number, *, err=10) op_organic_model
      
      read(unit_number, *, err=10) op_volatilization_model

C     COMPARTMENT INPUT

      read(unit_number,'(a80)') skip_name
      write(inp_out,'(a80)') skip_name
      read(unit_number, *, err=10) number_of_compartments

      if(number_of_compartments .ge. 1) then
C
C      No_Decay = 1 if no decay anywhere
C
         No_Decay =  1
         sprays_aerosol_DF_limit = 1.0d6
         sprays_aerosol_lambda_limit = 1.0d6
         sprays_elemental_DF_limit = 1.0d6

         do i = 1, number_of_compartments, 1
c
c        initialize compartment related array limits
c
            fresh_water_fraction(i) = 0.0
            sprays_aerosol_count(i) = 0		  
            sprays_aerosol_alpha(i, 1) = 0.0
            sprays_aerosol_percentile(i) = 0.0
            sprays_elemental_count(i) = 0		  
            sprays_organic_count(i) = 0		  
            sump_volatilization_count(i) = 0		  
            c_filter_flow_rate(i, 1) = 0.0
            c_filter_eff_count(i) = 0
            deposit_aerosol_count(i) = 0
            deposit_aerosol_reactor(i) = 0.0
            deposit_aerosol_percentile(i) = 0.0
            deposit_elemental_count(i) = 0         
   
            read(unit_number,'(a80)') skip_name
            write(inp_out,'(a80)') skip_name
            read(unit_number, *, err=10) compartment_detail(i)
            read(unit_number, *, err=10) compartment_decay(i)
	      if (Compartment_Decay(i) .gt. 0) No_Decay = 2
       
            read(unit_number, *, err=10) sprays_aerosol_model(i)
		  		        
            if(sprays_aerosol_model(i) .eq. 1) then
               read(unit_number, *, err=10) fresh_water_fraction(i)
               read(unit_number, *, err=10) sprays_aerosol_count(i)
            
               if(sprays_aerosol_count(i) .ge. 1) then
                  do j = 1, sprays_aerosol_count(i), 1
                     read(unit_number, *, err=10)
     &                      sprays_aerosol_time(i,j),sprays_aerosol(i,j)

                     sprays_aerosol_time(i, j) =  max(0.0d0,
     &                        (sprays_aerosol_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     sprays_aerosol(i,j)=sprays_aerosol(i,j)*IHTOIS
                  end do
               end if
            else if(sprays_aerosol_model(i) .eq. 2) then
               read(unit_number,*,err=10) fresh_water_fraction(i)
               read(unit_number,*,err=10) sprays_aerosol_alpha(i, 1)
               read(unit_number,*,err=10) sprays_aerosol_percentile(i)             
               read(unit_number,*,err=10) sprays_aerosol_count(i)
     &              
               if(sprays_aerosol_count(i) .ge. 1) then
                  do j = 1, sprays_aerosol_count(i), 1
                     read(unit_number, *, err=10)
     &                        sprays_aerosol_time(i, j),
     &                        sprays_aerosol_flux(i, j),
     &                        sprays_aerosol_height(i, j)

                     sprays_aerosol_alpha(i, j) =
     &                        sprays_aerosol_alpha(i, 1)
                     sprays_aerosol_time(i, j) =  max(0.0d0,
     &                        (sprays_aerosol_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     sprays_aerosol_flux(i,j) = 
     &                        sprays_aerosol_flux(i,j)*CFMTOM3S*IF2TOIM2
                     sprays_aerosol_height(i,j) =
     &                        sprays_aerosol_height(i,j) * FTOM
                  end do
               end if
            end if

            read(unit_number, *, err=10) sprays_elemental_model(i)
              
            if(sprays_elemental_model(i) .eq. 1) then
               read(unit_number, *, err=10) fresh_water_fraction(i)             
               read(unit_number, *, err=10) sprays_elemental_count(i)
                
               if(sprays_elemental_count(i) .ge. 1) then
                  do j = 1, sprays_elemental_count(i), 1
                     read(unit_number, *, err=10)
     &                        sprays_elemental_time(i, j),
     &                        sprays_elemental(i, j)

                     sprays_elemental_time(i, j) =  max(0.0d0,
     &                       (sprays_elemental_time(i, j) * 3600.0d0)
     &                       - start_accident)
                     sprays_elemental(i,j)=
     &                        sprays_elemental(i,j)*IHTOIS
                  end do
               end if
            end if

            read(unit_number, *, err=10) sprays_organic_model(i)
          
            if(sprays_organic_model(i) .eq. 1) then
               read(unit_number, *, err=10) fresh_water_fraction(i)              
               read(unit_number, *, err=10) sprays_organic_count(i)
                 
               if(sprays_organic_count(i) .ge. 1) then
                  do j = 1, sprays_organic_count(i), 1
                     read(unit_number, *, err=10)
     &                        sprays_organic_time(i, j),
     &                        sprays_organic(i, j)

                     sprays_organic_time(i, j) =  max(0.0d0,
     &                        (sprays_organic_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     sprays_organic(i,j) = sprays_organic(i,j)
     &	                      * IHTOIS
                  end do
               end if

               IF (sprays_aerosol_model(i) .eq. 1) THEN
                  read(unit_number, *, err=10) sprays_aerosol_DF_limit,
     &            sprays_aerosol_lambda_limit,sprays_elemental_DF_limit   
               ELSE IF (sprays_aerosol_model(i) .eq. 2) THEN
                  read(unit_number, *, err=10) sprays_elemental_DF_limit
               END IF
            end if

            read(unit_number, *, err=10) sump_volatilization_model(i)
             
            if(sump_volatilization_model(i) .eq. 2) then
               read(unit_number,*,err=10) sump_volatilization_count(i)
               
               if(sump_volatilization_count(i) .ge. 1) then
                  do j = 1, sump_volatilization_count(i), 1
                     read(unit_number, *, err=10)
     &                        sump_volatilization_time(i, j),
     &                        sump_volatilization_ph(i, j),
     &                        sump_volatilization_tempp(i, j),
     &                        sump_volatilization_tempa(i, j),
     &                        sump_volatilization_area(i, j)

                     sump_volatilization_time(i, j) =  max(0.0d0,
     &                        sump_volatilization_time(i, j) * 3600.0d0
     &                        - start_accident)
                  end do
               end if
            end if

            read(unit_number, *, err=10) c_filter_eff_model(i)
             
            if(c_filter_eff_model(i) .eq. 1) then
               IF(VERSION.lt.3.10) THEN
                 read(unit_number, *, err=10) c_filter_flow_rate(i, 1)
                 read(unit_number, *, err=10) c_filter_eff_count(i)
                  
                 c_filter_flow_rate(i,1) = 
     &              c_filter_flow_rate(i,1) * CFMTOM3S

                 if(c_filter_eff_count(i) .ge. 1) then
                    do j = 1, c_filter_eff_count(i), 1
                       c_filter_flow_rate(i, j) =
     &                          c_filter_flow_rate(i, 1)

                       read(unit_number, *, err=10)
     &                          c_filter_time(i, j),
     &                          c_filter_aerosol_eff(i, j),
     &                          c_filter_elemental_eff(i, j),
     &                          c_filter_organic_eff(i, j)

                       c_filter_time(i, j) =  max(0.0d0,
     &                         (c_filter_time(i, j) * 3600.0d0)
     &                          - start_accident)
                    end do
                 end if
               ELSE
                 read(unit_number, *, err=10) c_filter_eff_count(i)
                 if (c_filter_eff_count(i) .ge. 1) then
                    do j = 1, c_filter_eff_count(i), 1
                       read(unit_number, *, err=10)
     &                          c_filter_time(i, j),
     &                          c_filter_flow_rate(i, j),    
     &                          c_filter_aerosol_eff(i, j),
     &                          c_filter_elemental_eff(i, j),
     &                          c_filter_organic_eff(i, j)

                       c_filter_time(i, j) =  max(0.0d0,
     &                         (c_filter_time(i, j) * 3600.0d0)
     &                         - start_accident)
                       c_filter_flow_rate(i,j) = 
     &                         c_filter_flow_rate(i,j) * CFMTOM3S

                    end do
                 end if
C  failure check
c   verify sufficient room to store information
C
                 JPLUS = c_filter_eff_count(i) + 1
                 IF (JPLUS .le. MAXCOUNT-1) THEN
                    read(unit_number, *, err=10) c_filter_failure(i)
                    read(unit_number, *, err=10)
     &                        c_filter_time(i,JPLUS),
     &                        c_filter_flow_rate(i,JPLUS),
     &                        c_filter_aerosol_eff(i,JPLUS),
     &                        c_filter_elemental_eff(i,JPLUS),
     &                        c_filter_organic_eff(i,JPLUS)

                    c_filter_time(i,JPLUS) =  max(0.0d0,
     &                      (c_filter_time(i,JPLUS) * 3600.0d0)
     &                       - start_accident)
C       Get shutdown time
                    read(unit_number, *, err=10)
     &                        c_filter_time(i,JPLUS+1)

                    c_filter_time(i,JPLUS+1) =  max(0.0d0,
     &                      (c_filter_time(i,JPLUS+1) * 3600.0d0)
     &                       - start_accident)
                 ELSE
                    write(inp_out,'(/1x,a,I4,/ 10x,a)')
     &                 'Number of entries in filter flow versus time'
     &                 //' table =', JPLUS-1, ' this value exceeds'
     &                 //' limit when failure included '
                 END IF
               END IF
            end if

            read(unit_number, *, err=10) deposit_aerosol_model(i)
               
            if(deposit_aerosol_model(i) .eq. 1) then
               read(unit_number, *, err=10) deposit_aerosol_count(i)
                   
               if(deposit_aerosol_count(i) .ge. 1) then
                  do j = 1, deposit_aerosol_count(i), 1
                     read(unit_number, *, err=10)
     &                        deposit_aerosol_time(i, j),
     &                        deposit_aerosol(i, j)

                     deposit_aerosol_time(i, j) =  max(0.0d0,
     &                        (deposit_aerosol_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     deposit_aerosol(i,j) = deposit_aerosol(i,j)
     &                        * IHTOIS
                  end do
               end if
            else if(deposit_aerosol_model(i) .eq. 2) then
               read(unit_number, *, err=10) deposit_aerosol_count(i)
                   
               if(deposit_aerosol_count(i) .ge. 1) then
                  do j = 1, deposit_aerosol_count(i), 1
                     read(unit_number, *, err=10)
     &                        deposit_aerosol_time(i, j),
     &                        deposit_height(i, j),
     &                        deposit_part_density(i, j)

                     deposit_aerosol_time(i, j) =  max(0.0d0,
     &                        (deposit_aerosol_time(i, j) * 3600.0d0) 
     &                        - start_accident)
                     deposit_height(i,j) =
     &                        deposit_height(i,j) * FTOM
                     deposit_part_density(i,j) =
     &                        deposit_part_density(i,j)*GCM3TOKGM3
                  end do
               end if
            else if(deposit_aerosol_model(i) .eq. 3) then
              read(unit_number,*,err=10) deposit_aerosol_reactor(i)        
              read(unit_number,*,err=10) deposit_aerosol_percentile(i)
            end if

            read(unit_number, *, err=10) deposit_elemental_model(i)
            
		  if(deposit_elemental_model(i) .eq. 1) then
               read(unit_number, *, err=10) deposit_elemental_count(i)
             
               if(deposit_elemental_count(i) .ge. 1) then
                  do j = 1, deposit_elemental_count(i), 1
                     read(unit_number, *, err=10)
     &                        deposit_elemental_time(i, j),
     &                        deposit_elemental(i, j)

                     deposit_elemental_time(i, j) =  max(0.0d0,
     &                        (deposit_elemental_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     deposit_elemental(i,j) = 
     &                        deposit_elemental(i,j) * IHTOIS
                  end do
               end if
		  end if
         end do
      end if

      IF (No_Decay .eq. 1 .and. calculate_daughters .eq. 1)  THEN
C
C     this is an inconsistent input deck correction
C
          calculate_daughters = 0
      END IF

C      PATHWAY

      read(unit_number,'(a80)') skip_name
      write(inp_out,'(a80)') skip_name
      read(unit_number, *, err=10) number_of_pathways

      if(number_of_pathways .ge. 1) then
         do i = 1, number_of_pathways, 1
c
c        initialize pathway related array limits
c
            pathway_pipe_number(i) = -1
            piping_count(i) = 0
            brock_count(i) = 0
            brock_surface(i,1) = 0
            brock_volume(i,1) = 0
            brock_angle(i,1) = 0
            p_filter_eff_count(i) = 0
            sp_initial_volume(i) = 0.0
            sp_aerosol_count(i) = 0
            sp_elemental_count(i) = 0
            sp_organic_count(i) = 0
            sp_nobelgas_count(i) = 0
            sp_volatilization_count(i) = 0
            sp_volatilization_fraction(i,1) = 0.0
            convection_count(i) = 0
            water_leakage_count(i) = 0

            read(unit_number,'(a80)') skip_name
            write(inp_out,'(a80)') skip_name
            read(unit_number, *, err=10) pathway_detail(i)          
            read(unit_number, *, err=10) pathway_decay(i)

                pathway_decay(i) = No_Decay-1

            read(unit_number, *, err=10) piping_aerosol_model(i)
		                  
            if(piping_aerosol_model(i) .eq. 1) then
               read(unit_number, *, err=10) piping_count(i)
                 
               if(piping_count(i) .ge. 1) then
                  do j = 1, piping_count(i), 1
                     read(unit_number, *, err=10)
     &                        piping_time(i, j),
     &                        piping_aerosol_df(i, j),
     &                        piping_flow(i, j)

                     piping_aerosol_df(i,j) = 
     &                        piping_aerosol_df(i,j)
                     piping_time(i, j) =  max(0.0d0,
     &                        (piping_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     piping_flow(i,j) = piping_flow(i,j) * CFMTOM3S
                  end do
               end if

C      Pathway Brockmann model aerosol decontamination mode

            else if(piping_aerosol_model(i) .gt. 1) then
               IF (Version.lt. 3.10) THEN
                 read(unit_number, *, err=10) brock_count(i)
                 if(brock_count(i) .ge. 1) then
                   read(unit_number, *, err=10)
     &                     brock_surface(i, 1), brock_volume(i, 1),
     &                     brock_angle(i, 1)

                   brock_volume(i,1) = brock_volume(i,1) * F3TOM3
                   brock_surface(i,1) = brock_surface(i,1) * F2TOM2
                   brock_angle(i,1) = brock_angle(i,1) * DEGTORAD
                   do j = 1, brock_count(i), 1
                     read(unit_number, *, err=10)
     &                        brock_time(i, j), brock_flow(i, j),
     &                        brock_pressure(i, j), brock_temp(i, j)

                     brock_time(i, j) =   max(0.0d0,
     &                        (brock_time(i, j) * 3600.0d0) 
     &                         - start_accident)
                     brock_flow(i,j) = brock_flow(i,j) * CFMTOM3S
                     brock_temp(i,j) = 
     &                        (5*(brock_temp(i,j)-32)/9) + 273.15
                   end do
                 end if
              ELSE
C     Version 3.10
c
                  read(unit_number, *, err=10)
     &                     brock_surface(i, 1), brock_volume(i, 1),
     &                     brock_angle(i, 1),brock_temp(i, 1),
     &                     brock_pressure(i, 1),brock_velocity(i)

                brock_volume(i,1) = brock_volume(i,1) * F3TOM3
                brock_surface(i,1) = brock_surface(i,1) * F2TOM2
                brock_angle(i,1) = brock_angle(i,1) * DEGTORAD
                brock_temp(i,1) = (5*(brock_temp(i,1)-32)/9) + 273.15
                brock_pressure(i,1) = brock_pressure(i,1) / 14.7

                read(unit_number, *, err=10) brock_count(i)
                if(brock_count(i) .ge. 1) then

                  do j = 1, brock_count(i), 1
                     read(unit_number, *, err=10)
     &                        brock_time(i, j), brock_flow(i, j)
                     brock_time(i, j) =   max(0.0d0,
     &                        (brock_time(i, j) * 3600.0d0) 
     &                         - start_accident)
                     brock_flow(i,j) = brock_flow(i,j) * CFMTOM3S
                  end do
                end if
              END IF
            end if
C      Pathway piping decontamination mode
            read(unit_number, *, err=10) piping_elemental_model(i)
                
            if(piping_elemental_model(i) .eq. 1) then
               read(unit_number, *, err=10) piping_count(i)
                   
               if(piping_count(i) .ge. 1) then
                  do j = 1, piping_count(i), 1
                     read(unit_number, *, err=10)
     &                        piping_time(i, j),
     &                        piping_elemental_df(i, j),
     &                        piping_flow(i, j)

                     piping_elemental_df(i,j) = 
     &                        piping_elemental_df(i,j)
                     piping_time(i, j) =   max(0.0d0,
     &                        (piping_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     piping_flow(i,j) = piping_flow(i,j) * CFMTOM3S
                  end do
               end if
            else if (piping_elemental_model(i) .eq. 3) then
               read(unit_number, *, err=10) piping_elemental_vel(i)
            end if

            read(unit_number, *, err=10) piping_organic_model(i)
                
            if(piping_organic_model(i) .eq. 1) then
               read(unit_number, *, err=10) piping_count(i)
                   
               if(piping_count(i) .ge. 1) then
                  do j = 1, piping_count(i), 1
                     read(unit_number, *, err=10)
     &                        piping_time(i, j),
     &                        piping_organic_df(i, j),
     &                        piping_flow(i, j)

                     piping_organic_df(i,j) = 
     &                        piping_organic_df(i,j)
                     piping_time(i, j) =   max(0.0d0,
     &                        (piping_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     piping_flow(i,j) = piping_flow(i,j) * CFMTOM3S
                  end do
               end if
            else if (piping_organic_model(i) .eq. 3) then
               read(unit_number, *, err=10) piping_organic_vel(i)
            end if 
            
C      Pathway Filter input
            read(unit_number, *, err=10) p_filter_eff_model(i)
                
            if(p_filter_eff_model(i) .eq. 1) then
               read(unit_number, *, err=10) p_filter_eff_count(i)
                   
               if(p_filter_eff_count(i) .ge. 1) then
                  do j = 1, p_filter_eff_count(i), 1
                     read(unit_number, *, err=10)
     &                        p_filter_time(i, j),
     &                        p_filter_flow_rate(i, j),
     &                        p_filter_aerosol_eff(i, j),
     &                        p_filter_elemental_eff(i, j),
     &                        p_filter_organic_eff(i, j)

                     p_filter_time(i, j) =   max(0.0d0,
     &                        (p_filter_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     p_filter_flow_rate(i,j) = 
     &                        p_filter_flow_rate(i,j) * CFMTOM3S
                  end do
               end if
C  failure check
               IF (VERSION .GE. 3.10) THEN

c
c   verify sufficient room to store information
C
                  JPLUS = p_filter_eff_count(i) + 1
                  IF (JPLUS .le. MAXCOUNT-1) THEN
                     read(unit_number, *, err=10) p_filter_failure(i)
                     read(unit_number, *, err=10)
     &                       p_filter_time(i,JPLUS),
     &                       p_filter_flow_rate(i,JPLUS),
     &                       p_filter_aerosol_eff(i,JPLUS),
     &                       p_filter_elemental_eff(i,JPLUS),
     &                       p_filter_organic_eff(i,JPLUS)

                     p_filter_time(i,JPLUS) =   max(0.0d0,
     &                      (p_filter_time(i,JPLUS) * 3600.0d0)
     &                       - start_accident)
                     p_filter_flow_rate(i,JPLUS) = 
     &                        p_filter_flow_rate(i,JPLUS) * CFMTOM3S

C       Get shutdown time
                     read(unit_number, *, err=10)
     &                       p_filter_time(i,JPLUS+1)

                     p_filter_time(i,JPLUS+1) =   max(0.0d0,
     &                      (p_filter_time(i,JPLUS+1) * 3600.0d0)
     &                       - start_accident)
                  ELSE
                     write(inp_out,'(/1x,a,I4,/ 10x,a)')
     &                  'Number of entries in filter flow versus time'
     &                 //' table =', JPLUS-1, ' this value exceeds'
     &                 //' limit when failure included '
                  END IF
               END IF
            end if

C      Pathway suppression pool input
            read(unit_number, *, err=10) sp_aerosol_model(i)

            if(sp_aerosol_model(i) .eq. 1) then
               read(unit_number, *, err=10)  sp_initial_volume(i)
               read(unit_number, *, err=10)  sp_aerosol_count(i)
               
               sp_initial_volume(i) = sp_initial_volume(i)  
     &              * F3TOM3
               if(sp_aerosol_count(i) .ge. 1) then
                  do j = 1, sp_aerosol_count(i), 1
                     read(unit_number, *, err=10)
     &                        sp_aerosol_time(i, j),
     &                        sp_aerosol_df(i, j),
     &                        sp_aerosol_flow_rate(i, j)

                     sp_aerosol_time(i, j) =   max(0.0d0,
     &                        (sp_aerosol_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     sp_aerosol_df(i,j) = sp_aerosol_df(i,j)
                     sp_aerosol_flow_rate(i,j) = 
     &                        sp_aerosol_flow_rate(i,j) * CFMTOGM
                  end do
               end if
            end if

            read(unit_number, *, err=10) sp_elemental_model(i)

            if(sp_elemental_model(i) .eq. 1) then
               read(unit_number, *, err=10) sp_initial_volume(i)
               read(unit_number, *, err=10) sp_elemental_count(i)
                
               if(sp_elemental_count(i) .ge. 1) then
                  do j = 1, sp_elemental_count(i), 1
                     read(unit_number, *, err=10)
     &                        sp_elemental_time(i, j),
     &                        sp_elemental_df(i, j),
     &                        sp_elemental_flow_rate(i, j)

                     sp_elemental_time(i, j) =   max(0.0d0,
     &                        (sp_elemental_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     sp_elemental_df(i,j) = sp_elemental_df(i,j) 
                     sp_elemental_flow_rate(i,j) =
     &                        sp_elemental_flow_rate(i,j) * CFMTOGM
                  end do
               end if
            end if

            read(unit_number, *, err=10) sp_organic_model(i)

            if(sp_organic_model(i) .eq. 1) then
               read(unit_number, *, err=10) sp_initial_volume(i)
               read(unit_number, *, err=10) sp_organic_count(i)
                
               if(sp_organic_count(i) .ge. 1) then
                  do j = 1, sp_organic_count(i), 1
                     read(unit_number, *, err=10)
     &                        sp_organic_time(i, j),
     &                        sp_organic_df(i, j),
     &                        sp_organic_flow_rate(i, j)

                     sp_organic_time(i, j) =   max(0.0d0,
     &                        (sp_organic_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     sp_organic_df(i,j) = sp_organic_df(i,j)
                     sp_organic_flow_rate(i,j) =
     &                        sp_organic_flow_rate(i,j) * CFMTOGM
                  end do
               end if
            end if

c      Nobel gas release
            if(sp_aerosol_model(i) + sp_elemental_model(i) + 
     &         sp_organic_model(i) .ge. 1) then

               read(unit_number, *, err=10) sp_nobelgas_count(i)
                
               if(sp_nobelgas_count(i) .ge. 1) then
                  do j = 1, sp_nobelgas_count(i), 1
                     read(unit_number, *, err=10)
     &                        sp_nobelgas_time(i, j),
     &                        sp_nobelgas_flow_rate(i, j)

                     sp_nobelgas_time(i, j) =   max(0.0d0,
     &                        (sp_nobelgas_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     sp_nobelgas_flow_rate(i,j) =
     &                        sp_nobelgas_flow_rate(i,j) * CFMTOGM
                  end do
               end if
            end if

            read(unit_number, *, err=10) sp_volatilization_model(i)
                
            if (sp_volatilization_model(i) .eq. 2) then


            end if

            read(unit_number, *, err=10) convection_model(i)

            if(convection_model(i) .eq. 1) then
               read(unit_number, *, err=10) convection_count(i)
               
               if(convection_count(i) .ge. 1) then
                  do j = 1, convection_count(i), 1
                     read(unit_number, *, err=10)
     &                        convection_time(i, j),
     &                        convection_flow_rate(i, j)

                     convection_time(i, j) =   max(0.0d0,
     &                        (convection_time(i, j) * 3600.0d0)
     &                        - start_accident)
                     convection_flow_rate(i,j) = 
     &                        convection_flow_rate(i,j) / 8640000
                  end do
               end if
            end if

            read(unit_number, *, err=10) water_leakage_model(i)
               
            if(water_leakage_model(i) .eq. 1) then
               read(unit_number, *, err=10) water_leakage_count(i)
                 
               if(water_leakage_count(i) .ge. 1) then
                  do j = 1, water_leakage_count(i), 1
                     read(unit_number, *, err=10)
     &                        water_leakage_time(i, j),
     &                        water_leakage_rate(i, j)

                     water_leakage_time(i, j) =   max(0.0d0,
     &                        water_leakage_time(i, j) * 3600.0d0
     &                        - start_accident)
                     water_leakage_rate(i, j) =
     &                        water_leakage_rate(i, j) * 6.3090e-05
                  end do
               end if
            end if

         end do
      end if

C      Dose Compartment Location Input  
        Location_Control_Room = 0

      IF (VERSION .LT. 3.10) THEN

C        Earlier versions of the code merged Dose and X/Q input

        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number, *, err=10) Number_Dose_Locations
        Numb_XQ_Tables = Number_Dose_Locations

      if (Number_Dose_Locations .ge. 1) then
        do i = 1, Number_Dose_Locations, 1
          read(unit_number,'(a80)') skip_name
          write(inp_out,'(a80)') skip_name
          read(unit_number,'(a40)', err=10) location_name(i)
          location_name(i) = adjustl(location_name(i))
          read(unit_number,*, err=10) location_compartment_number(i)
          read(unit_number,*, err=10) location_xq_model(i)
          location_xq_name(i) = location_name(i)
          location_xq_count(i) = 0

          IF (location_xq_model(i) .eq. 1) THEN
C
C      offsite dose location
C
            read(unit_number,*, err=10) location_xq_count(i)
            if (location_xq_count(i) .ge. 1) then
              do j = 1, location_xq_count(i), 1
                read(unit_number,*, err=10)
     &                   location_xq_time(i, j), location_xq(i, j)
                location_xq_time(i, j) =    max(0.0d0,
     &                   (location_xq_time(i, j) * 3600.d0) 
     &                   - start_accident)
              end do
            end if
          ELSE
C
C       control room location
            Location_Control_Room = i

          END IF
C
C       breathing rate input
C
          read(unit_number,*, err=10)location_breathing_rate_model(i)
	    location_breathing_rate_count(i) = 0
          IF (location_breathing_rate_model(i) .eq. 1) THEN
            read(unit_number,*,err=10) location_breathing_rate_count(i)
            if (location_breathing_rate_count(i) .ge. 1) then
              do j = 1, location_breathing_rate_count(i), 1
                read(unit_number,*) 
     &                   location_breathing_rate_time(i, j),
     &                   location_breathing_rate(i, j)
                location_breathing_rate_time(i, j) =   max(0.0d0,
     &                   (location_breathing_rate_time(i, j) * 
     &                    3600.0d0) - start_accident)
              end do
            end if
          END IF

          read(unit_number,*,err=10) location_occupancy_factor_model(i)
	    location_occupancy_factor_count(i) = 0
          IF (level_rd_sdf .ge. 3) THEN
            write(*,*) 'location_occupancy_factor_model(', i,') = '
     &              , location_occupancy_factor_model(i)
          END IF
          IF (location_occupancy_factor_model(i) .eq. 1) THEN
C
C       occupancy factor input (onsite dose location)
C
            read(unit_number,*,err=10)location_occupancy_factor_count(i)
            if (level_rd_sdf .ge. 3) then
              write(*,*) 'location_occupancy_factor_count(',
     &                 i, ') = ', location_occupancy_factor_count(i)
            endif
            if (location_occupancy_factor_count(i) .ge. 1) then
              do j = 1, location_occupancy_factor_count(i), 1
                read(unit_number,*, err=10)
     &                    location_occupancy_factor_time(i, j),
     &                    location_occupancy_factor(i, j)
                if (level_rd_sdf .ge. 3) then
                  write(*,*) 'location_occupancy_factor_time(',
     &                       i, ', ', j, ') = ',
     &                       location_occupancy_factor_time(i, j)
                endif
                if (level_rd_sdf .ge. 3) then
                  write(*,*) 'location_occupancy_factor(',
     &                       i, ', ', j, ') = ',
     &                       location_occupancy_factor(i, j)
                endif
                location_occupancy_factor_time(i, j) =   max(0.0d0,
     &                    (location_occupancy_factor_time(i, j) *
     &                    3600.0d0) - start_accident)
              end do
            end if
          END IF
       end do
      end if

c     read "Effective Volume Location"
      read(unit_number,'(a80)') skip_name
      write(inp_out,'(a80)') skip_name
      read(unit_number,*, err=10) eff_vol_xq_model
      eff_vol_xq_count = 0
      if (level_rd_sdf .ge. 3) then
          write(inp_out,'(/5x,a)') 
     &         'eff_vol_xq_model = ', eff_vol_xq_model
      endif

      if(eff_vol_xq_model .eq. 1) then

c      set I to the control room location 
C
        I = Location_Control_Room
        location_xq_model(i) = eff_vol_xq_model
        read(unit_number,*, err=10) location_xq_count(i)

        if (location_xq_count(i) .ge. 1) then
          do j = 1, location_xq_count(i), 1
            read(unit_number,*, err=10)
     &                   location_xq_time(i, j), location_xq(i, j)
            location_xq_time(i, j) =   max(0.0d0,
     &                    (location_xq_time(i, j) * 3600.0d0)
     &                     - start_accident)
          end do
        end if
      end if
C
C         set the pathway vs XQ table (only Control Room active)
C
      N_Inflow = 0
	N_Exhaust = 0
      DO II = 1, number_of_pathways, 1
        jj = pathway_from(ii)
        if (compartment_type(jj) .eq. 2) then
c
c    pathway from environment
C
          N_Inflow = N_Inflow + 1
          Inflow_Paths(N_Inflow) = ii
        end if
        jj2 = pathway_to(ii)
        if (compartment_type(jj2) .eq. 2 .and. 
     &                      compartment_type(jj) .ne. 1) then
c
c    pathway to environment
C
          N_Exhaust = N_Exhaust + 1
          Exhaust_Paths(N_Exhaust) = ii
        end if
      end do
      DO IK = 1, N_Exhaust
        II = Exhaust_Paths(IK)
        DO IL = 1, N_Inflow
          JJ = Inflow_Paths(IL)
          Path_XQ_Table(II,JJ) = Location_Control_Room
        END DO
      END DO



      ELSE
C       
C       VERSION 3.10 Dose Location input 
C                             (Breathing Rate and Occupancy Factor)    
C
C            Each Dose Location (Number_Dose_Locations) has its own breathing rate  
C
C        OFFSITE Dose Locations (EAB & LPZ & perhaps 1 other) first
C        ONSITE Dose Locations follow
C
        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number,*, err=10) Number_Dose_Locations

        if (Number_Dose_Locations .ge. 1) then
          do i = 1, Number_Dose_Locations, 1
c
c        initialize dose related array limits
c
            location_breathing_rate_count(i) = 0
            location_occupancy_factor_count(i) = 0
            read(unit_number,'(a80)') skip_name
            read(unit_number,'(a40)', err=10) location_name(i)
            location_name(i) = adjustl(location_name(i))
            read(unit_number,*, err=10) location_compartment_number(i)
C
C            get breathing rates for this location

            read(unit_number,*,err=10) location_breathing_rate_model(i)
		                
            if (location_breathing_rate_model(i) .eq. 1) then
              read(unit_number,*) location_breathing_rate_count(i)
                               
              if (location_breathing_rate_count(i) .ge. 1) then
                do j = 1, location_breathing_rate_count(i), 1
                  read(unit_number, *, err=10)
     &                 location_breathing_rate_time(i, j),
     &                 location_breathing_rate(i, j)
                  location_breathing_rate_time(i, j) =   max(0.0d0,
     &                 (location_breathing_rate_time(i, j) * 
     &                  3600.0d0) - start_accident)
                end do
              end if
            end if

            read(unit_number,*) location_occupancy_factor_model(i)

C      if not environment then need an occupancy factor

            if (location_occupancy_factor_model(i) .eq. 1) then
              read(unit_number,*)location_occupancy_factor_count(i)
C               Dose Compartment Location
              Location_Control_Room = i            
              if (location_occupancy_factor_count(i) .ge. 1) then
                do j = 1, location_occupancy_factor_count(i), 1
                  read(unit_number, *, err=10)
     &               location_occupancy_factor_time(i, j),
     &               location_occupancy_factor(i, j)
                  location_occupancy_factor_time(i, j) =   max(0.0d0,
     &               (location_occupancy_factor_time(i, j) *
     &                3600.0d0) - start_accident)
                end do
              end if
            end if
          END DO

	  ELSE

          write(inp_out,'(/5x,a)') 
     &         'There are no Dose locations in this input deck'
          write(inp_out,'(/5x,a)')
     &         'There is no reason to continue, (RD_SDF)'
          write(inp_out,'(/5x,a)')
     &         '***********    S T O P   *******************'
          write(out_unit,'(/5x,a)') 
     &         'There are no Dose locations in this input deck'
          write(out_unit,'(/5x,a)')
     &         'There is no reason to continue, (RD_SDF)'
          write(out_unit,'(/5x,a)')
     &         '***********    S T O P   *******************'
          ERROR_CODE = 7
        END IF

C            Path Dependent X/Q input

        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number, *, err=10) Numb_XQ_Tables                  
        IF (Numb_XQ_Tables .gt. MAX_XQS) THEN
          write(inp_out,'(/5x,a)') 
     &         'Have exceeded number of allowable tables'
          write(inp_out,'(/5x,i4,a,i4)') 
     &         'MAX_XQS =', MAX_XQS, ' and input ', Numb_XQ_Tables
          write(inp_out,'(/5x,a)') 
     &         'There is no reason to continue, (RD_SDF)'
          write(inp_out,'(/5x,a)')
     &         '***********    S T O P   *******************'

          write(out_unit,'(/5x,a)') 
     &         'Have exceeded number of allowable tables'
          write(out_unit,'(/5x,i4,a,i4)') 
     &         'MAX_XQS =', MAX_XQS, ' and input ', Numb_XQ_Tables
          write(out_unit,'(/5x,a)') 
     &         'There is no reason to continue, (RD_SDF)'
          write(out_unit,'(/5x,a)')
     &         '***********    S T O P   *******************'
          ERROR_CODE = 8
        END IF       

        TIME_XQ_END = 0.0d0
        DO NXQ = 1, Numb_XQ_Tables
          read(unit_number, '(a40)', err=10) location_xq_name(NXQ)                  
CC          read(unit_number, *, err=10) location_xq_model(NXQ)                  
          read(unit_number, *, err=10) location_xq_count(NXQ)                  
          if (location_xq_count(NXQ) .ge. 1) then
            do j = 1, location_xq_count(NXQ), 1
              read(unit_number, *, err=10)
     &            location_xq_time(NXQ, j), location_xq(NXQ, j)
              location_xq_time(NXQ, j) =
     &                    (location_xq_time(NXQ, j) * 3600.0d0)

              IF (j .gt. 1) THEN
                 IF (location_xq_time(NXQ, j) .gt. TIME_XQ_END .AND.
     &                  location_xq(NXQ, j-1) .gt. 0.0d0) 
     &                  TIME_XQ_END = location_xq_time(NXQ, j)
                 IF (j .eq. location_xq_count(NXQ)) THEN      
                    IF (location_xq(NXQ,j) .gt. 0.0d0) 
     &                  TIME_XQ_END = duration_accident
                 END IF
              END IF

              location_xq_time(NXQ, j) =   max(0.0d0,
     &                  location_xq_time(NXQ, j) - start_accident)
            end do
          end if
        END DO

        IF (TIME_XQ_END .GT. 0.0D0) THEN
	       duration_accident = MIN(duration_accident,TIME_XQ_END)
        END IF
C
C       Input the pathway from and pathway to combinations for tables
C
        read(unit_number,'(a80)') skip_name
        write(inp_out,'(a80)') skip_name
        read(unit_number,*) N_Inflow,(Inflow_paths(IK),IK=1,N_Inflow)
        IF (N_Inflow .gt. 0) THEN
           read(unit_number,'(a80)') skip_name
           read(unit_number,*) N_Exhaust,
     &                             (Exhaust_paths(IK),IK=1,N_Exhaust)
           read(unit_number,'(a80)') skip_name
           write(inp_out,'(a80)') skip_name
           Path_XQ_Table(1,1) = 0
           IF (N_Exhaust*N_Inflow .GT. 0) THEN
              DO IK = 1, N_Exhaust
                 read(unit_number,*) (NHOLDR(IL),IL=1,N_Inflow) 
                 II = Exhaust_Paths(IK)
                 DO IL = 1, N_Inflow
                    JJ = Inflow_Paths(IL)
                    Path_XQ_Table(II,JJ) = NHOLDR(IL)
                    JRoom_From = COMPARTMENT_TYPE(Pathway_From(II))
	              JExhaust_Room = 0
                    IF (JRoom_From.eq.1 .or. JRoom_From.eq.5) 
     &                      JExhaust_room = 1
                    IF (NHOLDR(IL).le.0 .AND. JExhaust_Room.eq.0 .AND. 
     &                          Location_Control_Room.gt.0) THEN
                        write(inp_out,'(/5x,a,/10x,a,i4,3a,I4,a)') 
     &                      ' No X/Q table for this path ??',
     &                      ' Path', II ,trim(Pathway_name(II)), ' and',
     &                      ' Path', JJ ,trim(Pathway_name(JJ))
                        write(inp_out,'(/5x,a)') 
     &                      'There is no reason to continue, (RD_SDF)'
                        write(inp_out,'(/5x,a)')
     &                      '***********    S T O P   *****************'

                        write(out_unit,'(/5x,a,/10x,a,i4,3a,I4,a)') 
     &                      ' No X/Q table for this path ??',
     &                      ' Path', II ,trim(Pathway_name(II)), ' and',
     &                      ' Path', JJ ,trim(Pathway_name(JJ))
                        write(out_unit,'(/5x,a)') 
     &                      'There is no reason to continue, (RD_SDF)'             
                        write(out_unit,'(/5x,a)') 
     &                      '***********    S T O P   *****************' 
                        ERROR_CODE = 9
                     END IF                       
                 END DO
              END DO
            END IF
        ELSE
           read(unit_number,'(a80)') skip_name
           write(inp_out,'(a80)') skip_name
           read(unit_number,'(a80)') skip_name
           write(inp_out,'(a80)') skip_name
        END IF

      END IF
c		         
C      Simulation Parameters  

      read(unit_number,'(a80)') skip_name
      write(inp_out,'(a80)') skip_name
      read(unit_number, *, err=10) dt_max_count

      if (level_rd_sdf .ge. 3) then
         write(*,*) 'dt_max_count = ', dt_max_count
      endif

      if(dt_max_count .ge. 1) then
         do i = 1, dt_max_count, 1
            read(unit_number, *, err=10) dt_max_time(i), dt_max(i)
                
            if (level_rd_sdf .ge. 3) then
               write(*,*) 'dt_max_time(', i, ') = ',
     &              dt_max_time(i) / 3600.0d0
               write(*,*) 'dt_max(', i, ') = ', dt_max(i) / 3600.0d0
            endif
            dt_max_time(i) =   max(0.0d0, (dt_max_time(i) * 3600.0d0)
     &           - start_accident)
            dt_max(i) = dt_max(i) * 3600.0d0
            IF (dt_max(i) .lt. 4.0 .and. dt_max(i) .gt. 0.0) THEN
               write(inp_out,'(/,a)')
     &         '    THIS SMALL TIME STEP MAY RESULT IN EXCESSIVE'
     &          // ' CLOCK TIME FOR THIS CALCULATION '
            END IF
         end do
      end if

      if(action .eq. 'Cnsl') then
         read(unit_number, '(a80)', err=10) skip_name
         read(unit_number, '(a80)', err=10) skip_name
         write(inp_out,'(a80)') skip_name
      else if(action .NE. 'batc') then
         read(unit_number, '(a80)', err=10) skip_name
         write(inp_out,'(a80)') skip_name
         read(unit_number, *, err=10) skip_name
         write(inp_out,'(a80)') output_filename
      endif

C     Output Controls

C  edit input
      read(unit_number, *, err=10) show_plant
      if (level_rd_sdf .ge. 3) then
         write(*,*) 'show_plant = ', show_plant
      endif

      show_scenario = show_plant
      IF (VERSION.lt. 3.10) THEN
         read(unit_number, *, err=10) show_scenario
         if (level_rd_sdf .ge. 3) then
            write(*,*) 'show_scenario = ', show_scenario
         endif
         read(unit_number, *, err=10) show_event
         if (level_rd_sdf .ge. 3) then
            write(*,*) 'show_event = ', show_event
         endif
         read(unit_number, *, err=10) show_step
         if (level_rd_sdf .ge. 3) then
            write(*,*) 'show_step = ', show_step
         endif
         read(unit_number, *,err=10) show_model
         if (level_rd_sdf .ge. 3) then
            write(*,*) 'show_model = ', show_model
         endif
      ELSE
C   version 3.10
c        Output at each time interval
         read(unit_number, *, err=10) show_event
         if (level_rd_sdf .ge. 3) then
            write(*,*) 'show_plant = ', show_event
         endif
c        Model output at each time interval
         read(unit_number, *,err=10) show_model
         if (level_rd_sdf .ge. 3) then
            write(*,*) 'show_model = ', show_model
         endif
c        Output at each time interval given by the time step control input
         read(unit_number, *, err=10) show_step
         if (level_rd_sdf .ge. 3) then
            write(*,*) 'show_plant = ', show_step
         endif
      END IF

C
c       iclass = 1  version 1.0-3.03 
C                0  version 3.10
c       iunits = 0  version 1.0-3.03
C                1  only Curies edited (version 3.10)
c               -1  switch to compare with original results using
c                   input stream
C
      IF (VERSION.lt. 3.10) THEN
          ICLASS = 1
          IUNITS = 0

      ELSE
         read(unit_number, *, err=10) IUNITS
c   reset iclass to earlier verison calc
         IF (IUNITS .LT. 0) THEN
             ICLASS = 1
             IUNITS = 0
         END IF
	END IF

      if (level_rd_sdf .ge. 3) then
         IF (IUNITS.eq.0) 
     &        write(*,*) ' Masses in Atoms and kg in detailed output'
         IF (IUNITS.eq.1) 
     &        write(*,*) ' Masses in Curies in detailed output'
      endif
      

      IF (error_code.eq.0) then 
         write(action, '(a)') 'none'
         error_message= 'rd_sdf: OK'
      ELSE
C	   STOP
c               **************  STOP  ************************

      END IF
      goto 13

 5    continue
c     probably old file format - warn user

      write(out_unit,*) 'The input file is probably missing one or more'
      write(out_unit,*) 'lines that specify the source term fractions'
      write(out_unit,*) 'and fraction locations (RD_SDF)'
      write(out_unit,*) '***********    S T O P   *******************'
      ERROR_CODE = 2

 10   continue
c     bad file format
      error_code = 1
      if (len(trim(e)) > 0) then	   
         error_message = e
      else
         error_message = 'Bad sdf file format'
      endif
      goto 12
c     
 12   continue 
      write(action, '(a)') 'form'
c      error_code = 1200

 13   continue
      close(unit_number, status='DELETE')
      return

      end

C     ------------------------------------------------------------------
