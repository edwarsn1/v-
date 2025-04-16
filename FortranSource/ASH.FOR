      SUBROUTINE SOLVER(A,B,C,D,E,F,NDIM,NC,NSV,TIMES,NPD,
     1                  NEPS,MMAX,IPRT)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION TIMES(*),A(NDIM,*),B(NDIM,*),C(NDIM,*),D(NDIM,*),
     1          E(NDIM,*),F(NDIM,*)
C-
C- purpose: give the solution to xdot = Ax + S
C-          where A and S are time invariant matrices
C-          and the initial condition X0 is supplied
C-
C- variables:
C-
C- A, SV          input system matrix and source respectively
C- B,C,D,E,F      on input: work matrices
C-                on output: E = I + C D(C)   F = t D(C)
C-                such that x = E*x(0) + F*SV   (see POUT)
C-
C- NC             size of the system A (NCxNC) matrix
C- NSV            flag for SV (=0 if all SV=0 this saves time)
C-                otherwise NSV = 1 for the general case
C- NPD            this is an important integer variable:
C-                = number of solution at powers of two desired
C-                for example: if only the answer at time = t
C-                is wanted then NPD = 2. one is added because
C-                the initial condition is always included in the result
C-
C- POUT           the answers are stored in this matrix. Note that the
C-                second dimension is NPD. POUT(i,1) = P the initial cond.
C-                The rest of the entries of POUT(i,2..NPD) contain the
C-                answers to xdot = Ax + SV  x(0) = P. The last entry
C-                POUT(i,NPD) is the result at time = t.
C-                POUT is calculated as E*x(0) + F*SV
C-                i = 1..NC
C-
C- TIMES          this variable contains the time information.
C-                on input: t = times(NPD).
C-                on output: times(1) = 0.0
C-                times(npd)=t  times(npd-1)=t/2  ... times(2)=t/2^p
C-                note also that the array times has the dimension NPD.
C-                if the p calculated to make norm(H)<1/2 is smaller
C-                than NP2 then NP2 is adjusted accordingly. (NP2 = NPD-1)
C-
C- NEPS           this specifies the epsilon in the series solution of
C-                D(H) where eps = 10^-NEPS.
C-                the bigger NEPS, then the bigger the code will determine
C-                M must be in the series, where M = number of terms.
C-
C- MMAX           this is the maximum allowable value of M that you want
C-                the code to ever determine for calculating the series D(H)
C-
C- IPRT           print flag: 0=no printing, 1=print p,M, 2=print matrices
C-
      TIMES(1) = 0.0D0
      TIME = TIMES(NPD)
      NP2 = NPD-1
C-
C- Determine M dynamically, the maximum is MMAX
C-
      Y = DBLE(NEPS)*DLOG(10.0D0)
      TLOG = DLOG(2.0D0)
      FACT = 2.0D0
      M = 1
      IF (MMAX .EQ. 1) GO TO 2
      IF (MMAX .LE. 0) MMAX = 24
C-
      DO 1 M=1,MMAX
        FACT = FACT*(M+2)
        X = DBLE(M+1)*TLOG + DLOG(FACT)
        IF (X .GT. Y) GO TO 2
 1    CONTINUE
 2    SUM = 1.0D-20
C- Create the sum of the squares
      DO 4 I=1,NC
        DO 3 J=1,NC
          SUM = SUM + A(J,I)*A(J,I)
 3      CONTINUE
C        POUT(I,1) = P(I)
 4    CONTINUE
C- Calculate NP power of 2 scaling
      PP = (0.5D0*DLOG(SUM) + DLOG(TIME))/TLOG
      NP = PP + 1
      IF (NP .LT. 1) NP = 1
      IF (IPRT.GT.0) WRITE (2,100) M,NP,SUM
      TWON = 1.0D0
      DO 5 I=1,NP
        TWON = TWON * 2.0D0
 5    CONTINUE
      T = TIME / TWON
      CALL SCALAR(A,T,C,NDIM,NC)
C      IF (IPRT.GT.2) CALL PRMAT(NDIM,NC,NC,C,'C = AT Matrix (ASH)')
C- Use taylor series in special form
      CALL GENID(D,NDIM,NC)
      DO 7 I=1,M
        FM = 1.0D0/ (2.0D0 + DBLE(M-I))
        CALL SCALAR(D,FM,F,NDIM,NC)
        CALL MULTI(C,F,D,NDIM,NC)
        DO 6 J=1,NC
          D(J,J) = D(J,J) + 1.0D0
 6      CONTINUE
 7    CONTINUE
      CALL MULTI(C,D,E,NDIM,NC)
      DO 8 I=1,NC
        E(I,I) = E(I,I) + 1.0D0
 8    CONTINUE
C-
C- Rescale using recursion relation and keep NP2 powers of 2 solutions
C-
      CALL GENID(C,NDIM,NC)
      SP = 1.0D0
      IP = 1
      DO 10 I=1,NP
        NN = NP-I
        SP = SP/2.0D0
        T = T*2.0D0
C- Create the I + A*D(A) Matrix
        CALL AEQUAL(E,F,NDIM,NC)
        CALL MULTI(E,F,B,NDIM,NC)
        CALL AEQUAL(B,E,NDIM,NC)
        IF (NSV .EQ. 0) GO TO 12
C- Skip over source if NSV = 0
        DO 11 ID=1,NC
          F(ID,ID) = F(ID,ID) + 1.0D0
 11     CONTINUE
        CALL MULTI(C,F,B,NDIM,NC)
        CALL AEQUAL(B,C,NDIM,NC)
 12     CONTINUE
C- Skip over rest if NP2 is not within range
        IF (NN .GE. NP2) GO TO 10
        IF (NSV .EQ. 0) GO TO 13
C- Compute the D(C) matrix
        CALL SCALAR(D,SP,F,NDIM,NC)
        CALL MULTI(F,C,B,NDIM,NC)
        CALL SCALAR(B,T,F,NDIM,NC)
 13     CONTINUE
        IP = IP + 1
        TIMES(IP) = T
C- Compute the POUT solution at time=t
C- POUT = E*P + F*SV
C- Call MVMUL2 from Radcalc
C        CALL MVMUL2(E,F,P,SV,POUT,IP,NDIM,NC,NPD)
 10   CONTINUE
      IF (IPRT.GT.2) THEN
C        CALL PRMAT(NDIM,NC,NC,E,'E matrix (ASH)')
C        IF (NSV.NE.0) CALL PRMAT(NDIM,NC,NC,F,'F matrix (ASH)')
      END IF
C- End of ash solver routine
      RETURN
 100  FORMAT(//,' M   = ',I4,5X,'(# terms in sum)',
     1        /,' NP  = ',I4,5X,'(# times scaled by 2)',
     2        /,' SUM = ',1PD16.6,5X,'(Sum of squares of A)',//)
      END
      SUBROUTINE SCALAR(A,S,B,NDIM,NC)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION A(NDIM,*),B(NDIM,*)
C- Multiplies B = A * S (S is a scalar)
      DO 20 J=1,NC
        DO 10 JJ=1,NC
          B(JJ,J) = A(JJ,J) * S
 10     CONTINUE
 20   CONTINUE
      RETURN
      END
      SUBROUTINE AEQUAL(A,B,NDIM,NC)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION A(NDIM,*),B(NDIM,*)
C- Equates B to A
      DO 20 J=1,NC
        DO 10 JJ=1,NC
          B(JJ,J) = A(JJ,J)
 10     CONTINUE
 20   CONTINUE
      RETURN
      END
      SUBROUTINE GENID(A,NDIM,NC)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION A(NDIM,*)
C- Creates the identity matrix in A
      DO 20 J=1,NC
        DO 10 JJ=1,NC
          A(JJ,J) = 0.0D0
 10     CONTINUE
        A(J,J) = 1.0D0
 20   CONTINUE
      RETURN
      END
      SUBROUTINE MULTI(A,B,C,NDIM,NC)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION A(NDIM,*),B(NDIM,*),C(NDIM,*)
C-
C- Multiplies two square matrices C = A*B
C- Modified on 7/26/85 to not page fault to speed things up some
C-
      DO 30 K=1,NC
        DO 20 I=1,NC
          C(I,K) = 0.0D0
          DO 10 J=1,NC
            C(I,K) = C(I,K) + A(I,J)*B(J,K)
 10       CONTINUE
 20     CONTINUE
 30   CONTINUE
      RETURN
      END
      SUBROUTINE MVMUL2(AM,BM,AV,BV,C,IT,NDIM,NC,NPD)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION AM(NDIM,*),BM(NDIM,*),AV(*),BV(*),C(NDIM,*)
C-
C- Multiples P(it) = AM*AV + BM*BV 
C- and stores result in IT th column of C matrix
C- Modified on 7/26/85 to not page fault
C-
      DO 5 I=1,NC
        C(I,IT) = 0.0D0
 5    CONTINUE
      DO 30 K=1,NC
        IF (AV(K) .NE. 0.0D0) THEN
          DO 10 J=1,NC
            C(J,IT) = C(J,IT) + AM(J,K)*AV(K)
 10       CONTINUE
        END IF
        IF (BV(K) .NE. 0.0D0) THEN
          DO 20 J=1,NC
            C(J,IT) = C(J,IT) + BM(J,K)*BV(K)
 20       CONTINUE
        END IF
 30   CONTINUE
      RETURN
      END
