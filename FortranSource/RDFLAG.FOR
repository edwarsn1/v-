C     ------------------------------------------------------------------
C
C     Subroutine:  rdflag
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames ALION/ITS operations
C
C     Description: Reads debug flags from the mcode\flag.data file if it
C                  exists. If it doesn't exist, the debug flags are set
C                  to 0 indicating that no extra debug out is to
C                  printed.
C
C     Usage:       Called by radcalc
C
C     Inputs:      out_unit - the global varible which contains the unit
C                  number of the output file.
C
C     Outputs:     All of the debug flags which have the format:
C
C                     level_subname
C
C                  where subname is the name of the subroutine for which
C                  the flag is defined. A value of 0 indicates no debug
C                  output. A value of 9 indicates the maximum level of
C                  debug output.
C
C     Variables:   
C
C     Calls:       nextunit - subroutine that returns the next availble
C                  unit number for creating files.
C
C     Assumptions: If the flag.data file exists, it must be in the mcode
C                  subdirectory.
C
C     Version:     1.2
C
C     Date:        December 8, 1997
C
C     Revision
C     History:     1.2 - December 8, 1997 - removed rdnucd flag because
C                  the module no longer exists. Added logic to deal with
C                  the distributions that do not include the flag.dat
C                  file. Added local debug level to enable write
C                  statements.
C
C                  1.1 - January 29, 1996 - changed level_radtrad to
C                  level_radcalc. Added call and modified code to use
C                  next available file unit. factors to the dose
C                  calculations.
C
C                  1.0 - December 12, 1994 - initial version.
C
C     ------------------------------------------------------------------

      subroutine rdflag

         include 'full.com'

C        Declare variable types.

         logical file_exists
         integer unit_number, level_rdflag

         parameter (level_rdflag = 0)

         character * 72 header
         character * 15 subname

C        Write banner on entry into subroutine.
         
         if(level_rdflag .ge. 1) then
            write(out_unit,'(1x, a)') 'Subroutine rdflag.'
         end if

C        Check to see if the flag.data file exists

         inquire(file = 'flag.data', exist = file_exists)

         if(file_exists) then
            call nextunit(unit_number)
            open(unit_number, file = 'flag.data')
            if(level_rdflag .ge. 3) then
               write(out_unit,'(1x, a)') 'Reading flag file.'
            end if
         end if

         if(file_exists) then
            read(unit_number,*) header
         else
            header = 'Cannot find flag.data file. ' //
     &         'Using defualt values.'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit,'(1x, a)') header
         end if
   
         if(file_exists) then
            read(unit_number, *)
     &         level_aqueous, subname
         else
            level_aqueous = 0
            subname = 'level_aqueous'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_aqueous, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_cin, subname
         else
            level_cin = 0
            subname = 'level_cin'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_cin, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_coeffs, subname
         else
            level_coeffs = 0
            subname = 'level_coeffs'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_coeffs, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_coenum, subname
         else
            level_coenum = 0
            subname = 'level_coenum'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_coenum, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_cout, subname
         else
            level_cout = 0
            subname = 'level_cout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_cout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_decay, subname
         else
            level_decay = 0
            subname = 'level_decay'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_decay, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_doses, subname
         else
            level_doses = 0
            subname = 'level_doses'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_doses, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_energyc, subname
         else
            level_energyc = 0
            subname = 'level_energyc'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_energyc, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_energyp, subname
         else
            level_energyp = 0
            subname = 'level_energyp'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_energyp, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_equal, subname
         else
            level_equal = 0
            subname = 'level_equal'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_equal, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_extede, subname
         else
            level_extede = 0
            subname = 'level_extede'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_extede, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_filtin, subname
         else
            level_filtin = 0
            subname = 'level_filtin'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_filtin, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_fout, subname
         else
            level_fout = 0
            subname = 'level_fout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_fout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_initall, subname
         else
            level_initall = 0
            subname = 'level_initall'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_initall, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_invmat, subname
         else
            level_invmat = 0
            subname = 'level_invmat'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_invmat, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_lupc1, subname
         else
            level_lupc1 = 0
            subname = 'level_lupc1'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_lupc1, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_lupc2, subname
         else
            level_lupc2 = 0
            subname = 'level_lupc2'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_lupc2, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_lupc3, subname
         else
            level_lupc3 = 0
            subname = 'level_lupc3'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_lupc3, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_lupl2, subname
         else
            level_lupl2 = 0
            subname = 'level_lupl2'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_lupl2, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_lupp1, subname
         else
            level_lupp1 = 0
            subname = 'level_lupp1'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_lupp1, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_lupp2, subname
         else
            level_lupp2 = 0
            subname = 'level_lupp2'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_lupp2, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_masstr, subname
         else
            level_masstr = 0
            subname = 'level_masstr'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_masstr, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_necsteps, subname
         else
            level_necsteps = 0
            subname = 'level_necsteps'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_necsteps, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_nifout, subname
         else
            level_nifout = 0
            subname = 'level_nifout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_nifout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_nuclide, subname
         else
            level_nuclide = 0
            subname = 'level_nuclide'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_nuclide, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_opool, subname
         else
            level_opool = 0
            subname = 'level_opool'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_opool, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_output, subname
         else
            level_output = 0
            subname = 'level_output'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_output, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_pipin, subname
         else
            level_pipin = 0
            subname = 'level_pipin'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_pipin, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_pipout, subname
         else
            level_pipout = 0
            subname = 'level_pipout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_pipout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_printout, subname
         else
            level_printout = 0
            subname = 'level_printout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_printout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_radcalc, subname
         else
            level_radcalc = 0
            subname = 'level_radcalc'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_radcalc, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rdbwr, subname
         else
            level_rdbwr = 0
            subname = 'level_rdbwr'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rdbwr, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rdinpd, subname
         else
            level_rdinpd = 0
            subname = 'level_rdinpd'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rdinpd, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rd_nif, subname
         else
            level_rd_nif = 0
            subname = 'level_rd_nif'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rd_nif, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rdpsf, subname
         else
            level_rdpsf = 0
            subname = 'level_rdpsf'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rdpsf, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rdpwr, subname
         else
            level_rdpwr = 0
            subname = 'level_rdpwr'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rdpwr, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_recirc, subname
         else
            level_recirc = 0
            subname = 'level_recirc'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_recirc, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_residue, subname
         else
            level_residue = 0
            subname = 'level_residue'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_residue, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rftbwr, subname
         else
            level_rftbwr = 0
            subname = 'level_rftbwr'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rftbwr, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rftout, subname
         else
            level_rftout = 0
            subname = 'level_rftout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rftout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_rftpwr, subname
         else
            level_rftpwr = 0
            subname = 'level_rftpwr'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_rftpwr, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_sdfout, subname
         else
            level_sdfout = 0
            subname = 'level_sdfout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_sdfout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_sorter, subname
         else
            level_sorter = 0
            subname = 'level_sorter'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_sorter, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_source, subname
         else
            level_source = 0
            subname = 'level_source'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_source, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_spry, subname
         else
            level_spry = 0
            subname = 'level_spry'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_spry, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_sterm, subname
         else
            level_sterm = 0
            subname = 'level_sterm'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_sterm, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_supin, subname
         else
            level_supin = 0
            subname = 'level_supin'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_supin, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_supout, subname
         else
            level_supout = 0
            subname = 'level_supout'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_supout, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_tshift, subname
         else
            level_tshift = 0
            subname = 'level_tshift'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_tshift, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_xivolc, subname
         else
            level_xivolc = 0
            subname = 'level_xivolc'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_xivolc, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_xivolp, subname
         else
            level_xivolp = 0
            subname = 'level_xivolp'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_xivolp, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_xntdep, subname
         else
            level_xntdep = 0
            subname = 'level_xntdep'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_xntdep, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_xnupdt, subname
         else
            level_xnupdt = 0
            subname = 'level_xnupdt'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_xnupdt, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_zerodn, subname
         else
            level_zerodn = 0
            subname = 'level_zerodn'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_zerodn, subname
         end if
      
         if(file_exists) then
            read(unit_number, *)
     &         level_zrinv, subname
         else
            level_zrinv = 0
            subname = 'level_zrinv'
         end if
         if(level_rdflag .ge. 3) then
            write(out_unit, *)
     &         level_zrinv, subname
         end if
      
         if(file_exists) then
            close(unit_number)
         end if

         return

      end

C     ------------------------------------------------------------------
