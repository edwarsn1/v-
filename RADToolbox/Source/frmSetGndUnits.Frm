VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{BC098376-8AFB-11CE-90D3-0000C037528B}#4.1#0"; "csopt32.ocx"
Begin VB.Form frmSetGndUnits 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ground Surface Dose Factors Units Selection"
   ClientHeight    =   5445
   ClientLeft      =   1125
   ClientTop       =   2220
   ClientWidth     =   9060
   HelpContextID   =   1313000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5445
   ScaleWidth      =   9060
   ShowInTaskbar   =   0   'False
   Tag             =   "ForeVB DB=F:\PROJECTS\RASCAL3\ST-Dose\Help\std3.dba"
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   7440
      TabIndex        =   4
      Top             =   4800
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   7440
      TabIndex        =   3
      Top             =   4200
      WhatsThisHelpID =   43
      Width           =   1335
   End
   Begin CSOptLib.CSOptList optDosePrefix 
      Height          =   3495
      Left            =   120
      TabIndex        =   0
      Top             =   1560
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
      Contents        =   $"frmSetGndUnits.frx":0000
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Prefix"
      ListIndex       =   4
      ToolTip         =   "Dose prefix"
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
      Left            =   2400
      TabIndex        =   1
      Top             =   240
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
      Contents        =   $"frmSetGndUnits.frx":0092
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
   Begin CSOptLib.CSOptList optArea 
      Height          =   1575
      Left            =   6480
      TabIndex        =   2
      Top             =   240
      WhatsThisHelpID =   2313003
      Width           =   2445
      _Version        =   262145
      _ExtentX        =   4313
      _ExtentY        =   2778
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
      Contents        =   $"frmSetGndUnits.frx":00B1
      Spacing         =   30
      Caption         =   "Area"
      ListIndex       =   1
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
      Left            =   6360
      Top             =   4680
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin CSOptLib.CSOptList optTime 
      Height          =   2175
      Left            =   4560
      TabIndex        =   6
      Top             =   240
      WhatsThisHelpID =   2313003
      Width           =   1605
      _Version        =   262145
      _ExtentX        =   2831
      _ExtentY        =   3836
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
      Contents        =   $"frmSetGndUnits.frx":00F8
      Spacing         =   30
      Caption         =   "Time"
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
   Begin CSOptLib.CSOptList optActPrefix 
      Height          =   3495
      Left            =   2400
      TabIndex        =   7
      Top             =   1560
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
      Contents        =   $"frmSetGndUnits.frx":012A
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
   Begin CSOptLib.CSOptList optDose 
      Height          =   1215
      Left            =   120
      TabIndex        =   8
      Top             =   240
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
      Contents        =   $"frmSetGndUnits.frx":01BC
      Spacing         =   30
      Caption         =   "Dose"
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
      Caption         =   " Sv  /  Bq s m^-2"
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
      Left            =   5880
      TabIndex        =   9
      Top             =   2760
      WhatsThisHelpID =   2313004
      Width           =   2655
   End
   Begin VB.Label lblUnits 
      Alignment       =   2  'Center
      Caption         =   "Selected Units:"
      Height          =   255
      Left            =   4680
      TabIndex        =   5
      Top             =   2760
      Width           =   1095
   End
End
Attribute VB_Name = "frmSetGndUnits"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmSetGndUnits"

Dim sUnits As String, sUnitsInternal As String
Dim sDosePrefix As String
Dim sDose As String
Dim sActPrefix As String
Dim sActivity As String
Dim sTime As String
Dim sArea As String

Dim b_FirstPass As Boolean

Dim sa_Prefix(9) As String
Dim sa_Activity(2) As String
Dim sa_Area(4) As String
Dim sa_Dose(2) As String
Dim sa_Time(4) As String

Private Sub UpdateOptions()
   Const PROCEDURE_NAME As String = "UpdateOptions"
   
   Dim nChr As Integer
   Dim nStrLen As Integer
 
   On Error GoTo Error_Handler

   sDosePrefix = Left$(sUnits, 1)
   Select Case sDosePrefix
   Case "T"
      optDosePrefix.ListIndex = 0
   Case "G"
      optDosePrefix.ListIndex = 1
   Case "M"
      optDosePrefix.ListIndex = 2
   Case "k"
      optDosePrefix.ListIndex = 3
   Case " "
      optDosePrefix.ListIndex = 4
   Case "m"
      optDosePrefix.ListIndex = 5
   Case Chr$(181)
      optDosePrefix.ListIndex = 6
   Case "n"
      optDosePrefix.ListIndex = 7
   Case "p"
      optDosePrefix.ListIndex = 8
   Case Else
      optDosePrefix.ListIndex = 4
   End Select
 
   sDose = Mid$(sUnits, 2, 3)
   Select Case sDose
   Case "Sv "
      optDose.ListIndex = 0
   Case "rem"
      optDose.ListIndex = 1
   Case Else
      optDose.ListIndex = 0
   End Select
 
   sActPrefix = Mid$(sUnits, 8, 1)
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
 
   sActivity = Mid$(sUnits, 9, 2)
   Select Case sActivity
   Case "Bq"
      optActivity.ListIndex = 0
   Case "Ci"
      optActivity.ListIndex = 1
   Case Else
      optActivity.ListIndex = 0
   End Select
 
   sTime = Mid$(sUnits, 12, 1)
   Select Case sTime
   Case "s"
      optTime.ListIndex = 0
   Case "m"
      optTime.ListIndex = 1
   Case "h"
      optTime.ListIndex = 2
   Case "y"
      optTime.ListIndex = 3
   Case Else
      optTime.ListIndex = 0
   End Select
 
   nStrLen = Len(sUnits)
   sArea = Mid$(sUnits, 14, nStrLen - 13)
   Select Case Trim$(sArea)
   Case "cm^-2"
      optArea.ListIndex = 0
   Case "ft^-2"
      optArea.ListIndex = 2
   Case "m^-2"
      optArea.ListIndex = 1
   Case Else
      optArea.ListIndex = 0
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
 
   sUnits = sa_Prefix(optDosePrefix.ListIndex) & _
            sa_Dose(optDose.ListIndex) & " / " & _
            sa_Prefix(optActPrefix.ListIndex) & _
            sa_Activity(optActivity.ListIndex) & " " & _
            sa_Time(optTime.ListIndex) & " " & sa_Area(optArea.ListIndex)
   lblConcUnits = sUnits
   sUnitsInternal = sa_Prefix(optDosePrefix.ListIndex) & _
            sa_Dose(optDose.ListIndex) & " / " & _
            sa_Prefix(optActPrefix.ListIndex) & _
            sa_Activity(optActivity.ListIndex)
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
 
   gsDose_Prefix = sa_Prefix(optDosePrefix.ListIndex)
   gsDose_Unit = sa_Dose(optDose.ListIndex)
   gsAct_Prefix = sa_Prefix(optActPrefix.ListIndex)
   gsAct_Unit = sa_Activity(optActivity.ListIndex)
   gsTime = sa_Time(optTime.ListIndex)
   gs_Area = sa_Area(optArea.ListIndex)
   gb_SetUnits_Result = True
   gb_ButtonPressed = True
   gd_ExtFactor = fnd_Units_Factor("Gnd", Me, Me)
   gd_InhFactor = fnd_Units_Factor("Inh", Me, Me)
   gs_Inh_Units = sUnitsInternal
   gsChangeExtUnits = "Gnd"
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
 
 '  If KeyCode = vbKeyF1 Then
 '     dlgCommon.HelpContext = Me.HelpContextID
 '     dlgCommon.HelpCommand = cdlHelpContext
 '     dlgCommon.ShowHelp
 '  End If
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
   gbGnd_isLoaded = True
 
   sa_Prefix(0) = "T"
   sa_Prefix(1) = "G"
   sa_Prefix(2) = "M"
   sa_Prefix(3) = "k"
   sa_Prefix(4) = " "
   sa_Prefix(5) = "m"
   sa_Prefix(6) = Chr$(181)
   sa_Prefix(7) = "n"
   sa_Prefix(8) = "p"
   
   sa_Dose(0) = "Sv "
   sa_Dose(1) = "rem"
 
   sa_Activity(0) = "Bq"
   sa_Activity(1) = "Ci"
   
   sa_Time(0) = "s"
   sa_Time(1) = "m"
   sa_Time(2) = "h"
   sa_Time(3) = "y"
 
   sa_Area(0) = "cm^-2"
   sa_Area(1) = "m^-2"
   sa_Area(2) = "ft^-2"
   
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
      sUnits = gs_Gnd_Units
      sUnitsInternal = gs_Inh_Units
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

Private Sub optDose_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optDosePrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optActivity_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
Private Sub optActPrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
Private Sub optTime_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
Private Sub optArea_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
