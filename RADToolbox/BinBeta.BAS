'  Code to bin the beta spectra for Monte Carlo sampling
'  K.F. Eckerman, ORNL  06/05/12
'----------------------------------------------------------------------------------------
#COMPILE EXE
 %true = -1
 %false = NOT %true
 TYPE IndexType                           ' structure of ICRP-07.NDX
   Nuke AS STRING * 7                     ' nuclide name; e.g., Cl-38, Tc-99m
   t AS STRING * 8                        ' physical half-life of nuclide
   tu AS STRING * 2                       ' units of T1/2
   Mode AS STRING * 8                     ' decay mode
   mdec AS STRING * 7                     ' location of nuclide in ICRP-07.RAD
   mbet AS STRING * 7                     ' locatation of nuclide in ICRP-07.BET
   mack AS STRING * 7                     ' location of nuclide in ICRP-07.ACK
   mneu AS STRING * 6                     ' location of nuclide in ICRP-07.NSF
   dmy1 AS STRING * 1                     ' a blank
   dau1 AS STRING * 8                     ' daughter 1, e.g., Po-210
   idau1 AS STRING * 5                    ' location of daughter 1 in ICRP-07.NDX
   bf1 AS STRING * 11                     ' branching fraction to daughter 1
   dmy2 AS STRING * 1                     ' a blank
   dau2 AS STRING * 8                     ' daughter 2
   idau2 AS STRING * 5                    ' location of daughter 2 in ICRP-07.NDX
   bf2 AS STRING * 11                     ' branching fraction to daughter 2
   dmy3 AS STRING * 1                     ' blank
   dau3 AS STRING * 8                     ' daughter 3
   idau3 AS STRING * 5                    ' location of daughter 3 in ICRP-07.NDX
   bf3 AS STRING * 11                     ' branching fraction to daughter 3
   dmy4 AS STRING * 1                     ' blank
   dau4 AS STRING * 8                     ' daughter 3
   idau4 AS STRING * 5                    ' location of daughter 3 in ICRP-07.NDX
   bf4 AS STRING * 11                     ' branching fraction to daughter 3
   ea AS STRING * 7                       ' alpha transition energy (alpha + recoil) MeV/nt
   eb AS STRING * 8                       ' beta + IC + Auger/CK electron MeV/nt
   eg AS STRING * 8                       ' x-ray + gamma + annihilation energy MeV/nt
   dmy5 AS STRING * 1                     ' a blank space
   np10 AS STRING * 3                     ' # photon of energy < 10 keV
   npg10 AS STRING * 4                    ' # photon of energy >= 10 keV
   nbet AS STRING * 4                     ' # beta particles (# transitions)
   nel AS STRING * 5                      ' # electrons of discrete energy
   nalpha AS STRING * 4                   ' # alpha particles
   dmy6 AS STRING * 1                     ' a blank space
   Mass AS STRING * 10                    ' atomic mass
   Kair AS STRING * 10                    ' ICRU air kerma-rate constant
   Kpts AS STRING * 9                     ' point source air kerma rate
   CrLf AS STRING * 2                     '
 END TYPE
'
 TYPE HeadType                            ' structure of first recond in
   i1 AS STRING * 4                       ' ICRP-07.NDX. I1 is first data
   i2 AS STRING * 4                       ' record, I2 is last data record
   dmy AS STRING * 218                    ' in the file.
   CrLf AS STRING * 2
 END TYPE
'
 TYPE BetaType                            ' structure ICRP-07.BET records
    Eelc AS STRING * 8                    ' energy E (MeV)
    Freq AS STRING * 9                    ' frequency #/MeV per nt, P(E)
    CrLf AS STRING * 2
 END TYPE
'
 TYPE BetaHead                            ' structure ICRP-07.BET head record
    Nuke AS STRING * 7                    ' nuclide name, Sr-90
    nbet AS STRING * 10                   ' # energy grid points
    CrLf AS STRING * 2
 END TYPE
'
 %indx = 1  : %ibet = 2  : %iwrk = 3
 $Title = " BINBETA Code: bin beta spectra:    KF Eckerman ORNL   01/11/2013"
'
 %NULL = 0                                                 ' From Win32API
 %SW_MAXIMIZE = 3                                          '
 %MAX_PATH = 260                                           '
 %SW_MAXIMIZE = 3                                          '
'
 %xblue = 1 : %xWhite = 15
 %nmax = 160                      ' max dimension of beta spectrum
'
 $Table = "   E1       E2     P(E1,E2)   P(0,E2)"
 $format = "##.##### ##.##### ##.##### ##.####^^^^ ##.####^^^^"
'
 DECLARE FUNCTION ShellExecute LIB "SHELL32.DLL" ALIAS "ShellExecuteA" (BYVAL hwnd AS DWORD, _
                  lpOperation AS ASCIIZ, lpFile AS ASCIIZ, lpParameters AS ASCIIZ, _
                  lpDirectory AS ASCIIZ, BYVAL nShowCmd AS LONG) AS DWORD
 DEFLNG i-n
 DEFEXT a-h, o-z
'----------------------------------------------------------------------------------------
 FUNCTION PBMAIN () AS LONG
'----------------------------------------------------------------------------------------
    CONSOLE NAME $Title
    CONSOLE GET SIZE TO w&, h&
    DESKTOP GET CLIENT TO ncWidth&, ncHeight&
    DESKTOP GET LOC TO x&, y&
    CONSOLE SET LOC x& + (ncWidth& -w&) \ 2, y& + (ncHeight& -h&) \ 2
    CONSOLE GET SCREEN TO ncRows&, ncColumns&
    DIM x(%nmax), f(%nmax), D(%nmax), g(%nmax), DDW(%nmax)
    DIM Ex(%nmax), Yx(%nmax), Px(%nmax), DDD(%nmax), fe(%nmax), Eyx(%nmax)
    COLOR %xWhite, %xblue
    CLS
    LOCAL zText AS ASCIIZ * %MAX_PATH
    DIM IndHed AS GLOBAL HeadType
    DIM IndDat AS GLOBAL IndexType
    DIM BetHed AS GLOBAL BetaHead
    DIM BetSpec AS GLOBAL BetaType
    MOUSE 3, DOUBLE, DOWN
    MOUSE ON
    OPEN "Data\ICRP-07.NDX" FOR RANDOM AS %indx LEN = LEN(IndDat)
    OPEN "Data\ICRP-07.BET" FOR RANDOM AS %ibet LEN = LEN(BetSpec)
'
    CHDIR "Output"
    Nukex$ = COMMAND$

    CALL checkit(Nukex$, ip)
    IF ip = 0 THEN
        CLOSE
        EXIT FUNCTION
    END IF
    DO
        GET %indx, ip, IndDat
        FileOut$ = TRIM$(Nukex$) + "OUT.TXT"
        OPEN FileOut$ FOR OUTPUT AS #%iwrk
        LOCATE 2, 2
        Ls$ = RTRIM$(Nukex$) + " Decay Mode: " + RTRIM$(IndDat.mode) + "  T1/2 = " + _
              TRIM$(IndDat.t) + " " + IndDat.tu
        PRINT Ls$
        PRINT #%iwrk, Ls$
        PRINT
        PRINT #%iwrk, ""
        PRINT #%iwrk, " Below is the beta spectrum normalizied and binned for sampling in "
        PRINT #%iwrk, " Monte Carlo calculations. Distributions for bins uniform in energy "
        PRINT #%iwrk, " and uniform in probability are tabulated. P(E1, E2) is probability "
        PRINT #%iwrk, " of a beta with energy between E1 and E2 and P(0, E2) is the probability "
        PRINT #%iwrk, " of a particle of energy < E2.
        PRINT #%iwrk, ""
        mbeta = VAL(IndDat.mbet)
        GET %ibet, mbeta, BetHed
        n = VAL(BetHed.nbet)
        REDIM x(1 TO n) : REDIM f(1 TO n) : REDIM g(1 TO n)
        FOR i = 1 TO n
            GET %ibet, , BetSpec
            x(i) = VAL(BetSpec.Eelc)
            f(i) = VAL(BetSpec.Freq)
            g(i) = x(i) * f(i)
        NEXT i
        PRINT USING$("  Spectral points  =####", n)
        CALL pchim (n, x(), f(), D(), ierr)
        yield = pchid(n, x(), f(), D(), %false, 1, n, ierr)
        PRINT USING$("  Beta yield (/nt) =##.###^^^^", yield)
        PRINT #%iwrk, USING$("  Beta yield (/nt) =##.###^^^^", yield)
        CALL pchim (n, x(), g(), DDW(), ierr)
        Etot = pchid(n, x(), g(), DDW(), %false, 1, n, ierr)
        PRINT USING$("  Energy (MeV/nt)  =##.###^^^^", Etot)
        PRINT #%iwrk, USING$("  Energy (MeV/nt)  =##.###^^^^", Etot)
        PRINT USING$("  Mean energy (MeV)=##.###^^^^", Etot/yield)
        PRINT #%iwrk, USING$("  Mean energy (MeV)=##.###^^^^", Etot/yield)
        PRINT USING$("  End point (MeV)  =##.###^^^^", x(n))
        PRINT #%iwrk, USING$("  End point (MeV)  =##.###^^^^", x(n))
        PRINT
        PRINT #%iwrk, ""
'
'       normalize the spectrum
'
        FOR i = 1 TO n
            f(i) = f(i)/Yield
        NEXT i
        PRINT " Spectrum normalized to emission of a single beta particle."
        PRINT #%iwrk, " Spectrum normalized to emission of a single beta particle."
        PRINT
        PRINT #%iwrk, ""

        CALL pchim (n, x(), f(), D(), ierr)
'
        irow =  CURSORY
        PRINT " Enter number of energy bins (default 10) = 10"
        LOCATE irow, 45
        LINE INPUT nnn$
        nn = VAL(nnn$)
        IF nn = 0 THEN
            nn = 10
            LOCATE irow, 44
            PRINT STR$(nn)
        END IF
        REDIM Ex(nn), Yx(n), Px(nn), DDD(n), fe(nn)
        DE = X(n)/CDBL(nn)
        E1 = 0.0##
        PRINT #%iwrk, STR$(nn) + " Bins Uniform in Energy"
        PRINT #%iwrk, $Table
        FOR i = 1 TO nn
            E2 = E1 + DE
            Xy = pchia(n, x(), f(), D(), %false, E1, E2, ierr)
            yy = pchia(n, x(), f(), D(), %false, 0.0##, E2, ierr)
            PRINT #%iwrk, USING$($format, E1, E2, XY, YY)
            E1 = E1 + DE
        NEXT i
        PRINT
        PRINT #%iwrk, ""
'       Now do equal probaility in the bin
        n3 = 1
        yx(n3) = 0.0##                       ' Cumulative P(E)
        Eyx(n3) = 0.0##                      ' E(N)
        iok = %false
        FOR i = 2 TO n
            yx0 = pchid(n, x(), f(), D(), %false, 1, i, ierr)
            IF yx0 > 0.0## THEN iok = %true
            IF ISTRUE iok THEN              ' avoid multiple zero P at start
                INCR n3
                yx(n3) = yx0
                Eyx(n3) = x(i)
            END IF
        NEXT i
        Dp = 1.0##/CDBL(nn)                 ' setup cumulative P for bins
        FOR i = 1 TO nn                     ' and then find bin boundaries
            Px(i) = CDBL(i) * Dp            ' corresponding to the Ps.
        NEXT i
        CALL pchim (n3, Yx(),Eyx(), DDD(), ierr)
        CALL pchfe (n3, Yx(), Eyx(), DDD(), %false, nn, Px(), fe(), ierr)
        PRINT #%iwrk, STR$(nn) + " Bins Uniform in Probability"
        PRINT #%iwrk, $Table
        FOR i = 1 TO nn
            IF i = 1 THEN
                E1 = 0.0##
            ELSE
                E1 = Fe(i-1)
            END IF
            IF i = nn THEN
                E2 = x(n)
            ELSE
                E2 = Fe(i)
            END IF
            Xy = pchia(n, x(), f(), D(), %false, E1, E2, ierr)
            yy = pchia(n, x(), f(), D(), %false, 0.0##, E2, ierr)
            PRINT #%iwrk, USING$($format, E1, E2, XY, YY)
        NEXT i
        PRINT
        PRINT #%iwrk, ""
        PRINT #%iwrk, " The file " + FileOut$ + " is in folder "; CURDIR$; "."
        PRINT " File " + FileOut$ + " is in folder "; CURDIR$; "."
        CLOSE %iwrk
        PRINT
        zText = FileOut$
        ShellExecute BYVAL %Null, "open", zText, BYVAL %Null, BYVAL %Null, %SW_SHOWNORMAL
        PRINT " Press <Esc> to exit or any other key or left click mouse to redo...";
        aa$ = CON.WAITKEY$
        IF aa$ = $ESC THEN
            EXIT DO
        ELSE
            KILL FileOut$
        END IF
        CLS
    LOOP
    CLOSE
 END FUNCTION

'----------------------------------------------------------------------------------------
 SUB checkit(Nukex$, ip)
'----------------------------------------------------------------------------------------
'   Locate Nukex$ in the ICRP07.NDX file and check that it is
'   a beta emitter.
'
    ip = 0
    IF LEN(Nukex$) = 0 THEN
        PRINT " No nuclide identified."
        WAITKEY$
        EXIT SUB
    END IF
    Nukex$ = MCASE$(Nukex$)
    IF LEN(Nukex$) < 7 THEN Nukex$ = Nukex$ + STRING$(7-LEN(Nukex$), " ")
    ip = ibinry(Nukex$)
    IF ip > 0 THEN
        GET %indx, ip, IndDat
        Modex$ = IndDat.mode
        IF INSTR(Modex$, "B-") + INSTR(Modex$, "B+") + INSTR(Modex$, "SF")> 0 THEN
            EXIT SUB
        ELSE
            PRINT " " + RTRIM$(Nukex$) + " is not a beta emitter. " + _
                  "Its decay mode is "; IndDat.mode
        END IF
    ELSE
        PRINT " The nuclide " + RTRIM$(Nukex$) + " is not in the database."
    END IF
    WAITKEY$
 END SUB

'========================================================================================
' PCHIP routines
'
' Translated from fortran by KF Eckerman, ORNL
' Fortran written by Fred N. Fritsch, LLNL
'
' F.N. Fritsch and R.E. Carlson, "Monotone piecewise cubic interpolation,"
'      Siam J. Numer. Anal. 17:238-246, 1980
'
' F.N. Fritsch and J. Butland, "A Method for Constructing Local Monotone
'      Piecewise Cubic Interpolants," UCRL-87559, april 1982.
'
'========================================================================================
'----------------------------------------------------------------------------------------
 SUB chfev(x1, x2, f1, f2, d1, d2, jfirst, ne, xe(), fe(), nxt(), ierr)
'----------------------------------------------------------------------------------------
'  chfev:  cubic hermite function evaluator
'  evaluates the cubic polynomial determined by function values f1, f2 and derivatives
'  d1, d2 on interval (x1, x2) at the points xe(j), j=1 to ne.
'
'   parameters:
'     x1,x2 - (input) endpoints of interval of definition of cubic.
'             (error return if  x1 = x2 .)
'     f1,f2 - (input) values of function at x1 and x2, respectively.
'     d1,d2 - (input) values of derivative at x1 and x2, respectively.
'        ne - (input) number of evaluation points.  (error return if
'             ne < 1 .)
'        xe - (input) real array of points at which the functions are to
'             be evaluated.  if any of the xe are outside the interval
'             [x1, x2], a warning error is returned.
'       fe - (output) real array of values of the cubic function defined
'             by  x1,x2, f1,f2, d1,d2  at the points  xe.
'      nxt - (output) integer array indicating number of extrapolation
'            points:
'            nxt(1) = number of evaluation points to left of interval.
'            nxt(2) = number of evaluation points to right of interval.
'     ierr - (output) error flag.
'            normal return: ierr = 0  (no errors).
'            "recoverable" errors:
'                ierr = -1  if ne < 1 .
'                ierr = -2  if x1 = x2 .
'                (output arrays have not been changed in either case.)
'
    IF ne < 1 THEN
        ierr = -1
        EXIT SUB
    END IF
    h = x2 - x1
    IF h = 0.0## THEN
        ierr = -2
        EXIT SUB
    END IF
    ierr = 0
    nxt(1) = 0
    nxt(2) = 0
    xmi = MIN(0.0##, h)
    xma = MAX(0.0##, h)
    delta = (f2 - f1) / h
    del1 = (d1 - delta) / h
    del2 = (d2 - delta) / h
    c2 = -(del1 + del1 + del2)
    c3 = (del1 + del2) / h
    FOR i = 1 TO ne
        x = xe(i + jfirst - 1) - x1
        fe(i + jfirst - 1) = f1 + x * (d1 + x * (c2 + x * c3))
        IF x < xmi THEN
            nxt(1) = nxt(1) + 1
        ELSEIF x > xma THEN
            nxt(2) = nxt(2) + 1
        END IF
    NEXT i
 END SUB

'----------------------------------------------------------------------------------------
 FUNCTION chfiv (x1, x2, f1, f2, d1, d2, a, b, ierr) AS EXTENDED
'----------------------------------------------------------------------------------------
'  chfiv:  cubic hermite function integral evaluator
'  called by pchia to evaluate the integral of a single cubic (in hermite form) over an
'  arbitrary interval (a, b).
'
'  calling sequence:
'     value = chfiv (x1, x2, f1, f2, d1, d2, a, b, ierr)
'  parameters
'     x1,x2 -- (input) endpoints of interval of definition of cubic.
'           (error return if  x1.eq.x2 .)
'     f1,f2 -- (input) values of function at x1 and x2, respectively.
'     d1,d2 -- (input) values of derivative at x1 and x2, respectively.
'     a,b -- (input) endpoints of interval of integration.
'     ierr -- (output) error flag.
'           normal return:
'              ierr = 0  (no errors).
'           "recoverable" errors:
'              ierr = -1  if x1 .eq. x2.
'                value has not been set in this case.)
'
    FUNCTION = 0.0##
    IF x1 = x2 THEN
        ierr = 0
        EXIT FUNCTION
    END IF
    h = x2 - x1
    ta1 = (a - x1) / h
    ta2 = (x2 - a) / h
    tb1 = (b - x1) / h
    tb2 = (x2 - b) / h
'
    ua1 = ta1^3
    phia1 = ua1 * (2.0## - ta1)
    psia1 = ua1 * (3.0## * ta1 - 4.0##)
    ua2 = ta2^3
    phia2 = ua2 * (2.0## - ta2)
    psia2 = -ua2 * (3.0## * ta2 - 4.0##)
'
    ub1 = tb1^3
    phib1 = ub1 * (2.0## - tb1)
    psib1 = ub1 * (3.0## * tb1 - 4.0##)
    ub2 = tb2^3
    phib2 = ub2 * (2.0## - tb2)
    psib2 = -ub2 * (3.0## * tb2 - 4.0##)
'
    fterm = f1 * (phia2 - phib2) + f2 * (phib1 - phia1)
    dterm = (d1 * (psia2 - psib2) + d2 * (psib1 - psia1)) * (h / 6.0##)
'
    FUNCTION = 0.5## * h * (fterm + dterm)
 END FUNCTION

'----------------------------------------------------------------------------------------
 SUB pchfe (n, x(), f(), D(), iskip, ne, xe(), fe(), ierr)
'----------------------------------------------------------------------------------------
'  pchfe:  piecewise cubic hermite function evaluator
'
'  evaluates the cubic hermite function defined by  n, x, f, d  at the points
'  xe(j), j = 1 to ne.
'
'  parameters:
'     n --  (input) number of data points.  (error return if n < 2 .)
'     x --  (input) real array of independent variable values.  the elements of x must be
'           strictly increasing: x(i-1) < x(i),  i = 2(1)n. (error return if not.)
'     f --  (input) real array of function values.  f(i) is the value corresponding to x(i).
'     d --  (input) real array of derivative values.  d(i) is the value corresponding to x(i).
'     skip -(input/output) logical variable which should be set to true. if the user wishes
'           to skip checks for validity of preceding parameters, or to false otherwise. this
'           will save time in case these checks have already been performed (say, in pchim or
'           pchic). skip will be set to true on normal return.
'     ne -- (input) number of evaluation points.  (error return if ne < 1 .)
'     xe -- (input) real array of points at which the function is to be evaluated.
'           notes:
'            1. the evaluation will be most efficient if the elements of xe are increasing
'               relative to x; that is, xe(j) >= x(i) implies xe(k) >= x(i), all k >= j .
'            2. if any of the xe are outside the interval [x(1), x(n)], values are extrapolated
'               from the nearest extreme cubic, and a warning error is returned.
'     fe -- (output) real array of values of the cubic hermite function defined by  n, x, f, d
'           at the points  xe.
'     ierr -(output) error flag.
'            normal return:  ierr = 0  (no errors).
'            warning error:  ierr > 0  means that extrapolation was performed at ierr points.
'           "recoverable" errors:
'              ierr = -1  if n < 2 .
'              ierr = -3  if the x-array is not strictly increasing.
'              ierr = -4  if ne < 1. (the fe-array has not been changed in any of these cases.)
'                note: the above errors are checked in the order listed, and following arguments
'                      have "not" been validated.
'              ierr = -5  if an error has occurred in the lower-level routine chfev. this should
'                never happen.  notify the author if it does.
'
    DIM nxt(1 TO 2)
    IF ISFALSE iskip THEN
        IF n < 2 THEN
            ierr = -1
            EXIT SUB
        END IF
        FOR i = 2 TO n
            IF x(i) <= x(i - 1) THEN
                ierr = -3
                EXIT SUB
            END IF
        NEXT i
    END IF
    IF ne < 1 THEN
        ierr = -4
        EXIT SUB
    END IF
    ierr = 0
    iskip = %true
    jfirst = 1
    ir = 2
    DO WHILE jfirst <= ne
        jump = %false
        FOR j = jfirst TO ne
            IF xe(j) >= x(ir) THEN
                jump = %true
                EXIT FOR
            END IF
        NEXT j
        IF ISTRUE jump THEN
            IF ir = n THEN j = ne + 1
        ELSE
            j = ne + 1
        END IF
        nj = j - jfirst
        IF nj <> 0 THEN
            a1 = x(ir - 1)
            a2 = x(ir)
            f1 = f(ir - 1)
            f2 = f(ir)
            d1 = D(ir - 1)
            d2 = D(ir)
            CALL chfev(a1, a2, f1, f2, d1, d2, jfirst, nj, xe(), fe(), nxt(), ierc)
            IF ierc < 0 THEN
                ierr = -5
                EXIT SUB
            END IF
            IF nxt(2) > 0 THEN
                IF ir = n THEN
                    ierr = ierr + nxt(2)
                ELSE
                    ierr = -5
                    EXIT SUB
                END IF
            END IF
            IF nxt(1) > 0 THEN
                IF ir = 2 THEN
                    ierr = ierr + nxt(1)
                ELSE
                    FOR i = jfirst TO j - 1
                        IF xe(i) < x(ir - 1) THEN
                            j = i
                            EXIT FOR
                        END IF
                    NEXT i
                    FOR i = 1 TO ir - 1
                        IF xe(j) < x(i) THEN
                            EXIT FOR
                        END IF
                    NEXT i
                    ir = MAX&(1, i - 1)
                END IF
            END IF
            jfirst = j
        END IF
        INCR ir
        IF ir > n THEN EXIT DO
    LOOP
 END SUB

'----------------------------------------------------------------------------------------
 FUNCTION pchia(n, x(), f(), D(), iskip, a, b, ierr) AS EXTENDED
'----------------------------------------------------------------------------------------
'  pchia:  piecewise cubic hermite integrator, arbitrary limits
'
'  evaluates the definite integral of the cubic hermite function defined by  n, x, f, d
'  over the interval <a, b>.
'
' calling sequence:
'  value = pchia (n, x, f, d, incfd, skip, a, b, ierr)
' parameters:
'  value - (output) value of the requested integral.
'     n -  (input) number of data points.  (error return if n < 2)
'     x -  (input) real array of independent variable values.  the elements of x must be
'          strictly increasing: x(i-1) < x(i), i = 2 to n.  (error return if not.)
'     f - (input) real array of function values. f(i) is the value corresponding to x(i).
'     d - (input) real array of derivative values.  d(i) is the value corresponding to x(i).
'  skip - (input/output) logical variable which should be set to true. if the user wishes to
'         skip checks for validity of preceding parameters, or to false otherwise. this will
'         save time in case these checks have already been performed (say, in pchim or pchic).
'         skip will be set to true on return with ierr = 0 or -4.
' a, b -- (input) the limits of integration.
'         note: there is no requirment that <a, b> be contained in <x(1), x(n)>.  however, the
'         resulting integral value will be highly suspect, if not.
' ierr -- (output) error flag.
'         normal return: ierr = 0  (no errors).
'         warning errors:
'            ierr = 1 if a is outside the interval <x(1), x(n)>.
'            ierr = 2 if b is outside the interval <x(1), x(n)>.
'            ierr = 3 if both of the above are true.  (note that this means that either <a, b>
'                     contains data interval or the intervals do not intersect at all.)
'         "recoverable" errors:
'            ierr = -1  if n.lt.2 .
'            ierr = -2  if incfd.lt.1 .
'            ierr = -3  if the x-array is not strictly increasing. (value has not been computed
'                       in any of these cases.)
'          note: the above errors are checked in the order listed, and following arguments have
'                not been validated.
'
    FUNCTION = 0.0##
    IF ISFALSE iskip THEN
        IF n < 2 THEN
            ierr = -1
            EXIT FUNCTION
        END IF
        FOR i = 2 TO n
            IF x(i) < x(i - 1) THEN
                ierr = -3
                EXIT FUNCTION
            END IF
        NEXT i
    END IF
    iskip = %true
    ierr = 0
    IF (a < x(1)) OR (a > x(n)) THEN INCR ierr
    IF (b < x(1)) OR (b > x(n)) THEN ierr = ierr + 2
    IF a = b THEN
        value = 0.0##
    ELSE
        xa = MIN(a, b)
        xb = MAX(a, b)
        IF xb <= x(2) THEN
            value = chfiv(x(1), x(2), f(1), f(2), D(1), D(2), a, b, ierv)
            IF ierv < 0 THEN
                ierr = -4
                EXIT FUNCTION
            END IF
        ELSEIF xa >= x(n - 1) THEN
            value = chfiv(x(n - 1), x(n), f(n - 1), f(n), D(n - 1), D(n), a, b, ierv)
            IF ierv < 0 THEN
                ierr = -4
                EXIT FUNCTION
            END IF
        ELSE
            ia = 1
            FOR i = 1 TO n - 1
                IF xa > x(i) THEN ia = i + 1
            NEXT i
            ib = n
            FOR i = n TO ia STEP -1
                IF xb < x(i) THEN ib = i - 1
            NEXT i
            ierv = 0
            IF ib < ia THEN
                value = chfiv(x(ib), x(ia), f(ib), f(ia), D(ib), D(ia), a, b, ierv)
                IF ierv < 0 THEN
                    ierr = -4
                    EXIT FUNCTION
                END IF
            ELSE
                IF ib = ia THEN
                    value = 0.0##
                ELSE
                    value = pchid(n, x(), f(), D(), iskip, ia, ib, ierd)
                    IF ierd < 0 THEN
                        ierr = -5
                        EXIT FUNCTION
                    END IF
                END IF
                IF xa < x(ia) THEN
                    i1 = MAX&(1, ia - 1)
                    ir = i1 + 1
                    value = value + chfiv(x(i1), x(ir), f(i1), f(ir), D(i1), D(ir), xa, x(ia), ierv)
                    IF ierv < 0 THEN
                        ierr = -4
                        EXIT FUNCTION
                    END IF
                END IF
                IF xb > x(ib) THEN
                    IF xb > x(ib) THEN
                        ir = MIN&(ib + 1, n)
                        i1 = ir - 1
                        value = value + chfiv(x(i1), x(ir), f(i1), f(ir), D(i1), D(ir), x(ib), xb, ierv)
                        IF ierv < 0 THEN
                            ierr = -4
                            EXIT FUNCTION
                        END IF
                    END IF
                END IF
                IF a > b THEN value = -value
            END IF
        END IF
    END IF
    FUNCTION = value
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION pchid(n, x(), f(), D(), iskip, ia, ib, ierr) AS EXTENDED
'----------------------------------------------------------------------------------------
' pchid:  piecewise cubic hermite integrator, data limits evaluates the definite integral
'         of the cubic hermite function defined by  n, x, f, d  over the interval
'         [x(ia), x(ib)].
'
' calling sequence:
'    value = pchid (n, x, f, d, skip, ia, ib, ierr)
' parameters:
'  value - (output) value of the requested integral.
'     n -  (input) number of data points.  (error return if n < 2)
'     x -  (input) real array of independent variable values. the elements of x must be
'           strictly increasing: x(i-1) < x(i), i = 2 to n. (error return if not.)
'     f - (input) real array of function values. f(i) is the value corresponding to x(i).
'     d - (input) real array of derivative values. d(i) is the value corresponding to x(i).
'  skip - (input/output) logical variable which should be set to true.
'         if the user wishes to skip checks for validity of preceding parameters, or to
'         false otherwise. this will save time in case these checks have already been
'         performed (say, in pchim or pchic). skip will be set to true on return with
'         ierr = 0 or -4.
' ia,ib - (input) indices in x-array for the limits of integration. both must be in the
'         range [1,n]. (error return if not.) no restrictions on their relative values.
'  ierr - (output) error flag.
'         normal return: ierr = 0  (no errors).
'          "recoverable" errors:
'            ierr = -1  if n < 2 .
'            ierr = -3  if the x-array is not strictly increasing.
'            ierr = -4  if ia or ib is out of range.
'            (value has not been computed in any of these cases.)
'            note:  the above errors are checked in the order listed, and following
'                   arguments have not been validated.
'
    FUNCTION = 0.0##
    IF ISFALSE iskip THEN
        IF n < 2 THEN
            ierr = -1
            EXIT FUNCTION
        END IF
        FOR i = 2 TO n
            IF x(i) < x(i - 1) THEN
                ierr = -3
                EXIT FUNCTION
            END IF
        NEXT i
    END IF
    iskip = %true
    IF (ia < 1) OR (ia > n) THEN
        ierr = -4
        EXIT FUNCTION
    END IF
    IF (ib < 1) OR (ib > n) THEN
        ierr = -4
        EXIT FUNCTION
    END IF
    ierr = 0
    IF ia = ib THEN
        value = 0.0##
    ELSE
        sum = 0.0##
        FOR i = MIN&(ia, ib) TO MAX&(ia, ib) - 1
            h = x(i + 1) - x(i)
            sum = sum + h * ((f(i) + f(i + 1)) + (D(i) - D(i + 1)) * (h / 6.0##))
        NEXT i
        value = 0.5## * sum
        IF ia > ib THEN value = -value
    END IF
    FUNCTION = value
 END FUNCTION

'----------------------------------------------------------------------------------------
 SUB pchim (n, x(), f(), D(), ierr)
'----------------------------------------------------------------------------------------
'  pchim:  piecewise cubic hermite interpolation to monotone data.
'
'  sets derivatives needed to determine a monotone piecewise cubic hermite interpolant to
'  the data given in x and f. default boundary conditions are provided which are compatible
'  with monotonicity. (see pchic if user control of boundary conditions is desired.) if the
'  data are only piecewise monotonic, the interpolant will have an extremum at each point
'  where monotonicity switches direction.  (see pchic if user control is desired in such
'  cases.) the resulting piecewise cubic hermite function may be evaluated by pchfe or pchfd.
'
'   parameters:
'     n - (input) number of data points (error return if n < 2). if n = 2, simply does linear
'         interpolation.
'     x - (input) real array of independent variable values. the elements of x must be strictly
'         increasing: x(i-1) < x(i),  i = 2 to n (error return if not.)
'     f - (input) real array of dependent variable values to be interpolated. f(i) is value
'         corresponding to x(i).  pchim is designed for monotonic data, but it will work for
'         any f-array. it will force extrema at points where monotonicity switches direction.
'         if some other treatment of switch points is desired, pchic should be used instead.
'     d - (output) real array of derivative values at the data points. if the data are
'         monotonic, these values will determine a monotone cubic hermite function. the value
'         corresponding to x(i) is stored in d(i), i=1 to n.  no other entries in d are changed.
'  ierr - (output) error flag.
'         normal return:  ierr = 0  (no errors).
'         warning error:  ierr > 0  means that ierr switches in the direction of monotonicity
'                                   were detected.
'         "recoverable" errors:
'                         ierr = -1 if n < 2 .
'                         ierr = -3 if the x-array is not strictly increasing. (the d-array has
'                                   not been changed in any of these cases.)
'   note: the above errors are checked in the order listed, and the following arguments have
'         not been validated.
'
    IF n < 2 THEN
        ierr = -1
        EXIT SUB
    END IF
    FOR i = 2 TO n
        IF x(i) <= x(i - 1) THEN
            ierr = -3
            EXIT SUB
        END IF
    NEXT i
    ierr = 0
    nless1 = n - 1
    h1 = x(2) - x(1)
    del1 = (f(2) - f(1)) / h1
    dsave = del1
'
'   special case n=2 -- use linear interpolation.
'
    IF nless1 < 1 THEN
        D(1) = del1
        D(n) = del1
        EXIT SUB
    END IF
'
    h2 = x(3) - x(2)
    del2 = (f(3) - f(2)) / h2
    hsum = h1 + h2
    w1 = (h1 + hsum) / hsum
    w2 = -h1 / hsum
    D(1) = w1 * del1 + w2 * del2
    IF pchst(D(1), del1) <= 0.0## THEN
        D(1) = 0.0##
    ELSEIF pchst(del1, del2) < 0.0## THEN
        dmax = 3.0## * del1
        IF ABS(D(1)) > ABS(dmax) THEN
            D(1) = dmax
        END IF
    END IF
    FOR i = 2 TO nless1
        IF i <> 2 THEN
            h1 = h2
            h2 = x(i + 1) - x(i)
            hsum = h1 + h2
            del1 = del2
            del2 = (f(i + 1) - f(i)) / h2
        END IF
        D(i) = 0.0##
        IF pchst(del1, del2) < 0.0## THEN
            ierr = ierr + 1
            dsave = del2
        ELSEIF pchst(del1, del2) = 0.0## THEN
            IF del2 <> 0.0## THEN
                IF pchst(dsave, del2) < 0.0## THEN INCR ierr
                dsave = del2
            END IF
        ELSE
            hsumt3 = hsum + hsum + hsum
            w1 = (hsum + h1) / hsumt3
            w2 = (hsum + h2) / hsumt3
            dmax = MAX(ABS(del1), ABS(del2))
            dmin = MIN(ABS(del1), ABS(del2))
            drat1 = del1 / dmax
            drat2 = del2 / dmax
            D(i) = dmin / (w1 * drat1 + w2 * drat2)
        END IF
    NEXT i
    w1 = -h2 / hsum
    w2 = (h2 + hsum) / hsum
    D(n) = w1 * del1 + w2 * del2
    IF pchst(D(n), del2) < 0.0## THEN
        D(n) = 0.0##
    ELSEIF pchst(del1, del2) < 0.0## THEN
        dmax = 3.0## * del2
        IF ABS(D(n)) > ABS(dmax) THEN D(n) = dmax
    END IF
 END SUB

'----------------------------------------------------------------------------------------
 FUNCTION pchst(arg1, arg2) AS EXT
'----------------------------------------------------------------------------------------
'  pchst:  pchip sign-testing routine.
'    returns: -1. if arg1 and arg2 are of opposite sign.
'              0. if either argument is zero.
'             +1. if arg1 and arg2 are of the same sign.
'
    FUNCTION = sign(1.0##, arg1) * sign(1.0##, arg2)
    IF (arg1 = 0.0##) OR (arg2 = 0.0##) THEN FUNCTION = 0.0##
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION sign(x, y) AS EXT
'----------------------------------------------------------------------------------------
'  basic version of the fortran function sign(x, y)
'
    FUNCTION = ABS(x)
    IF y < 0.0## THEN FUNCTION = -ABS(x)
 END FUNCTION

' End of PCHIP routines
'========================================================================================

'----------------------------------------------------------------------------------------
 FUNCTION Ibinry (Taget$) AS LONG        ' routine to find target$ nuclide
'----------------------------------------------------------------------------------------
'  function bisects file and returns record number for Taget$ in NDX file
'
   GET %indx, 1, IndHed                  ' first call read the 1st record
   l1 = VAL(IndHed.i1)                   ' to find what is the first and
   l2 = VAL(IndHed.i2)                   ' last data records.  set the
   FUNCTION = 0                          ' variable.
   DO                                    ' now start the a bisection
      itry = (l1 + l2) \ 2               ' search of the file. note it is
      GET %indx, itry, IndDat            ' sorted by nuclide field.  in
      IF IndDat.nuke < Taget$ THEN       ' less than 10 reads we will find
         l1 = itry + 1                   ' the record for the target.
      ELSEIF IndDat.nuke > Taget$ THEN   '
         l2 = itry - 1                   '
      ELSE
         FUNCTION = itry                 ' found it, return the ibinry as
         EXIT FUNCTION                   ' itry.
      END IF                             '
   LOOP WHILE l1 < l2 + 1                ' if target not found the routine
   EXIT FUNCTION                         ' returns a value of zero.
 END FUNCTION
