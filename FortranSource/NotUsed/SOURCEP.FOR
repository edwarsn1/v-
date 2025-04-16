C     ------------------------------------------------------------------
C
C     Subroutine:  sourcep
C
C     ------------------------------------------------------------------
C
C     Author(s):   David Monroe
C                  (505) 844-9510
C
C                  Steven Humphreys
C                  (505) 844-7223
C
C                  Sandia National Laboratories
C                  Accident Analysis / Consequence Assessment Department
C                  Albuqueurue, NM 87185
C
C     Description: This subroutine controls calculation of source
C                  material into each compartment due to flow out of
C                  pipes into the compartment.
C
C     Usage:       call sourcep(grrate)
C
C     Inputs:      None.
C
C     Outputs:     grrate - total release rate for all transport groups,
C                  including contribution from piping pathway.
C
C     Variables:   icmpto, ipth, jtg - index counters
C
C     Calls:       None.
C
C     Assumptions:
C
C     Version:     2.3
C
C     Date:        February 23, 1996
C
C     Revision
C     History:     2.3 - February 23, 1996 - Removed unused variables
C                  from the argument list.
C
C                  2.2 - January 28, 1996 - Removed all of the commented
C                  out and dead code and made some format changes.
C                  It now appears that for non-MSIV pipes, this
C                  subroutine doesn't do anything.
C
C                  2.1 - October 19, 1995 - Coded added to calculate
C                  inventory in the paths. Code not completed or tested.
C
C                  2.0 - September 6, 1995 - Commented out MSIV code.
C                  Added code for the Brockman/Bixler pipe models.
C
C                  1.0 - January 11, 1995 - Initial version.
C
C     ------------------------------------------------------------------

      subroutine sourcep(grrate)
         include 'full.com'
         double precision grrate(MAXCOMP, MAXTGRP)

         integer jtg
         integer icmpto, ipth

C        Include file added by TJH on 19 October 1995.

C        Lines previously from cptran.inc. The other files that
C        previously included this file, also now contain these lines.

C        transport groups removed from compartment atmospheres
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

C        Write banner on entry into subroutine.

         if(level_source .ge. 1) then
            write(out_unit, '(1x, a)') 'Subroutine sourcep!'
         end if

C        Check all pathways. If piping pathway exists, treat outflow of
C        pipe as a source.

         do ipth = 1, number_of_pathways, 1

            if(pathway_type(ipth) .eq. 1) then

               if(level_source .ge. 2) then
                  write(out_unit, '(1x, a, i2, a)')
     &               'Pathway number ', ipth, ' is a pipe'
               end if

C              Set index for "to" compartment.

               icmpto = pathway_to(ipth)

               if(level_source .ge. 3) then
                  write(out_unit, '(1x, a, i2, i2, 5e13.4)')
     &               'ipth, icmpto, grrate after ', ipth, icmpto,
     &               (grrate(icmpto, jtg), jtg = 1, maxtgrp, 1)
               end if

            end if

         end do

         return

      end

C     ------------------------------------------------------------------
