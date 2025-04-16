C     ------------------------------------------------------------------
C
C     Subroutine:  PRINT_MODELS
C
C     ------------------------------------------------------------------
C
C     Author(s):   Terry Heames
C                  Innovative Technology Solutions Corporation
C                  (505) 872-1089
C
C     Description: This routine will describe the software, model, and 
C                  scenario used to obtain the resulting output.
C
C     Usage:       call print_model(nstep, simtim, deltat,
C                     xn, xngrp, pthgrp, time)
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
C     Version:     3.10
C
C     Date:        March, 2002
C
C     Revision
C     History:     2.3   March 1999 - Complete rework of the output format (NEB)
C
C                  2.2   August 1998 - miscellaneous changes to enhance the
C                  readability of the output  (NEB & TJH)
C
C                  1.4 - 13 August, 1996 - changed sv to rem, 
C                  added the df for the model info -btl
C
C                  1.3 - 8 July, 1996 - added the model info to printout -btl 
C                  
C                  1.2 - June, 1995 - made model and scenario description 
C                  printout code into two seperate functions  -btl
C
C                  1.1 - March 7, 1996 - made the on_event (previously
C                  onzone) and on_step (previously onstep) variables
C                  global. They are declared in the simulate.h include
C                  file. Also changed the variable show_time_steps to
C                  show_step.
C
C                  1.0 - January 29, 1996 - initial version.
C
C
C     ------------------------------------------------------------------

      SUBROUTINE PRINT_MODELS(nstep, simtim, deltat,
     &   xn, xngrp, path, pthgrp, time)
C
      include 'full.com'
      integer nstep
      double precision time
      double precision lupc2,lupp2
      double precision xn(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision path(MAXNUC, MAXPATH, MAXSTEP+1)
      double precision pthgrp(MAXTGRP, MAXPATH, MAXSTEP+1)

      double precision simtim, deltat(MAXSTEP)
C
C     setup the Decontamination Factors to be 
C              (mass in atm + mass in sump) / mass in atm         limited to 900
C     
      double precision dcon_factor(MAXTGRP)


      write(out_unit,'(/,1x,a,f9.4)') 
     &           'Detailed model information at time (H) = ',time

      do icmp=1, number_of_compartments,1

          if(deposit_aerosol_model(icmp) .EQ. 2) then
                  write(out_unit, '(/, 1x, a,i2)')
     &               '     Natural deposition'
     &             // ' - User Removal Coefficients, Compartment ',icmp
                  write(out_unit,'(1x, a)')
     &               '     Deposition Lambda ( 1 / hours): '

	            do i = 1, MAXTGRP
	              dcon_factor(i)=1.0
	              if (xngrp(i,icmp,1,nstep) .gt.0.0) then
	                 dcon_factor(i) = (xngrp(i,icmp,1,nstep) +
     &                 xngrp(i,icmp,4,nstep)) / xngrp(i,icmp,1,nstep) 
	              end if
	            end do
 
	              write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
                    write(out_unit,'(5x,1p4e11.4)')
     &               deposit_lambda(icmp,1) * ISTOIH,
     &               deposit_lambda(icmp,2) * ISTOIH, 
     &               deposit_lambda(icmp,3) * ISTOIH,
     &               deposit_lambda(icmp,5) * ISTOIH 
                    write(out_unit,'(1x,a)')
     &               '     Deposition Net DF: '
                    write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
	              write(out_unit,'(5x,1p4e11.4)')
     &               (dcon_factor(i), i=1,3),dcon_factor(5)

          else if(deposit_aerosol_model(icmp) .EQ. 2) then
                  write(out_unit, '(/, 1x, a,i2)')
     &               '     Natural deposition'
     &               // ' - Henry''s Correlation, Compartment ',icmp
                  write(out_unit,'(1x,a,1pe11.4)')
     &               '     Fall height (Feet): ',
     &               (lupc2(icmp,simtim,deposit_aerosol_time,
     &               deposit_height,deposit_aerosol_count(icmp))
     &               * MTOF)
                  write(out_unit,'(1x,a,1pe11.4)')
     &               '     Particle density (g/cm^3): ',
     &               (lupc2(icmp,simtim,deposit_aerosol_time,
     &             deposit_part_density,deposit_aerosol_count(icmp))
     &               * KGM3TOGCM3)
                  write(out_unit,'(1x, a)')
     &               '     Deposition Lambda ( 1 / hours): '

	            do i = 1, MAXTGRP
	              dcon_factor(i)=1.0
	              if (xngrp(i,icmp,1,nstep) .gt.0.0) then
	                 dcon_factor(i) = (xngrp(i,icmp,1,nstep) +
     &                 xngrp(i,icmp,4,nstep)) / xngrp(i,icmp,1,nstep) 
	              end if
	            end do
 
	              write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
                    write(out_unit,'(5x,1p4e11.4)')
     &               deposit_lambda(icmp,1) * ISTOIH,
     &               deposit_lambda(icmp,2) * ISTOIH, 
     &               deposit_lambda(icmp,3) * ISTOIH,
     &               deposit_lambda(icmp,5) * ISTOIH 
                    write(out_unit,'(1x,a)')
     &               '     Deposition Net DF: '
                    write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
	              write(out_unit,'(5x,1p4e11.4)')
     &               (dcon_factor(i), i=1,3),dcon_factor(5)

          else if (deposit_aerosol_model(icmp) .EQ. 3) then
                  write(out_unit,'(/,1x, a,i2)')
     &               '     Natural deposition'
     &               // ' - Powers'' Model, Compartment ',icmp
                  write(out_unit,'(6x, a)')
     &               'Deposition Lambda (1 / Hours)'

	            do i = 1, MAXTGRP
	              dcon_factor(i)=1.0
	              if (xngrp(i,icmp,1,nstep) .gt.0.0) then
	                 dcon_factor(i) = (xngrp(i,icmp,1,nstep) +
     &                 xngrp(i,icmp,4,nstep)) / xngrp(i,icmp,1,nstep) 
	              end if
	            end do
 
				  write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
                    write(out_unit,'(5x,1p4e11.4)')
     &               (deposit_lambda(icmp,1) * ISTOIH),
     &               (deposit_lambda(icmp,2) * ISTOIH), 
     &               (deposit_lambda(icmp,3) * ISTOIH),
     &               (deposit_lambda(icmp,4) * ISTOIH) 
                    write(out_unit,'(6x, a)')
     &               'Deposition Net DF'
                    write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
	              write(out_unit,'(5x,1p4e11.4)')
     &               (dcon_factor(i), i=1,3),dcon_factor(5)
          end if

C
C          spray removal coefficient and decontamination factors 
C          to output     
C
 
          if (sprays_aerosol_model(icmp) .GT. 0) then
                  write(out_unit,'(/,1x, a)')
     &               '         Spray Decontamination'
             if (sprays_aerosol_model(icmp) .EQ. 1) then
		        write(out_unit,'(/,1x, a, I2)')
     &             ' - User Removal Coefficients, Compartment ',icmp
             else
                  write(out_unit,'(/,1x, a, I2)')
     &             ' - Powers'' Model, Compartment ',icmp
             end if
                  write(out_unit,'(6x, a)')
     &               'Deposition Lambda (1 / Hours)'

	            do i = 1, MAXTGRP
	              dcon_factor(i)=1.0
	              if (xngrp(i,icmp,1,nstep) .gt.0.0) then
	                 dcon_factor(i) = (xngrp(i,icmp,1,nstep) +
     &                 xngrp(i,icmp,2,nstep)) / xngrp(i,icmp,1,nstep) 
	              end if
	            end do
 
				  write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
                    write(out_unit,'(5x,1p4e11.4)')
     &               (deposit_lambda(icmp,1) * ISTOIH),
     &               (deposit_lambda(icmp,2) * ISTOIH), 
     &               (deposit_lambda(icmp,3) * ISTOIH),
     &               (deposit_lambda(icmp,4) * ISTOIH) 
                    write(out_unit,'(6x, a)')
     &               'Deposition Net DF'
                    write(out_unit,'(1x,a)')
     &               '     Noble      Elemental'
     &               // '  Organic    Aerosol'
	              write(out_unit,'(5x,1p4e11.4)')
     &               (dcon_factor(i), i=1,3), dcon_factor(5)

          end if
      end do

C           now do pathway models

      do i=1, number_of_pathways, 1
          if(piping_aerosol_model(i) .GT. 1) then
                  write(out_unit, '(/,1x,a,i2)')
     &               '- Aerosol deposition in pipes Pathway ',i
                  write(out_unit,'(1x,a,1pe11.4)')
     &               '     Flow rate (cfm): ',
     &               (lupp2(i,simtim,brock_time,
     &               brock_flow,brock_count(i))
     &               * M3STOCFM)
              IF (Version .lt. 3.10) THEN
                  write(out_unit,'(1x,a,f8.4)')
     &               '     Gas pressure (Atm): ',
     &               (lupp2(i,simtim,brock_time,
     &               brock_pressure,brock_count(i)))
                  write(out_unit,'(1x,a,f8.4)')
     &               '     Gas Temperature (Degrees F): ',
     &               ((1.8*(lupp2(i,simtim,brock_time,
     &               brock_temp,brock_count(i))-273.15))+32)
              ELSE
                  write(out_unit,'(1x,a,f8.4)')
     &               '     Gas pressure (Atm): ',Brock_Pressure(i,1)
                  write(out_unit,'(1x,a,f8.4)')
     &               '     Gas Temperature (Degrees F): ',
     &               1.8*(Brock_temp(i,1)-273.15)+32
              END IF
                  write(out_unit,'(1x, a,/,a)')
     &               '     Deposit efficiencies (Eta) for various'
     &               // ' deposit mechanisms',
     &             '      Grav.      Turb. Inr.'
     &               // ' Diff.      Bends'
                  write(out_unit,'(5x,1p4e11.4)')
     &               brock_output(i,1), brock_output(i,2),
     &               brock_output(i,3), brock_output(i,4)
                  write(out_unit,'(1x,a,1pe11.4)')
     &               '     Overall DF: ',brock_output(i,5)
          endif
          if(piping_elemental_model(i) .EQ. 2) then
                  write(out_unit,'(/,1x,a,i2)')
     &               '- Elemental and organic deposition in pipes'
     &               // ' - Bixler model, Pathway ',i
                  write(out_unit,'(1x,a,/,a)')
     &              '               Elemental'
     &              // '             Organic ',
     &              '      Efficiency     DF'
     &              // '     Efficiency     DF'
                  write(out_unit,'(5x,1p4e11.4)')
     &               brock_output(i,6), brock_output(i,7),
     &               brock_output(i,8), brock_output(i,9)
          endif
      end do


      end
