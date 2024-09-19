VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmReport_UI_Probs 
   Caption         =   "Error Report"
   ClientHeight    =   4860
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8595
   HelpContextID   =   1033000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4860
   ScaleWidth      =   8595
   Tag             =   "ForeVB DB=F:\PROJECTS\RASCAL3\ST-Dose\Help\std3.dba"
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin MSComDlg.CommonDialog dlgCommon 
      Left            =   7440
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "&Help"
      Height          =   375
      Left            =   7080
      TabIndex        =   12
      Top             =   3600
      Width           =   1335
   End
   Begin VB.TextBox txtErrorProcedureName 
      Height          =   405
      Left            =   1920
      TabIndex        =   9
      Text            =   "unknown"
      Top             =   4200
      WhatsThisHelpID =   2033005
      Width           =   4815
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   7080
      TabIndex        =   8
      Top             =   4200
      Width           =   1335
   End
   Begin VB.TextBox txtErrorModuleName 
      Height          =   375
      Left            =   1920
      TabIndex        =   7
      Text            =   "unknown"
      Top             =   3600
      WhatsThisHelpID =   2033004
      Width           =   4815
   End
   Begin VB.TextBox txtErrorSeverity 
      Height          =   285
      Left            =   5160
      TabIndex        =   5
      Text            =   "unknown"
      Top             =   360
      WhatsThisHelpID =   2033002
      Width           =   1575
   End
   Begin VB.TextBox txtErrorDescription 
      Height          =   1695
      Left            =   1920
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "UIprobs.frx":0000
      Top             =   960
      WhatsThisHelpID =   2033003
      Width           =   4815
   End
   Begin VB.TextBox txtErrorNumber 
      Height          =   285
      Left            =   1920
      TabIndex        =   1
      Text            =   "-1"
      Top             =   360
      WhatsThisHelpID =   2033001
      Width           =   735
   End
   Begin VB.Label lblProcedure 
      Caption         =   "Message"
      Height          =   255
      Left            =   960
      TabIndex        =   11
      Top             =   4320
      Width           =   735
   End
   Begin VB.Label lblModule 
      Caption         =   "Module"
      Height          =   255
      Left            =   960
      TabIndex        =   10
      Top             =   3720
      Width           =   735
   End
   Begin VB.Label lblErrorLocation 
      Caption         =   "Error location:"
      Height          =   255
      Left            =   480
      TabIndex        =   6
      Top             =   3240
      Width           =   1215
   End
   Begin VB.Label lblSeverity 
      Caption         =   "Severity:"
      Height          =   375
      Left            =   3600
      TabIndex        =   4
      Top             =   360
      Width           =   1335
   End
   Begin VB.Label lblErrorDescription 
      Caption         =   "Error Description:"
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label lblErrorNumber 
      Caption         =   "Error number:"
      Height          =   255
      Left            =   600
      TabIndex        =   0
      Top             =   360
      Width           =   975
   End
End
Attribute VB_Name = "frmReport_UI_Probs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'------------------------------------------------------------------------
' File:         UIProbs.FRM   frmReport_UI_Probs
'
' Written by:   GF Athey
'
' Description: displays error messages
'
'------------------------------------------------------------------------
Option Explicit
Private Const MODULE_NAME As String = "frmReport_UI_Probs"

Private Sub cmdHelp_Click()
   Const PROCEDURE_NAME As String = "cmdHelp_Click"
 
   On Error GoTo Error_Handler
 
   dlgCommon.HelpCommand = cdlHelpContext
   dlgCommon.ShowHelp
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub cmdOK_Click()
 
   Unload Me
 
End Sub

Private Sub Form_Load()
   Const PROCEDURE_NAME As String = "Form_Load"
   On Error GoTo Error_Handler
   
   PositionForm Me
   
   txtErrorNumber = Format(gud_PrgErr.Number, "00000")
   txtErrorSeverity = Format(gud_PrgErr.Severity, "00")
   txtErrorDescription = gud_PrgErr.Description
   txtErrorModuleName = gud_PrgErr.Module
   txtErrorProcedureName = gud_PrgErr.Procedure
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
  cmdOK_Click
End Sub
