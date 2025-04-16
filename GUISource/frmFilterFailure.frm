VERSION 5.00
Begin VB.Form frmFilterFailure 
   BackColor       =   &H00BDDEEC&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Filter Failure"
   ClientHeight    =   3150
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3150
   ScaleWidth      =   7305
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtStopTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   5
      Top             =   2400
      Width           =   1315
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   6120
      TabIndex        =   7
      Top             =   600
      Width           =   855
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Reset"
      Height          =   375
      Left            =   6120
      TabIndex        =   8
      Top             =   120
      Width           =   855
   End
   Begin VB.CheckBox chkDisable 
      BackColor       =   &H00BDDEEC&
      Caption         =   "Disabled"
      Height          =   255
      Left            =   4440
      TabIndex        =   6
      Top             =   2400
      Width           =   1095
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   1560
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   2
      Top             =   1560
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4320
      TabIndex        =   3
      Top             =   1560
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5640
      TabIndex        =   4
      Top             =   1560
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1680
      TabIndex        =   1
      Top             =   1560
      Width           =   1315
   End
   Begin VB.Label lblStopTime 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Time until shutoff (h)"
      Height          =   255
      Left            =   360
      TabIndex        =   15
      Top             =   2160
      Width           =   2295
   End
   Begin VB.Label Title 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Instantaneous Release Fractions"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   14
      Top             =   480
      Width           =   5655
   End
   Begin VB.Label lblTime 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Time (h)"
      Height          =   255
      Left            =   480
      TabIndex        =   13
      Top             =   1320
      Width           =   1095
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Height          =   240
      Index           =   0
      Left            =   1725
      TabIndex        =   12
      Top             =   1320
      Width           =   1230
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Height          =   240
      Index           =   1
      Left            =   3120
      TabIndex        =   11
      Top             =   1320
      Width           =   1110
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Height          =   240
      Index           =   2
      Left            =   4440
      TabIndex        =   10
      Top             =   1320
      Width           =   1110
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Height          =   240
      Index           =   3
      Left            =   5760
      TabIndex        =   9
      Top             =   1320
      Width           =   1110
   End
End
Attribute VB_Name = "frmFilterFailure"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public FilterType As String
Private DataModify As Boolean

Private Sub chkDisable_Click()
    DataModify = True
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
Dim Delay As Single

  Delay = SourceTerm.DelayTime
  
  If DataModify Then
    Select Case FilterType
        Case "Pathway"
            With PathwayArr(frmPathway.CurrentIndex).TM1Filter
                .FailEnable = IIf(chkDisable = 1, 0, 1)
                .FailureData(1) = txtTime
                .FailureData(2) = txtCol1
                .FailureData(3) = txtCol2
                .FailureData(4) = txtCol3
                .FailureData(5) = txtCol4
                .StopTime = IIf(val(txtStopTime) > 0, txtStopTime, Delay + 720)
            End With
        Case "Recirc"
            With CompartmentArr(frmCompartment.CurrentIndex).F1ReFilters
                .FailEnable = IIf(chkDisable = 1, 0, 1)
                .FailureData(1) = txtTime
                .FailureData(2) = txtCol1
                .FailureData(3) = txtCol2
                .FailureData(4) = txtCol3
                .StopTime = IIf(val(txtStopTime) > 0, txtStopTime, Delay + 720)
            End With
    End Select
  End If
  
  Unload Me
End Sub

Private Sub Form_Activate()
Dim Delay As Single

    lblHeading(0) = "Flow Rate(cfm)"
    lblHeading(1) = "Aerosol"
    lblHeading(2) = "Elemental I"
    lblHeading(3) = "Organic I"
    
    Select Case FilterType
        Case "Pathway"
            With PathwayArr(frmPathway.CurrentIndex).TM1Filter
                chkDisable = IIf(.FailEnable, 0, 1)
                 txtTime = ZeroFormat(.FailureData(1), FloatFormat)
                 txtCol1 = ZeroFormat(.FailureData(2), FloatFormat)
                 txtCol2 = ZeroFormat(.FailureData(3), FloatFormat)
                 txtCol3 = ZeroFormat(.FailureData(4), FloatFormat)
                 txtCol4 = ZeroFormat(.FailureData(5), FloatFormat)
                 txtStopTime = ZeroFormat(.StopTime, FloatFormat)
            End With
            Me.BackColor = GetBackColor("Pathway")
            SetControlColor Me
        Case "Recirc"
            With CompartmentArr(frmCompartment.CurrentIndex).F1ReFilters
                txtTime = ZeroFormat(.FailureData(1), FloatFormat)
                txtCol1 = ZeroFormat(.FailureData(2), FloatFormat)
                txtCol2 = ZeroFormat(.FailureData(3), FloatFormat)
                txtCol3 = ZeroFormat(.FailureData(4), FloatFormat)
                txtCol4 = ZeroFormat(.FailureData(5), FloatFormat)
                txtStopTime = .StopTime
            End With
    End Select
    
    Delay = SourceTerm.DelayTime
    txtTime = Delay
    
    If val(txtTime) = 0 Then
        txtTime = Delay + 720
    End If
    If val(txtStopTime) = 0 Then
        txtStopTime = Delay + 720
    End If
    DataModify = False
End Sub

Private Sub Form_Resize()
  If Me.WindowState = vbNormal Then
    AdjustToScreen Me
  End If
End Sub

Private Sub txtCol1_Change()
    DataModify = True
End Sub

Private Sub txtCol1_GotFocus()
    SetSelect txtCol1
End Sub

Private Sub txtCol1_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next
    
    If KeyCode = vbKeyRight Then
        txtCol2.SetFocus
    ElseIf KeyCode = vbKeyLeft Then
        txtTime.SetFocus
    End If
End Sub

Private Sub txtCol2_Change()
    DataModify = True
End Sub

Private Sub txtCol2_GotFocus()
    SetSelect txtCol2
End Sub

Private Sub txtCol2_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next

    If KeyCode = vbKeyRight Then
        txtCol3.SetFocus
    ElseIf KeyCode = vbKeyLeft Then
        txtCol1.SetFocus
    End If
End Sub

Private Sub txtCol3_Change()
    DataModify = True
End Sub

Private Sub txtCol3_GotFocus()
    SetSelect txtCol3
End Sub

Private Sub txtCol3_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next
    
    If KeyCode = vbKeyRight Then
        txtCol4.SetFocus
    ElseIf KeyCode = vbKeyLeft Then
        txtCol2.SetFocus
    End If
End Sub

Private Sub txtCol4_Change()
    DataModify = True
End Sub

Private Sub txtCol4_GotFocus()
    SetSelect txtCol4
End Sub

Private Sub txtCol4_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next
    
    If KeyCode = vbKeyLeft Then
        txtCol3.SetFocus
    End If
End Sub

Private Sub txtStopTime_Change()
    DataModify = True
End Sub

Private Sub txtTime_Change()
    DataModify = True
End Sub

Private Sub txtTime_GotFocus()
    SetSelect txtTime
End Sub

Private Sub txtstoptime_GotFocus()
    SetSelect txtStopTime
End Sub

Private Sub txtTime_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next

    If KeyCode = vbKeyRight Then
        txtCol1.SetFocus
    End If
End Sub
