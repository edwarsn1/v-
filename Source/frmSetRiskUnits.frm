VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{BC098376-8AFB-11CE-90D3-0000C037528B}#4.1#0"; "csopt32.ocx"
Begin VB.Form frmSetRiskUnits 
   Caption         =   "Risk Coefficients Units Selection"
   ClientHeight    =   5190
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8565
   LinkTopic       =   "Form1"
   ScaleHeight     =   5190
   ScaleWidth      =   8565
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   6840
      TabIndex        =   1
      Top             =   3720
      WhatsThisHelpID =   43
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   6840
      TabIndex        =   0
      Top             =   4440
      Width           =   1335
   End
   Begin CSOptLib.CSOptList optActivity 
      Height          =   1215
      Left            =   3000
      TabIndex        =   2
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
      Contents        =   $"frmSetRiskUnits.frx":0000
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
      Left            =   5520
      Top             =   3480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin CSOptLib.CSOptList optTime 
      Height          =   2175
      Left            =   5160
      TabIndex        =   3
      Top             =   120
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
      Contents        =   $"frmSetRiskUnits.frx":001F
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
      Left            =   3000
      TabIndex        =   4
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
      Contents        =   $"frmSetRiskUnits.frx":0051
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
   Begin CSOptLib.CSOptList optArea 
      Height          =   1575
      Left            =   240
      TabIndex        =   7
      Top             =   120
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
      Contents        =   $"frmSetRiskUnits.frx":00E3
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
   Begin CSOptLib.CSOptList optVol 
      Height          =   1575
      Left            =   240
      TabIndex        =   8
      Top             =   120
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
      Contents        =   $"frmSetRiskUnits.frx":012A
      Spacing         =   30
      Caption         =   "Volume"
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
   Begin VB.Label lblUnits 
      Alignment       =   2  'Center
      Caption         =   "Selected Units:"
      Height          =   255
      Left            =   5400
      TabIndex        =   6
      Top             =   2640
      Width           =   1095
   End
   Begin VB.Label lblRiskUnits 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   " /  Bq "
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
      Left            =   6720
      TabIndex        =   5
      Top             =   2520
      WhatsThisHelpID =   2313004
      Width           =   1695
   End
End
Attribute VB_Name = "frmSetRiskUnits"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmSetRiskUnits"

Dim sUnitsExt As String, sUnitsInt As String, sUnitsGnd As String
Dim sActPrefix As String
Dim sActivity As String
Dim sTime As String, sArea As String, sVol As String

Dim b_FirstPass As Boolean
Dim sa_Vol(3) As String
Dim sa_Area(3) As String
Dim sa_Prefix(9) As String
Dim sa_Activity(2) As String
Dim sa_Time(4) As String

Private Sub cmdCancel_Click()
  Me.Hide
End Sub

Private Sub cmdOK_Click()
 Const PROCEDURE_NAME As String = "cmdOK_Click"
   On Error GoTo Error_Handler
 
   gsRisk_Unit_Int = sUnitsInt
   gsRisk_Unit_Ext = sUnitsExt
   gsRisk_Unit_Gnd = sUnitsGnd
' compute conversion factors
   fnd_Units_Factors
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

Private Sub Form_Load()
   Const PROCEDURE_NAME As String = "Form_Load"
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
   
   sa_Activity(0) = "Bq"
   sa_Activity(1) = "Ci"
   
   sa_Time(0) = "s"
   sa_Time(1) = "m"
   sa_Time(2) = "h"
   sa_Time(3) = "y"

   sa_Vol(0) = "cm^3"
   sa_Vol(1) = " m^3"
   sa_Vol(2) = "ft^3"
    
   sa_Area(0) = "cm^2"
   sa_Area(1) = " m^2"
   sa_Area(2) = "ft^2"
    
  If gsRisk_Path = "Ingestion" Or gsRisk_Path = "Inhalation" Then
    sActPrefix = Mid(gsRisk_Unit_Int, 2, 1)
    sActivity = Mid(gsRisk_Unit_Int, 3, 2)
  Else
    If gsRisk_Path = "Ground Plane" Then
      sArea = Mid(gsRisk_Unit_Gnd, 1, 4)
    Else
      sVol = Mid(gsRisk_Unit_Ext, 1, 4)
    End If
    sActPrefix = Mid(gsRisk_Unit_Ext, 7, 1)
    sActivity = Mid(gsRisk_Unit_Ext, 8, 2)
    sTime = Mid(gsRisk_Unit_Ext, 11, 1)
  End If
  
  optArea.Visible = False
  optArea.Enabled = False
  optVol.Visible = False
  optVol.Enabled = False
  If gsRisk_Path = "Ingestion" Or gsRisk_Path = "Inhalation" Then
    lblRiskUnits = gsRisk_Unit_Int
    optTime.Visible = False
    optTime.Enabled = False
  Else
    optTime.Visible = True
    optTime.Enabled = True
    If gsRisk_Path = "Ground Plane" Then
      lblRiskUnits = gsRisk_Unit_Gnd
      optArea.Visible = True
      optArea.Enabled = True
    Else
      lblRiskUnits = gsRisk_Unit_Ext
      optVol.Visible = True
      optVol.Enabled = True
    End If
  End If
  lblRiskUnits_Change

End Sub

Private Sub UpdateOptions()
   Const PROCEDURE_NAME As String = "UpdateOptions"
   
   Dim nChr As Integer
   Dim nStrLen As Integer
 
   On Error GoTo Error_Handler

   If gsRisk_Path = "Ingestion" Or gsRisk_Path = "Inhalation" Then
     sActPrefix = Mid(sUnitsInt, 2, 1)
   Else
     If gsRisk_Path = "Ground Plane" Then
       sActPrefix = Mid(sUnitsGnd, 7, 1)
     Else
       sActPrefix = Mid(sUnitsExt, 7, 1)
     End If
   End If
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
 
   If gsRisk_Path = "Ingestion" Or gsRisk_Path = "Inhalation" Then
     sActivity = Mid(sUnitsInt, 3, 2)
   Else
     sActivity = Mid(sUnitsExt, 8, 2)
   End If
   Select Case sActivity
   Case "Bq"
      optActivity.ListIndex = 0
   Case "Ci"
      optActivity.ListIndex = 1
   Case Else
      optActivity.ListIndex = 0
   End Select
 
   If Not (gsRisk_Path = "Ingestion" Or gsRisk_Path = "Inhalation") Then
     sTime = Mid(sUnitsExt, 11, 1)
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
   
     If gsRisk_Path = "Ground Plane" Then
       sArea = Mid$(sUnitsGnd, 1, 4)
       Select Case Trim$(sArea)
       Case "cm^2"
         optVol.ListIndex = 0
       Case "ft^2"
         optVol.ListIndex = 2
       Case "m^2"
         optVol.ListIndex = 1
       Case Else
         optVol.ListIndex = 0
       End Select
     Else
       sVol = Mid$(sUnitsExt, 1, 4)
       Select Case Trim$(sVol)
       Case "cm^3"
         optVol.ListIndex = 0
       Case "ft^3"
         optVol.ListIndex = 2
       Case "m^3"
         optVol.ListIndex = 1
       Case Else
         optVol.ListIndex = 0
       End Select
     End If
   End If
 
   If Not b_FirstPass Then
     UpdateUnitsString
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

Sub UpdateUnitsString()
   Const PROCEDURE_NAME As String = "UpdateUnitsString"
   Dim ExtInd As Integer
   On Error GoTo Error_Handler
 
   If gsRisk_Path = "Ground Plane" Then
     ExtInd = optArea.ListIndex
   Else
     ExtInd = optVol.ListIndex
   End If
   sUnitsExt = sa_Vol(ExtInd) & " /" & sa_Prefix(optActPrefix.ListIndex) & _
            sa_Activity(optActivity.ListIndex) & " " & _
            sa_Time(optTime.ListIndex)
   sUnitsGnd = sa_Area(ExtInd) & " /" & sa_Prefix(optActPrefix.ListIndex) & _
            sa_Activity(optActivity.ListIndex) & " " & _
            sa_Time(optTime.ListIndex)
   sUnitsInt = "/" & sa_Prefix(optActPrefix.ListIndex) & _
            sa_Activity(optActivity.ListIndex)
   If gsRisk_Path = "Ingestion" Or gsRisk_Path = "Inhalation" Then
     lblRiskUnits = sUnitsInt
   ElseIf gsRisk_Path = "Ground Plane" Then
     lblRiskUnits = sUnitsGnd
   Else
     lblRiskUnits = sUnitsExt
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

Private Sub lblRiskUnits_Change()
Const PROCEDURE_NAME As String = "lblConcUnits_Change"
   On Error GoTo Error_Handler

   If b_FirstPass Then
      sUnitsExt = gsRisk_Unit_Ext
      sUnitsInt = gsRisk_Unit_Int
      sUnitsGnd = gsRisk_Unit_Gnd
      UpdateOptions
      b_FirstPass = False
   End If
   UpdateUnitsString

   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub optActivity_Click()
   If Not b_FirstPass Then UpdateUnitsString
End Sub

Private Sub optActPrefix_Click()
   If Not b_FirstPass Then UpdateUnitsString
End Sub

Private Sub optArea_Click()
   If Not b_FirstPass Then UpdateUnitsString
End Sub

Private Sub optTime_Click()
   If Not b_FirstPass Then UpdateUnitsString
End Sub


Sub fnd_Units_Factors()
   Const PROCEDURE_NAME As String = "fnd_Units_Factors"
   Dim Prefix(9) As Double, Activity(2) As Double, ExtInd As Integer
   Dim Time(4) As Double, Volume(3) As Double, Area(3) As Double
 
   On Error GoTo Error_Handler
   Prefix(0) = 0.000000000001 ' tera
   Prefix(1) = 0.000000001    ' giga
   Prefix(2) = 0.000001       ' mega
   Prefix(3) = 0.001          ' kilo
   Prefix(4) = 1
   Prefix(5) = 1000#          ' milli
   Prefix(6) = 1000000#       ' micro
   Prefix(7) = 1000000000#    ' nano
   Prefix(8) = 1000000000000# ' pico
   
   Activity(0) = 1
   Activity(1) = 0.000000000027 ' Bq -> Ci
   
   Time(0) = 1
   Time(1) = 60               ' m -> s
   Time(2) = 3600             ' h -> s
   Time(3) = 31558150         ' y -> s
   
   Volume(0) = 1 / 1000000#   ' cm^3 -> m^3
   Volume(1) = 1
   Volume(2) = 0.02832        ' ft^3 -> m^2
   
   Area(0) = 1 / 10000#       ' cm^3 -> m^2
   Area(1) = 1
   Area(2) = 0.0929           ' ft^3 -> m^3
   
   If gsRisk_Path = "Ground Plane" Then
     ExtInd = optArea.ListIndex
   Else
     ExtInd = optVol.ListIndex
   End If
   
   gdRisk_Factor_Int = 1#
   gdRisk_Factor_Int = gdRisk_Factor_Int / Prefix(optActPrefix.ListIndex)
   gdRisk_Factor_Int = gdRisk_Factor_Int / Activity(optActivity.ListIndex)
   gdRisk_Factor_Ext = gdRisk_Factor_Int / Time(optTime.ListIndex)
   gdRisk_Factor_Ext = gdRisk_Factor_Ext * Volume(ExtInd)
   gdRisk_Factor_Gnd = gdRisk_Factor_Ext * Area(ExtInd)
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Private Sub optVol_Click()
   If Not b_FirstPass Then UpdateUnitsString
End Sub
