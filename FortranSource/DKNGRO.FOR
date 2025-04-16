C     ##################################################################

      SUBROUTINE DKNGRO( NSTEP, DELTAT, XN, XNGRP, PATH, PTHGRP )

C     ##################################################################

C     include statement 
      INCLUDE 'full.com'

C     nuclide numbers for daughters only
      INTEGER ND(MAXNUC,3)

C     changes made on 12/06/94 +
c     routine rewritten by kew
      INTEGER NSTEP
      INTEGER INUC, JDTR, KNUC, LOCN, KOMP, jnuc
      double precision DFACTOR, GFACTOR
      double precision xn_temp(MAXNUC, MAXCOMP, MAXCLOC)
      double precision pth_temp(MAXNUC, MAXPATH)
c tjh
C     added the reset of the group nuclide totals XNGRP  
C     based upon the decayed/daughtered nuclides  5-1-00
C
      double precision XN(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision XNGRP(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision PATH(MAXNUC, MAXPATH, MAXSTEP+1)
      double precision PTHGRP(MAXTGRP, MAXPATH, MAXSTEP+1)
      double precision DELTAT(MAXSTEP)  
C
         double precision i_frc_elem(MAXCOMP, MAXCLOC)
         double precision i_frc_orga(MAXCOMP, MAXCLOC)
         double precision i_frc_aero(MAXCOMP, MAXCLOC)
C  .
C tjh  used the saved iodine fractions from XNUPDT
c
         common / ifraction/ i_frc_elem, i_frc_orga, i_frc_aero
c
c
c  kew
c  commented out the arrays below since the time part is not needed
C     amounts of nuclides after decay and before ingrowth
C     double precision    XN_TEMP(MAXNUC,MAXCOMP,5,MAXSTEP)
c  ...      double precision    XN_TEMP(MAXNUC,MAXCOMP,5,MAXSTEP) 
C     amounts of nuclides lost during decay
c  ...      double precision    XN_LOSS(MAXNUC,MAXCOMP,5,MAXSTEP)

C     changes made on 12\06\94

C     ########## process data for all nuclides ##########
C
C     old version (ICLASS = 1) decays only the atmosphere
C     new version (ICLASS = 0) decays everywhere 
C                                   (including deposited nuclides)

      MAX_KOMP_LOC = MAXCLOC
	IF (ICLASS .EQ. 1) MAX_KOMP_LOC = 1

C
C     set up substeps to keep decay and daughtering in same loop
C     spreadsheet appears to show change beyond 1000 sec.  This is 
C     about 10% of the shortest decay time.  
C     Hence test on existence of decay and daughtering and time step
C     in order of likelihood
c
      IF (calculate_daughters.ne.0 .AND. DELTAT(NSTEP).GE.1200.) Then
        NLOOPS = (DELTAT(NSTEP)*1.000001) / 600.
        step_time = DELTAT(NSTEP) / NLOOPS
      ELSE
        NLOOPS = 1
        step_time = DELTAT(NSTEP)
      END IF

      DO NST = 1, NLOOPS

c  kew
c  first store the pre decay nuclide values

      do locn = 1, MAX_KOMP_LOC, 1
        DO KOMP = 1, NUMBER_OF_COMPARTMENTS
          DO INUC = 1, NUMBER_OF_NUCLIDES
            xn_temp(inuc,komp,locn)= xn(inuc,komp,locn,nstep)
          end do
        end do
      end do


C     do for each nuclide, both parents and daughters
      DO INUC = 1, NUMBER_OF_NUCLIDES
C       do for each daughter of given parent nuclide
        DO JDTR = 1, 3

C         obtain number of nuclide for each daughter
c  kew
c  initialize nuclide daughter index to zero for not present
c  and skip if the branching ratio is zero
          nd(inuc,jdtr) = 0
          if ( BRANCH_FRACTION(inuc,jdtr) .gt. 0.0 ) then

C           do for each nuclide
            DO KNUC = 1, NUMBER_OF_NUCLIDES

C             if name of daughter equals name of nuclide then
C             set number of daughter to number of nuclide
              IF ( NUCLIDE_DAUGHTER(INUC,JDTR) .EQ. 
     *             NUCLIDE_NAME(KNUC) ) THEN
                ND(INUC,JDTR) = KNUC
              END IF
C             end if name of daughter equals name of nuclide

            END DO
C           end do for each nuclide

          end if
c         end if for non zero branching fraction

        END DO
C       end do for each daughter of given parent nuclide
      END DO
C     end do for each nuclide, parents and daughters

C     ############ simulate parent decay ############

C     amount of each nuclide after decay

C     do for each nuclide
c  kew
c  base decay off of the previous time step values
c  because each nuclide could be the daughter of another nuclide
c  and this would give incorrect results to use current dt values
c  also modified this to do in two loops - first loop does decay
c  and the second loop does ingrowth. this ensures that nuclides
c  that are growing also decay properly and vice versa
c  ...

      DO INUC = 1, NUMBER_OF_NUCLIDES
C       amount of nuclide after decay
        DFACTOR = DEXP( - DECAY_CONSTANT(INUC) * step_time )
        DO KOMP = 1, NUMBER_OF_COMPARTMENTS
c  kew
c  decay the parent in all locations if flag is on
c  ...
          if ( No_Decay .EQ. 2 ) then
C
C      ADD DECAY AMOUNT FOR EACH NUCLIDE IN EACH COMPARTMENT
C      ATMOSPHERE.  WILL ADJUST FOR GAMMA OR BETA ENERGY ELSEWHERE
C
	      GAMMA_BETA(INUC,KOMP) = GAMMA_BETA(INUC,KOMP) + 
     &                      (1.0 - DFACTOR)*XN_TEMP(INUC,KOMP,1)
            DO LOCN = 1, MAX_KOMP_LOC, 1
              XN(INUC,KOMP,LOCN,NSTEP) = 
     &                  XN_TEMP(INUC,KOMP,LOCN) * DFACTOR
            end do
          end if
        end do        
      END DO
c  kew
c  decay into the daughters if they are present
c  and if the decay daughters flag is set
c  ...
      if ( calculate_daughters .ne. 0 ) then
      DO INUC = 1, NUMBER_OF_NUCLIDES
        GFACTOR = 1.0-DEXP( - DECAY_CONSTANT(INUC) * step_time )
        DO KOMP = 1, NUMBER_OF_COMPARTMENTS
          if ( No_Decay .EQ. 2 ) then

          DO LOCN = 1, MAX_KOMP_LOC, 1
            do jdtr = 1, 3
              jnuc = nd(inuc,jdtr)
              if (jnuc .gt. 0) then
                loc1 = locn
c     move deposited nobles back to main compartment
                if (LOCN.GT.1 .AND. ngroup(jnuc).eq.1) loc1 = 1
                add_nuclides = gfactor * xn_temp(inuc,komp,locn) *
     &                         BRANCH_FRACTION(inuc,jdtr)
                xn(jnuc,komp,loc1,nstep) = xn(jnuc,komp,loc1,nstep) +
     &                                     add_nuclides  
              end if
            end do
          end do
          end if
        end do
      end do
      end if

C     end do for each nuclide
c

c      see if new version, if so decay the nuclides in pathways
C
      IF (ICLASS .EQ. 0) THEN

        DO NPATH = 1, NUMBER_OF_PATHWAYS
          DO INUC = 1, NUMBER_OF_NUCLIDES
            pth_temp(inuc,NPATH)= PATH(inuc,NPATH,nstep)
          end do
        end do


C     do for each nuclide, both parents and daughters
        DO INUC = 1, NUMBER_OF_NUCLIDES

C       do for each daughter of given parent nuclide
          DO JDTR = 1, 3

C         obtain number of nuclide for each daughter
c  kew
c  initialize nuclide daughter index to zero for not present
c  and skip if the branching ratio is zero
            nd(inuc,jdtr) = 0
            if ( BRANCH_FRACTION(inuc,jdtr) .gt. 0.0 ) then

C           do for each nuclide
              DO KNUC = 1, NUMBER_OF_NUCLIDES

C             if name of daughter equals name of nuclide then
C             set number of daughter to number of nuclide
                IF ( NUCLIDE_DAUGHTER(INUC,JDTR) .EQ. 
     *                          NUCLIDE_NAME(KNUC) ) THEN
                  ND(INUC,JDTR) = KNUC
                END IF
C             end if name of daughter equals name of nuclide

              END DO
C           end do for each nuclide

            end if
c         end if for non zero branching fraction

          END DO
C       end do for each daughter of given parent nuclide

        END DO
C     end do for each nuclide, parents and daughters

C     ############ simulate parent decay ############

C     amount of each nuclide after decay

C     do for each nuclide
c  kew
c  base decay off of the previous time step values
c  because each nuclide could be the daughter of another nuclide
c  and this would give incorrect results to use current dt values
c  also modified this to do in two loops - first loop does decay
c  and the second loop does ingrowth. this ensures that nuclides
c  that are growing also decay properly and vice versa
c  ...
        DO INUC = 1, NUMBER_OF_NUCLIDES
C       amount of nuclide after decay
          DFACTOR = DEXP( - DECAY_CONSTANT(INUC) * step_time )
          DO NPATH = 1, NUMBER_OF_PATHWAYS
c  kew
c  decay the parent in all locations if flag is on
c  ...
            if ( No_Decay .EQ. 2 ) then
C
C
C      ADD DECAY AMOUNT FOR EACH NUCLIDE IN EACH PATHWAY
C      WILL ADJUST FOR GAMMA OR BETA ENERGY ELSEWHERE
C
	        GAMMA_BETA_P(INUC,NPATH) = GAMMA_BETA_P(INUC,NPATH) + 
     &                      (1.0 - DFACTOR)*PTH_TEMP(INUC,NPATH)
              PATH(INUC,NPATH,NSTEP) = 
     &                      PTH_TEMP(INUC,NPATH) * DFACTOR
            end if
          end do
          
        END DO
c  kew
c  decay into the daughters if they are present
c  and if the decay daughters flag is set
c  ...
        if ( calculate_daughters .ne. 0 ) then
          DO INUC = 1, NUMBER_OF_NUCLIDES
            GFACTOR = 1.0-DEXP( - DECAY_CONSTANT(INUC) * step_time )
            DO NPATH = 1, NUMBER_OF_PATHWAYS
              if ( No_Decay .EQ. 2 ) then

                do jdtr = 1, 3
                  jnuc = nd(inuc,jdtr)
                  if (jnuc .gt. 0) then
                    add_nuclides = gfactor * pth_temp(inuc,NPATH) *
     &                             BRANCH_FRACTION(inuc,jdtr)
c     move deposited nobles on to exhaust compartment
                    IF (ngroup(jnuc).eq.1) THEN
                      KOMP = PATHWAY_TO(NPATH)
                      xn(jnuc,komp,1,nstep) = xn(jnuc,komp,1,nstep)
     &                                       + add_nuclides  
                    ELSE 
                      path(jnuc,NPATH,nstep) = path(jnuc,NPATH,nstep) 
     &                                       + add_nuclides
                    END IF           
                  end if
                end do
              end if
            END DO
          END DO
        end if
      END IF      ! finished new decay model
C
      END DO
c          substep finish (NST = 1, NLOOPS)

C     initialize atmosphere xngrp to 0.0
C
      DO ngrp = 1, MAXTGRP, 1
	   DO komp = 1, number_of_compartments
	      DO locn = 1, 1
	        xngrp(ngrp,komp,locn,nstep) = 0.0
	      END DO
	   END DO
      END DO
C
C   re-evaluate the atmosphere xngrp
C
      DO inuc = 1, number_of_nuclides
	   ngrp = ngroup(inuc)
	   DO komp = 1, number_of_compartments
	      DO locn = 1, 1
               
	         if (ngrp.eq.1) then
C     nobels
                  xngrp(1,komp,locn,nstep)= xngrp(1,komp,locn,nstep)
     &                                    + xn(inuc,komp,locn,nstep)
	         else if (ngrp.eq.2) then
C     halogens
                  xngrp(2,komp,locn,nstep)= xngrp(2,komp,locn,nstep)
     &            + i_frc_elem(komp,1) * xn(inuc,komp,locn,nstep)
                  xngrp(3,komp,locn,nstep)= xngrp(3,komp,locn,nstep)
     &            + i_frc_orga(komp,1) * xn(inuc,komp,locn,nstep)
                  xngrp(4,komp,locn,nstep)= xngrp(4,komp,locn,nstep)
     &            + i_frc_aero(komp,1) * xn(inuc,komp,locn,nstep)

                  xngrp(5,komp,locn,nstep)= xngrp(5,komp,locn,nstep)
     &            + i_frc_aero(komp,1) * xn(inuc,komp,locn,nstep)
     &                       / AVOGADRO *atomic_weight(inuc) / 1.0d3
               else
                  xngrp(5,komp,locn,nstep)= xngrp(5,komp,locn,nstep)
     &                                    + xn(inuc,komp,locn,nstep)
     &                       / AVOGADRO *atomic_weight(inuc) / 1.0d3
	         end if
	      END DO
	   END DO
      END DO



C
      CALL GRP_VALUE (NSTEP, 1, DELTAT, XN, XNGRP,  
     &           PATH, PTHGRP)

C
C     return to caller
      RETURN

C     end of subroutine dkngro
      END

