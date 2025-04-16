C     ------------------------------------------------------------------
C
C     Include:     filename.h
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
C     Assumptions: .
C
C     Version:     3.10
C
C     Date:        
C
C     Revision
C     History:     May 2004   Holder for version number TJH,
C                  case (title) name
C                  multiple inventories and release files
C
C             3.00 Jan 99 Enlarged size of filenames from 40. -- 
C                  C. Erickson SNL
C
C
C       Number_Inventory_Files   Number of inventory (NIF) files 
C       Number_Release_Files     Number of release fraction (RFT) files
C       Inventory_Release        Release file number associated with
C                                   a particular source 
C       Version                  reads the first card as 3.01, 3.02.,3.03, 3.10
C
C
C     ------------------------------------------------------------------

         integer   
     &      out_unit, 
     &      Number_Inventory_Files, Number_Release_Files,
     &      Inventory_Release, unit_number_o

         character
     &      inventory_filename * 256,
     &      output_filename * 256,
     &      plant_filename * 256,
     &      release_filename * 256,
     &      scenario_filename * 256,
     &      dcf_inp_filename * 256,
     &      case_name * 80


         common /filename/
     &      out_unit, 
     &      Number_Inventory_Files, Number_Release_Files,
     &      Inventory_Release(MAXSRCE), unit_number_o,
     &      Version,
     &      inventory_filename(MAXFILES),
     &      output_filename,
     &      plant_filename,
     &      release_filename(MAXFILES),
     &      scenario_filename,
     &      dcf_inp_filename,
     &      case_name

C     ------------------------------------------------------------------
