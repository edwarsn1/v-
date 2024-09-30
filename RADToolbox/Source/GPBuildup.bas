Attribute VB_Name = "GPBuildup"
 Option Explicit
 Sub builup(E_MeV() As Double, GP_Coeff() As Double, Symbol$, ne As Long)
    Dim X(9) As Double
    Dim Zk As Double
    Dim bup As Double
    Dim ztanh2 As Double
    Dim arg As Double
    Dim i As Long
    Dim j As Long
    
    ztanh2 = tanh(-2)
    X(1) = 0.5
    X(2) = 1#
    X(3) = 2#
    X(4) = 4#
    X(5) = 8#
    X(6) = 10#
    X(7) = 20#
    X(8) = 40#
    X(9) = 60#
    For i = 1 To ne
       For j = 1 To 9
          arg = X(j) / GP_Coeff(i, 4) - 2#
          Zk = GP_Coeff(i, 2) * X(j) ^ GP_Coeff(i, 3) + _
               GP_Coeff(i, 5) * (tanh(arg) - ztanh2) / (1# - ztanh2)
          If Zk = 1# Then
             bup = (GP_Coeff(i, 1) - 1#) * X(j)
          Else
             bup = (GP_Coeff(i, 1) - 1#) * (Zk ^ X(j) - 1#) / (Zk - 1#)
          End If
          bup = 1# + bup
       Next j
    Next i
 End Sub

 Function tanh(X#) As Double
    tanh = (Exp(X#) - Exp(-X#)) / (Exp(X#) + Exp(-X#))
 End Function
