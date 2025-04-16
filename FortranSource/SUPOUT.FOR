C     VERSION OF SUPOUT.FOR CREATED FOR TESTING PURPOSES

C     ##################################################################
      SUBROUTINE SUPOUT( ICOMP, JPATH, SIMTIM, SUPFL )
C     ##################################################################

C     This subroutine calculates the normalized flow out of a given
C     compartment by way of a suppression pool. These value obtained are
C     returned in the array SUPFL(4).

C     Inputs:
C     (1) compartment number
C     (2) pathway number
C     (3) current simulation time

C     Output:
C     SUPFL(), normalized flow out of compartment thru suppression pool
C     (1) nobles, (2) elemental iodine, (3) organic iodine, 
C     (4) iodine aerosol  (5) all aerosol

C     Reference is "Model Description", LeAnn Adams Miller, 2/25/94

C     ------------------------------------------------------------------
C     CREATED BY LAM ON 2/28/94
C     TESTED BY DKM ON 15 JUNE 1995, 25 JULY 1995
C     ------------------------------------------------------------------

C     include statement
      INCLUDE 'full.com'

      INTEGER ICOMP, II
      INTEGER JPATH

      double precision SUPFL(MAXTGRP)
      double precision SIMTIM, FLOW
      double precision LUPP2
      double precision GMTOMS

CDKM  conversion factor, hr to sec
CDKM  HRTOSC = 3600.0

C     conversion factor, gal/min to m3/sec
      GMTOMS = 6.3090E-05

C     write banner on entry into subroutine      
      IF ( LEVEL_SUPOUT .GE. 1 ) THEN
        write(out_unit,'(1X,A18)') 'SUBROUTINE SUPOUT!'
      END IF
C     flow rate out of compartment through suppression pool
C     assumed to be zero
      FLOW = 0.0

C     ########## transport rate for noble gases #########

CTJH  Note: It is being assumed that there is no 
C     retention of noble gases by the suppression pool
C     and that the noble gas flow is input when any of the others is avaialable.

      IF (SP_NOBELGAS_COUNT(JPATH) .GE. 1) THEN
C
C       flow rate, m3/sec
        FLOW = LUPP2( JPATH, SIMTIM, SP_AEROSOL_TIME,
     *    SP_NOBELGAS_FLOW_RATE, SP_NOBELGAS_COUNT(JPATH) )

      END IF
C     transport rate of noble gases, 1/sec
      SUPFL(1) = FLOW * GMTOMS / COMPARTMENT_VOLUME(ICOMP)

C     ############ elem-iodine transport group ############
c
C     flow rate out of compartment through suppression pool
C     assumed to be zero
c
      FLOW = 0.0
c  TJH  MODIFY THE CALL TO FIRST CHECK ON EXISTENCE
      IF (SP_ELEMENTAL_MODEL(JPATH) .EQ. 1) THEN
         FLOW = LUPP2( JPATH, SIMTIM, SP_ELEMENTAL_TIME, 
     *     SP_ELEMENTAL_FLOW_RATE, SP_ELEMENTAL_COUNT(JPATH) )
	END IF

C     normalized flow rate out of compartment
      SUPFL(2) = FLOW * GMTOMS / COMPARTMENT_VOLUME(ICOMP)
        
C     ############ orga-iodine transport group ############

C     flow rate out of compartment through suppression pool
c
      FLOW = 0.0
c  TJH  MODIFY THE CALL TO FIRST CHECK ON EXISTENCE
      IF (SP_ORGANIC_MODEL(JPATH) .EQ. 1) THEN
         FLOW = LUPP2( JPATH, SIMTIM, SP_ORGANIC_TIME, 
     *     SP_ORGANIC_FLOW_RATE, SP_ORGANIC_COUNT(JPATH) )
	END IF
C     normalized flow rate out of compartment
      SUPFL(3) = FLOW * GMTOMS / COMPARTMENT_VOLUME(ICOMP)
        
C     ############## aerosol transport group ##############

C     flow rate out of compartment through suppression pool
c
      FLOW = 0.0
c  TJH  MODIFY THE CALL TO FIRST CHECK ON EXISTENCE
      IF (SP_AEROSOL_MODEL(JPATH) .EQ. 1) THEN
         FLOW = LUPP2( JPATH, SIMTIM, SP_AEROSOL_TIME, 
     *     SP_AEROSOL_FLOW_RATE, SP_AEROSOL_COUNT(JPATH) )
	END IF

C     normalized flow rate out of compartment
      SUPFL(4) = FLOW * GMTOMS / COMPARTMENT_VOLUME(ICOMP)

C      
      SUPFL(5) = SUPFL(4)
	        
      IF ( LEVEL_SUPOUT .GE. 2 ) THEN
        write(out_unit,'(1X,A8,E11.4,5E13.4,A8)') 
     *   'SUPFL = ', (SUPFL(II),II=1,MAXTGRP), '   1/sec'
      END IF

C     return to caller
      RETURN

C     end of subroutine SUPOUT
      END

