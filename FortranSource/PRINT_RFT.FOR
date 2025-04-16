C     ##################################################################
      SUBROUTINE PRINT_RFT (INVEN,NREL,NSOURCE)
C     ##################################################################

C     Subroutine to produce an edit of the input files, i.e. *.RFT, 
C      *.NIF, & *.INP.  Thus some verification as to what the user 
C      input into the code.
C
C     Subroutine: print_rft  
C
C     ------------------------------------------------------------------
C
C     Author(s): David Monroe  
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
C     Version:         3.10    
C
C     Date:            2004/2005      

C     include statement
      INCLUDE 'full.com'

      double precision HRTOSC, DUMM1, DUMM2, PRATIO
      double precision RELEASE_MASS(MAXCGRP), TOT_FRAC(MAXCGRP)
      integer NCGRP, INVEN, NREL

C
C     conversion factor, hours to seconds
      HRTOSC = 3600.0
c
      pratio = plant_power_level / inventory_power_level
c
C    add the edit of the INP and NIF files
C
c   determine release by group for all release types
c
C
      write(out_unit,'(/,1x,2a)') 'Inventory file =    '
     &                ,trim(Inventory_filename(INVEN))
      IF (NREL .GT. 0)
     &       write(out_unit,'(1x,a,2a)') 'Release from file = '
     &                ,trim(Release_Filename(NREL))
c
      write(out_unit, '(1x, 2a,/)')
     &     'Dose Conversion file = ', trim(dcf_inp_filename)

      write(out_unit,'(/,1x,2a)')
     & 'Nuclide  Group  Specific     half     Whole Body  ',
     & ' Inhaled     Inhaled'
      write(out_unit,'(1x,2a)')
     & ' Name          Inventory     life        DCF      ',
     & ' Thyroid    Effective'
      IF (Inventory_Type(INVEN) .EQ. 1) THEN
          write(out_unit,'(1x,2a)')
     &   '                (Ci/MWt)     (s)     (Sv-m3/Bq-s) ',
     &   ' (Sv/Bq)     (Sv/Bq)'
      ELSE IF (Inventory_Type(INVEN) .EQ. 2) THEN
          write(out_unit,'(1x,2a)')
     &   '                (Ci/cc)      (s)     (Sv-m3/Bq-s) ',
     &   ' (Sv/Bq)     (Sv/Bq)'
      ELSE
          write(out_unit,'(1x,2a)')
     &   '                (Ci/hr)      (s)     (Sv-m3/Bq-s) ',
     &   ' (Sv/Bq)     (Sv/Bq)'
      END IF

c
      do i = 1, Number_of_nuclides, 1
        IF (NGROUP(I) .lt. MAXCGRP) THEN
	     DUMM2 = initial_nuclides(i,INVEN) + 
     &          nuclide_concentration(i,INVEN) +
     &          Nuclide_Insert_Rate(i,INVEN)
C
C   if lead inventory file edit maximum information
C   if subsequent inventory group then only for thos that have a release
C
	     if ( (Nuclide_edit(i).gt.0 .and. INVEN.eq.1) .or. 
     &                  (DUMM2.gt.0.0 .and. INVEN.gt.1) ) then
	       DUMM1 = LOG(2.0)/DECAY_CONSTANT(I)

             IF (Inventory_Type(INVEN) .EQ. 1) THEN
               write(out_unit,'(1x,a8,2x,i2,1x,1p2e11.3,3e12.3)')
     &         nuclide_name(i),ngroup(i), initial_nuclides(i,INVEN),
     &         DUMM1,dcf_cshine(i,8),dcf_inhale(i,6),dcf_inhale(i,8) 

             ELSE IF (Inventory_Type(INVEN) .EQ. 2) THEN
               write(out_unit,'(1x,a8,2x,i2,1x,1p2e11.3,3e12.3)')
     &         nuclide_name(i),ngroup(i),nuclide_concentration(i,INVEN),
     &         DUMM1,dcf_cshine(i,8),dcf_inhale(i,6),dcf_inhale(i,8)
       
             ELSE 
               write(out_unit,'(1x,a8,2x,i2,1x,1p2e11.3,3e12.3)')
     &         nuclide_name(i),ngroup(i),Nuclide_Insert_Rate(i,INVEN),
     &         DUMM1,dcf_cshine(i,8),dcf_inhale(i,6),dcf_inhale(i,8)  
             END IF
           end if
        END IF
      end do
C
      do i = 1, Number_of_nuclides, 1
        IF (NGROUP(I) .EQ. MAXCGRP) THEN
	     DUMM2 = initial_nuclides(i,INVEN) + 
     &          nuclide_concentration(i,INVEN) +
     &          Nuclide_Insert_Rate(i,INVEN)
	     if (DUMM2.gt.0.0) then
                 DUMM2 = DUMM2 * CITOBQS / decay_constant(i) *
     &               atomic_weight(i) / AVOGADRO *
     &               (Plant_Power_Level/Inventory_power_level)
               write(out_unit,'(1x,a8,2x,i2,1x,f11.1,a)')
     &            nuclide_name(i),ngroup(i),DUMM2,'  (gm)'
           end if
        END IF
      end do
C
      if (calculate_daughters .EQ. 1 .and. INVEN.eq.1) then
	write(out_unit,'(/,1x,2a)')
     & 'Nuclide    Daughter  Fraction   Daughter  Fraction',
     & '   Daughter  Fraction '

        do i = 1, Number_of_nuclides, 1
           IF (Nuclide_edit(i).gt.0 .and. 
     &                          branch_fraction(i,1).gt.0.0) then
              write(out_unit,'(1x,a8,2x,3(a8,f8.2,6x) )')
     &              nuclide_name(i),(NUCLIDE_DAUGHTER(i,j),
     &              branch_fraction(i,j), j=1,3)
	     end IF
	  end do
	end if
C
c   determine release masses in each group
c
      IF (NREL .GT. 0) THEN
        do i = 1, maxcgrp, 1
	    release_mass(i) = 0.0
	  end do
c
        tot_frac(1) = NOBLES_GAP(NREL) + NOBLES_EARLY(NREL) + 
     &                NOBLES_EX(NREL) + NOBLES_LATE(NREL)
        tot_frac(2) = IODINE_GAP(NREL) + IODINE_EARLY(NREL) + 
     &                IODINE_EX(NREL) + IODINE_LATE(NREL)
        tot_frac(3) = CESIUM_GAP(NREL) + CESIUM_EARLY(NREL) + 
     &                CESIUM_EX(NREL) + CESIUM_LATE(NREL)
	  tot_frac(4) = TELLURIUM_GAP(NREL) + TELLURIUM_EARLY(NREL) + 
     &                TELLURIUM_EX(NREL) + TELLURIUM_LATE(NREL)
        tot_frac(5) = STRONTIUM_GAP(NREL) + STRONTIUM_EARLY(NREL) + 
     &                STRONTIUM_EX(NREL) + STRONTIUM_LATE(NREL)
        tot_frac(6) = BARIUM_GAP(NREL) + BARIUM_EARLY(NREL) + 
     &                BARIUM_EX(NREL) + BARIUM_LATE(NREL)
	  tot_frac(7) = RUTHENIUM_GAP(NREL) + RUTHENIUM_EARLY(NREL) + 
     &                RUTHENIUM_EX(NREL) + RUTHENIUM_LATE(NREL)
        tot_frac(8) = CERIUM_GAP(NREL) + CERIUM_EARLY(NREL) + 
     &                CERIUM_EX(NREL) + CERIUM_LATE(NREL) 
	  tot_frac(9) = LANTHANUM_GAP(NREL) + LANTHANUM_EARLY(NREL) + 
     &                LANTHANUM_EX(NREL) + LANTHANUM_LATE(NREL)
        tot_frac(10) = AEROSOL_GAP(NREL) + AEROSOL_EARLY(NREL) + 
     &                AEROSOL_EX(NREL) + AEROSOL_LATE(NREL) 
c
        pratio = plant_power_level / inventory_power_level
c
c
        IF (Inventory_Type(INVEN) .eq. 2) THEN
c
	     NCOMP = Source_Term_On(NSOURCE)
           VOLUME_SRC = Compartment_Volume(ncomp)*1.0e6
        END IF
C
C                 Initial_Nuclides(i,NUMB)  Ci/MWt
C                 nuclide_initial_amount(i,NUMB)   Atoms/ MWt
C
C   mass in gms (IUNITS=0) in Curies (IUNITS=1)
        do i = 1, Number_of_nuclides, 1
          NCGRP = ngroup(i)
          IF (NCGRP .LT. 10) THEN

            IF (Inventory_Type(INVEN) .eq. 1) THEN
c     Ci/MWt
              if (initial_nuclides(i,INVEN).gt.0.0) then
                IF (IUNITS .EQ. 0)
     &             Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &               Initial_nuclides(I,INVEN) * tot_frac(NCGRP) * 
     &               PRATIO * CITOBQS * atomic_weight(I) /
     &               (AVOGADRO*DECAY_CONSTANT(I)) 
                IF (IUNITS .EQ. 1)
     &             Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &               Initial_nuclides(I,INVEN) * tot_frac(NCGRP) *
     &               PRATIO 
              end if
            ELSE IF (Inventory_Type(INVEN) .eq. 2) THEN
c     Ci/cc
              if (Nuclide_Concentration(i,INVEN).gt.0.0) then
                IF (IUNITS .EQ. 0)
     &             Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &               Nuclide_Concentration(i,INVEN) * VOLUME_SRC *
     &               tot_frac(NCGRP) * CITOBQS * atomic_weight(I) /
     &               (AVOGADRO * DECAY_CONSTANT(I)) 
                IF (IUNITS .EQ. 1)
     &             Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &               Nuclide_Concentration(i,INVEN) * VOLUME_SRC *
     &               tot_frac(NCGRP)
              end if
            ELSE
              if (Nuclide_Insert_Rate(i,INVEN) .gt.  0.) then
c     Ci/hr
                IF (IUNITS .EQ. 0)
     &             Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &               Nuclide_Insert_Rate(i,INVEN) * 
     &               Duration_Gap(NREL) / htos * tot_frac(NCGRP) *
     &               CITOBQS * atomic_weight(I) /
     &               (AVOGADRO * DECAY_CONSTANT(I)) 
                IF (IUNITS .EQ. 1)
     &             Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &               Nuclide_Insert_Rate(i,INVEN) * 
     &               Duration_Gap(NREL) / htos * tot_frac(NCGRP)
              end if
            END IF
          ELSE
c      aerosol input is always input in kg and converted atoms 
            IF (IUNITS .EQ. 0)
     &         Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &           Initial_nuclides(I,INVEN) * tot_frac(NCGRP) * 
     &           PRATIO * CITOBQS * atomic_weight(I) /
     &           (AVOGADRO*DECAY_CONSTANT(I)) 
            IF (IUNITS .EQ. 1)
     &         Release_mass(NCGRP) = Release_Mass(NCGRP) + 
     &           Initial_nuclides(I,INVEN) * tot_frac(NCGRP) *
     &           PRATIO 
          END IF
        end do
C
C     duration, hours, non-negative
C
        WRITE(out_unit,'(/,1X,A29)') 'Release Fractions and Timings:'
        WRITE(out_unit,'(1X,A60)')  RELEASE_NAME(NREL)
        WRITE(out_unit,'(1X,A60)')  RFT_TITLE_1(NREL)
	  WRITE(out_unit,'(9X,A16,A18,a15,2x,A13)')
     &          '        GAP     ' ,
     &          '  EARLY IN-VESSEL ' ,
     &             ' LATE RELEASE  ', 'RELEASE MASS ' 
        IF (IUNITS.eq.0) THEN
	    WRITE(out_unit,'(9X,F13.6,A3,F10.4,A4,1x,F11.4,A4,10x,a4)')
     &    DURATION_GAP(NREL) / HRTOSC, ' hr' ,
     &    DURATION_EARLY(NREL) / HRTOSC, ' hrs' ,
     &    DURATION_EX(NREL) / HRTOSC,  ' hrs' ,'(gm)'
        ELSE 
	    WRITE(out_unit,'(9X,F13.6,A3,F10.4,A4,1x,F11.4,A4,10x,a4)')
     &    DURATION_GAP(NREL) / HRTOSC, ' hr' ,
     &    DURATION_EARLY(NREL) / HRTOSC, ' hrs' ,
     &    DURATION_EX(NREL) / HRTOSC,  ' hrs' ,'(Ci)'
        END IF

        do i = 1, maxcgrp, 1
	    release_mass(i) = release_mass(i) * 
     &                       source_term_fraction(NSOURCE)
	  end do
C
C     nobles, fractions, sum not greater than unity

C      WRITE   Nobles Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'NOBLES     ',NOBLES_GAP(NREL), 
     *    NOBLES_EARLY(NREL), NOBLES_EX(NREL), Release_Mass(1)

C      WRITE   Iodine Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'IODINE     ',IODINE_GAP(NREL), 
     *    IODINE_EARLY(NREL), IODINE_EX(NREL), Release_Mass(2)

C      WRITE   Cesium Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'CESIUM     ',CESIUM_GAP(NREL), 
     *    CESIUM_EARLY(NREL), CESIUM_EX(NREL), Release_Mass(3)

C      WRITE   TELLURIUM Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'TELLURIUM  ',TELLURIUM_GAP(NREL), 
     *    TELLURIUM_EARLY(NREL), TELLURIUM_EX(NREL), Release_Mass(4)

C      WRITE   Strontium Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'STRONTIUM  ', STRONTIUM_GAP(NREL), 
     *   STRONTIUM_EARLY(NREL), STRONTIUM_EX(NREL), Release_Mass(5)

C      WRITE   Barium Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'BARIUM     ', BARIUM_GAP(NREL),
     *    BARIUM_EARLY(NREL), BARIUM_EX(NREL), Release_Mass(6)

C      WRITE   RUTHENIUM Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'RUTHENIUM  ',RUTHENIUM_GAP(NREL), 
     *    RUTHENIUM_EARLY(NREL), RUTHENIUM_EX(NREL), Release_Mass(7)

C      WRITE   Cerium Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'CERIUM     ', CERIUM_GAP(NREL), 
     *   CERIUM_EARLY(NREL), CERIUM_EX(NREL), Release_Mass(8)

C      WRITE   LANTHANUM Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'LANTHANUM  ', LANTHANUM_GAP(NREL), 
     *   LANTHANUM_EARLY(NREL), LANTHANUM_EX(NREL), Release_Mass(9)

C      WRITE   Aerosol Release Fractions:
        WRITE(out_unit,'(1X,A11,1pe12.4,3x,e12.4,4x,e12.4,6x,e11.3)')
     *   'AEROSOL     ', Aerosol_GAP(NREL), 
     *   Aerosol_EARLY(NREL), Aerosol_EX(NREL), Release_Mass(10)
C
      END IF
C
C     return to caller
      RETURN

C     end of subroutine PRINT_RFT
      END
