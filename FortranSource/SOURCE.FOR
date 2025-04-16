C     ##################################################################

      SUBROUTINE SOURCE( SIMTIM, NSTEP, DELTAT, XN, XNGRP, PATH,
     *    PTHGRP, RRATE, GRRATE )

C     ##################################################################

C     This subroutine controls calculation of source material into
C     each compartment. Source material arises in two general ways:
C     (1) from core debris
C     (2) from iodine volitization from pools

C     Inputs:
C     (1) current simulation time, simtim
C     (2) current time-step counter, nstep
C     (3) current time-step increment, deltat
C     (4) number of each nuclide in each location, xn
C     (5) number of each transport group in each location, xngrp
C     (6) number of each nuclide in each pathway, path
C     (7) number of each transport group in each pathway, pthgrp

C     Output:
C     GRRATE, release rate for all transport groups into compartment

C     group release rate from core debris
C     GRRATE1(COMP,4) <<===== from subroutine STERM

C     group release rate due to iodine volatilization from pools
C     GRRATE2(COMP,4) <<===== from subroutine XIVOLC (sump)
C     GRRATE3(COMP,4) <<===== from subroutine XIVOLC (opool)
C     GRRATE4(COMP,4) <<===== from subroutine XIVOLP (spool)

C     group release rate due to all causes
C     GRRATE(COMP,4)  = GRRATE1 + GRRATE2 + GRRATE3 + GRRATE4

C     Called by:
C     RADCALC

C     Calls to:
C     STERM

C     ----------------------------------------------------------------
C     CREATED BY LAM ON 3/14/94
C     TESTED BY DKM 06 OCTOBER 1995
C     Added source input by concentration (Ci/cc) TJH May 2004
C     ----------------------------------------------------------------

C     include statement
      INCLUDE 'full.com'

C     include file for subroutine output
C     contains total_release(maxnuc), accd_wbod, etc.

      double precision TOTAL_RELEASE(MAXNUC)

      COMMON /OUTPUT/ TOTAL_RELEASE, ACCD_WBOD, ACCD_THYR, ACCD_TEDE

      INTEGER ICMP, IPTH, ITG
      INTEGER INUC ! for code block to update total_release
      INTEGER JTG
      INTEGER NSTEP
      INTEGER POOL_TYPE

      double precision XN(MAXNUC,MAXCOMP,MAXCLOC,MAXSTEP)
      double precision XNGRP(MAXTGRP,MAXCOMP,MAXCLOC,MAXSTEP)
      double precision PATH(MAXNUC,MAXPATH,MAXSTEP+1)
      double precision PTHGRP(MAXTGRP,MAXPATH,MAXSTEP+1)
      double precision SIMTIM, DELTAT(MAXSTEP)
      double precision GRRATE(MAXCOMP,MAXTGRP)
      double precision GRRATE1(MAXCOMP,MAXTGRP)
      double precision GRRATE2(MAXCOMP,MAXTGRP)
      double precision GRRATE3(MAXCOMP,MAXTGRP)
      double precision GRRATE4(MAXCOMP,MAXTGRP)
      double precision rf(10)

CSLH  Changed MAXNUC to include 1 extra nuclide to contain non-
CSLH  radioactive aerosol inventory. Changed all occurences of
CSLH  MAXNUC+1 to MAXNUC to reflect this change.

      double precision RRATE(MAXNUC,MAXCOMP)

      double precision ACCD_WBOD(MAXDOSE), ACCD_THYR(MAXDOSE)
      double precision ACCD_TEDE(MAXDOSE)

C     write banner on entry into subroutine
      IF ( LEVEL_SOURCE .GE. 1 ) THEN
        WRITE(out_unit,'(1X,A19)') 'SUBROUTINE SOURCE! '
      END IF

C     calculate release rate for each compartment
C     #########################################################
      CALL STERM(SIMTIM, NSTEP, DELTAT, RRATE, GRRATE1 )
C     #########################################################
c

      IF (NSTEP.eq.1) THEN
         do icmp = 1, number_of_compartments, 1
            do nucl = 1, number_of_nuclides, 1
               do jloc = 1, maxcloc, 1
                  xn(nucl, icmp, jloc, 1) = 0.0d0
                  xn(nucl, icmp, jloc, 2) = 0.0d0
               end do
            end do
         end do

C     
C       source term compartment, look for initial concnetration input 
C
         CC3TOF3 = M3TOF3 * 1.0e-6

         DO NS = 1, Number_of_Sources, 1
            ICMP = SOURCE_TERM_ON(NS)
            NUMB =  Compartment_Inventory_File(NS)
            IF (Inventory_Type(NUMB) .eq. 2) Then 
              NRLSE = Inventory_Release(NS)
              DO ll = 1, 10
		      rf(ll) = 1.0
              END DO                         
              IF (NRLSE.gt.0) THEN
                rf( 1) = nobles_gap(NRLSE)
                rf( 2) = iodine_gap(NRLSE)
                rf( 3) = cesium_gap(NRLSE)
                rf( 4) = tellurium_gap(NRLSE)
                rf( 5) = strontium_gap(NRLSE)
                rf( 6) = barium_gap(NRLSE)
                rf( 7) = ruthenium_gap(NRLSE)
                rf( 8) = cerium_gap(NRLSE)
                rf( 9) = lanthanum_gap(NRLSE)
                rf(10) = aerosol_gap(NRLSE)
              END IF
           
              do nucl = 1, number_of_nuclides, 1
C
C   insert concentration in appropriate compartment atmosphere (icmp,1)
C                        and convert to atoms
C
                 NGRP = Ngroup(nucl)
                 xn(nucl,ICMP,1,1) = nuclide_concentration(nucl,NUMB)
     &                        * (Compartment_Volume(ICMP) *1.0e6) 
     &                        * Source_Term_Fraction(NS) * rf(NGRP)
     &                        * CITOBQS / DECAY_CONSTANT(nucl)
     &                        + xn(nucl,ICMP,1,1)
                do jloc = 2, maxcloc, 1
                  xn(nucl,icmp,jloc,1) = 0.0
                end do
              end do
            END IF      
         END DO
      END IF



C     ######################################################
C     ########## SUM SOURCES FOR ALL COMPARTMENTS ##########
C     ######################################################

C     do-loop for each compartment
      DO ICMP = 1, NUMBER_OF_COMPARTMENTS

C       do-loop for each transport group
        DO JTG = 1, MAXTGRP

C         total release rate for current transport group
C         core debris + sump + overlying pool + suppression pool
          GRRATE(ICMP,JTG) = GRRATE1(ICMP,JTG) + GRRATE2(ICMP,JTG) +
     *      GRRATE3(ICMP,JTG) + GRRATE4(ICMP,JTG)

        END DO
C       end do-loop for each transport group

        IF ( LEVEL_SOURCE .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A14)') 'SOURCE OUTPUT:'
          WRITE(out_unit,'(1X,A8,I1,A7,5E13.4)')
     *    ' GRRATE(', ICMP, ',*)  = ',
     *      (GRRATE(ICMP,ITG),ITG=1,MAXTGRP)
        END IF

      END DO
C     end do-loop for each compartment

C     return to caller
      RETURN

C     end of subroutine SOURCE
      END


