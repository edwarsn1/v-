c  kew
c  shift all the results from the 2nd to the 1st time element
c  ...
C     SLH - January 29, 1996 - Changed LEVEL_RADTRAD to LEVEL_RADCALC
C     SLH - March 11, 1996 - Changed LEVEL_RADCALC to LEVEL_TSHIFT

      subroutine tshift(deltat,xn,xngrp,path,pthgrp,
     &  dose_wbod, dose_skin, dose_thyr, dose_tede)

      INCLUDE 'full.com'
      double precision XN(MAXNUC,MAXCOMP,MAXCLOC,MAXSTEP)
      double precision PATH(MAXNUC,MAXPATH,MAXSTEP+1)
      double precision XNGRP(MAXTGRP,MAXCOMP,MAXCLOC,MAXSTEP)
      double precision PTHGRP(MAXTGRP,MAXPATH,MAXSTEP+1)
      double precision DELTAT(MAXSTEP)
      DOUBLE PRECISION DOSE_WBOD(MAXDOSE,MAXSTEP)
      DOUBLE PRECISION DOSE_skin(MAXDOSE,MAXSTEP)
      DOUBLE PRECISION DOSE_THYR(MAXDOSE,MAXSTEP)
      DOUBLE PRECISION DOSE_TEDE(MAXDOSE,MAXSTEP)
      integer ii,jj,kk
c
      deltat(1) = deltat(2)
      
      do ii = 1, MAXDOSE
        dose_wbod(ii, 1) = dose_wbod(ii, 2)
        dose_skin(ii, 1) = dose_skin(ii, 2)
        dose_thyr(ii, 1) = dose_thyr(ii, 2)
        dose_tede(ii, 1) = dose_tede(ii, 2)
      end do

      DO kk = 1, MAXCLOC
      DO jj = 1, NUMBER_OF_COMPARTMENTS
        DO ii = 1, NUMBER_OF_NUCLIDES
           XN(II,JJ,KK,1) = XN(II,JJ,KK,2)
        END DO
        DO II = 1, MAXTGRP
          XNGRP(II,JJ,KK,1) = XNGRP(II,JJ,KK,2)
        END DO
        if(LEVEL_TSHIFT .ge. 2) then
          WRITE(out_unit,
     *      '(1X,A16,i4,i4,A5,5(1p,e12.4,1x))')
     *      ' tshift: xngrp(',jj,kk,')  =',
     *        xngrp(1,jj,kk,1), xngrp(2,jj,kk,1),
     *        xngrp(3,jj,kk,1), xngrp(4,jj,kk,1),xngrp(5,jj,kk,1)
        end if
      END DO
      END DO

      DO JJ = 1, MAXPATH, 1
        DO II = 1, MAXTGRP, 1
          PTHGRP(II,JJ,1) = PTHGRP(II,JJ,2)
        END DO
        DO ii = 1, NUMBER_OF_NUCLIDES
          PATH(II,JJ,1) = PATH(II,JJ,2)
        END DO
      END DO

      DO II = 1, maxnuc, 1
        op_nuc_inv(II,1)= op_nuc_inv(II,2)
      END DO
      DO II = 1, maxtgrp, 1
        op_grp_inv(II,1)= op_grp_inv(II,2)
      END DO

      return
      end
