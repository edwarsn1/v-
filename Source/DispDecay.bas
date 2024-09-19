Attribute VB_Name = "modSelect"
' file: DispDecay.bas  modSelect
Option Explicit
Const MODULE_NAME As String = "modSelec.bas"

  Dim H As Single, X_Scale As Single, Y_Scale As Single
  Dim Half_H As Single, Half_X As Single, Half_Y As Single
  Dim Nuclide As String * 8

Sub ReadDecayChain(lDecayNuc As Long, NucName As String, ReturnedNuc As String, SA_Units As String)
  Const PROCEDURE_NAME As String = "ReadDecayChain"
' this one is called from external dose factors with daughters
  Dim Return_Err As String * 1, MD As String * 50, SAU As String * 25
  Dim sErrorFile As String, sID As String * 5, SAD As String * 9
  Dim FN As String, i As Integer, a As Double, AI As Double
  Dim sTime As String * 10
  
  On Error GoTo Error_Handler
  
  Nuclide = NucName
  MD = App.Path
  SAU = SA_Units
  SAD = gs_SA_Units
  If ReturnedNuc = "Risk" Then
    Return_Err = "R"
  Else
    Return_Err = "I"
  End If
  sID = Str(lDecayNuc)
  sTime = "1.0"
  Call Write_Chain_Activity(sID, Nuclide, MD, Return_Err, sTime, "hours")
   
   If Return_Err <> " " Then
      sErrorFile = gs_TempPath & gs_DrawChain_Error_FileName
 
      If Len(Dir$(sErrorFile)) Then
         Call ReportCalcError("DrawChain", sErrorFile)
         GoTo Display_Abort
      Else
         sErrorFile = gs_TempPath & "temp.err"
         FN = FreeFile
         Open sErrorFile For Output As #FN
         Print #FN, "W 0000 Problem with extracting nuc data " & _
           "but could not create the error log file"
         Close FN
         Call ReportCalcError("DrawChain", sErrorFile)
         GoTo Display_Abort
      End If
   End If
 
   FN = gs_TempPath & "display.txt"
   Open FN For Input As #10
   Input #10, gn_DauCount(gn_Parent)
   For i = 1 To gn_DauCount(gn_Parent)
     Input #10, gs_NucNames(i, gn_Parent), a, AI
   Next i
   Close #10
  
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

Display_Abort:

End Sub

Sub ShowSummary(lDecayNuc As Long, NucName As String, ReturnedNuc As String, SA_Units As String)
  Const PROCEDURE_NAME As String = "ShowSummary"
  Dim Return_Err As String * 1, MD As String * 50, SAU As String * 25
  Dim sErrorFile As String, nFN As Integer, sID As String * 5, SAD As String * 9
  
  On Error GoTo Error_Handler
  
  Nuclide = NucName
  MD = App.Path
  SAU = SA_Units
  SAD = gs_SA_Units
  If ReturnedNuc = "JAERI" Then
    Return_Err = "J"
  Else
    Return_Err = "I"
  End If
  sID = Str(lDecayNuc)
  Call Write_Summary(sID, Nuclide, MD, Return_Err, SAU, SAD)
   
   If Return_Err <> " " Then
      sErrorFile = gs_TempPath & gs_DrawChain_Error_FileName
 
      If Len(Dir$(sErrorFile)) Then
         Call ReportCalcError("DrawChain", sErrorFile)
         GoTo Display_Abort
      Else
         sErrorFile = gs_TempPath & "temp.err"
         nFN = FreeFile
         Open sErrorFile For Output As #nFN
         Print #nFN, "W 0000 Problem with display of nuc data " & _
           "but could not create the error log file"
         Close nFN
         Call ReportCalcError("DrawChain", sErrorFile)
         GoTo Display_Abort
      End If
   End If
 
  gView_File_Name = gs_TempPath & "display.txt"
  frmFileViewer.Caption = "Summary Table for " & NucName
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing
  
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

Display_Abort:

End Sub

Sub ShowDecayData(lDecayNuc As Long, NucName As String, ReturnedNuc As String, SA_Units As String)
  Const PROCEDURE_NAME As String = "ShowDecayData"
  Dim Return_Err As String * 1, MD As String * 50, SAU As String * 25
  Dim sErrorFile As String, nFN As Integer, sID As String * 5, SAD As String * 9
  
  On Error GoTo Error_Handler
  
  Nuclide = NucName
  MD = App.Path
  SAU = SA_Units
  SAD = gs_SA_Units
  If ReturnedNuc = "JAERI" Then
    Return_Err = "J"
  Else
    Return_Err = "I"
  End If
  sID = Str(lDecayNuc)
  Call Write_Chain(sID, Nuclide, MD, Return_Err, SAU, SAD)
   
   If Return_Err <> " " Then
      sErrorFile = gs_TempPath & gs_DrawChain_Error_FileName
 
      If Len(Dir$(sErrorFile)) Then
         Call ReportCalcError("DrawChain", sErrorFile)
         GoTo Display_Abort
      Else
         sErrorFile = gs_TempPath & "temp.err"
         nFN = FreeFile
         Open sErrorFile For Output As #nFN
         Print #nFN, "W 0000 Problem with display of nuc data " & _
           "but could not create the error log file"
         Close nFN
         Call ReportCalcError("DrawChain", sErrorFile)
         GoTo Display_Abort
      End If
   End If
 
  gView_File_Name = gs_TempPath & "display.txt"
  frmFileViewer.Caption = "Decay Data Table for " & NucName
  frmFileViewer.lblDecay.Visible = True
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing
  
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

Display_Abort:

End Sub
Sub ShowDecayActivity(lDecayNuc As Long, NucName As String, _
  DecayT As String, DecayU As String, ReturnedNuc As String)
Const PROCEDURE_NAME As String = "ShowDecayActivity"
  Dim i As Integer, ret As Long, Chain_Count
  Dim Names(30) As String
  Dim a(30) As Double, AI(30) As Double
  Dim DecT As String * 10, DecU As String * 10
  Dim Return_Err As String * 1, MD As String * 50
  Dim sErrorFile As String, nFN As Integer, sID As String * 5
  On Error GoTo Error_Handler
  
  sID = Str(lDecayNuc)
  MD = App.Path
  If ReturnedNuc = "JAERI" Then
    Return_Err = "J"
  Else
    Return_Err = "I"
  End If
  Nuclide = NucName
  DecT = DecayT
  DecU = DecayU
 
  Call Write_Chain_Activity(sID, Nuclide, MD, Return_Err, DecT, DecU)
   If Return_Err <> " " Then
      sErrorFile = gs_TempPath & gs_DrawChain_Error_FileName
      If Len(Dir$(sErrorFile)) Then
         Call ReportCalcError("DrawChain", sErrorFile)
      Else
         sErrorFile = gs_TempPath & "temp.err"
         nFN = FreeFile
         Open sErrorFile For Output As #nFN
         Print #nFN, "W 0000 Problem with display of nuc data " & _
           "but could not create the error log file"
         Close nFN
         Call ReportCalcError("DrawChain", sErrorFile)
      End If
      GoTo Display_Abort
   End If
 
'  gView_File_Name = gs_TempPath & "display.txt"
'  Open gView_File_Name For Input As #88
'  Input #88, Chain_Count
'  For i = 1 To Chain_Count
'    Input #88, Names(i), a(i), AI(i)
'  Next i
'  Close #88
  frmDisplayDecayCalc.Caption = "Decay Calculations for " & NucName & _
    " for " & DecayT & " " & DecayU
  Load frmDisplayDecayCalc
  frmDisplayDecayCalc.Show vbModal
  Set frmDisplayDecayCalc = Nothing
  
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
   
Display_Abort:

End Sub

Sub ShowDecayChain(lDecayNuc As Long, NucName As String, ReturnedNuc As String)
Const PROCEDURE_NAME As String = "ShowDecayChain"
  Dim i As Integer, ret As Long
  Dim Max_X As Single, Max_Y As Single, String_Count As Integer
  Dim Return_Err As String * 1, MD As String * 50
  Dim sErrorFile As String, nFN As Integer, sID As String * 5
  On Error GoTo Error_Handler
  
  sID = Str(lDecayNuc)
  MD = App.Path
  If ReturnedNuc = "JAERI" Then
    Return_Err = "J"
  Else
    Return_Err = "I"
  End If
  Nuclide = NucName
 
  Call Draw_Chain(sID, Nuclide, MD, Return_Err)
   If Return_Err <> " " Then
      sErrorFile = gs_TempPath & gs_DrawChain_Error_FileName
      If Len(Dir$(sErrorFile)) Then
         Call ReportCalcError("DrawChain", sErrorFile)
      Else
         sErrorFile = gs_TempPath & "temp.err"
         nFN = FreeFile
         Open sErrorFile For Output As #nFN
         Print #nFN, "W 0000 Problem with display of nuc data " & _
           "but could not create the error log file"
         Close nFN
         Call ReportCalcError("DrawChain", sErrorFile)
      End If
      GoTo Display_Abort
   End If
 
  If (frmDecayViewer.HScroll1.Value = 0 And _
      frmDecayViewer.VScroll1.Value = 0) Then
      Call Display_Chain
  End If
  frmDecayViewer.HScroll1.Value = 0
  frmDecayViewer.VScroll1.Value = 0
  X_Org = 0
  Y_Org = 0
   
  gView_File_Name = gs_TempPath & "display.tmp"
  Open gView_File_Name For Input As #88
  Input #88, String_Count, Max_X, Max_Y
  Close #88
  
  If (Max_Y * 60 < frmDecayViewer.pic1.Height) Then
    frmDecayViewer.pic2.Height = frmDecayViewer.pic1.Height
  Else
    frmDecayViewer.pic2.Height = Max_Y * 60
  End If
  If (Max_X * 150 < frmDecayViewer.pic1.Width) Then
    frmDecayViewer.pic2.Width = frmDecayViewer.pic1.Width
  Else
    frmDecayViewer.pic2.Width = Max_X * 150
  End If
  frmDecayViewer.HScroll1.Max = frmDecayViewer.pic2.Width - frmDecayViewer.pic1.Width
  frmDecayViewer.VScroll1.Max = frmDecayViewer.pic2.Height - frmDecayViewer.pic1.Height

  frmDecayViewer.Caption = "Decay Chain for " & NucName
  frmDecayViewer.Show vbModal
  Set frmDecayViewer = Nothing
  
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
   
Display_Abort:

End Sub

Sub Display_Chain()
Const PROCEDURE_NAME As String = "Display_Chain"
  
  Dim Decay_String As String, Branch As String, Aro_Str(38) As String
  Dim Dec_Mode As String * 2, Arrow As String * 2
  Dim x As Single, y As Single, Max_X As Single, Max_Y As Single, _
    DTop As Single
  Dim l1 As Long, N_Aro_Strs As Long, _
    N_Nuc_Strs As Long, N_Str_Len(38) As Long, X_Offset As Long
  Dim X_Str(38) As Long, Y_Str(38) As Long, X_unit As Long
  Dim X_Aro(38) As Long, Y_Aro(38) As Long, Match_X As Long, _
    Match_Y As Long
  Dim String_Count As Integer, i As Integer, R As Integer, _
    j As Integer
  On Error GoTo Error_Handler
  

  l1 = GSSetBG(15)
  R = GSClearView(1)
  H = GSGetRTextHt(2, 0, "X")
  X_Scale = H * 6#
  Y_Scale = H * 3#
  Half_H = H / 2#
  Half_X = X_Scale / 2.1
  Half_Y = Y_Scale / 2#
  DTop = frmDecayViewer.pic2.SDKInfo(8) + frmDecayViewer.pic2.SDKInfo(6)
  DTop = DTop * 1.1
  X_unit = X_Scale
  X_unit = X_unit
'  frmDecayViewer.pic2.FontSize = 50

  N_Nuc_Strs = 0
  N_Aro_Strs = 0
  gView_File_Name = gs_TempPath & "display.tmp"
  Open gView_File_Name For Input As #88
  Input #88, String_Count, Max_X, Max_Y

  For i = 0 To String_Count - 1
    Input #88, x, y, Decay_String
    x = x * X_Scale
    y = y * Y_Scale
    y = DTop - y
    x = x - X_Org
    y = y - Y_Org
    
    If Mid$(Decay_String, 1, 1) <> "!" Then
      R = GSRText(x - Half_X, y - Half_H, 2, 0, 0, Trim$(Decay_String))
      N_Nuc_Strs = N_Nuc_Strs + 1
      N_Str_Len(N_Nuc_Strs) = GSGetRTextWid(2, 0, Trim$(Decay_String))
      N_Str_Len(N_Nuc_Strs) = N_Str_Len(N_Nuc_Strs) / 4#
      X_Str(N_Nuc_Strs) = x
      Y_Str(N_Nuc_Strs) = y
    Else
      Arrow = Mid$(Decay_String, 2, 2)
      If (Arrow = "1 " Or Arrow = "2 " Or Arrow = "3 ") Then
        Arrow = "> "
      End If
      If (Arrow <> "V " And Arrow <> "VD") Then
        N_Aro_Strs = N_Aro_Strs + 1
        Aro_Str(N_Aro_Strs) = Decay_String
        X_Aro(N_Aro_Strs) = x
        Y_Aro(N_Aro_Strs) = y
      Else
        Dec_Mode = Mid$(Decay_String, 4, 2)
        Branch = Mid$(Decay_String, 6)
        Call Draw_Arrow(x, y, Arrow, Branch, 0)
      End If
    End If
  Next i
  Close #88

  For i = 1 To N_Aro_Strs
    Decay_String = Aro_Str(i)
    x = X_Aro(i)
    y = Y_Aro(i)
    Arrow = Mid$(Decay_String, 2, 2)
    If (Arrow = "1 " Or Arrow = "2 " Or Arrow = "3 ") Then
      Arrow = "> "
    End If
    Match_X = x - X_unit
    Match_Y = y
    X_Offset = 0
    For j = 1 To N_Nuc_Strs
      If (Match_X = X_Str(j) And Match_Y = Y_Str(j)) Then
        X_Offset = N_Str_Len(j) * 0.75
        Exit For
      End If
    Next j
    Dec_Mode = Mid$(Decay_String, 4, 2)
    Branch = Mid$(Decay_String, 6)
    Call Draw_Arrow(x, y, Arrow, Branch, X_Offset)

  Next i

  frmDecayViewer.pic2.SDKPaint = 1
  
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub
    
Sub Draw_Arrow(x As Single, y As Single, _
  Arrow As String, Branch As String, X_Offset As Long)
Const PROCEDURE_NAME As String = "Draw_Arrow"
  Dim R As Integer, TextX As Long, TextY As Long
  On Error GoTo Error_Handler

'  draw arrow shafts and print branching fraction
  TextX = X_Scale * 0.6
  TextY = Y_Scale * 0.3
  Select Case Arrow
    
    Case "> ", "< "
      If Len(Trim(Branch)) > 0 Then
'        R = GSRText(x - (Half_X / 2#), y + 10#, 2, 0, 0, _
'          Trim$(Branch))
        R = GSVText(x - (Half_X / 2#), y + 10, TextX, TextY, 0, _
          0, 0, 0, Trim$(Branch))
      End If
      R = GSLineAbs(x + X_Offset, y + 1, x + Half_X, _
        y + 1, 5, 2, 0)
    
    Case "V "
      If Len(Trim(Branch)) > 0 Then
'        R = GSRText(x + 5, y, 2, 0, 0, Trim$(Branch))
        R = GSVText(x + 5, y, TextX, TextY, 0, _
          0, 0, 0, Trim$(Branch))
      End If
      R = GSLineAbs(x, y - Half_Y, x, y + (1.5 * Half_Y), 5, 2, 0)
    
    Case "VD"
      If Len(Trim(Branch)) > 0 Then
        R = GSVText(x + 3, y, TextX, TextY, 0, _
          0, 0, 0, Trim$(Branch))
      End If
      R = GSLineAbs(x - 1, y - Half_Y + 1, x - 2, y + (1.5 * Half_Y), 5, 2, 0)
      R = GSLineAbs(x + 1, y - Half_Y + 1, x + 2, y + (1.5 * Half_Y), 5, 2, 0)
    
    Case "\D", "\U"
      If Len(Trim(Branch)) > 0 Then
        R = GSVText(x + (TextX / 2), y + (TextY / 2) - Half_H, TextX, TextY, -30, _
          0, 2, 0, Trim$(Branch))
      End If
      R = GSLineAbs(x + Half_X + X_Offset, y - Half_Y, x - Half_X, y + Half_Y, 5, 2, 0)
    
    Case "/D", "/U"
      If Len(Trim(Branch)) > 0 Then
        R = GSVText(x + 20, y + 20 - Half_H, TextX, TextY, 30, _
          0, 2, 0, Trim$(Branch))
      End If
      R = GSLineAbs(x - Half_X + X_Offset, y - Half_Y + 1, x + Half_X, _
        y + Half_Y, 5, 2, 0)
  
  End Select

' draw arrow heads
  Select Case Arrow
    
    Case "> "
      R = GSLineAbs(x + Half_X, y + 1, x + Half_X - (X_Scale / 12), _
        y + 1 - (X_Scale / 12#), 5, 2, 0)
      R = GSLineAbs(x + Half_X, y + 1, x + Half_X - (X_Scale / 12#), _
        y + 1 + (X_Scale / 12#), 5, 2, 0)
    
    Case "< "
      R = GSLineAbs(x + X_Offset, y + 1, _
        x + X_Offset + (X_Scale / 12#), _
        y + 1 - (X_Scale / 12#), 5, 2, 0)
      R = GSLineAbs(x + X_Offset, y + 1, _
        x + X_Offset + (X_Scale / 12#), _
        y + 1 + (X_Scale / 12#), 5, 2, 0)
    
    Case "V ", "VD"
      R = GSLineAbs(x, y - Half_Y, x - (X_Scale / 12#), _
        y - Half_Y + (X_Scale / 12#), 5, 2, 0)
      R = GSLineAbs(x, y - Half_Y, x + (X_Scale / 12#), _
        y - Half_Y + (X_Scale / 12#), 5, 2, 0)
    
    Case "\D"
      R = GSLineAbs(x + Half_X + X_Offset, y - Half_Y, x + Half_X + X_Offset, _
        y - Half_Y + (X_Scale / 12#), 5, 2, 0)
      R = GSLineAbs(x + Half_X + X_Offset, y - Half_Y, x + Half_X + X_Offset - (X_Scale / 12#), _
        y - Half_Y * 1.1, 5, 2, 0)
    
    Case "\U"
      R = GSLineAbs(x - Half_X + X_Offset, y + Half_Y, x - Half_X + X_Offset, _
        y + Half_Y - (X_Scale / 12#), 5, 2, 0)
      R = GSLineAbs(x - Half_X + X_Offset, y + Half_Y, x - Half_X + X_Offset + (X_Scale / 12#), _
        y + Half_Y * 1.1, 5, 2, 0)
    
    Case "/D"
      R = GSLineAbs(x - Half_X + X_Offset, y - Half_Y, x - Half_X + X_Offset, _
        y - Half_Y + (X_Scale / 12#), 5, 2, 0)
      R = GSLineAbs(x - Half_X + X_Offset, y - Half_Y, x - Half_X + X_Offset + (X_Scale / 12#), _
        y - Half_Y * 1.1, 5, 2, 0)
    
    Case "/U"
      R = GSLineAbs(x + Half_X + X_Offset, y + Half_Y, x + Half_X + X_Offset, _
        y + Half_Y - (X_Scale / 12#), 5, 2, 0)
      R = GSLineAbs(x + Half_X + X_Offset, y + Half_Y, x + Half_X + X_Offset - (X_Scale / 12#), _
        y + Half_Y * 1.1, 5, 2, 0)
  
  End Select

   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub
Sub Select_mnuExitClick()
Const PROCEDURE_NAME As String = "Select_mnuExitClick"
  Dim lStat As Long
  On Error GoTo Error_Handler
  
  lStat = GSCloseServer()
'  Unload frmPickNuc
'  Set frmPickNuc = Nothing
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub
  
Sub Select_mnuHelpClick()
Const PROCEDURE_NAME As String = "Select_mnuHelpClick"
  On Error GoTo Error_Handler
  
'  frmPickNuc.dlgCommon.HelpFile = "Decay3.hlp"
'  frmPickNuc.dlgCommon.HelpKey = "Contents"
'  frmPickNuc.dlgCommon.HelpCommand = &H101
'  frmPickNuc.dlgCommon.Action = 6
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub
