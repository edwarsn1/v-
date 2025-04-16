C     ------------------------------------------------------------------
C
C     Subroutine:  deposition (ITG, DELTAT, NSTEP, XNGRP, 
C                  XNGDOT, SYSMTX, XNGBEG, PTHGRP, TRANSPORT_EFF)
C
C     ------------------------------------------------------------------
C
C     Author(s):   Terry Heames
C                  ALION/ITSO
C                  (505) 872 1089
C
C     Description:
C                 REPLACES CTRAN.h and PTRAN.h of earlier versions
C
C                 Calculates the XNGRP and PTHGRP arrays
c                 XNGRP is the compartment group dependent atom quantity 
c                 PTHGRP is the pathway group dependent atom quantity 
C
C    Compartment types
C
C     xngrp(Group,Comp,1,Step)     atmosphere, revol'n
C     xngrp(Group,Comp,2,Step)     comp sump
C     xngrp(Group,Comp,3,Step)     comp opool
C     xngrp(Group,Comp,4,Step)     dep surfaces
C     xngrp(Group,Comp,5,Step)     comp filter

C     Pathway Types
C     ptran(Path,1,Group)     pipe walls
C     ptran(Path,2,Group)     pathway filters
C     ptran(Path,3,Group)     s-pool
C     ptran(Path,4,Group)     no accumulation
C     ptran(Path,5,Group)     not defined      
C
C     GROUP is the transport group (ITG) 1= nobels, 2= I2_elem
C      3 = HI or CH3I_organic, 4 = CsI aerosol and 5 = other aerosols
C
C     pthgrp(Group, Path, Step)
C
C $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

      subroutine deposition (ITG, DELTAT, NSTEP, SIMTIM, XNGRP, 
     &   XNGDOT, SYSMTX, XNGBEG, PTHGRP, TRANSPORT_EFF)

C $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
       
      include 'full.com'
c
      double precision xngvel, xngend, xngave, simtim
      double precision xngdot(MAXCOMP)
      double precision xngbeg(MAXCOMP)
      double precision sysmtx(MAXCOMP, MAXCOMP)

      double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)
      double precision pthgrp(MAXTGRP, MAXPATH, MAXSTEP+1)
      double precision xngrp_total(MAXCLOC), pthgrp_total
      double precision deltat(MAXSTEP)

C     add transport effectivenss to the output (1/01)

      double precision transport_eff(MAXTGRP,MAXPATH), DUM1, DUM2
      double precision xngvel_1, xngend_1, xngave_1, XNGADD_1

C++
C     TJH     Code added by TJH on 19 October 1995.

      double precision ctran(MAXCOMP, MAXCLOC, MAXTGRP)
      double precision ptran(MAXPATH, MAXPLOC, MAXTGRP)
      double precision frac_out(MAXTGRP,MAXPATH)
	double precision xoq_now(MAX_XQS), current_df(MAXTGRP)

      common / cptran / ctran, ptran, frac_out, xoq_now

C     included into following subroutines
C     radcalc             sourcep             coeffs
C     filtin              pipin               supin
C     xnupdt              deposition


      integer icmp, itg, jcmp, ipth, komp, komp_to, jj, jpth, kk


C
C     ###############################################################
C       this first part replaces the CTRAN include in RADCALC
C     ###############################################################

C       variables being used:
C       xngbeg(comp) is xngrp(tg,comp,1,nstep-1), value of TG for comp
C         atmos, beginning of time step, defined earlier
C       xngdot(comp) is grrate(comp,tg), source release rate of TG for
C         comp atmos, beginning of time step, defined earlier
C       xngend is xngrp(tg,comp,1,nstep), value of TG for comp atmos,
C         end of time step, obtained from resader
C       xngvel is total rate of TG for comp atmos, beginning of time
C         step, obtained below as sum of transport terms and removal
C         terms and source term

C       compartment and ctran types,   where ctran defined:
C       (1) atmosphere                 not defined (for revol'n, later)
C       (2) sump                       spry
C       (3) overlying pool             not defined (for opool, later)
C       (4) deposition surface         xntdep
C       (5) recirculation filter       recirc

C       do-loop for each compartment
        DO ICMP = 1 , NUMBER_OF_COMPARTMENTS

C         if compartment has sprays then (2)
          IF ( COMPARTMENT_SPRAYS(ICMP) .EQ. 1 ) THEN

C           value of TG for comp atmos, end of time step
            XNGEND = XNGRP(ITG,ICMP,1,NSTEP)
C           total rate of TG for comp atmos, beginning of time step
            XNGVEL = XNGDOT(ICMP)
            IF ( NSTEP .GT. 1 ) THEN
              DO JCMP = 1, NUMBER_OF_COMPARTMENTS
                XNGVEL = XNGVEL +
     *            SYSMTX(ICMP,JCMP) * XNGRP(ITG,JCMP,1,NSTEP-1)
              END DO
            END IF
C           average value of transport group in comp atmos
C           obtained using second-degree polynomial fit
            XNGAVE = ( 4.0 * XNGBEG(ICMP) + 2.0 * XNGEND +
     *        XNGVEL * DELTAT(NSTEP) ) / 6.0
C           Average mass >= 0.0
            IF (XNGAVE .LT. 0.0) XNGAVE = 0.5*(XNGBEG(ICMP)+XNGEND)		    

c
            current_df(itg) = 1.0
            If (xngrp(itg,ICMP,1,nstep) .ne. 0.0) then
                current_df(itg) = (1.0 + xngrp(itg,ICMP,2,nstep) / 
     &                                       xngrp(itg,ICMP,1,nstep))
            end if
c    Compare current DF to limits, if exceeded then set spry_rem = 0
C    Note that time must be greater than a few minutes 
C
            IF (itg.eq.2 .and. simtim .gt. 360.0) THEN
              IF (current_DF(itg) .ge. sprays_elemental_DF_limit) THEN
                IF (ION_ELEM .eq. 0) THEN
                   ION_ELEM = 1
                   WRITE(OUT_UNIT,'(/,1x,a,f7.2,a)')
     &                'ELEMENTAL SPRAY DF LIMIT EXCEEDED AT TIME = ',
     &                 simtim/3600.,' (hr)'
                END IF
                XNGAVE = 0.0
              END IF
            ELSE IF (itg.gt.3 .and. simtim .gt. 360.0) THEN
              IF (current_DF(itg) .ge. sprays_aerosol_DF_limit) THEN
                IF (ION_AERO .le. 1) THEN
	            ION_AERO = 2
                  WRITE(OUT_UNIT,'(/,1x,a,f7.2,a)')
     &               'AEROSOL SPRAY DF LIMIT EXCEEDED AT TIME = ',
     &                simtim/3600.,' (hr)'
                END IF
                XNGAVE = 0.0
              ELSE IF (current_DF(itg) .ge. sprays_aerosol_lambda_limit)
     &                                                          THEN    
C                ctran(ICMP, 2, itg) = ctran(ICMP, 2, itg) / 10.0
                IF (ION_AERO .eq. 0) THEN
	            ION_AERO = 1
                  WRITE(OUT_UNIT,'(/,1x,a,f7.2,a,/10x,a)')
     &               'AEROSOL SPRAY DF LIMIT EXCEEDED AT TIME = ',
     &                simtim/3600.,' (hr)', 'DIVIDE INPUT REMOVAL '
     &               //'COEFFICIENT BY 10           **************'
                END IF
	        END IF
            END If           


C           updated transport group in sublocation type 2
C           value of ctran(2) is defined in coeffs(via sprem)
            IF ( NSTEP .EQ. 1 ) THEN
              XNGRP(ITG,ICMP,2,NSTEP) =
     *          CTRAN(ICMP,2,ITG) * XNGAVE * DELTAT(NSTEP)
            ELSE
              XNGRP(ITG,ICMP,2,NSTEP) = XNGRP(ITG,ICMP,2,NSTEP-1) +
     *          CTRAN(ICMP,2,ITG) * XNGAVE * DELTAT(NSTEP)
            END IF
            DUM2 = CTRAN(ICMP,2,ITG) * DELTAT(NSTEP)
          END IF
C         end if compartment has sprays

C         if compartment has natural deposition then (4)
          IF ( COMPARTMENT_DEPOSITION(ICMP) .EQ. 1 ) THEN
C           value of TG for comp atmos, end of time step
            XNGEND = XNGRP(ITG,ICMP,1,NSTEP)
C           total rate of TG for comp atmos, beginning of time step
            XNGVEL = XNGDOT(ICMP)
            IF ( NSTEP .GT. 1 ) THEN
              DO JCMP = 1, NUMBER_OF_COMPARTMENTS
                XNGVEL = XNGVEL +
     *            SYSMTX(ICMP,JCMP) * XNGRP(ITG,JCMP,1,NSTEP-1)
              END DO
            END IF
C           average value of transport group in comp atmos
C           obtained using second-degree polynomial fit
            XNGAVE = ( 4.0 * XNGBEG(ICMP) + 2.0 * XNGEND +
     *        XNGVEL * DELTAT(NSTEP) ) / 6.0
C           Average mass >= 0.0
            IF (XNGAVE .LT. 0.0) XNGAVE = 0.5*(XNGBEG(ICMP)+XNGEND)		    
C           updated transport group in sublocation type 4
C           value of ctran(4) is defined in xntdep
            IF ( NSTEP .EQ. 1 ) THEN
              XNGRP(ITG,ICMP,4,NSTEP) =
     *          CTRAN(ICMP,4,ITG) * XNGAVE * DELTAT(NSTEP)
            ELSE
              XNGRP(ITG,ICMP,4,NSTEP) = XNGRP(ITG,ICMP,4,NSTEP-1) +
     *          CTRAN(ICMP,4,ITG) * XNGAVE * DELTAT(NSTEP)
            END IF
C
            IF(LEVEL_COEFFS.ge.2 .and. itg.ge.4) then
              write(out_unit,'(1x, a,/ 2i4, 1p6e20.10,/8x,6e20.10)') 
     &           'DEPOSITION. ICMP, ITG, XNGVEL,XNGAVE,DELTAT,CTRAN,',
     &            ICMP, ITG, 
     &            XNGVEL, XNGAVE, DELTAT(NSTEP), CTRAN(ICMP,4,ITG),
     &                      XNGEND, XNGBEG(ICMP),
     &            XNGDOT(ICMP),XNGRP(ITG,ICMP,4,1),XNGRP(ITG,ICMP,4,2)
            END IF
C
          END IF
C         end if compartment has natural deposition

C         if compartment has recirculation filter then (5)
          IF ( COMPARTMENT_FILTERS(ICMP) .EQ. 1 ) THEN
C           value of TG for comp atmos, end of time step
            XNGEND = XNGRP(ITG,ICMP,1,NSTEP)
C           total rate of TG for comp atmos, beginning of time step
            XNGVEL = XNGDOT(ICMP)
            IF ( NSTEP .GT. 1 ) THEN
              DO JCMP = 1, NUMBER_OF_COMPARTMENTS
                XNGVEL = XNGVEL +
     *            SYSMTX(ICMP,JCMP) * XNGRP(ITG,JCMP,1,NSTEP-1)
              END DO
            END IF
C           average value of transport group in comp atmos
C           obtained using second-degree polynomial fit
            XNGAVE = ( 4.0 * XNGBEG(ICMP) + 2.0 * XNGEND +
     *        XNGVEL * DELTAT(NSTEP) ) / 6.0
C           Average mass >= 0.0
            IF (XNGAVE .LT. 0.0) XNGAVE = 0.5*(XNGBEG(ICMP)+XNGEND)		    
C           updated transport group in sublocation type 5
C           value of ctran(5) is defined in recirc
            IF ( NSTEP .EQ. 1 ) THEN
              XNGRP(ITG,ICMP,5,NSTEP) =
     *          CTRAN(ICMP,5,ITG) * XNGAVE * DELTAT(NSTEP)
            ELSE
              XNGRP(ITG,ICMP,5,NSTEP) = XNGRP(ITG,ICMP,5,NSTEP-1) +
     *          CTRAN(ICMP,5,ITG) * XNGAVE * DELTAT(NSTEP)
            END IF
          END IF
C         end if compartment has recirculation filter

        END DO
C       end do-loop for each compartment, ICMP


C       total transport group for sprays (2)
        XNGRP_TOTAL(2) = 0.0
        DO ICMP = 1, NUMBER_OF_COMPARTMENTS
          XNGRP_TOTAL(2) = XNGRP_TOTAL(2) + XNGRP(ITG,ICMP,2,NSTEP)
        END DO

        IF ( LEVEL_COEFFS .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A40)')
     *       'XNGRP VALUES AT END OF TG-LOOP (SPRAYS):'
          DO ICMP = 1, NUMBER_OF_COMPARTMENTS
            IF ( ITG .EQ. MAXTGRP ) THEN
              WRITE(out_unit,'(1X,A7,I1,A1,I2,A1,I2,A1,I2,A4,e15.7,A3)')
     *        ' XNGRP(', ITG, ',', ICMP, ',', 2, ',', NSTEP, ') = ',
     *          XNGRP(ITG,ICMP,2,NSTEP), ' kg'
            ELSE
              WRITE(out_unit,'(1X,A7,I1,A1,I2,A1,I2,A1,I2,A4,e15.7,A5)')
     *        ' XNGRP(', ITG, ',', ICMP, ',', 2, ',', NSTEP, ') = ',
     *          XNGRP(ITG,ICMP,2,NSTEP), ' atom'
            END IF
          END DO
          IF ( ITG .EQ. MAXTGRP ) THEN
            WRITE(out_unit,'(1X,A21,e15.7,A3)')
     *      ' XNGRP_TOTAL(2)    = ', XNGRP_TOTAL(2), ' kg'
          ELSE
            WRITE(out_unit,'(1X,A21,e15.7,A5)')
     *      ' XNGRP_TOTAL(2)    = ', XNGRP_TOTAL(2), ' atom'
          END IF
        END IF

C       total transport group for natural deposition (4)
        XNGRP_TOTAL(4) = 0.0
        DO ICMP = 1, NUMBER_OF_COMPARTMENTS
          XNGRP_TOTAL(4) = XNGRP_TOTAL(4) + XNGRP(ITG,ICMP,4,NSTEP)
        END DO

        IF ( LEVEL_COEFFS .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A41)')
     *       'XNGRP VALUES AT END OF TG-LOOP (NAT DEP):'
          DO ICMP = 1, NUMBER_OF_COMPARTMENTS
            IF ( ITG .EQ. MAXTGRP ) THEN
              WRITE(out_unit,'(1X,A7,I1,A1,I2,A1,I2,A1,I2,A4,e15.7,A3)')
     *        ' XNGRP(', ITG, ',', ICMP, ',', 4, ',', NSTEP, ') = ',
     *          XNGRP(ITG,ICMP,4,NSTEP), ' kg'
            ELSE
              WRITE(out_unit,'(1X,A7,I1,A1,I2,A1,I2,A1,I2,A4,e15.7,A5)')
     *        ' XNGRP(', ITG, ',', ICMP, ',', 4, ',', NSTEP, ') = ',
     *          XNGRP(ITG,ICMP,4,NSTEP), ' atom'
            END IF
          END DO
          IF ( ITG .EQ. MAXTGRP ) THEN
            WRITE(out_unit,'(1X,A21,e15.7,A3)')
     *      ' XNGRP_TOTAL(4)    = ', XNGRP_TOTAL(4), ' kg'
          ELSE
            WRITE(out_unit,'(1X,A21,e15.7,A5)')
     *      ' XNGRP_TOTAL(4)    = ', XNGRP_TOTAL(4), ' atom'
          END IF
        END IF

C       total transport group for recirculation filters (5)
        XNGRP_TOTAL(5) = 0.0
        DO ICMP = 1, NUMBER_OF_COMPARTMENTS
          XNGRP_TOTAL(5) = XNGRP_TOTAL(5) + XNGRP(ITG,ICMP,5,NSTEP)
        END DO

        IF ( LEVEL_COEFFS .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A40)')
     *       'XNGRP VALUES AT END OF TG-LOOP (R-FILT):'
          DO ICMP = 1, NUMBER_OF_COMPARTMENTS
            IF ( ITG .EQ. MAXTGRP ) THEN
              WRITE(out_unit,'(1X,A7,I1,A1,I2,A1,I2,A1,I2,A4,e15.7,A3)')
     *        ' XNGRP(', ITG, ',', ICMP, ',', 5, ',', NSTEP, ') = ',
     *          XNGRP(ITG,ICMP,5,NSTEP), ' kg'
            ELSE
              WRITE(out_unit,'(1X,A7,I1,A1,I2,A1,I2,A1,I2,A4,e15.7,A5)')
     *        ' XNGRP(', ITG, ',', ICMP, ',', 5, ',', NSTEP, ') = ',
     *          XNGRP(ITG,ICMP,5,NSTEP), ' atom'
            END IF
          END DO
          IF ( ITG .EQ. MAXTGRP ) THEN
            WRITE(out_unit,'(1X,A21,e15.7,A3)')
     *      ' XNGRP_TOTAL(5)    = ', XNGRP_TOTAL(5), ' kg'
          ELSE
            WRITE(out_unit,'(1X,A21,e15.7,A5)')
     *      ' XNGRP_TOTAL(5)    = ', XNGRP_TOTAL(5), ' atom'
          END IF
        END IF



C     ###############################################################
C       this second part replaces the PTRAN include in RADCALC
C     ###############################################################


C       variables being used:
C       xngbeg(comp) is xngrp(tg,comp,1,nstep-1), value of TG for comp
C         atmos, beginning of time step, defined earlier
C       xngdot(comp) is grrate(comp,tg), source release rate of TG for
C         comp atmos, beginning of time step, defined earlier
C       xngend is xngrp(tg,comp,1,nstep), value of TG for comp atmos,
C         end of time step, obtained from resader
C       xngvel is total rate of TG for comp atmos, beginning of time
C         step, obtained below as sum of transport terms and removal
C         terms and source term

C       pathway and ptran types, ..... where ptran defined:
C       (1) piping pathway             pipin, pipinb
C       (2) filtered pathway           filtin
C       (3) suppression pool           supin
C       (4) natural convection         no accumlation occurs
C       (5) not defined                -----------

C       do-loop for each pathway
		
      DO IPTH = 1, NUMBER_OF_PATHWAYS

C  *******************************************************************

C         if pathway type is PIPING pathway then (1)

        IF ( PATHWAY_TYPE(IPTH) .EQ. 1 ) THEN
C           compartment from which pathway comes
          KOMP = PATHWAY_FROM(IPTH)
C           value of TG for comp atmos, end of time step
          XNGEND = XNGRP(ITG,KOMP,1,NSTEP)
C           total rate of TG for comp atmos, beginning of time step
          XNGVEL = XNGDOT(KOMP)
          IF ( NSTEP .GT. 1 ) THEN
            DO JCMP = 1, NUMBER_OF_COMPARTMENTS
              XNGVEL = XNGVEL +
     &            SYSMTX(KOMP,JCMP) * XNGRP(ITG,JCMP,1,NSTEP-1)
            END DO
          END IF
C           average value of transport group in comp atmos
C           obtained using second-degree polynomial fit
          XNGAVE = ( 4.0 * XNGBEG(KOMP) + 2.0 * XNGEND +
     &        XNGVEL * DELTAT(NSTEP) ) / 6.0
C           Average mass >= 0.0
          IF (XNGAVE .LT. 0.0) XNGAVE = 0.5*(XNGBEG(KOMP)+XNGEND)		    

C           updated transport group in pathway/ptran type 1
C           value of ptran(1) is defined in pipin/pipinb
          IF ( NSTEP .EQ. 1 ) THEN
            PTHGRP(ITG,IPTH,NSTEP) =
     &          PTRAN(IPTH,1,ITG) * XNGAVE * DELTAT(NSTEP)
	      PTHGRP(ITG,IPTH,3) =
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
          ELSE
            PTHGRP(ITG,IPTH,NSTEP) = PTHGRP(ITG,IPTH,NSTEP-1) +
     &          PTRAN(IPTH,1,ITG) * XNGAVE * DELTAT(NSTEP)
            PTHGRP(ITG,IPTH,3) = PTHGRP(ITG,IPTH,3) +
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
          END IF
        END IF
C         end if pathway type is piping pathway
 

C  *******************************************************************

C         if pathway type is FILTERED pathway then 

        IF ( PATHWAY_TYPE(IPTH) .EQ. 2 ) THEN
C
          KOMP_TO = 0
		  dum1 = 0.
		  dum2 = 0.
C           compartment from which pathway comes
          KOMP = PATHWAY_FROM(IPTH)
C           value of TG for comp atmos, end of time step
          XNGEND = XNGRP(ITG,KOMP,1,NSTEP)
C           total rate of TG for comp atmos, beginning of time step
          XNGVEL = XNGDOT(KOMP)
          IF ( NSTEP .GT. 1 ) THEN
            DO JCMP = 1, NUMBER_OF_COMPARTMENTS
              XNGVEL = XNGVEL +
     &            SYSMTX(KOMP,JCMP) * XNGRP(ITG,JCMP,1,NSTEP-1)
            END DO
          END IF
C           average value of transport group in comp atmos
C           obtained using second-degree polynomial fit
          XNGAVE = ( 4.0 * XNGBEG(KOMP) + 2.0 * XNGEND +
     &        XNGVEL * DELTAT(NSTEP) ) / 6.0
C           Average mass >= 0.0
          IF (XNGAVE .LT. 0.0) XNGAVE = 0.5*(XNGBEG(KOMP)+XNGEND)		    
C           Negative mass in a compartment is not acceptable
          If (XNGAVE .LT. 0.0) XNGAVE = 0.0


C          check if the environment is the "from compartment" for this pathway
C
          IF (COMPARTMENT_TYPE(KOMP) .EQ. 2) THEN
C
C         adjust for direct mass transfer from exhaust to intake
		
            XNGAVE = 1.0
            KOMP_TO = pathway_to(IPTH)

C   Store the Q/Vol(1-eff) & Q/Vol(eff) for the control inflow ipth

		  dum1 = transport_eff(ITG,ipth)
	      dum2 = ptran(IPTH,2,ITG)

C  initialize
            transport_eff(ITG,ipth) = 0.0
            ptran(IPTH,2,ITG) = 0.0
	        do jj = 1, N_Exhaust, 1
                jpth = Exhaust_Paths(jj)
	          NXQ = Path_XQ_Table(jpth,IPTH)
	          kk = pathway_from(jpth)
	          if (NXQ .gt. 0) then
                   XNGVEL_1 = xngdot(kk)
                   XNGEND_1 = XNGRP(ITG,kk,1,NSTEP)
                   XNGAVE_1 = 0.5 * (XNGBEG(kk) + XNGEND_1)
C                   XNGADD_1 = XNGAVE_1 * DELTAT(NSTEP)
C                   IF (DABS(XNGVEL_1) .gt. 0.2*XNGADD_1)  THEN
C                       XNGAVE_1 = (XNGADD_1  +
C     &                      4.0 * XNGBEG(kk) + 2.0 * XNGEND_1) / 6.0
C                   END IF
                   IF (XNGAVE_1.lt.0.0) XNGAVE_1 = 0.0

C   multiply the fractional inflow term by the exhaust

                   transport_eff(ITG,ipth) = 
     &                   transport_eff(ITG,ipth) + dum1 * 
     &                   xoq_now(NXQ)*frac_out(ITG,jpth)*XNGAVE_1
	                           
                   ptran(ipth,2,ITG) = ptran(ipth,2,ITG) + dum2 * 
     &                   xoq_now(NXQ)*frac_out(ITG,jpth)*XNGAVE_1
C
C
                   IF(LEVEL_COEFFS.ge.2 .and. itg.eq.4) THEN
                      write(out_unit,'(1x, a, 5i4, 4(/6x,1p6e20.10))') 
     &                 'exhaust-inflow,  itg,ipth,jpth,NXQ, kk, xng ',
     &                  itg,ipth,jpth,NXQ, kk,
     &                  xngend_1, xngend, xngave_1, xngave, xngvel, 
     &                  XNGVEL_1,
     &                  transport_eff(ITG,ipth),ptran(ipth,2,ITG),dum1,
     &                  dum2,xngbeg(kk),xngbeg(komp)
                   END IF

                end if
		    end do
          END IF

C           updated transport group in pathway/ptran type 2
C           value of ptran(2) is defined in filtin
C           
          IF ( NSTEP .EQ. 1 ) THEN
            PTHGRP(ITG,IPTH,NSTEP) =
     &          PTRAN(IPTH,2,ITG) * XNGAVE * DELTAT(NSTEP)
	      PTHGRP(ITG,IPTH,3) =
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
          ELSE
            PTHGRP(ITG,IPTH,NSTEP) = PTHGRP(ITG,IPTH,NSTEP-1) +
     &          PTRAN(IPTH,2,ITG) * XNGAVE * DELTAT(NSTEP)
            PTHGRP(ITG,IPTH,3) = PTHGRP(ITG,IPTH,3) +
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
          END IF
         
C
            IF(LEVEL_COEFFS.ge.2 .and. itg.eq.4) then
              write(out_unit,'(1x, a, 5i4, 4(/6x,1p6e20.10))') 
     &          'DEPOSITION...  KOMP, ITG, IPTH, KOMP_TO, N_Exhaust =',
     &           KOMP, ITG, IPTH, KOMP_TO,  N_Exhaust,
     &           XNGVEL, XNGAVE, DELTAT(NSTEP), PTRAN(IPTH,2,ITG),
     &           sysmtx(1,3), XNGEND,XNGBEG(KOMP),XNGDOT(KOMP),
     &           XNGRP(ITG,KOMP,1,1),PTHGRP(ITG,IPTH,NSTEP),
     &           TRANSPORT_EFF(ITG,IPTH),PTHGRP(ITG,IPTH,3),
     &           DUM1, DUM2, frac_out(itg,1),frac_out(itg,N_Exhaust)
            END IF
C reset
          IF (COMPARTMENT_TYPE(KOMP) .EQ. 2) THEN	
            transport_eff(ITG,ipth) = dum1
            ptran(IPTH,2,ITG) = dum2
		END IF	

        END IF
C         end if pathway type is filtered pathway

C  *******************************************************************

C         if pathway type is Generic then (3 or 6)

          IF (PATHWAY_TYPE(IPTH).EQ.3 .OR. PATHWAY_TYPE(IPTH).EQ.6) THEN
C           compartment from which pathway comes
            KOMP = PATHWAY_FROM(IPTH)
C           value of TG for comp atmos, end of time step
            XNGEND = XNGRP(ITG,KOMP,1,NSTEP)
C           total rate of TG for comp atmos, beginning of time step
            XNGVEL = XNGDOT(KOMP)
            IF ( NSTEP .GT. 1 ) THEN
              DO JCMP = 1, NUMBER_OF_COMPARTMENTS
                XNGVEL = XNGVEL +
     &            SYSMTX(KOMP,JCMP) * XNGRP(ITG,JCMP,1,NSTEP-1)
              END DO
            END IF
C           average value of transport group in comp atmos
C           obtained using second-degree polynomial fit
            XNGAVE = ( 4.0 * XNGBEG(KOMP) + 2.0 * XNGEND +
     &        XNGVEL * DELTAT(NSTEP) ) / 6.0
C           Average mass >= 0.0
            IF (XNGAVE .LT. 0.0) XNGAVE = 0.5*(XNGBEG(KOMP)+XNGEND)		    

C           updated transport group in pathway/ptran type 3
C           value of ptran(3) is defined in supin
C           updated transport group, ptran type is 3
            IF ( NSTEP .EQ. 1 ) THEN
              PTHGRP(ITG,IPTH,NSTEP) =
     &          PTRAN(IPTH,3,ITG) * XNGAVE * DELTAT(NSTEP)
	        PTHGRP(ITG,IPTH,3) =
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
            ELSE
              PTHGRP(ITG,IPTH,NSTEP) = PTHGRP(ITG,IPTH,NSTEP-1) +
     &          PTRAN(IPTH,3,ITG) * XNGAVE * DELTAT(NSTEP)
              PTHGRP(ITG,IPTH,3) = PTHGRP(ITG,IPTH,3) +
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
            END IF
          END IF
C         end if pathway type is suppression pool
  

C  *******************************************************************

C         if pathway type is NATURAL CONVECTION then

          IF ( PATHWAY_TYPE(IPTH) .EQ. 4 ) THEN
C           nothing accumulates in this pathway
C           compartment from which pathway comes
            KOMP = PATHWAY_FROM(IPTH)
C           value of TG for comp atmos, end of time step
            XNGEND = XNGRP(ITG,KOMP,1,NSTEP)
C           total rate of TG for comp atmos, beginning of time step
            XNGVEL = XNGDOT(KOMP)
            IF ( NSTEP .GT. 1 ) THEN
              DO JCMP = 1, NUMBER_OF_COMPARTMENTS
                XNGVEL = XNGVEL +
     &            SYSMTX(KOMP,JCMP) * XNGRP(ITG,JCMP,1,NSTEP-1)
              END DO
            END IF
C           average value of transport group in comp atmos
C           obtained using second-degree polynomial fit
            XNGAVE = ( 4.0 * XNGBEG(KOMP) + 2.0 * XNGEND +
     &        XNGVEL * DELTAT(NSTEP) ) / 6.0
C           Average mass >= 0.0
            IF (XNGAVE .LT. 0.0) XNGAVE = 0.5*(XNGBEG(KOMP)+XNGEND)		    

C           updated transport group in pathway/ptran type 4
C           value of transport_eff is defined in coeffs (from cin)
C 
            PTHGRP(ITG,IPTH,NSTEP) =  0.0
c
            IF ( NSTEP .EQ. 1 ) THEN
	        PTHGRP(ITG,IPTH,3) =
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
            ELSE
              PTHGRP(ITG,IPTH,3) = PTHGRP(ITG,IPTH,3) +
     &          TRANSPORT_EFF(ITG,IPTH) * XNGAVE * DELTAT(NSTEP)
            END IF
C
C
            IF(LEVEL_COEFFS.ge.2 .and. itg.eq.4) then
               write(out_unit,'(1x, a, 2i4, 4(/6x,1p6e20.10))') 
     &           'DEPOSITION, KOMP, IPTH, XNGVEL, XNGAVE, DELTAT=',
     &            KOMP, IPTH, XNGVEL, XNGAVE, DELTAT(NSTEP),
     &            sysmtx(1,3),XNGDOT(KOMP),XNGBEG(KOMP),
     &            XNGEND,PTHGRP(ITG,IPTH,3),TRANSPORT_EFF(ITG,IPTH) 
            END IF
C

          END IF
C        
C         end if pathway type is natural convection

C         if pathway type is not currently defined then
C         IF ( PATHWAY_TYPE(IPTH) .GE. 5 ) THEN
C           these pathways are not currently defined
C         END IF
C         end if pathway type is not currently defined

        END DO
C       end do-loop for each pathway, IPTH

C       total transport group for all pathways
        PTHGRP_TOTAL = 0.0
        DO JPTH = 1, NUMBER_OF_PATHWAYS
          PTHGRP_TOTAL = PTHGRP_TOTAL + PTHGRP(ITG,JPTH,NSTEP)
        END DO

        IF ( LEVEL_coeffs .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A32)')
     &       'PTHGRP VALUES AT END OF TG-LOOP:'
          DO IPTH = 1, NUMBER_OF_PATHWAYS
            IF ( ITG .EQ. MAXTGRP ) THEN
              WRITE(out_unit,'(1X,A8,I1,A1,I2,A1,I2,A6,e15.7,A3)')
     &        ' PTHGRP(', ITG, ',', IPTH, ',', NSTEP, ')  = ',
     &          PTHGRP(ITG,IPTH,NSTEP), ' kg'
            ELSE
              WRITE(out_unit,'(1X,A8,I1,A1,I2,A1,I2,A6,e15.7,A5)')
     &        ' PTHGRP(', ITG, ',', IPTH, ',', NSTEP, ')   = ',
     &          PTHGRP(ITG,IPTH,NSTEP), ' atom'
            END IF
          END DO
          IF ( ITG .EQ. MAXTGRP ) THEN
            WRITE(out_unit,'(1X,A21,e15.7,A3)')
     &      ' PTHGRP_TOTAL      = ', PTHGRP_TOTAL, ' kg'
          ELSE
            WRITE(out_unit,'(1X,A21,e15.7,A5)')
     &      ' PTHGRP_TOTAL      = ', PTHGRP_TOTAL, ' atom'
          END IF
        END IF

      RETURN

C     end of subroutine depositon
      END
