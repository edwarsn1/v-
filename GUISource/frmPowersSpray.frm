VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmPowersSpray 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00BDDEEC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Compartment Features: Sprays"
   ClientHeight    =   7110
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6870
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7110
   ScaleWidth      =   6870
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Reset"
      Height          =   375
      Left            =   5280
      TabIndex        =   53
      ToolTipText     =   "Restore original data"
      Top             =   120
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00BDDEEC&
      Caption         =   "Percentile"
      Height          =   855
      Left            =   2160
      TabIndex        =   2
      ToolTipText     =   "10% represents minimum decontamination"
      Top             =   1080
      Width           =   3015
      Begin VB.OptionButton optPercentile 
         BackColor       =   &H00BDDEEC&
         Caption         =   "90%"
         Height          =   255
         Index           =   2
         Left            =   2040
         TabIndex        =   52
         Top             =   360
         Width           =   855
      End
      Begin VB.OptionButton optPercentile 
         BackColor       =   &H00BDDEEC&
         Caption         =   "50%"
         Height          =   255
         Index           =   1
         Left            =   1080
         TabIndex        =   51
         Top             =   360
         Width           =   855
      End
      Begin VB.OptionButton optPercentile 
         BackColor       =   &H00BDDEEC&
         Caption         =   "10%"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   50
         Top             =   360
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.TextBox txtFracSpray 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   600
      TabIndex        =   1
      Text            =   "1.0000"
      ToolTipText     =   "Ratio of Unsprayed volume to Sprayed volume"
      Top             =   1440
      Width           =   975
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   3510
      TabIndex        =   48
      Top             =   5760
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   3510
      TabIndex        =   47
      Top             =   5400
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   3510
      TabIndex        =   46
      Top             =   5040
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   3510
      TabIndex        =   45
      Top             =   4680
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   3510
      TabIndex        =   44
      Top             =   4320
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   3510
      TabIndex        =   43
      Top             =   3960
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   3510
      TabIndex        =   42
      Top             =   3600
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   3510
      TabIndex        =   41
      Top             =   3240
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   3510
      TabIndex        =   40
      Top             =   2880
      Width           =   1395
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   3510
      TabIndex        =   39
      Top             =   2520
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   2115
      TabIndex        =   37
      Top             =   5760
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   2115
      TabIndex        =   36
      Top             =   5400
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   2115
      TabIndex        =   35
      Top             =   5040
      Width           =   1395
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5280
      TabIndex        =   34
      ToolTipText     =   "Save data and close"
      Top             =   600
      Width           =   1455
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   2115
      TabIndex        =   33
      Top             =   4680
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   2115
      TabIndex        =   32
      Top             =   4320
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   2115
      TabIndex        =   31
      Top             =   3960
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   2115
      TabIndex        =   30
      Top             =   3600
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   2115
      TabIndex        =   29
      Top             =   3240
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   2115
      TabIndex        =   28
      Top             =   2880
      Width           =   1395
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2115
      TabIndex        =   27
      Top             =   2520
      Width           =   1395
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   840
      TabIndex        =   14
      Top             =   5760
      Width           =   1275
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   13
      Top             =   6735
      Width           =   6870
      _ExtentX        =   12118
      _ExtentY        =   661
      Style           =   1
      SimpleText      =   "Model designed for PWR containments and BWR drywells"
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   840
      TabIndex        =   12
      Top             =   5400
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   840
      TabIndex        =   11
      Top             =   5040
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   840
      TabIndex        =   10
      Top             =   4680
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   840
      TabIndex        =   9
      Top             =   4320
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   840
      TabIndex        =   8
      Top             =   3960
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   840
      TabIndex        =   7
      Top             =   3600
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   840
      TabIndex        =   6
      Top             =   3240
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   840
      TabIndex        =   5
      Top             =   2880
      Width           =   1275
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   840
      TabIndex        =   4
      Top             =   2520
      Width           =   1275
   End
   Begin VB.Label lblPaste 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Paste"
      Height          =   255
      Left            =   2520
      TabIndex        =   54
      ToolTipText     =   "Used to copy data from spreadsheets"
      Top             =   6240
      Width           =   615
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Spray Alpha"
      Height          =   255
      Index           =   2
      Left            =   360
      TabIndex        =   49
      Top             =   1200
      Width           =   1455
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "Height (ft)"
      Height          =   240
      Index           =   1
      Left            =   3780
      TabIndex        =   38
      Top             =   2160
      Width           =   855
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "Flux (cfm/sq ft)"
      Height          =   240
      Index           =   0
      Left            =   2175
      TabIndex        =   26
      Top             =   2160
      Width           =   1275
   End
   Begin VB.Label lblRow 
      Alignment       =   2  'Center
      BackColor       =   &H00BDDEEC&
      Caption         =   "Time (h)"
      Height          =   240
      Index           =   10
      Left            =   1020
      TabIndex        =   25
      Top             =   2160
      Width           =   915
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   8
      Left            =   480
      TabIndex        =   24
      Top             =   5460
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   7
      Left            =   480
      TabIndex        =   23
      Top             =   5100
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   9
      Left            =   360
      TabIndex        =   22
      Top             =   5820
      Width           =   255
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   6
      Left            =   480
      TabIndex        =   21
      Top             =   4740
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   5
      Left            =   480
      TabIndex        =   20
      Top             =   4380
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   4
      Left            =   480
      TabIndex        =   19
      Top             =   4020
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   3
      Left            =   480
      TabIndex        =   18
      Top             =   3660
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   2
      Left            =   480
      TabIndex        =   17
      Top             =   3300
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   480
      TabIndex        =   16
      Top             =   2940
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   480
      TabIndex        =   15
      Top             =   2580
      Width           =   135
   End
   Begin VB.Shape Shape1 
      Height          =   4575
      Left            =   240
      Top             =   2040
      Width           =   4935
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "Powers Model for Aerosol Removal Coefficients"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   240
      TabIndex        =   3
      Top             =   600
      Width           =   4950
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      BackColor       =   &H00BDDEEC&
      Caption         =   "Compartment Features: Sprays"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   195
      Width           =   3210
   End
End
Attribute VB_Name = "frmPowersSpray"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Ntvals As Integer
Dim CurrentIndex As Integer
Dim ValidPercentiles(0 To 2)
Dim DataModify As Boolean
Private TheFormEdit As Boolean ' pass or fail the edits
Private TheEditType As String  ' which edit to do

Private Sub cmdCancel_Click()
  InitControls
End Sub

Private Sub cmdExit_Click()
  Unload Me
End Sub

Private Sub Form_Activate()
    SetControlColor Me
    CheckClipboard
End Sub

Private Sub Form_Load()

  ValidPercentiles(0) = 10
  ValidPercentiles(1) = 50
  ValidPercentiles(2) = 90

  SetTabIndex
  CurrentIndex = frmCompartment.CurrentIndex
  InitControls
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CheckClipboard
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
'  If DataModify And Not IgnoreModify Then cancel = EditData

    If DataModify Then
        'Added range checking (this form only) JCK 12/19/00
        cancel = CheckMinMax
        If cancel = 0 Then
            cancel = EditData
            If cancel = 0 Then frmRadtrad.SaveState True
        End If
    End If
End Sub

Private Sub lblPaste_Click()
    PasteToTable
End Sub

Private Sub optPercentile_Click(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol1_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol1_GotFocus(Index As Integer)
  SetSelect txtCol1(Index)
End Sub

Private Sub txtCol1_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtCol1(Index - 1).SetFocus
            Else
                txtCol1(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtCol1(Index + 1).SetFocus
            Else
                txtCol1(0).SetFocus
            End If
        Case vbKeyLeft
            txtTime(Index).SetFocus
        Case vbKeyRight
            txtCol2(Index).SetFocus
    End Select
End Sub

Private Sub txtCol2_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol2_GotFocus(Index As Integer)
 SetSelect txtCol2(Index)
End Sub

'Type compartmentrecord
'  Name As String
'  Type As Integer
'  Volume As Single
'  Features(0 To 3) As Integer
'  SourceTerm As Boolean ' may not need this
'  F0Sprays As spraysrecord
'  F1ReFilters As refilrecord
'  F2Deposition As depositionrecord
'  F3OPool As overlyingpoolrecord
'End Type
'Type powerssprayrecord 'p. 34
'  Times() As Single
'  Flux() As Single
'  Height() As Single
'  FracSprayed As Single
'  Percentile As Single
'End Type

Public Sub SaveData(ntime As Integer)
   Dim j
  
   On Error GoTo errorhandler
 '  On Error Resume Next
  
      With CompartmentArr(CurrentIndex).F0Sprays.Powers
        .Count = ntime
        ReDim .times(1 To ntime) As Single, _
              .Flux(1 To ntime) As Single, _
              .Height(1 To ntime) As Single
        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .Flux(j) = CSng(txtCol1(j - 1))
           .Height(j) = CSng(txtCol2(j - 1))
        Next j
                
        For j = 0 To 2
          If optPercentile(j).Value Then
            .Percentile = ValidPercentiles(j)
            Exit For
          End If
        Next j
        .FracSpray = CSng(txtFracSpray)
      End With
 
   
Exit Sub
errorhandler:
Dim msg As String
If Err.Number <> 0 Then
    msg = "Powers Spray Savedata Error # " & Str(Err.Number) & " was generated by " _
            & Err.Source & Chr(13) & Err.Description
    MsgBox msg, vbOKOnly + vbExclamation, "Error"
End If
End Sub

Public Sub InitControls()
' fill form controls with this particular type of data, from headerrecord in module1.
Dim i
Dim AControl As Control
  
  For Each AControl In Controls
    If TypeOf AControl Is TextBox Then AControl.Text = ""
    If TypeOf AControl Is TextBox Or TypeOf AControl Is ComboBox Then
      AControl.BackColor = vbWhite
      AControl.ForeColor = vbBlack
    End If
  Next
  
  lblData(0) = "Compartment " + Format(CurrentIndex) + ": " + _
                   CompartmentArr(CurrentIndex).Name
  With CompartmentArr(CurrentIndex).F0Sprays.Powers
    'ReDim Preserve .times(1 To MaxDimen) As Single, _
       '.Flux(1 To MaxDimen) As Single, _
       '.Height(1 To MaxDimen) As Single
    For i = 1 To MaxDimen
      If i > UBound(.times) Then
        txtTime(i - 1) = Format(0, TIMEFORM)
        txtCol1(i - 1) = Format(0, SCIZERO)
        txtCol2(i - 1) = Format(0, SCIZERO)
      Else
        txtTime(i - 1) = Format(.times(i), TIMEFORM)
        txtCol1(i - 1) = ZeroFormat(.Flux(i), FloatFormat)
        txtCol2(i - 1) = ZeroFormat(.Height(i), FloatFormat)
      End If
      txtCol1(i - 1).ToolTipText = "Ratio of Sprayed flow (cfm) to floor area (sq ft) [.002-0.5 cfm/ft2]"
      txtCol2(i - 1).ToolTipText = "Distance from headers to floor (ft) [16.5-164 ft]"
    Next i
' Belcourt added to always initialize
    txtTime(0) = SourceTerm.DelayTime
    Select Case .Percentile
      Case 10:
        optPercentile(0).Value = True
      Case 50:
        optPercentile(1).Value = True
      Case 90:
        optPercentile(2).Value = True
    End Select
    
    txtFracSpray = ZeroFormat(.FracSpray, FloatFormat)
    txtFracSpray.Tag = "num" 'JCK
  End With
  DataModify = False
End Sub

Private Sub CheckClipboard()
'See if data on the clipboard looks like Excel data - JCK 11/2005
Dim ValidData As Boolean
Dim i As Integer

    ValidData = CheckClipboardData
    If ValidData <> lblPaste.Enabled Then
        lblPaste.Enabled = ValidData
    End If
OK:
End Sub

Private Sub PasteToTable()
'JCK 11/2005
Dim PasteData() As String
Dim Buffer As String
Dim nError As Single
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

        If j = 0 Then
            If val(txtTime(j).Text) <> val(PasteData(0)) Then
                nError = val(txtTime(j).Text)
                Exit Do
            End If
        Else
            txtTime(j).Text = PasteData(0)
        End If
        txtCol1(j).Text = PasteData(1)
        txtCol2(j).Text = PasteData(2)
        j = j + 1
    Loop Until Buffer = ""
    
    If nError >= 0 Then
        PasteError nError, Me
    End If
    
    txtCol1(0).SetFocus
    Exit Sub
    
PastingError:
    Beep
End Sub

Public Sub SetTabIndex()
  Dim i
  Dim maxcols
  
  maxcols = 3
  For i = 0 To MaxDimen - 1
    txtTime(i).TabIndex = i * maxcols + 3
    txtTime(i).Tag = "time"
    txtCol1(i).TabIndex = i * maxcols + 4
    txtCol1(i).Tag = "num"
    txtCol2(i).TabIndex = i * maxcols + 5
    txtCol2(i).Tag = "num"
  Next i
End Sub

Public Property Get PassFormEdit() As Boolean
  PassFormEdit = TheFormEdit
End Property

Public Property Let PassFormEdit(ByVal vNewValue As Boolean)
  TheFormEdit = vNewValue
  If Not TheFormEdit Then ShowErrorMessage EditType, lblData(0)
End Property

Public Property Get EditType() As String
   EditType = TheEditType
End Property

Public Property Let EditType(ByVal vNewValue As String)
  TheEditType = vNewValue
  PassFormEdit = DoFormEdit(Me, TheEditType)
End Property

Private Sub txtCol2_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtCol2(Index - 1).SetFocus
            Else
                txtCol2(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtCol2(Index + 1).SetFocus
            Else
                txtCol2(0).SetFocus
            End If
        Case vbKeyLeft
            txtCol1(Index).SetFocus
    End Select
End Sub

Private Sub txtFracSpray_Change()
    DataModify = True
End Sub

Private Sub txtTime_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtTime_GotFocus(Index As Integer)
  SetSelect txtTime(Index)
End Sub

Public Function EditData() As Integer
Dim cancel As Integer
   
    cancel = 0
    EditType = "Numeric"
    If PassFormEdit Then
        EditType = "Times"
        If PassFormEdit Then
            Ntvals = CInt(Me.Tag) 'number of time values just stored by times edit
            Me.Tag = ""
           SaveData Ntvals
           frmRadtrad.SaveState True
        Else
           cancel = 1 ' failed numeric edit;  re-edit when OK pressed
        End If
    Else
      cancel = 1 ' failed time edit
    End If
    EditData = cancel
End Function

Function CheckMinMax() As Integer
Dim Index As Integer
 
    CheckMinMax = 0
  
    For Index = 0 To MaxDimen - 1
        If val(txtTime(Index)) = 0 And Index <> 0 Then
            Exit For
        Else
            With txtCol1(Index)
                If Not IsNumeric(.Text) Then Exit Function
                If val(.Text) < 0.002 Or val(.Text) > 0.5 Then
                    If Index < MaxDimen - 1 Then
                        If txtTime(Index + 1) <> 0 Then
                            MsgBox "Flux value must be between 0.002 and 0.5", _
                                        vbExclamation, "Out of Range"
                            .ForeColor = vbRed
                            CheckMinMax = 1
                            Exit For
                        End If
                    End If
                ElseIf .ForeColor <> vbBlack Then
                    .ForeColor = vbBlack
                End If
            End With
            
            With txtCol2(Index)
                If Not IsNumeric(.Text) Then Exit Function
                If val(.Text) < 16.4 Or val(.Text) > 164 Then
                    If Index < MaxDimen - 1 Then
                        If txtTime(Index + 1) <> 0 Then
                            MsgBox "Height value must be between 16.4 and 164", _
                                vbExclamation, "Out of Range"
                            .ForeColor = vbRed
                            CheckMinMax = 1
                            Exit For
                        End If
                    End If
                ElseIf .ForeColor <> vbBlack Then
                    .ForeColor = vbBlack
                End If
            End With
        End If
    Next
End Function

Private Sub txtTime_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtTime(Index - 1).SetFocus
            Else
                txtTime(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtTime(Index + 1).SetFocus
            Else
                txtTime(0).SetFocus
            End If
        Case vbKeyRight
            txtCol1(Index).SetFocus
    End Select
End Sub
