VERSION 5.00
Object = "{BC098376-8AFB-11CE-90D3-0000C037528B}#4.1#0"; "csopt32.ocx"
Begin VB.Form frmSetActUnits 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Activity Units Selection"
   ClientHeight    =   5220
   ClientLeft      =   1125
   ClientTop       =   2220
   ClientWidth     =   7230
   HelpContextID   =   1313000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5220
   ScaleWidth      =   7230
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
      Top             =   4560
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   374
      Left            =   5640
      TabIndex        =   2
      Top             =   3960
      WhatsThisHelpID =   43
      Width           =   1335
   End
   Begin CSOptLib.CSOptList optAreaPrefix 
      Height          =   3495
      Left            =   2280
      TabIndex        =   0
      Top             =   1440
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
      Contents        =   $"frmSetActUnits.frx":0000
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Area Prefix"
      ListIndex       =   3
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
   Begin CSOptLib.CSOptList optAct 
      Height          =   975
      Left            =   120
      TabIndex        =   1
      Top             =   120
      WhatsThisHelpID =   2313002
      Width           =   1845
      _Version        =   262145
      _ExtentX        =   3254
      _ExtentY        =   1720
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
      Contents        =   $"frmSetActUnits.frx":0092
      Spacing         =   20
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
   Begin CSOptLib.CSOptList optActPrefix 
      Height          =   3495
      Left            =   120
      TabIndex        =   5
      Top             =   1440
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
      Contents        =   $"frmSetActUnits.frx":00AF
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Activity Prefix"
      ListIndex       =   3
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
   Begin CSOptLib.CSOptList optArea 
      Height          =   975
      Left            =   2280
      TabIndex        =   6
      Top             =   120
      WhatsThisHelpID =   2313002
      Width           =   1005
      _Version        =   262145
      _ExtentX        =   1773
      _ExtentY        =   1720
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
      Contents        =   $"frmSetActUnits.frx":0141
      Spacing         =   20
      Caption         =   "Area"
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
      Caption         =   "Bq"
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
      Left            =   5520
      TabIndex        =   7
      Top             =   2040
      WhatsThisHelpID =   2313004
      Width           =   1455
   End
   Begin VB.Label lblText 
      Alignment       =   2  'Center
      Caption         =   "Selected Units:"
      Height          =   255
      Left            =   4320
      TabIndex        =   4
      Top             =   2040
      Width           =   1095
   End
End
Attribute VB_Name = "frmSetActUnits"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmSetActUnits"

Dim sUnits As String
Dim sAreaPrefix As String
Dim sArea As String
Dim sActPrefix As String
Dim sact As String

Dim b_FirstPass As Boolean, b_isExternal As Boolean

Dim sa_Prefix(9) As String
Dim sa_act(2) As String
Dim sa_Area(2) As String

Private Sub UpdateOptions()
   Const PROCEDURE_NAME As String = "UpdateOptions"
   
   Dim nChr As Integer
   Dim nStrLen As Integer
 
   On Error GoTo Error_Handler

   sAreaPrefix = Mid$(sUnits, 7, 1)
   Select Case sAreaPrefix
   Case "T"
      optAreaPrefix.ListIndex = 0
   Case "G"
      optAreaPrefix.ListIndex = 1
   Case "M"
      optAreaPrefix.ListIndex = 2
   Case "k"
      optAreaPrefix.ListIndex = 3
   Case " "
      optAreaPrefix.ListIndex = 4
   Case "m"
      optAreaPrefix.ListIndex = 5
   Case Chr$(181)
      optAreaPrefix.ListIndex = 6
   Case "n"
      optAreaPrefix.ListIndex = 7
   Case "p"
      optAreaPrefix.ListIndex = 8
   Case Else
      optAreaPrefix.ListIndex = 4
   End Select
 
   sArea = Mid$(sUnits, 8, 2)
   Select Case sArea
   Case "m "
      optArea.ListIndex = 0
   Case "ft"
      optArea.ListIndex = 1
   Case Else
      optArea.ListIndex = 0
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
 
   sact = Mid$(sUnits, 2, 2)
   Select Case sact
   Case "Bq "
      optAct.ListIndex = 0
   Case "Ci"
      optAct.ListIndex = 1
   Case Else
      optAct.ListIndex = 0
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
 
   If Not b_isExternal Then ' means this is external dose
     sUnits = sa_Prefix(optActPrefix.ListIndex) & _
            sa_act(optAct.ListIndex)
   Else
     sUnits = sa_Prefix(optActPrefix.ListIndex) & _
            sa_act(optAct.ListIndex) & " / " & _
            sa_Prefix(optAreaPrefix.ListIndex) & _
            sa_Area(optArea.ListIndex) & "^2"
   End If
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
 
   gsAreaCalc_Prefix = sa_Prefix(optAreaPrefix.ListIndex)
   gsAreaCalc_Unit = sa_Area(optArea.ListIndex)
   gsActCalc_Prefix = sa_Prefix(optActPrefix.ListIndex)
   gsActCalc_Unit = sa_act(optAct.ListIndex)
   gb_SetUnits_Result = True
   gb_ButtonPressed = True
   gs_Activity_Unit = sa_Prefix(optActPrefix.ListIndex) & _
     sa_act(optAct.ListIndex)
   gs_AirActivity_Unit = sa_Prefix(optActPrefix.ListIndex) & _
     sa_act(optAct.ListIndex) & " / " & _
     sa_Prefix(optAreaPrefix.ListIndex) & _
     sa_Area(optArea.ListIndex) & "^3"
   gs_GndActivity_Unit = sa_Prefix(optActPrefix.ListIndex) & _
     sa_act(optAct.ListIndex) & " / " & _
     sa_Prefix(optAreaPrefix.ListIndex) & _
     sa_Area(optArea.ListIndex) & "^2"
   gd_ActFactor = fnd_ActUnits_Factor("Inh", Me)
   gd_ActAirFactor = fnd_ActUnits_Factor("Air", Me)
   gd_ActGndFactor = fnd_ActUnits_Factor("Gnd", Me)

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
   
   If nThisTab = 4 Then ' means this is external dose
     optArea.Enabled = True
     optArea.Visible = True
     optAreaPrefix.Enabled = True
     optAreaPrefix.Visible = True
     b_isExternal = True
   Else
     optArea.Enabled = False
     optArea.Visible = False
     optAreaPrefix.Enabled = False
     optAreaPrefix.Visible = False
     b_isExternal = False
   End If
 
 
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
   
   sa_Area(0) = "m"
   sa_Area(1) = "ft"
 
   sa_act(0) = "Bq"
   sa_act(1) = "Ci"
   
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
       If Not b_isExternal Then
         sUnits = gs_Activity_Unit
       Else
         If Rad_Toolbox.optExternal.Value = "Ground Surface" Then
           sUnits = gs_GndActivity_Unit
         Else
           sUnits = gs_AirActivity_Unit
         End If
       End If
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

Private Sub optArea_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optAreaPrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optact_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
Private Sub optActPrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
