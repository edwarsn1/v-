VERSION 5.00
Object = "{827E9F53-96A4-11CF-823E-000021570103}#1.0#0"; "graphs32.ocx"
Begin VB.Form frmBetaDisplay 
   Caption         =   "Beta Spectrum Display"
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   7590
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdMonteCarlo 
      Caption         =   "Export to Monte Carlo Input"
      Height          =   375
      Left            =   5280
      TabIndex        =   4
      Top             =   7080
      Width           =   2175
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   7080
      Width           =   1335
   End
   Begin VB.CommandButton cmdExport 
      Caption         =   "Export to Excel Table"
      Height          =   375
      Left            =   2280
      TabIndex        =   2
      Top             =   7080
      Width           =   2055
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8400
      TabIndex        =   1
      Top             =   7080
      Width           =   1335
   End
   Begin GraphsLib.Graph gphBeta 
      Height          =   6615
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   9495
      _Version        =   393216
      _ExtentX        =   16748
      _ExtentY        =   11668
      _StockProps     =   96
      BorderStyle     =   1
      Background      =   "15~-1~-1~-1~-1~-1~-1"
      BottomTitle     =   "E (MeV)_"
      ColorData       =   "16"
      FontSize        =   "200~110~100~100"
      GraphType       =   6
      GridLineStyle   =   2
      GridStyle       =   3
      LeftTitle       =   "Y(E)"
      LeftTitleStyle  =   1
      OverlayColor    =   "0"
      OverlayPattern  =   "3"
      OverlaySymbol   =   "0"
      SymbolData      =   "1"
      ThickLines      =   0
      YLabelText      =   "^"
   End
End
Attribute VB_Name = "frmBetaDisplay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' file frmBetaDisplay.frm
Option Explicit
Const MODULE_NAME As String = "frmBetaDisplay"

Private Sub cmdExport_Click()
Const PROCEDURE_NAME As String = "cmdExport_Click"
 
Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, iC As Integer, Tester
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
  
    For i = 1 To gphBeta.NumPoints
      gsExcel.Cells(i + 2, 1 + gn_ExcelStartColumn).Value = gd_EGrid(i)
      gsExcel.Cells(i + 2, 2 + gn_ExcelStartColumn).Value = gd_BetaSpectrum(i)
    Next i
    i = gphBeta.NumPoints
    gsExcel.Cells(i + 2, 1 + gn_ExcelStartColumn).Value = gd_EGrid(gphBeta.NumPoints)
    gsExcel.Cells(i + 2, 2 + gn_ExcelStartColumn).Value = gd_BetaSpectrum(gphBeta.NumPoints)
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = "beta energy/intensity data"
    gsExcel.Cells(2, 1 + gn_ExcelStartColumn) = "Energy(Mev)"
    gsExcel.Cells(2, 2 + gn_ExcelStartColumn) = "Y(E)"
    gsExcel.Cells(1, 2 + gn_ExcelStartColumn) = gs_NucSelected
    gsExcel.Visible = True
    gn_ExcelStartColumn = gn_ExcelStartColumn + 2 + 1
    Exit Sub

2:  WhichErr = "Open"
' the following line causes the error if Excel is not installed
    Set gsExcel = CreateObject("Excel.Application")
    gsExcel.Workbooks.Add
    gn_ExcelStartColumn = 0
    gsExcel.Visible = False
    GoTo 1

Error_Handler:
  If (WhichErr = "Not Open") Then
    Err.Clear
    Resume 2
  ElseIf (WhichErr = "Open") Then
    MsgBox "Cannot export; Excel is not installed on this computer."
    Exit Sub
  Else
    gud_PrgErr.Number = Err.Number
    gud_PrgErr.Severity = 5
    gud_PrgErr.Description = Err.Description
    gud_PrgErr.Module = MODULE_NAME
    gud_PrgErr.Procedure = PROCEDURE_NAME
    Call Display_UI_Error
  End If
  End Sub

Private Sub cmdMonteCarlo_Click()
Dim sStr As String, ReturnValue As Integer
  sStr = gs_EXEPath & "binbeta " & gs_NucSelected & " "
  'MsgBox sStr
  ReturnValue = Shell(sStr, 1)
  'MsgBox ReturnValue
End Sub

Private Sub cmdOK_Click()
  Me.Hide
End Sub

Private Sub cmdPrint_Click()
  gphBeta.PrintStyle = 2
  gphBeta.GraphTitle = Me.Caption
  gphBeta.DrawMode = graphPrint
End Sub

Private Sub Form_Load()
  PositionForm Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
  cmdOK_Click
End Sub
