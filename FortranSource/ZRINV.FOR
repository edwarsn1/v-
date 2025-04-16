C     ------------------------------------------------------------------
C
C     Subroutine:  zrinv
C
C     ------------------------------------------------------------------
C
C     Author(s):   Ken Washington
C                  (505) 844-0231
C                  Information Systems Applications Department
C
C                  Steven Humphreys
C                  (505) 844-7223
C                  Accident Analysis / Consequence Assessment Department
C
C                  Sandia National Laboratories
C                  Albuquerque, NM 87185
C
C     Description: Routine to zero the inventories in a particular type
C                  of compartment. This routine was written for general
C                  use, but currently is only used for environment
C                  compartments (compartment type = 3). The current use
C                  is to zero env inventories for plume simulations.
C
C     Usage:       call zrinv(nstep, xn, xngrp)
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
C     Version:     1.1
C
C     Date:        January 30, 1996
C
C     Revision
C     History:     1.1 - January 30, 1996 - made formatting changes and
C                  modified main loop below so that it looped through
C                  compartments instead of locations. Previously
C                  compartments would be cleared more than once if they
C                  had more than one location. This probably didn't
C                  cause any problems but it was a tad inefficient and
C                  made me nervous.
C
C                  1.0 - January 16, 1996 - Initial Version.
C
C
C     ------------------------------------------------------------------

      subroutine zrinv(nstep, xn, xngrp)
         include 'full.com'
         integer nstep
         double precision xn(MAXNUC, MAXCOMP, MAXCLOC, MAXSTEP)
         double precision xngrp(MAXTGRP, MAXCOMP, MAXCLOC, MAXSTEP)

         integer i, j

         do i = 1, number_of_compartments, 1

C           Check to see if this is an environment compartment. If it is
C           then transfer all of the nuclides and transport groups to
C           deposition surfaces. Note: we are not doing any type of
C           ground deposition - this is for bookkeeping puposes only.

C           February 7, 1996 - added code to put present environment
C           inventory into sub-compartment 2.

            if(compartment_type(i) .eq. 2) then

C              Move the environment atmosphere nuclide inventory to the
C              deposition surfaces.

               do j = 1, number_of_nuclides, 1
                  xn(j, i, 4, nstep) =
     &               xn(j, i, 4, nstep) + xn(j, i, 1, nstep)
                  xn(j, i, 2, nstep) = xn(j, i, 1, nstep)
                  xn(j, i, 1, nstep) = 0.0
               end do

C              Move the environment atmosphere transport group inventory
C              to the deposition surfaces.

               do j = 1, MAXTGRP, 1
                  xngrp(j, i, 4, nstep) =
     &               xngrp(j, i, 4, nstep) + xngrp(j, i, 1, nstep)
                  xngrp(j, i, 2, nstep) = xngrp(j, i, 1, nstep)
                  xngrp(j, i, 1, nstep) = 0.0
               end do

            end if

         end do

         return

      end

C     ------------------------------------------------------------------
