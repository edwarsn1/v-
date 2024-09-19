Attribute VB_Name = "DoseRates"
' Based on ADoses Ver. 4.1 by KF Eckerman

  DefLng I-N
  DefDbl A-H, O-Z
  Type HeadDef                            ' structure of 1st index record
     i1 As String * 4                     ' # first data record
     i2 As String * 4                     ' # last data record
     dy As String * 66
   CrLf As String * 2
  End Type
  Type NukeDef                            ' Nuke record in dose rate file
     nuke As String * 7                   ' Nuke name
     iage As String * 6                   ' Age at intake (d)
    iamad As String * 6                   ' AMAD (um) - here always 1
    itype As String * 1                   ' Absorption Type F, M, S, V, etc.
       f1 As String * 8                   ' f1 values
     ntim As String * 4                   ' # times
     nlet As String * 3                   ' # LETs (1 or 2)
     LLet As String * 1                   ' LET type (L, H or B)
      dmy As String * 12
     CrLf As String * 2
  End Type
  Type DoseDef
     Tim As String * 8                    ' Time (d)
     din(1 To 4) As String * 10           ' dose rate (SI, RMarrow, Lung, AI)
     CrLf As String * 2
  End Type
  Public IndHed As HeadDef
  Public DoseDat As DoseDef

 Sub Dose_Rates(sArguments As String)
'-------------------------------------------------------------------------
   Dim sFN As String, rsADoses As Recordset, sOutStr As String
  
   Dim times(150), dl(150, 4), dh(150, 4), H(150), D(150), hc(8) As Double
   Dim Typex$, Tcomp(10), RBE(4)
   Dim sFileName As String, i As Integer, iBlanks(20) As Integer, _
     iL As Integer, j As Integer, nTimes As Integer
   Dim DoseNuc As NukeDef
   
'   sArguments = Command
   iL = Len(RTrim(sArguments))
   iBlanks(20) = iL
   j = 1
   For i = 1 To iL
     If (Mid(sArguments, i, 1) = " ") Then
       iBlanks(j) = i
       j = j + 1
     End If
   Next i
   If (i = 0 Or j > 19) Then
     MsgBox ("error reading input (iL, j): " & Str(iL) & " " & Str(j))
     sFileName = App.Path & "\temp\doserate.tmp"
     Open sFileName For Output As #3
     Write #3, "Error, table could not be created."
     Close #3
     Exit Sub
   End If
   iBlanks(j) = iL + 1
   iL = iBlanks(2) - iBlanks(1) - 1
   nukex$ = Mid(sArguments, iBlanks(1) + 1, iL)
   iL = iBlanks(3) - iBlanks(2) - 1
   Typex$ = Mid(sArguments, iBlanks(2) + 1, iL)
   iL = iBlanks(4) - iBlanks(3) - 1
   LETflag$ = Mid(sArguments, iBlanks(3) + 1, iL)
   iL = iBlanks(5) - iBlanks(4) - 1
   iRBE_Set$ = Mid(sArguments, iBlanks(4) + 1, iL)
   For i = 1 To 4
     iL = iBlanks(5 + i) - iBlanks(4 + i) - 1
     RBE(i) = Val(Mid(sArguments, iBlanks(4 + i) + 1, iL))
   Next i
   For i = 9 To j - 1
     iL = iBlanks(1 + i) - iBlanks(i) - 1
     Tcomp(i - 8) = Val(Mid(sArguments, iBlanks(i) + 1, iL))
   Next i
   nTimes = j - 9

'  input now complete
   sFileName = App.Path & "\data\InhDose.Drt"
   Open sFileName For Random As #2 Len = Len(DoseDat)
   sFileName = App.Path & "\temp\doserate.tmp"
   Open sFileName For Output As #3

   sFN = App.Path & "\data\Adoses.mdb"
   Rad_Toolbox.dataEle.DatabaseName = sFN
   Rad_Toolbox.dataEle.RecordSource = "Select * from ADoses Where Nuclide = '" & nukex$ & "'"
   Rad_Toolbox.dataEle.Refresh
   Set rsADoses = Rad_Toolbox.dataEle.Recordset
   rsADoses.MoveFirst
   icasex = -1
   For i = 2 To 12 Step 2
     If rsADoses.Fields(i) = Typex$ Then
       icasex = rsADoses.Fields(i + 1)
     End If
   Next i
   rsADoses.Close

   If (icasex = -1) Then
     MsgBox (nukex$ & " is not in the database")
     Close #2
     Close #3
     End
   End If

   Get #2, icasex, DoseNuc                       ' get the data
   npts = Val(DoseNuc.ntim)                      ' # times in dose rate data
   Call Readem(times(), dl(), dh(), icasex, npts, LETflag$)

   For ix = 1 To nTimes
      If npts <> 1 Then                       ' do integral if npts > 1 else
         If iRBE_Set$ = "Y" Then              ' apply RBEs
            For j = 1 To 4
               For i = 1 To npts
                  H(i) = dl(i, j) + RBE(j) * dh(i, j)
               Next i
               Call pchim(npts, times(), H(), D(), ierr)
               hc(j) = pchia(npts, times(), H(), D(), False, 0#, Tcomp(ix), ierr)
            Next j
         Else                                  ' do not apply RBEs
            If LETflag$ = "L" Then
               For j = 1 To 4
                  For i = 1 To npts
                     H(i) = dl(i, j)
                  Next i
                  Call pchim(npts, times(), H(), D(), ierr)
                  hc(j) = pchia(npts, times(), H(), D(), False, 0#, _
                                Tcomp(ix), ierr)
               Next j
            ElseIf LETflag$ = "H" Then
               For j = 1 To 4
                  For i = 1 To npts
                     H(i) = dh(i, j)
                  Next i
                  Call pchim(npts, times(), H(), D(), ierr)
                  hc(j + 4) = pchia(npts, times(), H(), D(), False, _
                                  0#, Tcomp(ix), ierr)
               Next j
            ElseIf LETflag$ = "B" Then
               For j = 1 To 4
                  For i = 1 To npts
                     H(i) = dl(i, j)
                  Next i
                  Call pchim(npts, times(), H(), D(), ierr)
                  hc(j) = pchia(npts, times(), H(), D(), False, _
                                0#, Tcomp(ix), ierr)
               Next j
               For j = 1 To 4
                  For i = 1 To npts
                     H(i) = dh(i, j)
                  Next i
                  Call pchim(npts, times(), H(), D(), ierr)
                  hc(j + 4) = pchia(npts, times(), H(), D(), False, 0#, _
                                  Tcomp(ix), ierr)
               Next j
            End If
         End If
      Else                                    ' single point is the integral
         If iRBE_Set$ = "Y" Then
           For j = 1 To 4
              hc(j) = dl(1, j) + RBE(j) * dh(1, j)
           Next j
         Else
           If LETflag$ = "L" Then
             For j = 1 To 4
               hc(j) = dl(1, j)
             Next j
           ElseIf LETflag$ = "H" Then
             For j = 5 To 8
               hc(j) = dh(1, j - 4)
             Next j
           ElseIf LETflag$ = "B" Then
             For j = 1 To 4
               hc(j) = dl(1, j)
             Next j
             For j = 1 To 4
               hc(j + 4) = dh(1, j)
             Next j
           End If
         End If
      End If
' calculations complete for the ix_th time period
' now write the results
      If iRBE_Set$ = "Y" Then
         If ix = 1 Then
            Write #3, "Absorbed Dose Adjusted by RBE (Gy/Bq)"
            Write #3, "Nuclide", "Type", "SI", "Marrow", "Lung", "AI", "Tmax (d)"
         End If
         Write #3, nukex$, Typex$, hc(1), hc(2), hc(3), hc(4), Tcomp(ix)
      Else
         If LETflag$ = "L" Then
            If ix = 1 Then
               Write #3, "Absorbed Dose (Low LET) (Gy/Bq)"
               Write #3, "Nuclide", "Type", "SI", "Marrow", "Lung", "AI", "Tmax (d)"
            End If
            Write #3, nukex$, Typex$, hc(1), hc(2), hc(3), hc(4), Tcomp(ix)
         ElseIf LETflag$ = "H" Then
            If ix = 1 Then
               Write #3, "Absorbed Dose (High LET) (Gy/Bq)"
               Write #3, "Nuclide", "Type", "SI", "Marrow", "Lung", "AI", "Tmax (d)"
            End If
            Write #3, nukex$, Typex$, hc(1), hc(2), hc(3), hc(4), Tcomp(ix)
         Else
            If ix = 1 Then
               Write #3, "Absorbed Dose (Gy/Bq)"
               Write #3, "Nuclide", "Type", "SI", " ", "Marrow", " ", "Lung", " ", "AI", " ", "Tmax (d)"
               Write #3, "Low", "High", "Low", "High", "Low", "High", "Low", "High"
            End If
            Write #3, nukex$, Typex$, hc(1), hc(5), hc(2), hc(6), hc(3), hc(7), _
              hc(4), hc(8), Tcomp(ix)
         End If
      End If
   Next ix
   Close #2
   Close #3
End Sub

'-------------------------------------------------------------------------
 Sub Readem(times(), dl(), dh(), irec, n, LETflag$)
'-------------------------------------------------------------------------
   For i = 1 To n
      For j = 1 To 4
         dl(i, j) = 0#
         dh(i, j) = 0#
      Next j
   Next i
   If LETflag$ = "L" Then
      For i = 1 To n
         Get #2, irec + i, DoseDat
         times(i) = Val(DoseDat.Tim)
         For j = 1 To 4
            dl(i, j) = Val(DoseDat.din(j))
         Next j
      Next i
   ElseIf LETflag$ = "H" Then
      For i = 1 To n
         Get #2, irec + i, DoseDat
         times(i) = Val(DoseDat.Tim)
         For j = 1 To 4
            dh(i, j) = Val(DoseDat.din(j))
         Next j
      Next i
   ElseIf LETflag$ = "B" Then
      For i = 1 To n
         irec = irec + 1
         Get #2, irec, DoseDat
         times(i) = Val(DoseDat.Tim)
         For j = 1 To 4
            dl(i, j) = Val(DoseDat.din(j))
         Next j
         irec = irec + 1
         Get #2, irec, DoseDat
         For j = 1 To 4
            dh(i, j) = Val(DoseDat.din(j))
         Next j
      Next i
   Else
' ERROR TRAP HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   End If
 End Sub
