VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{BC098376-8AFB-11CE-90D3-0000C037528B}#4.1#0"; "csopt32.ocx"
Begin VB.Form frmSetEleUnits 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Absorber Data Units Selection"
   ClientHeight    =   4095
   ClientLeft      =   1125
   ClientTop       =   2220
   ClientWidth     =   10395
   HelpContextID   =   1313000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4095
   ScaleWidth      =   10395
   ShowInTaskbar   =   0   'False
   Tag             =   "ForeVB DB=F:\PROJECTS\RASCAL3\ST-Dose\Help\std3.dba"
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   8760
      TabIndex        =   3
      Top             =   3480
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   8760
      TabIndex        =   2
      Top             =   2880
      WhatsThisHelpID =   43
      Width           =   1335
   End
   Begin CSOptLib.CSOptList optMassPrefix 
      Height          =   3495
      Left            =   4560
      TabIndex        =   0
      Top             =   240
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
      Contents        =   $"frmsetEleUnits.frx":0000
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Mass Prefix"
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
   Begin CSOptLib.CSOptList optArea 
      Height          =   735
      Left            =   2400
      TabIndex        =   1
      Top             =   240
      Visible         =   0   'False
      WhatsThisHelpID =   2313002
      Width           =   1845
      _Version        =   262145
      _ExtentX        =   3254
      _ExtentY        =   1296
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
      Enabled         =   0   'False
      Contents        =   "m^2"
      Spacing         =   30
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
   Begin MSComDlg.CommonDialog dlgCommon 
      Left            =   7920
      Top             =   600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin CSOptLib.CSOptList optAreaPrefix 
      Height          =   3495
      Left            =   2400
      TabIndex        =   5
      Top             =   240
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
      Contents        =   $"frmsetEleUnits.frx":0093
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Area Prefix"
      ListIndex       =   4
      ToolTip         =   "Area prefix"
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
      Height          =   735
      Left            =   5400
      TabIndex        =   6
      Top             =   240
      Visible         =   0   'False
      WhatsThisHelpID =   2313002
      Width           =   1845
      _Version        =   262145
      _ExtentX        =   3254
      _ExtentY        =   1296
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
      Enabled         =   0   'False
      Contents        =   "g"
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
   Begin CSOptLib.CSOptList optEnergyPrefix 
      Height          =   3495
      Left            =   240
      TabIndex        =   8
      Top             =   240
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
      Contents        =   $"frmsetEleUnits.frx":0126
      Spacing         =   23
      ItemGap         =   5
      Caption         =   "Energy Prefix"
      ListIndex       =   1
      ToolTip         =   "Energy prefix"
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
   Begin CSOptLib.CSOptList optEnergy 
      Height          =   735
      HelpContextID   =   2313002
      Left            =   240
      TabIndex        =   9
      Top             =   240
      Visible         =   0   'False
      WhatsThisHelpID =   2313002
      Width           =   1845
      _Version        =   262145
      _ExtentX        =   3254
      _ExtentY        =   1296
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
      Enabled         =   0   'False
      Contents        =   "eV"
      Spacing         =   30
      Caption         =   "Energy"
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
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Coefficient Units:"
      Height          =   195
      Left            =   6600
      TabIndex        =   11
      Top             =   1440
      Width           =   1200
   End
   Begin VB.Label lblCoefUnits 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "MeV cm^2 /  g"
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
      Left            =   7920
      TabIndex        =   10
      Top             =   1320
      WhatsThisHelpID =   2313004
      Width           =   2295
   End
   Begin VB.Label lblConcUnits 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   " g / cm^2"
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
      Left            =   7920
      TabIndex        =   7
      Top             =   2040
      WhatsThisHelpID =   2313004
      Width           =   1455
   End
   Begin VB.Label lblUnits 
      Alignment       =   2  'Center
      Caption         =   "Range Units:"
      Height          =   255
      Left            =   6840
      TabIndex        =   4
      Top             =   2160
      Width           =   1095
   End
End
Attribute VB_Name = "frmSetEleUnits"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmSetEleUnits"

Dim sUnits As String
Dim sEnergyPrefix As String
Dim sEnergy As String
Dim sMassPrefix As String
Dim sMass As String
Dim sAreaPrefix As String
Dim sArea As String

Dim b_FirstPass As Boolean

Dim sa_Prefix(9) As String
Dim sa_Area(2) As String
Dim sa_Mass(2) As String
Dim sa_Energy(1) As String

Private Sub UpdateOptions()
   Const PROCEDURE_NAME As String = "UpdateOptions"
   
   Dim nChr As Integer
   Dim nStrLen As Integer
 
   On Error GoTo Error_Handler

   sEnergyPrefix = Mid$(sUnits, 1, 1)
   Select Case sEnergyPrefix
   Case "G"
      optEnergyPrefix.ListIndex = 0
   Case "M"
      optEnergyPrefix.ListIndex = 1
   Case "k"
      optEnergyPrefix.ListIndex = 2
   Case " "
      optEnergyPrefix.ListIndex = 3
   Case "c"
      optEnergyPrefix.ListIndex = 4
   Case "m"
      optEnergyPrefix.ListIndex = 5
   Case Chr$(181)
      optEnergyPrefix.ListIndex = 6
   Case "n"
      optEnergyPrefix.ListIndex = 7
   Case "p"
      optEnergyPrefix.ListIndex = 8
   Case Else
      optEnergyPrefix.ListIndex = 3
   End Select
 
   optEnergy.ListIndex = 0
   sEnergy = Mid$(sUnits, 2, 2)

   sMassPrefix = Mid$(sUnits, 12, 1)
   Select Case sMassPrefix
   Case "G"
      optMassPrefix.ListIndex = 0
   Case "M"
      optMassPrefix.ListIndex = 1
   Case "k"
      optMassPrefix.ListIndex = 2
   Case " "
      optMassPrefix.ListIndex = 3
   Case "c"
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
      optMassPrefix.ListIndex = 3
   End Select
 
   optMass.ListIndex = 0
   sMass = Mid$(sUnits, 13, 13)
   
   sAreaPrefix = Mid$(sUnits, 5, 1)
   Select Case sAreaPrefix
   Case "G"
      optAreaPrefix.ListIndex = 0
   Case "M"
      optAreaPrefix.ListIndex = 1
   Case "k"
      optAreaPrefix.ListIndex = 2
   Case " "
      optAreaPrefix.ListIndex = 3
   Case "c"
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
      optAreaPrefix.ListIndex = 3
   End Select
 
   optArea.ListIndex = 0
   sArea = Mid$(sUnits, 6, 1)
  
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
 
   sUnits = sa_Prefix(optEnergyPrefix.ListIndex) & _
            sa_Energy(optEnergy.ListIndex) & " " & _
            sa_Prefix(optAreaPrefix.ListIndex) & _
            sa_Area(optArea.ListIndex) & " / " & _
            sa_Prefix(optMassPrefix.ListIndex) & _
            sa_Mass(optMass.ListIndex)
   lblCoefUnits = sUnits
   
   If (gs_EleForm = "Photon") Then
     sUnits = sa_Prefix(optAreaPrefix.ListIndex) & _
            sa_Area(optArea.ListIndex) & " / " & _
            sa_Prefix(optMassPrefix.ListIndex) & _
            sa_Mass(optMass.ListIndex)
    Else
     sUnits = sa_Prefix(optMassPrefix.ListIndex) & _
            sa_Mass(optMass.ListIndex) & " / " & _
            sa_Prefix(optAreaPrefix.ListIndex) & _
            sa_Area(optArea.ListIndex)
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
   Dim sLabel As String, i As Integer, j As Integer
   Dim sCh As String * 1, sRevLabel As String
   On Error GoTo Error_Handler
 
   gsEnergy_Prefix = sa_Prefix(optEnergyPrefix.ListIndex)
   gsEnergy_Unit = sa_Energy(optEnergy.ListIndex)
   gsMass_Prefix = sa_Prefix(optMassPrefix.ListIndex)
   gsMass_Unit = sa_Mass(optMass.ListIndex)
   gsArea_Prefix = sa_Prefix(optAreaPrefix.ListIndex)
   gsArea_Unit = sa_Area(optArea.ListIndex)
   gb_SetUnits_Result = True
   gb_ButtonPressed = True
   Call Ele_Units_Factor(Me)

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
   
   If (gs_EleForm <> "Photon") Then
'     optEnergy.Visible = True
     optEnergyPrefix.Visible = True
'     optEnergy.Enabled = True
     optEnergyPrefix.Enabled = True
     lblUnits.Caption = "Range Units:"
     Label2.Visible = True
     lblCoefUnits.Visible = True
   Else
'     optEnergy.Visible = False
     optEnergyPrefix.Visible = False
'     optEnergy.Enabled = False
     optEnergyPrefix.Enabled = False
     lblUnits.Caption = "Units:"
     Label2.Visible = False
     lblCoefUnits.Visible = False
   End If
 
   b_FirstPass = True
 
   sa_Prefix(0) = "G"
   sa_Prefix(1) = "M"
   sa_Prefix(2) = "k"
   sa_Prefix(3) = " "
   sa_Prefix(4) = "c"
   sa_Prefix(5) = "m"
   sa_Prefix(6) = Chr$(181)
   sa_Prefix(7) = "n"
   sa_Prefix(8) = "p"
   
   sa_Energy(0) = "eV"
   sa_Mass(0) = "g "
   sa_Area(0) = "m^2"
   
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
     sUnits = gs_Energy_Units
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

Private Sub optEnergy_Click()
   
   If Not b_FirstPass Then UpdateUnitsString

End Sub

Private Sub optEnergyPrefix_Click()
   
   If Not b_FirstPass Then UpdateUnitsString

End Sub

Private Sub optMass_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optMassPrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub

Private Sub optArea_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
Private Sub optAreaPrefix_Click()
 
   If Not b_FirstPass Then UpdateUnitsString
 
End Sub
