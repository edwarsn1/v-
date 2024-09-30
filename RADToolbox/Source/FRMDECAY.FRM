VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{827E9F53-96A4-11CF-823E-000021570103}#1.0#0"; "GRAPHS32.OCX"
Begin VB.Form frmDecayViewer 
   Appearance      =   0  'Flat
   BackColor       =   &H80000000&
   Caption         =   "Decay Chain Viewer"
   ClientHeight    =   7455
   ClientLeft      =   1425
   ClientTop       =   1740
   ClientWidth     =   11880
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   497
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   792
   Begin VB.VScrollBar VScroll1 
      Height          =   7215
      LargeChange     =   100
      Left            =   11520
      Max             =   1000
      SmallChange     =   10
      TabIndex        =   2
      Top             =   240
      Width           =   255
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   150
      Left            =   240
      Max             =   1500
      SmallChange     =   15
      TabIndex        =   1
      Top             =   7200
      Width           =   11295
   End
   Begin VB.PictureBox pic1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000009&
      BorderStyle     =   0  'None
      FillColor       =   &H00FFFFFF&
      ForeColor       =   &H8000000E&
      Height          =   7215
      Left            =   240
      ScaleHeight     =   481
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   753
      TabIndex        =   0
      Top             =   0
      Width           =   11295
      Begin GraphsLib.Graph pic2 
         Height          =   21000
         Left            =   120
         TabIndex        =   3
         Top             =   -240
         Width           =   24000
         _Version        =   393216
         _ExtentX        =   42333
         _ExtentY        =   37042
         _StockProps     =   96
         BorderStyle     =   1
         Background      =   "15~15~15~-1~-1~-1~-1"
         PrintStyle      =   3
      End
   End
   Begin MSComDlg.CommonDialog dlgCommon 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Menu mnuOK 
      Caption         =   "&OK"
      NegotiatePosition=   1  'Left
   End
   Begin VB.Menu mnuPrint 
      Caption         =   "Print"
   End
End
Attribute VB_Name = "frmDecayViewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'------------------------------------------------------------------------
' File:         Frmdecay.FRM   frmDecayViewer
'
' Written by:   AL Sjoreen
' Updated:      20-January-1999
'
' Description: implements viewing of decay chain graphics
'
'------------------------------------------------------------------------
Option Explicit
Private Const MODULE_NAME As String = "frmDecayViewer"

Private Sub cmdOK_Click()
Const PROCEDURE_NAME As String = "cmdOK_Click"
  Dim R As Integer
  On Error GoTo Error_Handler
  
  R = GSClearView(0)
  Unload frmDecayViewer
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error


End Sub

Private Sub mnuPrint_Click()
Const PROCEDURE_NAME As String = "mnuPrint_Click"
Dim R As Integer

  dlgCommon.CancelError = True
  On Error GoTo Print_Cancel
  dlgCommon.ShowPrinter
  On Error GoTo Error_Handler
   
  frmDecayViewer.HScroll1.Value = 0
  frmDecayViewer.VScroll1.Value = 0
  
  R = GSOpenPrn("", "", 4)
  R = GSPrnOut(0, 1, 2)
  R = GSClosePrn()
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

Print_Cancel:
End Sub

Private Sub Form_Load()
Const PROCEDURE_NAME As String = "Form_Load"
On Error GoTo Error_Handler

  PositionForm frmDecayViewer
  X_Org = 0
  Y_Org = 0
  SWidth = GSGetSXExt()
  SHgt = GSGetSYExt()
  With frmDecayViewer
    .pic1.Move 0, 0, .ScaleWidth - .VScroll1.Width, _
      .ScaleHeight - (.HScroll1.Height * 3)
    .pic2.Move 0, 0
    
    .HScroll1.Top = SHgt
    .HScroll1.Left = 0
    .HScroll1.Width = SWidth
    .VScroll1.Top = 0
    .VScroll1.Left = SWidth
    .VScroll1.Height = SHgt
  End With
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub Form_Resize()
Const PROCEDURE_NAME As String = "Form_Resize"
On Error GoTo Error_Handler

  pic1.Height = frmDecayViewer.Height - (HScroll1.Height * 3)
  pic1.Width = frmDecayViewer.Width
  pic1.Move 0, 0, ScaleWidth - VScroll1.Width, ScaleHeight - (HScroll1.Height * 3)
   
  pic2.Move 0, 0
  
  HScroll1.Top = pic1.Height
  HScroll1.Left = 0
  HScroll1.Width = pic1.Width
  
  VScroll1.Top = 0
  VScroll1.Left = pic1.Width
  VScroll1.Height = pic1.Height
  HScroll1.Max = pic2.Width - pic1.Width
  VScroll1.Max = pic2.Height - pic1.Height
  Call Display_Chain
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub Form_Unload(Cancel As Integer)
  mnuOK_Click
End Sub

Private Sub Hscroll1_Change()
Const PROCEDURE_NAME As String = "Hscroll1_Change"
On Error GoTo Error_Handler

  X_Org = HScroll1.Value
  Call Display_Chain
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub mnuOK_Click()
Const PROCEDURE_NAME As String = "mnuOK_Click"
  Dim R As Integer
  On Error GoTo Error_Handler
  
  R = GSClearView(0)
  Unload frmDecayViewer
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub pic2_SDKPaint()
Const PROCEDURE_NAME As String = "pic2_SDKPaint"
  Call Display_Chain
End Sub

Private Sub Vscroll1_Change()
Const PROCEDURE_NAME As String = "Vscroll1_Change"
On Error GoTo Error_Handler

  Y_Org = -VScroll1.Value
  Call Display_Chain
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

