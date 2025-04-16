C     TESTED VERSION

C     ##################################################################
      SUBROUTINE FILTIN( JAYPEE, SIMTIM, FILFIN )
C     ##################################################################

C     This subroutine calculates the removal coefficient for filtering
C     incoming air. The coefficient, given by:
C                   (1 - Eg;i,j / 100) * Ki,j(f) / Vj
C     is calculated for each transport group for the given time step 
C     and is stored in the array FILFIN(4). The user must specify the
C     volume of the "from" compartment, the flow through the filter,
C     and the efficiency of the filter for the various groups.

C     Inputs:
C     (1) pathway number
C     (2) current simulation time

C     Ouput:
C     FILFIN, removal coefficient for filters, all transport groups
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol

C     Reference is "Model Description", LeAnn Adams Miller, 2/25/94.
C     In particular, see Section 2.2.6. 

C     ------------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     TESTED BY DKM ON 5 JULY 1995
C     ------------------------------------------------------------------

C     include statement
      INCLUDE 'full.com'

      INTEGER JAYPEE

      double precision SIMTIM
      double precision FLOW, FEFF
      double precision LUPP2
      double precision FILFIN(MAXTGRP)
      
CTJH  code added by TJH on 19 October 1995

C        Lines previously from cptran.inc. The other files that
C        previously included this file, also now contain these lines.

C        transport groups (tg) removed from compartment (comp) atmospheres
C        and deposited into other compartment sub-locations
C        assignments for ctran (compartments):

C        ctran(comp,1,tg)     not defined      atmosphere, revol'n
C        ctran(comp,2,tg)     sprays           comp sump
C        ctran(comp,3,tg)     not defined      comp opool
C        ctran(comp,4,tg)     nat dep          dep surfaces
C        ctran(comp,5,tg)     recirc filter    comp filter

C        transport groups deposited in pathways
C        assignments for ptran (pathways):

C        ptran(path,1,tg)     pipe loss        pipe walls
C        ptran(path,2,tg)     filter loss      pathway filters
C        ptran(path,3,tg)     s-pool loss      s-pool
C        ptran(path,4,tg)     nat convect      no accumulation
C        ptran(path,5,tg)     not defined      -----------
C
C        pthgrp(Group, Path, Step)

CTJH     Code added by TJH on 19 October 1995.

      double precision ctran(MAXCOMP, MAXCLOC, MAXTGRP)
      double precision ptran(MAXPATH, MAXPLOC, MAXTGRP)
      double precision frac_out(MAXTGRP,MAXPATH)
	double precision xoq_now(MAX_XQS)

      common / cptran / ctran, ptran, frac_out, xoq_now

C        included into following subroutines
C        radcalc             sourcep             coeffs
C        filtin              pipin               supin

C        End of cptran.inc lines.


C     write banner on entry into subroutine
      IF ( LEVEL_FILTIN .GE. 1 ) THEN
        write(out_unit,'(1X,A18)') 'SUBROUTINE FILTIN!'
      END IF
C
C   check for filter failure
C
      JPLUS = p_filter_eff_count(JAYPEE) + 1

      IF (P_Filter_Failure(JAYPEE) .GT.0 .and. 
     &           SIMTIM .gt. P_FILTER_TIME(JAYPEE,JPLUS+1) ) THEN 
C
C   failed filter is shutdown
C
         FLOW = P_FILTER_FLOW_RATE(JAYPEE,JPLUS+1)
         FEFF = 1.0
         FILFIN(1) = FLOW / COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
         FILFIN(2) = FILFIN(1)
         FILFIN(3) = FILFIN(1)
         FILFIN(4) = FILFIN(1)
         PTRAN(JAYPEE,2,1) = 0.0
         PTRAN(JAYPEE,2,2) = 0.0
         PTRAN(JAYPEE,2,3) = 0.0
         PTRAN(JAYPEE,2,4) = 0.0

      ELSE IF (P_Filter_Failure(JAYPEE) .GT.0 .and. 
     &           SIMTIM .gt. P_FILTER_TIME(JAYPEE,JPLUS) ) THEN 
c
c     filter has failed
c
C     filter release fraction for elemental iodine, percent
        FEFF = LUPP2( JAYPEE, SIMTIM, P_FILTER_TIME, 
     &    P_FILTER_ELEMENTAL_EFF, P_FILTER_EFF_COUNT(JAYPEE) )
C     filter release fraction for organic iodine, percent
        FEFF = LUPP2( JAYPEE, SIMTIM, P_FILTER_TIME,
     &    P_FILTER_ORGANIC_EFF, P_FILTER_EFF_COUNT(JAYPEE) )
C     filter release fraction for aerosols, percent
        FEFF = LUPP2( JAYPEE, SIMTIM, P_FILTER_TIME,
     &    P_FILTER_AEROSOL_EFF, P_FILTER_EFF_COUNT(JAYPEE) )
C
C   ptran = amount in pthgrp/(xngave*deltat)*(1-feff)Q/vol
C  I think we want to do the easy thing and treat it as a source
C

         FLOW = P_FILTER_FLOW_RATE(JAYPEE,JPLUS)
         FEFF = 1.0
         FILFIN(1) = FLOW / COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
         FILFIN(2) = FILFIN(1)
         FILFIN(3) = FILFIN(1)
         FILFIN(4) = FILFIN(1)
         PTRAN(JAYPEE,2,1) = 0.0
         PTRAN(JAYPEE,2,2) = 0.0
         PTRAN(JAYPEE,2,3) = 0.0
         PTRAN(JAYPEE,2,4) = 0.0
      ELSE

C     flow rate, m3/sec
        FLOW = LUPP2( JAYPEE, SIMTIM, P_FILTER_TIME, 
     &      P_FILTER_FLOW_RATE, P_FILTER_EFF_COUNT(JAYPEE) )

        IF ( LEVEL_FILTIN .GE. 2 ) THEN
          write(out_unit,'(1X,A26)') ' FILTIN: FILTER FLOW RATE!'
          write(out_unit,'(1X,A13,F11.4,A5)') 
     &    ' FLOW      = ', FLOW, ' m3/s'                
        END IF

C     ########## noble gas transport group ##########

C     no effect on noble gases, 1/sec
        FEFF = 0.0

C     removal coefficient for noble gases, 1/sec

        FILFIN(1) = FLOW / COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))

CTJH  code added 19 October 1995
        PTRAN(JAYPEE,2,1) = 0.0
      
        IF ( LEVEL_FILTIN .GE. 2 ) THEN
          write(out_unit,'(1X,A34)') 
     &    ' FILTIN: NO EFFECT ON NOBLE GASES!'
          write(out_unit,'(1X,A13,F11.4,A2)') 
     &    ' FEFF      = ', FEFF, ' %'
          write(out_unit,'(1X,A13,F11.4,A6)') 
     &    ' FILFIN(1) = ', FILFIN(1), ' 1/sec'
          write(out_unit,'(1X,A7,I1,A1,I1,A1,I1,A4,E13.4)') 
     &    ' PTRAN(', JAYPEE, ',', 2, ',', 1, ') = ',
     &      PTRAN(JAYPEE,2,1)
        END IF

C     ########## elemental iodine transport group ##########
C     filter efficency for elemental iodine, percent
        FEFF = LUPP2( JAYPEE, SIMTIM, P_FILTER_TIME, 
     &    P_FILTER_ELEMENTAL_EFF, P_FILTER_EFF_COUNT(JAYPEE) )

C     removal coefficient for elemental iodine, 1/sec

        FILFIN(2) = ( 1.0 - FEFF / 100.0 ) * FLOW /
     &    COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
CTJH  code added 19 October 1995
        PTRAN(JAYPEE,2,2) = FEFF / 100.0 * FLOW / 
     &    COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
C     
      

        IF ( LEVEL_FILTIN .GE. 2 ) THEN
          write(out_unit,'(1X,A26)') ' FILTIN: ELEMENTAL IODINE!'
          write(out_unit,'(1X,A13,F11.4,A2)') 
     &    ' FEFF      = ', FEFF, ' %'
          write(out_unit,'(1X,A13,F11.4,A6)') 
     &    ' FILFIN(2) = ', FILFIN(2), ' 1/sec'
          write(out_unit,'(1X,A7,I1,A1,I1,A1,I1,A4,E13.4)') 
     &    ' PTRAN(', JAYPEE, ',', 2, ',', 2, ') = ',
     &      PTRAN(JAYPEE,2,2)
        END IF

C     ########## organic iodine transport group ##########

C     filter efficiency for organic iodine, percent
        FEFF = LUPP2( JAYPEE, SIMTIM, P_FILTER_TIME,
     &    P_FILTER_ORGANIC_EFF, P_FILTER_EFF_COUNT(JAYPEE) )

C     removal coefficient for organic iodine, 1/sec

        FILFIN(3) = ( 1.0 - FEFF / 100.0 ) * FLOW /
     &    COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
CTJH  code added 19 October 1995
        PTRAN(JAYPEE,2,3) = FEFF / 100.0 * FLOW / 
     &    COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
C     end if
      
        IF ( LEVEL_FILTIN .GE. 2 ) THEN
          write(out_unit,'(1X,A24)') ' FILTIN: ORGANIC IODINE!'
          write(out_unit,'(1X,A13,F11.4,A2)') 
     &    ' FILFIN(3) = ', FILFIN(3), ' 1/sec'
          write(out_unit,'(1X,A7,I1,A1,I1,A1,I1,A4,E13.4)') 
     &    ' PTRAN(', JAYPEE, ',', 2, ',', 3, ') = ',
     &      PTRAN(JAYPEE,2,3)
        END IF

C     ########## aerosol transport group ##########

C     filter efficiency for aerosols, percent
        FEFF = LUPP2( JAYPEE, SIMTIM, P_FILTER_TIME,
     &    P_FILTER_AEROSOL_EFF, P_FILTER_EFF_COUNT(JAYPEE) )

C     removal coefficient for aerosols, 1/sec

        FILFIN(4) = ( 1.0 - FEFF / 100.0 ) * FLOW /
     &    COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
CTJH  code added 19 October 1995
        PTRAN(JAYPEE,2,4) = FEFF / 100.0 * FLOW / 
     &    COMPARTMENT_VOLUME(PATHWAY_FROM(JAYPEE))
C     
      
        IF ( LEVEL_FILTIN .GE. 2 ) THEN
          write(out_unit,'(1X,A18)') ' FILTIN: AEROSOLS!'
          write(out_unit,'(1X,A13,F11.4,A2)') 
     &    ' FEFF      = ', FEFF, ' %'
          write(out_unit,'(1X,A13,F11.4,A6)') 
     &    ' FILFIN(4) = ', FILFIN(4), ' 1/sec'
          write(out_unit,'(1X,A7,I1,A1,I1,A1,I1,A4,E13.4)') 
     &    ' PTRAN(', JAYPEE, ',', 2, ',', 4, ') = ',
     &      PTRAN(JAYPEE,2,4)
        END IF

        FILFIN(5) = FILFIN(4)
	  PTRAN(JAYPEE,2,5) = PTRAN(JAYPEE,2,4)

      END IF
C
C     return to caller
      RETURN

C     end of subroutine FILTIN
      END
