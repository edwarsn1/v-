VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form frmBR 
   BackColor       =   &H00BDDEEC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Breathing Rate and Occupancy"
   ClientHeight    =   6744
   ClientLeft      =   3456
   ClientTop       =   4332
   ClientWidth     =   6012
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.6
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6744
   ScaleWidth      =   6012
   Begin VB.Frame fraDefaults 
      Caption         =   "BR Defaults"
      Height          =   735
      Left            =   480
      TabIndex        =   58
      Top             =   6840
      Width           =   4935
      Begin VB.OptionButton optDefault 
         Caption         =   "EAB or LPZ"
         Height          =   255
         Index           =   0
         Left            =   600
         TabIndex        =   60
         Top             =   360
         Width           =   1935
      End
      Begin VB.OptionButton optDefault 
         Caption         =   "Control Room"
         Height          =   255
         Index           =   1
         Left            =   2760
         TabIndex        =   59
         Top             =   360
         Width           =   1935
      End
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   0
      Left            =   3240
      TabIndex        =   57
      Top             =   2520
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   1
      Left            =   3240
      TabIndex        =   55
      Top             =   2850
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   2
      Left            =   3240
      TabIndex        =   54
      Top             =   3180
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   3
      Left            =   3240
      TabIndex        =   53
      Top             =   3510
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   4
      Left            =   3240
      TabIndex        =   52
      Top             =   3840
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   5
      Left            =   3240
      TabIndex        =   51
      Top             =   4170
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   6
      Left            =   3240
      TabIndex        =   50
      Top             =   4500
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   7
      Left            =   3240
      TabIndex        =   49
      Top             =   4830
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   8
      Left            =   3240
      TabIndex        =   48
      Top             =   5160
      Width           =   925
   End
   Begin VB.TextBox txtTimeOcc 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   9
      Left            =   3240
      TabIndex        =   47
      Top             =   5490
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   0
      Left            =   600
      TabIndex        =   46
      Top             =   2520
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   1
      Left            =   600
      TabIndex        =   45
      Top             =   2850
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   2
      Left            =   600
      TabIndex        =   44
      Top             =   3180
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   3
      Left            =   600
      TabIndex        =   43
      Top             =   3510
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   4
      Left            =   600
      TabIndex        =   42
      Top             =   3840
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   5
      Left            =   600
      TabIndex        =   41
      Top             =   4170
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   6
      Left            =   600
      TabIndex        =   40
      Top             =   4500
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   7
      Left            =   600
      TabIndex        =   39
      Top             =   4830
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   8
      Left            =   600
      TabIndex        =   38
      Top             =   5160
      Width           =   925
   End
   Begin VB.TextBox txtTimeBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   9
      Left            =   600
      TabIndex        =   37
      Top             =   5490
      Width           =   925
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   0
      Left            =   1530
      TabIndex        =   36
      Top             =   2520
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   1
      Left            =   1530
      TabIndex        =   35
      Top             =   2850
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   2
      Left            =   1530
      TabIndex        =   34
      Top             =   3180
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   3
      Left            =   1530
      TabIndex        =   33
      Top             =   3510
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   4
      Left            =   1530
      TabIndex        =   32
      Top             =   3840
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   5
      Left            =   1530
      TabIndex        =   31
      Top             =   4170
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   6
      Left            =   1530
      TabIndex        =   30
      Top             =   4500
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   7
      Left            =   1530
      TabIndex        =   29
      Top             =   4830
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   8
      Left            =   1530
      TabIndex        =   28
      Top             =   5160
      Width           =   1050
   End
   Begin VB.TextBox txtBR 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   9
      Left            =   1530
      TabIndex        =   27
      Top             =   5490
      Width           =   1050
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Reset"
      Height          =   375
      Left            =   4320
      TabIndex        =   26
      ToolTipText     =   "Restore original data"
      Top             =   360
      Width           =   1215
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   9
      Left            =   4170
      TabIndex        =   11
      Top             =   5490
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   8
      Left            =   4170
      TabIndex        =   10
      Top             =   5160
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   7
      Left            =   4170
      TabIndex        =   9
      Top             =   4830
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   6
      Left            =   4170
      TabIndex        =   8
      Top             =   4500
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   5
      Left            =   4170
      TabIndex        =   7
      Top             =   4170
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   4
      Left            =   4170
      TabIndex        =   6
      Top             =   3840
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   3
      Left            =   4170
      TabIndex        =   5
      Top             =   3510
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   2
      Left            =   4170
      TabIndex        =   4
      Top             =   3180
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   1
      Left            =   4170
      TabIndex        =   3
      Top             =   2850
      Width           =   1050
   End
   Begin VB.TextBox txtOccupy 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   325
      Index           =   0
      Left            =   4170
      TabIndex        =   2
      Top             =   2520
      Width           =   1050
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4320
      TabIndex        =   24
      ToolTipText     =   "Save data and close"
      Top             =   840
      Width           =   1215
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   372
      Left            =   0
      TabIndex        =   25
      Top             =   6372
      Width           =   6012
      _ExtentX        =   10605
      _ExtentY        =   656
      Style           =   1
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label lblPaste 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Paste"
      Height          =   255
      Index           =   1
      Left            =   3960
      TabIndex        =   64
      ToolTipText     =   "Used to copy data from spreadsheets"
      Top             =   5880
      Width           =   615
   End
   Begin VB.Label lblPaste 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Paste"
      Height          =   255
      Index           =   0
      Left            =   1320
      TabIndex        =   63
      ToolTipText     =   "Used to copy data from spreadsheets"
      Top             =   5880
      Width           =   615
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Low Population Zone"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3120
      TabIndex        =   62
      ToolTipText     =   "Change name in Offsite X/Q"
      Top             =   1635
      Width           =   2535
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Exclusion Area Boundary"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   360
      TabIndex        =   61
      ToolTipText     =   "Change name in Offsite X/Q"
      Top             =   1635
      Width           =   2535
   End
   Begin VB.Label lblDoseLocation 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Time  (h)"
      Height          =   330
      Index           =   2
      Left            =   3240
      TabIndex        =   56
      Top             =   2160
      Width           =   930
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   9
      Left            =   120
      TabIndex        =   23
      Top             =   5535
      Width           =   255
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   8
      Left            =   240
      TabIndex        =   22
      Top             =   5205
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   7
      Left            =   240
      TabIndex        =   21
      Top             =   4875
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   6
      Left            =   240
      TabIndex        =   20
      Top             =   4545
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   5
      Left            =   240
      TabIndex        =   19
      Top             =   4215
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   4
      Left            =   240
      TabIndex        =   18
      Top             =   3885
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   3
      Left            =   240
      TabIndex        =   17
      Top             =   3555
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   2
      Left            =   240
      TabIndex        =   16
      Top             =   3225
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   240
      TabIndex        =   15
      Top             =   2895
      Width           =   135
   End
   Begin VB.Label lblNum 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   240
      TabIndex        =   14
      Top             =   2565
      Width           =   135
   End
   Begin VB.Label lblDoseLocation 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Occupancy Factor- CR"
      Height          =   495
      Index           =   3
      Left            =   4170
      TabIndex        =   1
      Top             =   1995
      Width           =   1170
   End
   Begin VB.Shape Shape2 
      Height          =   4335
      Left            =   3120
      Top             =   1920
      Width           =   2415
   End
   Begin VB.Shape Shape1 
      Height          =   4335
      Index           =   0
      Left            =   480
      Top             =   1920
      Width           =   2415
   End
   Begin VB.Label lblDoseLocation 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   " Time (h)"
      Height          =   255
      Index           =   0
      Left            =   600
      TabIndex        =   12
      Top             =   2160
      Width           =   930
   End
   Begin VB.Label lblCompartment 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Compartment"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1080
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   3915
   End
   Begin VB.Label lblDoseLocation 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Breathing rate (cu m/s)"
      Height          =   495
      Index           =   1
      Left            =   1560
      TabIndex        =   13
      Top             =   1995
      Width           =   1170
   End
End
Attribute VB_Name = "frmBR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const EDGE = 3960
Private DataModify As Boolean
Private IgnoreModify As Boolean
Private Ntvals As Integer
Private ThisDoseLocation As Integer
Private IsDoseRoom As Boolean
Private TheEditType As String
Private TheFormEdit As Boolean
Private fEnvironment As Boolean
Private BreathingRates As Integer
Private times(9) As Single

Public Sub Reset()
    cmdCancel_Click
End Sub

Private Sub cmdCancel_Click()
 IgnoreModify = True
 InitControls
 'loadCompartmentMenu cboComp ' to reset form
 'SetCompartment 'JCK
 IgnoreModify = False
 DataModify = False
End Sub

Private Sub cmdExit_Click()
  IgnoreModify = False
  Unload Me
End Sub

Public Property Let DoseLocation(Location As Integer)
    ThisDoseLocation = Location
    InitControls
End Property

Private Sub Form_Activate()
    CheckClipboard
End Sub

Private Sub Form_Load()

 SetTabIndex
    
 IgnoreModify = False
 DataModify = False
 fEnvironment = False
 BreathingRates = 0
End Sub

Private Sub ShowBreathingRates(Columns As Integer)
Dim i As Integer, j As Integer

On Error GoTo ShowBRError

    If BreathingRates = 0 Then
        'Tell SaveData() which to save
        BreathingRates = Columns
        HideOccupancy
        
        Load Shape1(1)
        Shape1(1).Left = Shape1(0).Left + Shape1(0).Width + 240
        Shape1(1).Visible = True
        
        j = txtBR(9).TabIndex + 1
        For i = 10 To 19
            Load txtTimeBR(i)
            With txtTimeBR(i)
                .Left = txtTimeBR(0).Left + Shape1(0).Width + 240
                .Top = txtTimeBR(i - 10).Top
                .TabIndex = j
                .Visible = True
                If i > 10 Then
                    .Enabled = True
                End If
            End With
            j = j + 1
            
            Load txtBR(i)
            With txtBR(i)
                .Left = txtBR(0).Left + Shape1(0).Width + 240
                .Top = txtBR(i - 10).Top
                .TabIndex = j
                .Visible = True
            End With
            j = j + 1
        Next
        
        Load lblDoseLocation(4)
        With lblDoseLocation(4)
            .Left = lblDoseLocation(0).Left + Shape1(0).Width + 240
            .Visible = True
        End With
        
        Load lblDoseLocation(5)
        With lblDoseLocation(5)
            .Left = lblDoseLocation(1).Left + Shape1(0).Width + 240
            .Top = lblDoseLocation(1).Top
            .Width = lblDoseLocation(1).Width
            .Height = lblDoseLocation(1).Height
            .Caption = "Breathing rate (cu m/s)"
            .Visible = True
        End With
        
        Label1(0) = DoseLocationArr(1).Name
        Label2 = DoseLocationArr(2).Name
    
        If Columns = 3 Then
            Load Label1(1)
            With Label1(1)
                .Top = Label2.Top
                .Left = Label2.Left + Shape1(0).Width + 240
                .Visible = True
                .Caption = DoseLocationArr(3).Name
            End With
            
            '---------- Repeat ----------
            Load Shape1(2)
            Shape1(2).Left = Shape1(1).Left + Shape1(0).Width + 240
            Shape1(2).Visible = True
            j = txtBR(19).TabIndex + 1
            
            For i = 20 To 29
                Load txtTimeBR(i)
                With txtTimeBR(i)
                    .Left = txtTimeBR(10).Left + Shape1(0).Width + 240
                    .Top = txtTimeBR(i - 10).Top
                    .TabIndex = j
                    .Visible = True
                    If i > 20 Then
                        .Enabled = True
                    End If
                End With
                j = j + 1
                
                Load txtBR(i)
                With txtBR(i)
                    .Left = txtBR(10).Left + Shape1(0).Width + 240
                    .Top = txtBR(i - 10).Top
                    .TabIndex = j
                    .Visible = True
                End With
                j = j + 1
            Next
            
            Load lblDoseLocation(6)
            With lblDoseLocation(6)
                .Left = lblDoseLocation(4).Left + Shape1(0).Width + 240
                .Visible = True
            End With
            
            Load lblDoseLocation(7)
            With lblDoseLocation(7)
                .Left = lblDoseLocation(5).Left + Shape1(0).Width + 240
                .Top = lblDoseLocation(1).Top
                .Width = lblDoseLocation(1).Width
                .Height = lblDoseLocation(1).Height
                .Caption = "Breathing rate (cu m/s)"
                .Visible = True
            End With
            Me.Width = Me.Width + Shape1(0).Width + 240
            cmdExit.Left = cmdExit.Left + Shape1(0).Width + 240
            cmdCancel.Left = cmdCancel.Left + Shape1(0).Width + 240
            Load lblPaste(2)
            With lblPaste(2)
                .Left = Shape1(2).Left + Shape1(2).Width / 2 - .Width / 2
                .Top = lblPaste(1).Top
                .Visible = True
                .ToolTipText = lblPaste(0).ToolTipText
            End With
        End If
    End If
    Exit Sub
    
ShowBRError:
    MsgBox Err.Description, vbExclamation, "ShowBreathingRates()"
End Sub

Public Sub ShowOccupancy()
  Dim i
  
  lblDoseLocation(2).Enabled = DoseRoom
  lblDoseLocation(3).Enabled = DoseRoom
  
  For i = 0 To MaxDimen - 1
    txtTimeOcc(i).Visible = DoseRoom
    txtOccupy(i).Visible = DoseRoom
    txtTimeOcc(i).Enabled = DoseRoom
    txtOccupy(i).Enabled = DoseRoom
  Next i
  ' exception is time 0, always false so that begin time is zero or delay time
  txtTimeOcc(0).Enabled = False
  
  If DoseRoom Then
    With DoseLocationArr(CurrentIndex).dlOccupy
      'ReDim Preserve .times(1 To MaxDimen) As Single, .Data(1 To MaxDimen) As Single
      For i = 1 To MaxDimen
        If i > UBound(.times) Then
            txtTimeOcc(i - 1) = Format(0, TIMEFORM)
            txtOccupy(i - 1) = Format(0, SCIZERO)
        Else
            txtTimeOcc(i - 1) = Format(.times(i), TIMEFORM)
            txtOccupy(i - 1) = ZeroFormat(.Data(i), FloatFormat)
            txtTimeOcc(i - 1).Tag = "num"
            txtOccupy(i - 1).Tag = "num"
        End If
      Next i
    End With
  End If
End Sub

Private Sub HideOccupancy()
Dim i As Integer

    Shape2.Visible = False
    lblDoseLocation(2).Visible = False
    lblDoseLocation(3).Visible = False
    For i = 0 To 9
        txtOccupy(i).Visible = False
        txtTimeOcc(i).Visible = False
    Next
    Me.Caption = "Breathing Rates"
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CheckClipboard
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
  
  'Blank name is delete flag
  If DataModify And Not IgnoreModify Then
    cancel = EditData
  End If
  
  'If Cancel = 0 Then frmRadtrad.cboDoseLocation.Enabled = True
  If cancel = 0 Then frmRadtrad.SaveState True
 
End Sub

Private Sub Form_Resize()
 If WindowState = vbNormal Then
  Left = frmRadtrad.Left + EDGE
  Top = frmRadtrad.Top + 2000
 End If
End Sub

Private Sub lblPaste_Click(Index As Integer)
    PasteToTable Index
End Sub

Private Sub txtBR_Change(Index As Integer)
  DataModify = True
End Sub

Private Sub txtBR_GotFocus(Index As Integer)
  SetSelect txtBR(Index)
End Sub

Public Sub InitControls()
Dim CompName As String
Dim Response As VbMsgBoxResult
Dim i
Dim AControl As Control

On Error GoTo errorhandler
    
    For Each AControl In Controls
    If TypeOf AControl Is TextBox Then AControl.Text = ""
    
    If TypeOf AControl Is TextBox Or TypeOf AControl Is ComboBox Then
      AControl.BackColor = vbWhite
      AControl.ForeColor = vbBlack
    End If
  Next
  
  IgnoreModify = True
  
  With DoseLocationArr(CurrentIndex)
    'If .CompartmentNumber > 0 Then
      'SetCompartment 'JCK
      DoseRoom = False

      'If CompartmentArr(.CompartmentNumber).Type = 1 Then ' Control Room
      Select Case frmCompartment.cboType.ListIndex
        Case 1
            DoseRoom = True
            .ControlRoom = True
        Case 2
            fEnvironment = True
        Case 3
            DoseRoom = True
      End Select
    'End If
    
    If fEnvironment Then
        If UCase(DoseLocationArr(3).Name) Like "*UNUSED*" Then
            ShowBreathingRates 2
        Else
            ShowBreathingRates 3
        End If
        
        With DoseLocationArr(1)
          With .dlBR
            If .Model = 1 Then
                'ReDim Preserve .times(1 To MaxDimen) As Single, .Data(1 To MaxDimen) As Single
                For i = 1 To MaxDimen
                  If i > UBound(.times) Then
                    txtTimeBR(i - 1) = Format(0, TIMEFORM)
                    txtBR(i - 1) = Format(0, SCIZERO)
                  Else
                    txtTimeBR(i - 1) = Format(.times(i), TIMEFORM)
                    txtBR(i - 1) = ZeroFormat(.Data(i), FloatFormat)
                    txtBR(i - 1).Tag = "num"
                    txtTimeBR(i - 1).Tag = "num"
                  End If
                Next i
            Else
                txtTimeBR(0) = SourceTerm.DelayTime
            End If
          End With
        End With
        
        With DoseLocationArr(2)
          With .dlBR
            If .Model = 1 Then
                'ReDim Preserve .times(1 To MaxDimen) As Single, .Data(1 To MaxDimen) As Single
                For i = 11 To MaxDimen + 10
                  If i - 10 > UBound(.times) Then
                    txtTimeBR(i - 1) = Format(0, TIMEFORM)
                    txtBR(i - 1) = Format(0, SCIZERO)
                  Else
                    txtTimeBR(i - 1) = Format(.times(i - 10), TIMEFORM)
                    txtBR(i - 1) = ZeroFormat(.Data(i - 10), FloatFormat)
                  End If
                  txtTimeBR(i - 1).Tag = "num"
                  txtBR(i - 1).Tag = "num"
                Next
            Else
                txtTimeBR(10) = SourceTerm.DelayTime
            End If
          End With
        End With

        If BreathingRates = 3 Then
          With DoseLocationArr(3)
            With .dlBR
              If .Model = 1 Then
                'ReDim Preserve .times(1 To MaxDimen) As Single, .Data(1 To MaxDimen) As Single
                For i = 21 To MaxDimen + 20
                  If i - 20 > UBound(.times) Then
                    txtTimeBR(i - 1) = Format(0, TIMEFORM)
                    txtBR(i - 1) = Format(0, SCIZERO)
                  Else
                    txtTimeBR(i - 1) = Format(.times(i - 20), TIMEFORM)
                    txtBR(i - 1) = ZeroFormat(.Data(i - 20), FloatFormat)
                  End If
                  txtTimeBR(i - 1).Tag = "num"
                  txtBR(i - 1).Tag = "num"
                Next
            Else
                txtTimeBR(20) = SourceTerm.DelayTime
            End If
          End With
        End With
      End If
    Else
        BreathingRates = 1
        Label1(0).Visible = False
        Label2.Visible = False
        With .dlBR
          If .Model = 1 Then
            'ReDim Preserve .times(1 To MaxDimen) As Single, .Data(1 To MaxDimen) As Single
            For i = 1 To MaxDimen
              If i > UBound(.times) Then
                txtTimeBR(i - 1) = Format(0, TIMEFORM)
                txtBR(i - 1) = Format(0, SCIZERO)
              Else
                txtTimeBR(i - 1) = Format(.times(i), TIMEFORM)
                txtBR(i - 1) = ZeroFormat(.Data(i), FloatFormat)
              End If
              txtBR(i - 1).Tag = "num"
              txtTimeBR(i - 1).Tag = "num"
            Next i
          Else
            txtTimeBR(0) = SourceTerm.DelayTime
          End If
        End With
        
        With .dlOccupy
          If .Model = 1 Then
            'ReDim Preserve .times(1 To MaxDimen) As Single, .Data(1 To MaxDimen) As Single
            For i = 1 To MaxDimen
              If i > UBound(.times) Then
                txtTimeOcc(i - 1) = Format(0, TIMEFORM)
                txtOccupy(i - 1) = Format(0, SCIZERO)
              Else
                txtTimeOcc(i - 1) = Format(.times(i), TIMEFORM)
                txtOccupy(i - 1) = ZeroFormat(.Data(i), FloatFormat)
              End If
              txtOccupy(i - 1).Tag = "num"
              txtTimeOcc(i - 1).Tag = "num"
            Next
          Else
            txtTimeOcc(0) = SourceTerm.DelayTime 'JCK
          End If
        End With
    End If
  End With
       
  DataModify = False
  IgnoreModify = False
  Exit Sub
  
errorhandler:
Dim Msg As String
If Err.Number <> 0 Then
    Msg = Err.Description
    MsgBox Msg, vbOKOnly + vbExclamation, "frmBR.InitControls()"
End If
Exit Sub
Resume Next
End Sub

Private Sub CheckClipboard()
'See if data on the clipboard looks like Excel data - JCK 11/2005
Dim ValidData As Boolean
Dim i As Integer

    ValidData = CheckClipboardData
    If ValidData <> lblPaste(0).Enabled Then
        For i = 0 To lblPaste.UBound
            lblPaste(i).Enabled = ValidData
        Next
    End If
OK:
End Sub

Private Sub PasteToTable(TableID As Integer)
'JCK 11/2005
Dim PasteData() As String
Dim Buffer As String
Dim nError As Single
Dim Msg As String
Dim i As Integer, j As Integer

On Error GoTo PastingError

    j = 0
    nError = -1
    Buffer = Clipboard.GetText
    
    Do
        i = InStr(Buffer, vbCrLf)
        PasteData = Split(Left(Buffer, i - 1), vbTab)
        i = i + 1
        Buffer = Right(Buffer, Len(Buffer) - i)
        
        Select Case TableID
            Case (0)
                'Default EAB table
                If j = 0 Then
                    If val(txtTimeBR(j).Text) <> val(PasteData(0)) Then
                        nError = val(txtTimeBR(j).Text)
                        Exit Do
                    End If
                Else
                    txtTimeBR(j).Text = PasteData(0)
                End If
                txtBR(j).Text = PasteData(1)
            Case 1
                If DoseRoom Then
                    'Occupancy
                    If j = 0 Then
                        If val(txtTimeOcc(j).Text) <> val(PasteData(0)) Then
                            nError = val(txtTimeOcc(j).Text)
                            Exit Do
                        End If
                    Else
                        txtTimeOcc(j).Text = PasteData(0)
                    End If
                    txtOccupy(j).Text = PasteData(1)
                Else
                    'Breathing rate table #2
                    If j = 0 Then
                        If val(txtTimeBR(j + 10).Text) <> val(PasteData(0)) Then
                            nError = val(txtTimeBR(j + 10).Text)
                            Exit Do
                        End If
                        
                    Else
                        txtTimeBR(j + 10).Text = PasteData(0)
                    End If
                    txtBR(j + 10).Text = PasteData(1)
                End If
            Case 2 'Optional breathing rate #3
                If j > 0 Then
                    If val(txtTimeBR(j + 20).Text) <> val(PasteData(0)) Then
                        nError = val(txtTimeBR(j + 20).Text)
                        Exit Do
                    End If
                Else
                    txtTimeBR(j + 20).Text = PasteData(0)
                End If
                txtBR(j + 20).Text = PasteData(1)
        End Select
        j = j + 1
    Loop Until Buffer = ""
    
    If nError >= 0 Then
        PasteError nError, Me
    End If
    
    Select Case TableID
        Case 0
            txtBR(0).SetFocus
        Case 1
            If DoseRoom Then
                txtOccupy(0).SetFocus
            Else
                txtBR(10).SetFocus
            End If
        Case 2
            txtBR(20).SetFocus
    End Select
    Exit Sub
    
PastingError:
    Beep
End Sub

'Private Sub SetCompartment()
'Dim i, Number 'JCK

'    Number = DoseLocationArr(CurrentIndex).CompartmentNumber
'    With cboComp
'      For i = 0 To .ListCount - 1
'        If .ItemData(i) = Number Then
'          .ListIndex = i
'          Exit For
'        End If
'      Next
'    End With

'End Sub

Public Sub SaveData()
Dim i
 
On Error GoTo errorhandler

    
  If BreathingRates = 1 Then
    With DoseLocationArr(CurrentIndex)
      'Display for a control room with breathing and occupancy tables
      .CompartmentNumber = frmCompartment.CurrentIndex
      .ControlRoom = DoseRoom
      
      'Count breathing rate rows
      For i = 0 To MaxDimen
        If val(txtTimeBR(i)) = 0 And val(txtBR(i)) = 0 Then
            Exit For
        End If
      Next
      
      If i > 0 Then
        'Save breathing rate data
        With .dlBR
          .Model = 1
          .Count = Max(1, i)
          ReDim .times(1 To .Count) As Single, .Data(1 To .Count) As Single
          For i = 1 To .Count
            .times(i) = CSng(txtTimeBR(i - 1))
            .Data(i) = CSng(txtBR(i - 1))
          Next i
        End With
      Else
        'No valid data
        .dlBR.Model = 0
      End If

      'Count occupancy rows
      For i = 0 To MaxDimen
        If val(txtTimeOcc(i)) = 0 And val(txtOccupy(i)) = 0 Then
            Exit For
        End If
      Next
    
      If i > 0 Then
        'Save occupancy data
        With .dlOccupy
          .Model = 1
          .Count = Max(1, i)
          ReDim .times(1 To .Count) As Single, .Data(1 To .Count) As Single
          For i = 1 To .Count
            .times(i) = CSng(txtTimeOcc(i - 1))
            .Data(i) = CSng(txtOccupy(i - 1))
          Next i
        End With
      Else
        .dlOccupy.Model = 0
      End If
    End With
  Else
    With DoseLocationArr(1)
      'Display for environment, with 2 or 3 breathing rate tables
      For i = 0 To MaxDimen
        If val(txtTimeBR(i)) = 0 And val(txtBR(i)) = 0 Then
            Exit For
        End If
      Next
    
      With .dlBR
          .Model = 1
          .Count = Max(1, i)
          ReDim .times(1 To .Count) As Single, .Data(1 To .Count) As Single
          For i = 1 To .Count
            .times(i) = CSng(txtTimeBR(i - 1))
            .Data(i) = CSng(txtBR(i - 1))
          Next i
      End With
    End With
        
    With DoseLocationArr(2)
        For i = 0 To MaxDimen
          If val(txtTimeBR(i + 10)) = 0 And val(txtBR(i + 10)) = 0 Then
              Exit For
          End If
        Next

        With .dlBR
          .Model = 1
          .Count = Max(1, i)
          ReDim .times(1 To .Count) As Single, .Data(1 To .Count) As Single
          For i = 1 To .Count
            .times(i) = CSng(txtTimeBR(i - 1 + 10))
            .Data(i) = CSng(txtBR(i - 1 + 10))
          Next i
        End With
    End With
      
    If BreathingRates = 3 Then
      With DoseLocationArr(3)
        For i = 0 To MaxDimen
            If val(txtTimeBR(i + 20)) = 0 And val(txtBR(i + 20)) = 0 Then
                Exit For
            End If
        Next
    
        With .dlBR
          .Model = 1
          .Count = Max(1, i)
          ReDim .times(1 To .Count) As Single, .Data(1 To .Count) As Single
          For i = 1 To .Count
            .times(i) = CSng(txtTimeBR(i - 1 + 20))
            .Data(i) = CSng(txtBR(i - 1 + 20))
          Next i
        End With
      End With
    End If
  End If
  DataModify = False
  IgnoreModify = False
 Exit Sub
   
errorhandler:
Dim Msg As String
If Err.Number <> 0 Then
    Msg = "Dose Location Savedata: Error # " & Str(Err.Number) & " was generated by " _
            & Err.Source & Chr(13) & Err.Description
    MsgBox Msg, vbOKOnly + vbExclamation, "Error"
End If
Exit Sub
Resume Next
End Sub

Public Property Get CurrentIndex() As Integer
'No longer selected by user -- see cmdDoseLocation in frmCompartment
  CurrentIndex = ThisDoseLocation
End Property

Private Sub txtBR_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtBR(Index - 1).SetFocus
            Else
                txtBR(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtBR(Index + 1).SetFocus
            Else
                txtBR(0).SetFocus
            End If
        Case vbKeyLeft
            txtTimeBR(Index).SetFocus
        Case vbKeyRight
            txtTimeOcc(Index).SetFocus
    End Select
End Sub

Private Sub txtOccupy_Change(Index As Integer)
 DataModify = True
End Sub

Private Sub txtOccupy_GotFocus(Index As Integer)
  SetSelect txtOccupy(Index)
End Sub

Private Sub txtOccupy_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtOccupy(Index - 1).SetFocus
            Else
                txtOccupy(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtOccupy(Index + 1).SetFocus
            Else
                txtOccupy(0).SetFocus
            End If
        Case vbKeyLeft
            txtTimeOcc(Index).SetFocus
    End Select
End Sub

Private Sub txtTimeBR_Change(Index As Integer)
  DataModify = True
End Sub

Private Sub txtTimeBR_GotFocus(Index As Integer)
  SetSelect txtTimeBR(Index)
End Sub

Private Sub txtTimeBR_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

    Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtTimeBR(Index - 1).SetFocus
            Else
                txtTimeBR(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtTimeBR(Index + 1).SetFocus
            Else
                txtTimeBR(0).SetFocus
            End If
        Case vbKeyRight
            txtBR(Index).SetFocus
    End Select
End Sub

Private Sub txtTimeOcc_Change(Index As Integer)
 DataModify = True
End Sub

Private Sub txtTimeOcc_GotFocus(Index As Integer)
  SetSelect txtTimeOcc(Index)
End Sub

Public Property Get DoseRoom() As Boolean
  DoseRoom = IsDoseRoom
End Property

Public Property Let DoseRoom(ByVal vNewValue As Boolean)
  IsDoseRoom = vNewValue
  ShowOccupancy
End Property

Public Sub SetTabIndex()
  Dim i, j
    'txtName.Tag = "name"
    'cboComp.Tag = "fill"
    
    'j = txtTimeXQ(0).TabIndex
    'For i = 0 To MaxDimen - 1
    ' txtTimeXQ(i).TabIndex = j
    ' txtXQ(i).TabIndex = j + 1
    ' txtTimeXQ(i).Tag = ""
    'txtXQ(i).Tag = ""
    ' j = txtTimeXQ(i).TabIndex + 2
    'Next i
    
     'j = txtXQ(MaxDimen - 1).TabIndex + 1
    j = txtTimeBR(0).TabIndex
    For i = 0 To MaxDimen - 1
     txtTimeBR(i).TabIndex = j
     txtBR(i).TabIndex = j + 1
     txtTimeBR(i).Tag = ""
     txtBR(i).Tag = ""
     j = txtTimeBR(i).TabIndex + 2
    Next i

    j = txtBR(MaxDimen - 1).TabIndex + 1
    For i = 0 To MaxDimen - 1
     txtTimeOcc(i).TabIndex = j
     txtOccupy(i).TabIndex = j + 1
     txtTimeOcc(i).Tag = ""
     txtOccupy(i).Tag = ""
     j = txtTimeOcc(i).TabIndex + 2
    Next i

End Sub

Public Property Get EditType() As String
   EditType = TheEditType
End Property

Public Property Let EditType(ByVal vNewValue As String)

  TheEditType = vNewValue
  PassFormEdit = DoFormEdit(Me, TheEditType)
  
End Property

Public Property Get PassFormEdit() As Boolean
  PassFormEdit = TheFormEdit
End Property

Public Property Let PassFormEdit(ByVal vNewValue As Boolean)
  
  TheFormEdit = vNewValue
  If Not TheFormEdit Then ' we failed an edit
     ShowErrorMessage EditType, "Dose Location " + DoseLocationArr(CurrentIndex).Name
  End If
  
End Property

Public Function EditData() As Integer
Dim cancel As Boolean
Dim MaxBR As Integer
Dim i As Integer
    
    cancel = 0
    EditType = "Named"
    If PassFormEdit Then
        Select Case BreathingRates
            Case 1
                'Dose room
                For i = 0 To MaxDimen - 1
                  txtTimeOcc(i).Tag = "num"
                Next
                MaxBR = 9
            Case 2
                'Environment
                MaxBR = 19
            Case 3
                'Environment
                MaxBR = 29
        End Select
        For i = 0 To MaxBR
            txtTimeBR(i).Tag = "num"
        Next
        EditType = "Numeric"
        If PassFormEdit Then
            Select Case BreathingRates
                Case 1
                    'Dose room
                    For i = 0 To MaxDimen - 1
                      txtTimeOcc(i).Tag = "time"
                    Next
                    MaxBR = 9
                Case 2
                    'Environment
                    MaxBR = 19
                Case 3
                    'Environment
                    MaxBR = 29
            End Select
            For i = 0 To MaxBR
                txtTimeBR(i).Tag = "time"
            Next
            EditType = "Times"
            If PassFormEdit Then
                'If BreathingRates > 1 Then
                '    If Not ValidateTimes Then
                '        cancel = 1
                '    End If
                'End If
                
                'If cancel = 0 Then
                    SaveData 'passed br and occupancy
                    frmRadtrad.SaveState True
                'End If
            Else
              cancel = 1 ' failed br/occupancy time edit
            End If
        Else
          cancel = 1 ' failed numeric edit
        End If
    Else
      cancel = 1 'failed name edit
    End If
  
  EditData = cancel
End Function

Private Sub txtTimeOcc_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtTimeOcc(Index - 1).SetFocus
            Else
                txtTimeOcc(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtTimeOcc(Index + 1).SetFocus
            Else
                txtTimeOcc(0).SetFocus
            End If
        Case vbKeyLeft
            txtBR(Index).SetFocus
        Case vbKeyRight
            txtOccupy(Index).SetFocus
    End Select
End Sub
