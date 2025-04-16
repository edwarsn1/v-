C     ############################################################

      SUBROUTINE RECIRC( ICMP, SIMTIM, REFILT )

C     ############################################################

C     This subroutine calculates the removal coefficient for the
C     recirculating filters in a compartment. The subroutine loops
C     over all transport groups. The coefficient:
C                  Eg;i,i * Ki,i(f) / (100 * Vi)
C     is calculated for each transport group for this particular
C     time step and is stored in the array REFILT(5). 
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol
C
C     The efficiency of the filter for that particular group, g, is
C     denoted by Eg;i,i and the normalized flow rate through the
C     filter is denoted by Ki,i(f). The user must specify both of
C     these parameters.

C     Inputs:
C     (1) compartment number
C     (2) current simulation time

C     Output: removal coefficient for recirculating filters
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol

C     Assumptions:
C     (1) There is no re-release of atoms trapped by filter.
C     (2) Recirculation filter has no effect on nobles.

C     ----------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     TESTED BY DKM ON 14 JUNE 1995
C     ----------------------------------------------------------------

C     include statments
      INCLUDE 'full.com'

      INTEGER ICMP, II

      double precision REFILT(MAXTGRP)
      double precision SIMTIM
      double precision FEFF, FFLOW
      double precision LUPC2

C     print out banner on entering subroutine
      IF ( LEVEL_RECIRC .GE. 1 ) THEN
        WRITE(OUT_UNIT,'(1X,A18)') 'SUBROUTINE RECIRC!'
      END IF

C     filter flow rate, user-specified, 1/sec
C     <<<<< CODE FOR TABULAR INPUT OF FILTER FLOW RATE >>>>>
      FFLOW = LUPC2( ICMP, SIMTIM, C_FILTER_TIME, C_FILTER_FLOW_RATE,
     *  C_FILTER_EFF_COUNT(ICMP) ) 

CDKM  filter flow rate, normalized, 1/sec
CDKM  <<<<< CODE FOR SINGLE INPUT OF FILTER FLOW RATE >>>>>     
CDKM  FFLOW = C_FILTER_FLOW_RATE(ICMP)

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A8,E16.10)') 'FFLOW = ', FFLOW
      END IF

C     #########################################################
C     ##### effect of recirculation filter on noble gases #####
C     #########################################################

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A12)') 'NOBLE GASES:'
      END IF

C     no effect on noble gases, 1/sec
      REFILT(1) = 0.0

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A12,E16.10)') 'REFILT(1) = ', REFILT(1)
      END IF

C     ##########################################################
C     ### effect of recirculation filter on elemental iodine ###
C     ##########################################################

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A17)') 'ELEMENTAL IODINE:'
      END IF

C     filter efficiency, elemental iodine, user-specified, percent
      FEFF = LUPC2( ICMP, SIMTIM, C_FILTER_TIME, C_FILTER_ELEMENTAL_EFF,
     *  C_FILTER_EFF_COUNT(ICMP) )

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A8,E16.10)') 'FEFF  = ', FEFF
      END IF

CDKM  <<<<< CODE FOR FLOW RATE IN M3/SEC >>>>>
CDKM  removal coefficient, elemental iodine, 1/sec
      REFILT(2) = FEFF * FFLOW / 100.0 / COMPARTMENT_VOLUME(ICMP)

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A12,E16.10)') 'REFILT(2) = ', REFILT(2)
      END IF

C     ########################################################
C     ### effect of recirculation filter on organic iodine ###
C     ########################################################

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A15)') 'ORGANIC IODINE:'
      END IF

C     filter efficiency, organic iodine, user-specified, 1/sec
      FEFF = LUPC2( ICMP, SIMTIM, C_FILTER_TIME, C_FILTER_ORGANIC_EFF,
     *  C_FILTER_EFF_COUNT(ICMP) )

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A8,E16.10)') 'FEFF  = ', FEFF
      END IF

CDKM  <<<<< CODE FOR FLOW RATE IN M3/SEC >>>>>
CDKM  removal coefficient, organic iodine, 1/sec
      REFILT(3) = FEFF * FFLOW / 100.0 / COMPARTMENT_VOLUME(ICMP)

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A12,E16.10)') 'REFILT(3) = ', REFILT(3)
      END IF

C     ##################################################
C     ### effect of recirculation filter on aerosols ###
C     ##################################################
      
      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A9)') 'AEROSOLS:'
      END IF

C     filter efficiency, aerosols, user-specified, percent
      FEFF = LUPC2( ICMP, SIMTIM, C_FILTER_TIME, C_FILTER_AEROSOL_EFF,
     *  C_FILTER_EFF_COUNT(ICMP) )

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A8,E16.10)') 'FEFF  = ', FEFF
      END IF

CDKM  <<<<< CODE FOR FLOW RATE IN M3/SEC >>>>>
CDKM  removal coefficient, aerosols, 1/sec
      REFILT(4) = FEFF * FFLOW / 100.0 / COMPARTMENT_VOLUME(ICMP)

      IF ( LEVEL_RECIRC .GE. 2 ) THEN
        WRITE(OUT_UNIT,'(1X,A12,E16.10)') 'REFILT(4) = ', REFILT(4)
      END IF

      REFILT(5) = REFILT(4)

      IF ( LEVEL_RECIRC .GE. 1 ) THEN
        WRITE(OUT_UNIT,'(1X,A9,5E16.10)') 
     *   'REFILT = ', (REFILT(II),II=1,MAXTGRP)
      END IF

C     return to caller
      RETURN

C     end of subroutine RECIRC
      END

