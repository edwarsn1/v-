VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{BC098376-8AFB-11CE-90D3-0000C037528B}#4.1#0"; "csopt32.ocx"
Begin VB.Form frmSetSAUnits 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Specific Activity Units Selection"
   ClientHeight    =   5850
   ClientLeft      =   1125
   ClientTop       =   2220
   ClientWidth     =   7200
   HelpContextID   =   1313000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5850
   ScaleWidth      =   7200
   ShowInTaskbar   =   0   'False
   Tag             =   "ForeVB DB=F:\PROJECTS\RASCAL3\ST-Dose\Help\std3.dba"
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   5640
      TabIndex        =   3
      Top             =   5160
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5640
      TabIndex        =   2
      Top             =   4560
      WhatsThisHelpID =   43
      Width           =   1335
   End
   Begin CSOptLib.CSOptList optMassPrefix 
      Height          =   3495
      Left            =   2280
      TabIndex        =   0
      Top             =   2040
      WhatsThisHelpID =   2313001
      Width           =   1875
      _Version        =   262145
      _ExtentX        =   3307
      _ExtentY        =   6165
      _StockProps     =   77
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Contents        =   $"frmsetSAunits.frx":0000
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Prefix"
      ListIndex       =   4
      ToolTip         =   "Mass prefix"
      BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin CSOptLib.CSOptList optActivity 
      Height          =   1215
      Left            =   120
      TabIndex        =   1
      Top             =   120
      WhatsThisHelpID =   2313002
      Width           =   1845
      _Version        =   262145
      _ExtentX        =   3254
      _ExtentY        =   2143
      _StockProps     =   77
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Contents        =   $"frmsetSAunits.frx":0092
      Spacing         =   30
      Caption         =   "Activity"
      ListIndex       =   0
      BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComDlg.CommonDialog dlgCommon 
      Left            =   4800
      Top             =   4320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin CSOptLib.CSOptList optActPrefix 
      Height          =   3495
      Left            =   120
      TabIndex        =   5
      Top             =   2040
      WhatsThisHelpID =   2313001
      Width           =   1875
      _Version        =   262145
      _ExtentX        =   3307
      _ExtentY        =   6165
      _StockProps     =   77
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Contents        =   $"frmsetSAunits.frx":00B1
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Prefix"
      ListIndex       =   4
      ToolTip         =   "Activity prefix"
      BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin CSOptLib.CSOptList optMass 
      Height          =   1695
      Left            =   2280
      TabIndex        =   6
      Top             =   120
      WhatsThisHelpID =   2313002
      Width           =   1845
      _Version        =   262145
      _ExtentX        =   3254
      _ExtentY        =   2990
      _StockProps     =   77
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Contents        =   $"frmsetSAunits.frx":0143
      Spacing         =   30
      Caption         =   "Mass"
      ListIndex       =   0
      BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblConcUnits 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   " Bq / kg"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   5640
      TabIndex        =   7
      Top             =   2160
      WhatsThisHelpID =   2313004
      Width           =   1455
   End
   Begin VB.Label lblUnits 
      Alignment       =   2  'Center
      Caption         =   "Selected Units:"
      Height          =   255
      Left            =   4320
      TabIndex        =   4
      Top             =   2280
      Width           =   1095
   End
End
Attribute VB_Name = "frmSetSAUnits"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmSetSAUnits"

Dim sUnits As String
Dim sMassPrefix As String
Dim sMass As String
Dim sActPrefix As String
Dim sActivity As String

Dim b_FirstPass As Boolean

Dim sa_Prefix(9) As String
Dim sa_Activity(2) As String
Dim sa_Mass(2) As String

Private Sub UpdateOptions()
   Const PROCEDURE_NAME As String = "UpdateOptions"
   
   Dim nChr As Integer
   Dim nStrLen As Integer
 
   On Error GoTo Error_Handler

   sMassPrefix = Mid$(sUnits, 7, 1)
   Select Case sMassPrefix
   Case "T"
      optMassPrefix.ListIndex = 0
   Case "G"
      optMassPrefix.ListIndex = 1
   Case "M"
      optMassPrefix.ListIndex = 2
   Case "k"
      optMassPrefix.ListIndex = 3
   Case " "
      optMassPrefix.ListIndex = 4
   Case "m"
      optMassPrefix.ListIndex = 5
   Case Chr$(181)
      optMassPrefix.ListIndex = 6
   Case "n"
      optMassPrefix.ListIndex = 7
   Case "p"
      optMassPrefix.ListIndex = 8
   Case Else
      optMassPrefix.ListIndex = 4
   End Select
 
   sMass = Mid$(sUnits, 8, 2)
   Select Case sMass
   Case "g "
      optMass.ListIndex = 0
   Case "lb"
      optMass.ListIndex = 1
   Case "oz"
      optMass.ListIndex = 2
   Case Else
      optMass.ListIndex = 0
   End Select
 
   sActPrefix = Left$(sUnits, 1)
   Select Case sActPrefix
   Case "T"
      optActPrefix.ListIndex = 0
   Case "G"
      optActPrefix.ListIndex = 1
   Case "M"
      optActPrefix.ListIndex = 2
   Case "k"
      optActPrefix.ListIndex = 3
   Case " "
      optActPrefix.ListIndex = 4
   Case "m"
      optActPrefix.ListIndex = 5
   Case Chr$(181)
      optActPrefix.ListIndex = 6
   Case "n"
      optActPrefix.ListIndex = 7
   Case "p"
      optActPrefix.ListIndex = 8
   Case Else
      optActPrefix.ListIndex = 4
   End Select
 
   sActivity = Mid$(sUnits, 2, 2)
   Select Case sActivity
   Case "Bq"
      optActivity.ListIndex = 0
   Case "Ci"
      optActivity.ListIndex = 1
   Case Else
      optActivity.ListIndex = 0
   End Select
  
   If Not b_FirstPass Then UpdateUnitsString
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Sub UpdateUnitsString()
   Const PROCEDURE_NAME As String = "UpdateUnitsString"
   On Error GoTo Error_Handler
 
   sUnits = sa_Prefix(optActPrefix.ListIndex) & _
            sa_Activity(optActivity.ListIndex) & " / " & _
            sa_Prefix(optMassPrefix.ListIndex) & _
            sa_Mass(optMass.ListIndex)

   lblConcUnits = sUnits
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Private Sub cmdCancel_Click()
   Const PROCEDURE_NAME As String = "cmdCancel_Click"
   On Error GoTo Error_Handler
 
   gb_SetUnits_Result = False
   gb_ButtonPressed = True
   Me.Hide
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
   Const PROCEDURE_NAME As String = "cmdOK_Click"
   On Error GoTo Error_Handler
 
   gsMass_Prefix = sa_Prefix(optMassPrefix.ListIndex)
   gsMass_Unit = sa_Mass(optMass.ListIndex)
   gsSAct_Prefix = sa_Prefix(optActPrefix.ListIndex)
   gsSAct_Unit = sa_Activity(optActivity.ListIndex)
   gb_SetUnits_Result = True
   gb_ButtonPressed = True
   gd_SAFactor = fnd_Units_Factor("SA", Me, Me)

   Me.Hide
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
   Const PROCEDURE_NAME As String = "Form_KeyDown"
   On Error GoTo Error_Handler
 
'   If KeyCode = vbKeyF1 Then
'      dlgCommon.HelpContext = Me.HelpContextID
'      dlgCommon.HelpCommand = cdlHelpContext
'      dlgCommon.ShowHelp
'   End If
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Private Sub Form_Load()
   Const PROCEDURE_NAME As String = "Form_Load"
   On Error GoTo Error_Handler
 
   PositionForm Me
   
   b_FirstPass = True
 
   sa_Prefix(0) = "T"
   sa_Prefix(1) = "G"
   sa_Prefix(2) = "M"
   sa_Prefix(3) = "k"
   sa_Prefix(4) = " "
   sa_Prefix(5) = "m"
   sa_Prefix(6) = Chr$(181)
   sa_Prefix(7) = "n"
   sa_Prefix(8) = "p"
   
   sa_Mass(0) = "g "
   sa_Mass(1) = "lb"
   sa_Mass(2) = "oz"
 
   sa_Activity(0) = "Bq"
   sa_Activity(1) = "Ci"
   
   lblConcUnits_Change
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
  If Not gb_AllDone Then
    Cancel = 1
    If Not gb_ButtonPressed Then
      cmdOK_Click
    Else
      gb_ButtonPressed = False
    End If
  End If
End Sub

Private Sub lblConcUnits_Change()
   Const PROCEDURE_NAME As String = "lblConcUnits_Change"
   On Error GoTo Error_Handler
 
     If b_FirstPass Then
        sUnits = gs_SA_Units
        UpdateOptions
        b_FirstPass = False
     End If
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Private Sub optMass_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optMassPrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optActivity_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
Private Sub optActPrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
