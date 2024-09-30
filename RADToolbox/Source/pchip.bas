Attribute VB_Name = "pChip"
  DefLng I-N
  DefDbl A-H, O-Z
  Dim iSkip As Boolean
'pchip.bas
'-----------------------------------------------------------------------
 Sub chfev(x1, x2, f1, f2, d1, d2, jfirst, ne, xe(), fe(), nxt(), ierr)
'-----------------------------------------------------------------------
'  chfev:  cubic hermite function evaluator
'  evaluates the cubic polynomial determined by function values
'  f1, f2 and derivatives d1, d2 on interval (x1, x2) at the points
'  xe(j), j=1(1)ne.

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

  If ne < 1 Then
    ierr = -1
    Exit Sub
  End If
  h = x2 - x1
  If h = 0# Then
    ierr = -2
    Exit Sub
  End If
  ierr = 0
  nxt(1) = 0
  nxt(2) = 0
  xmi = amin(0#, h)
  xma = amax(0#, h)
  delta = (f2 - f1) / h
  del1 = (d1 - delta) / h
  del2 = (d2 - delta) / h
  c2 = -(del1 + del1 + del2)
  c3 = (del1 + del2) / h
  For i = 1 To ne
    x = xe(i + jfirst - 1) - x1
    fe(i + jfirst - 1) = f1 + x * (d1 + x * (c2 + x * c3))
    If x < xmi Then
        nxt(1) = nxt(1) + 1
    ElseIf x > xma Then
        nxt(2) = nxt(2) + 1
    End If
  Next i
  End Sub

'-----------------------------------------------------------------------
  Function chfiv(x1, x2, f1, f2, d1, d2, a, b, ierr) As Double
'-----------------------------------------------------------------------
'  chfiv:  cubic hermite function integral evaluator
'  called by pchia to evaluate the integral of a single cubic (in
'  hermite form) over an arbitrary interval (a,b).

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

   If x1 = x2 Then
      ierr = 0
      Exit Function
   End If
   h = x2 - x1
   ta1 = (a - x1) / h
   ta2 = (x2 - a) / h
   tb1 = (b - x1) / h
   tb2 = (x2 - b) / h

   ua1 = ta1 ^ 3
   phia1 = ua1 * (2# - ta1)
   psia1 = ua1 * (3# * ta1 - 4#)
   ua2 = ta2 ^ 3
   phia2 = ua2 * (2# - ta2)
   psia2 = -ua2 * (3# * ta2 - 4#)

   ub1 = tb1 ^ 3
   phib1 = ub1 * (2# - tb1)
   psib1 = ub1 * (3# * tb1 - 4#)
   ub2 = tb2 ^ 3
   phib2 = ub2 * (2# - tb2)
   psib2 = -ub2 * (3# * tb2 - 4#)

   fterm = f1 * (phia2 - phib2) + f2 * (phib1 - phia1)
   dterm = (d1 * (psia2 - psib2) + d2 * (psib1 - psia1)) * (h / 6#)

   chfiv = 0.5 * h * (fterm + dterm)
  End Function

'-----------------------------------------------------------------------
  Sub pchfe(n, x(), f(), D(), iSkip, ne, xe(), fe(), ierr)
'-----------------------------------------------------------------------
'  pchfe:  piecewise cubic hermite function evaluator
'
'  evaluates the cubic hermite function defined by  n, x, f, d  at
'  the points  xe(j), j=1(1)ne.

'  parameters:
'     n -- (input) number of data points.  (error return if n < 2 .)
'     x -- (input) real array of independent variable values.  the
'           elements of x must be strictly increasing:
'                x(i-1) < x(i),  i = 2(1)n. (error return if not.)
'     f -- (input) real array of function values.  f(i) is
'           the value corresponding to x(i).
'     d -- (input) real array of derivative values.  d(i) is
'           the value corresponding to x(i).
'     skip -- (input/output) logical variable which should be set to
'           true. if the user wishes to skip checks for validity of
'           preceding parameters, or to false otherwise. this will save
'           time in case these checks have already been performed (say,
'           in pchim or pchic). skip will be set to true on normal return.
'     ne -- (input) number of evaluation points.  (error return if
'           ne < 1 .)
'     xe -- (input) real array of points at which the function is to be
'          evaluated.
'         notes:
'          1. the evaluation will be most efficient if the elements
'             of xe are increasing relative to x;
'             that is,   xe(j) >= x(i)
'             implies    xe(k) >= x(i),  all k >= j .
'          2. if any of the xe are outside the interval [x(1),x(n)],
'             values are extrapolated from the nearest extreme cubic,
'             and a warning error is returned.
'     fe -- (output) real array of values of the cubic hermite function
'          defined by  n, x, f, d  at the points  xe.
'     ierr -- (output) error flag.
'          normal return:  ierr = 0  (no errors).
'          warning error:  ierr > 0  means that extrapolation was performed
'                          at ierr points.
'          "recoverable" errors:
'             ierr = -1  if n < 2 .
'             ierr = -3  if the x-array is not strictly increasing.
'             ierr = -4  if ne < 1. (the fe-array has not been changed in
'                        any of these cases.)
'             note:  the above errors are checked in the order listed,
'                    and following arguments have **not** been validated.
'             ierr = -5  if an error has occurred in the lower-level
'                        routine chfev. this should never happen.
'                        notify the author **immediately** if it does.
'  other routines used:  chfev.

  Dim nxt(2) As Long
  
  If Not iSkip Then
     If n < 2 Then
        ierr = -1
        Exit Sub
     End If
     For i = 2 To n
        If x(i) <= x(i - 1) Then
           ierr = -3
           Exit Sub
        End If
     Next i
  End If
  If ne < 1 Then
     ierr = -4
     Exit Sub
  End If
  ierr = 0
  iSkip = True
  jfirst = 1
  ir = 2
  Do While jfirst <= ne
     jump = False
     For j = jfirst To ne
       If xe(j) >= x(ir) Then
          jump = True
          Exit For
       End If
     Next j
     If jump Then
        If ir = n Then j = ne + 1
     Else
        j = ne + 1
     End If
     nj = j - jfirst
     If nj <> 0 Then
        a1 = x(ir - 1)
        a2 = x(ir)
        a2 = x(ir)
        f1 = f(ir - 1)
        f2 = f(ir)
        d1 = D(ir - 1)
        d2 = D(ir)
        Call chfev(a1, a2, f1, f2, d1, d2, jfirst, nj, xe(), fe(), nxt(), ierc)
        If ierc < 0 Then
           ierr = -5
           Exit Sub
        End If
        If nxt(2) > 0 Then
           If ir = n Then
              ierr = ierr + nxt(2)
           Else
              ierr = -5
              Exit Sub
           End If
        End If
        If nxt(1) > 0 Then
           If ir = 2 Then
              ierr = ierr + nxt(1)
           Else
              For i = jfirst To j - 1
                 If xe(i) < x(ir - 1) Then
                    j = i
                    Exit For
                 End If
              Next i
              For i = 1 To ir - 1
                 If xe(j) < x(i) Then
                    Exit For
                 End If
              Next i
              ir = imax(1, i - 1)
           End If
        End If
        jfirst = j
     End If
     ir = ir + 1
     If ir > n Then Exit Do
  Loop
 End Sub

'-----------------------------------------------------------------------
 Function pchia(n, x(), f(), D(), iSkip, a, b, ierr) As Double
'---------------------------------------------------------------
'  pchia:  piecewise cubic hermite integrator, arbitrary limits
'
'  evaluates the definite integral of the cubic hermite function
'  defined by  n, x, f, d  over the interval <a, b>.

' calling sequence:
'  value = pchia (n, x, f, d, incfd, skip, a, b, ierr)
' parameters:
'  value - (output) value of the requested integral.
'     n -  (input) number of data points.  (error return if n < 2)
'     x -  (input) real array of independent variable values.  the
'          elements of x must be strictly increasing:
'               x(i-1) < x(i),  i = 2(1)n.  (error return if not.)
'     f - (input) real array of function values.  f(i) is
'         the value corresponding to x(i).
'     d - (input) real array of derivative values.  d(i) is
'         the value corresponding to x(i).
'  skip - (input/output) logical variable which should be set to true.
'         if the user wishes to skip checks for validity of preceding
'         parameters, or to false otherwise. this will save time in case
'         these checks have already been performed (say, in pchim or pchic).
'         skip will be set to true on return with ierr = 0 or -4.
' a, b -- (input) the limits of integration.
'         note: there is no requirment that <a, b> be contained in the
'              <x(1), x(n)>.  howeer, the resulting integral value will
'              be highly suspect, if not.
' ierr -- (output) error flag.
'         normal return: ierr = 0  (no errors).
'         warning errors:
'            ierr = 1 if a is outside the interval <x(1), x(n)>.
'            ierr = 2 if b is outside the interval <x(1), x(n)>.
'            ierr = 3 if both of the above are true.  (note that this
'                     means that eigher <a,b> contains data interval
'                     or the intervals do not inersect at all.)
'         "recoverable" errors:
'            ierr = -1  if n.lt.2 .
'            ierr = -2  if incfd.lt.1 .
'            ierr = -3  if the x-array is not strictly increasing.
'              (value has not been computed in any of these cases.)
'          note: the above errors are checked in the order listed,
'                and following arguments have **not** been validated.
'
'  fortran intrinsics used:  amax1, amin1, max0, min0.
'  other routines used: chfiv, pchid.

   If Not iSkip Then
     If n < 2 Then
        ierr = -1
        Exit Function
     End If
     For i = 2 To n
       If x(i) < x(i - 1) Then
          ierr = -3
          Exit Function
       End If
     Next i
  End If
  iSkip = True
  ierr = 0
  If (a < x(1)) Or (a > x(n)) Then ierr = ierr + 1
  If (b < x(1)) Or (b > x(n)) Then ierr = ierr + 2
  If a = b Then
     Value = 0#
  Else
     xa = amin(a, b)
     xb = amax(a, b)
     If xb <= x(2) Then
        Value = chfiv(x(1), x(2), f(1), f(2), D(1), D(2), a, b, ierv)
        If ierv < 0 Then
           ierr = -4
           Exit Function
        End If
     ElseIf xa >= x(n - 1) Then
        Value = chfiv(x(n - 1), x(n), f(n - 1), f(n), D(n - 1), D(n), a, b, ierv)
        If ierv < 0 Then
           ierr = -4
           Exit Function
        End If
     Else
        ia = 1
        For i = 1 To n - 1
            If xa > x(i) Then ia = i + 1
        Next i
        ib = n
        For i = n To ia Step -1
            If xb < x(i) Then ib = i - 1
        Next i
        ierv = 0
        If ib < ia Then
           Value = chfiv(x(ib), x(ia), f(ib), f(ia), D(ib), D(ia), a, b, ierv)
           If ierv < 0 Then
             ierr = -4
             Exit Function
           End If
        Else
           If ib = ia Then
              Value = 0#
           Else
              Value = pchid(n, x(), f(), D(), iSkip, ia, ib, ierd)
              If ierd < 0 Then
                 ierr = -5
                 Exit Function
              End If
           End If
           If xa < x(ia) Then
              i1 = imax(1, ia - 1)
              ir = i1 + 1
              Value = Value + chfiv(x(i1), x(ir), f(i1), f(ir), D(i1), D(ir), xa, x(ia), ierv)
              If ierv < 0 Then
                 ierr = -4
                 Exit Function
              End If
           End If
           If xb > x(ib) Then
              If xb > x(ib) Then
                 ir = imin(ib + 1, n)
                 i1 = ir - 1
                 Value = Value + chfiv(x(i1), x(ir), f(i1), f(ir), D(i1), D(ir), x(ib), xb, ierv)
                 If ierv < 0 Then
                    ierr = -4
                    Exit Function
                 End If
              End If
           End If
           If a > b Then Value = -Value
        End If
     End If
  End If
  pchia = Value
 End Function

'-----------------------------------------------------------------------
 Function pchid(n, x(), f(), D(), iSkip, ia, ib, ierr) As Double
'---------------------------------------------------------------
' pchid:  piecewise cubic hermite integrator, data limits
' evaluates the definite integral of the cubic hermite function
' defined by  n, x, f, d  over the interval [x(ia), x(ib)].

' calling sequence:
'    value = pchid (n, x, f, d, skip, ia, ib, ierr)
' parameters:
'  value - (output) value of the requested integral.
'     n -  (input) number of data points.  (error return if n < 2)
'     x -  (input) real array of independent variable values.  the
'          elements of x must be strictly increasing:
'               x(i-1) < x(i),  i = 2(1)n.  (error return if not.)
'     f - (input) real array of function values.  f(i) is
'         the value corresponding to x(i).
'     d - (input) real array of derivative values.  d(i) is
'         the value corresponding to x(i).
'  skip - (input/output) logical variable which should be set to true.
'         if the user wishes to skip checks for validity of preceding
'         parameters, or to false otherwise. this will save time in case
'         these checks have already been performed (say, in pchim or pchic).
'         skip will be set to true on return with ierr = 0 or -4.
' ia,ib - (input) indices in x-array for the limits of integration.
'         both must be in the range [1,n].  (error return if not.)
'         no restrictions on their relative values.
'  ierr - (output) error flag.
'         normal return: ierr = 0  (no errors).
'          "recoverable" errors:
'            ierr = -1  if n < 2 .
'            ierr = -3  if the x-array is not strictly increasing.
'            ierr = -4  if ia or ib is out of range.
'            (value has not been computed in any of these cases.)
'            note:  the above errors are checked in the order listed,
'                   and following arguments have **not** been validated.

   If Not iSkip Then
      If n < 2 Then
         ierr = -1
         Exit Function
      End If
      For i = 2 To n
        If x(i) < x(i - 1) Then
           ierr = -3
           Exit Function
        End If
      Next i
   End If
   iSkip = True
   If (ia < 1) Or (ia > n) Then
      ierr = -4
      Exit Function
   End If
   If (ib < 1) Or (ib > n) Then
      ierr = -4
      Exit Function
   End If
   ierr = 0
   If ia = ib Then
      Value = 0#
   Else
      Sum = 0#
      For i = imin(ia, ib) To imax(ia, ib) - 1
          h = x(i + 1) - x(i)
          Sum = Sum + h * ((f(i) + f(i + 1)) + (D(i) - D(i + 1)) * (h / 6#))
      Next i
      Value = 0.5 * Sum
      If ia > ib Then Value = -Value
   End If
   pchid = Value
 End Function

'-----------------------------------------------------------------------
  Sub pchim(n, x(), f(), D(), ierr)
'-----------------------------------------------------------------------
'  pchim:  piecewise cubic hermite interpolation to monotone data.

'  sets derivatives needed to determine a monotone piecewise cubic
'  hermite interpolant to the data given in x and f.  default
'  boundary conditions are provided which are compatible with
'  monotonicity. (see pchic if user control of boundary
'  conditions is desired.) if the data are only piecewise monotonic,
'  the interpolant will have an extremum at each point where
'  monotonicity switches direction.  (see pchic if user control is
'  desired IN such cases.) the resulting piecewise cubic hermite
'  function may be evaluated by pchfe or pchfd.

'   parameters:
'     n - (input) number of data points.  (error return if n < 2.).
'         if n=2, simply does linear interpolation.
'     x - (input) real array of independent variable values.  the
'         elements of x must be strictly increasing:
'                x(i-1) < x(i),  i = 2(1)n.  (error return if not.)
'     f - (input) real array of dependent variable values to be inter-
'         polated.  f(i) is value corresponding to x(i).  pchim is designed
'         for monotonic data, but it will work for any f-array.  it will
'         force extrema at points where monotonicity switches direction.
'         if some other treatment of switch points is desired, pchic should
'         be used instead.
'     d - (output) real array of derivative values at the data points.
'         if the data are monotonic, these values will determine a
'         monotone cubic hermite function. the value corresponding to x(i)
'         is stored in d(i), i=1(1)n.  no other entries in d are changed.
'  ierr - (output) error flag.
'         normal return:  ierr = 0  (no errors).
'         warning error:  ierr > 0  means that ierr switches in the direction
'                         of monotonicity were detected.
'         "recoverable" errors:
'                         ierr = -1 if n < 2 .
'                         ierr = -3 if the x-array is not strictly increasing.
'                         (the d-array has not been changed in any of these
'                          cases.)
'   note: the above errors are checked in the order listed, and the
'         following arguments have **not** been validated.

  If n < 2 Then
     ierr = -1
     Exit Sub
  End If
  For i = 2 To n
     If x(i) <= x(i - 1) Then
        ierr = -3
        Exit Sub
     End If
  Next i
  ierr = 0
  nless1 = n - 1
  h1 = x(2) - x(1)
  del1 = (f(2) - f(1)) / h1
  dsave = del1

  '  special case n=2 -- use linear interpolation.

  If nless1 < 1 Then
     D(1) = del1
     D(n) = del1
     Exit Sub
  End If

  h2 = x(3) - x(2)
  del2 = (f(3) - f(2)) / h2
  hsum = h1 + h2
  w1 = (h1 + hsum) / hsum
  w2 = -h1 / hsum
  D(1) = w1 * del1 + w2 * del2
  If pchst(D(1), del1) <= 0# Then
     D(1) = 0#
  ElseIf pchst(del1, del2) < 0# Then
     dmax = 3# * del1
     If Abs(D(1)) > Abs(dmax) Then
        D(1) = dmax
     End If
  End If
  For i = 2 To nless1
    If i <> 2 Then
       h1 = h2
       h2 = x(i + 1) - x(i)
       hsum = h1 + h2
       del1 = del2
       del2 = (f(i + 1) - f(i)) / h2
    End If
    D(i) = 0#
    If pchst(del1, del2) < 0# Then
       ierr = ierr + 1
       dsave = del2
    ElseIf pchst(del1, del2) = 0# Then
       If del2 <> 0# Then
          If pchst(dsave, del2) < 0# Then ierr = ierr + 1
          dsave = del2
       End If
    Else
       hsumt3 = hsum + hsum + hsum
       w1 = (hsum + h1) / hsumt3
       w2 = (hsum + h2) / hsumt3
       dmax = amax(Abs(del1), Abs(del2))
       dmin = amin(Abs(del1), Abs(del2))
       drat1 = del1 / dmax
       drat2 = del2 / dmax
       D(i) = dmin / (w1 * drat1 + w2 * drat2)
    End If
  Next i
  w1 = -h2 / hsum
  w2 = (h2 + hsum) / hsum
  D(n) = w1 * del1 + w2 * del2
  If pchst(D(n), del2) < 0# Then
     D(n) = 0#
  ElseIf pchst(del1, del2) < 0# Then
     dmax = 3# * del2
     If Abs(D(n)) > Abs(dmax) Then D(n) = dmax
  End If
 End Sub

'-----------------------------------------------------------------------
  Function pchst(arg1, arg2) As Double
'-----------------------------------------------------------------------
'  pchst:  pchip sign-testing routine.
'    returns: -1. if arg1 and arg2 are of opposite sign.
'              0. if either argument is zero.
'             +1. if arg1 and arg2 are of the same sign.

  pchst = sign(1#, arg1) * sign(1#, arg2)
  If (arg1 = 0#) Or (arg2 = 0#) Then pchst = 0#
 End Function

'-----------------------------------------------------------------------
  Function sign(x, y) As Double
'---------------------------------------------------------------------
'  basic version of the fortran function sign(x, y)

  sign = Abs(x)
  If y < 0# Then sign = -Abs(x)
 End Function

 Function amin(a As Double, b As Double)
   If a < b Then
     amin = a
   Else
     amin = b
   End If
 End Function
 
 Function imin(i As Long, j As Long)
   If i < j Then
     imin = i
   Else
     imin = j
   End If
 End Function
 
 Function amax(a As Double, b As Double)
   If a >= b Then
     amax = a
   Else
     amax = b
   End If
 End Function
 
 Function imax(i As Long, j As Long)
   If i >= j Then
     imax = i
   Else
     imax = j
   End If
 End Function
