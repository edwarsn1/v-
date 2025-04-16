C     ##################################################################

      SUBROUTINE GRP_VALUE (NSTEP, INOW, DELTAT, XN, XNGRP,  
     &           PATH, PTHGRP)

C     ##################################################################
C     
C     Author(s): 
C
C     Terry Heames
C     ALION/ITSO
C     (505) 872-1089   
C     
C     
C
C     INOW    1  transfer xn into xn2 (from dkngro)
C                transfer xngrp into xngrp2 
C                transfer path to path2 
C     XN      input compartment nuclide distribution (atoms)
C     XN2     output nuclide distribution (Ci)
C     XNGRP2  output nuclide distribution by group (Ci)
C     PATH    input pathway nuclide distribution (atoms)
C     PATH2   output pathway nuclide distribution (Ci)
C     PTHGRP2 output pathway nuclide distribution by group (Ci)
c
C     include statement 
      INCLUDE 'full.com'

c tjh
C     added the reset of the group nuclide totals XNGRP  
      double precision XN(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision path(MAXNUC, MAXPATH, MAXSTEP+1)
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
C
      double precision ctran(MAXCOMP, MAXCLOC, MAXTGRP)
      double precision ptran(MAXPATH, MAXPLOC, MAXTGRP)
      double precision frac_out(MAXTGRP,MAXPATH)
	double precision xoq_now(MAX_XQS), XNN

      common / cptran / ctran, ptran, frac_out, xoq_now
c
c       iclass = 1 (version 1.0-3.03) or new edit (iclass=0)
c       iunits = 0 (version 1.0-3.03) or all in Curies (iunits=1)

      double precision p_frc_elem(MAXPATH, MAXSTEP+1)
      double precision p_frc_orga(MAXPATH, MAXSTEP+1)
      double precision p_frc_aero(MAXPATH, MAXSTEP+1)

C
	 
      go to (1000, 2000), INOW

C
C     transfer xn (atoms) to xn2 (Ci)
C     all locations
 1000 continue
      DO inuc = 1, Number_of_Nuclides, 1
        dum1 = decay_constant(inuc)/CITOBQS
        DO komp = 1, Number_of_Compartments, 1
	    DO locn = 1, MAXCLOC, 1
            XN2(inuc,komp,locn) = XN(inuc,komp,locn,NSTEP)*dum1
          END DO
        END DO
      END DO

C
C      reset the fractions based on the group values
C
      DO KOMP = 1, number_of_compartments, 1
        DO locn = 1, MAXCLOC, 1
           xntotal = xngrp(2,komp,locn,nstep) + xngrp(3,komp,locn,nstep)
     &              + xngrp(4,komp,locn,nstep)
           if (xntotal .LE. 0.0) xntotal = 1.0
           i_frc_elem(KOMP,locn)= xngrp(2,komp,locn,nstep)/xntotal
           i_frc_orga(KOMP,locn)= xngrp(3,komp,locn,nstep)/xntotal
           i_frc_aero(KOMP,locn)= xngrp(4,komp,locn,nstep)/xntotal
        END DO  

c  zero the group values           
	  DO locn = 1, MAXCLOC, 1
	    DO NGRP = 1, MAXTGRP, 1
            xngrp2(ngrp,komp,locn) = 0.0
          END DO             
        END DO             

      END DO
C
c     make xngrp2 (Curies) from xn 
c
      DO inuc = 1, number_of_nuclides, 1
	   ngrp = ngroup(inuc)
	   DO komp = 1, number_of_compartments, 1
	     DO locn =	1, MAXCLOC, 1

              xnn = xn2(inuc,komp,locn) 
 	        if (ngrp.eq.1) then
C     nobels
                xngrp2(1,komp,locn)= xngrp2(1,komp,locn) + xnn
	        else if (ngrp.eq.2) then
C     halogens
                xngrp2(2,komp,locn)= xngrp2(2,komp,locn)
     &                           + i_frc_elem(komp,locn) * xnn 
                xngrp2(3,komp,locn)= xngrp2(3,komp,locn)
     &                           + i_frc_orga(komp,locn) * xnn 
                xngrp2(4,komp,locn)= xngrp2(4,komp,locn)
     &                           + i_frc_aero(komp,locn) * xnn 
                xngrp2(5,komp,locn)= xngrp2(5,komp,locn)
     &                     + i_frc_aero(komp,locn) * xnn      
              else
C     aerosols
                xngrp2(5,komp,locn)= xngrp2(5,komp,locn) + xnn 
	        end if
	     END DO
         END DO
      END DO

C
C     transfer path (atoms) to path2 (Ci)
C

      DO inuc = 1, Number_of_Nuclides, 1
        dum1 = decay_constant(inuc)/CITOBQS
        DO NPATH = 1, Number_of_Pathways, 1
            PATH2(inuc,npath,NSTEP) = PATH(inuc,npath,NSTEP)*dum1
            PATH2(inuc,npath,3) = PATH(inuc,npath,3)*dum1
        END DO
      END DO

C
C      set the path fractions based on the group atom values
C
      Do NST = 2, 3

          DO NPATH = 1, number_of_pathways, 1
             p_total = pthgrp(2,NPATH,NST) + 
     &          pthgrp(3,NPATH,NST) + pthgrp(4,NPATH,NST)
             if (P_total .LE. 0.0) p_total = 1.0
             p_frc_elem(NPATH,NST)= pthgrp(2,NPATH,NST)/p_total
             p_frc_orga(NPATH,NST)= pthgrp(3,NPATH,NST)/p_total
             p_frc_aero(NPATH,NST)= pthgrp(4,NPATH,NST)/p_total
 
c  zero the group values          
	       DO NGRP = 1, MAXTGRP, 1
               pthgrp2(NGRP,NPATH,NST) = 0.0
             END DO             
          END DO             
 
                   

        DO inuc = 1, Number_of_Nuclides, 1
	   ngrp = ngroup(inuc)

          DO NPATH = 1, Number_of_Pathways, 1
              dum2 = path2(inuc,NPATH,NST) 
 	        if (ngrp.eq.1) then
C     nobels
                pthgrp2(1,NPATH,NST)= pthgrp2(1,NPATH,NST) + dum2
	        else if (ngrp.eq.2) then
C     halogens
                pthgrp2(2,NPATH,NST)= pthgrp2(2,NPATH,NST)
     &                           + p_frc_elem(NPATH,NST) * dum2 
                pthgrp2(3,NPATH,NST)= pthgrp2(3,NPATH,NST)
     &                           + p_frc_orga(NPATH,NST) * dum2 
                pthgrp2(4,NPATH,NST)= pthgrp2(4,NPATH,NST)
     &                           + p_frc_aero(NPATH,NST) * dum2 
                pthgrp2(5,NPATH,NST)= pthgrp2(5,NPATH,NST)
     &                           + p_frc_aero(NPATH,NST) * dum2      
              else
C     aerosols
                pthgrp2(5,NPATH,NST)= pthgrp2(5,NPATH,NST) + dum2 
	        end if
	     END DO       
        END DO    

      END do


      RETURN
C
C      design pthgrp2
C
 2000 continue
     

C
C     return to caller
      RETURN

C     end of subroutine grp_value
      END

