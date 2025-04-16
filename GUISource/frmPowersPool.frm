VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmPowersPool 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Compartment Features: Overlying Pool"
   ClientHeight    =   6990
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6600
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
   ScaleHeight     =   6990
   ScaleWidth      =   6600
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Reset"
      Height          =   375
      Left            =   5160
      TabIndex        =   51
      ToolTipText     =   "Restore original data"
      Top             =   120
      Width           =   1335
   End
   Begin VB.Frame fraPercentile 
      Caption         =   "Percentile"
      Height          =   735
      Left            =   1560
      TabIndex        =   0
      ToolTipText     =   "10% represents minimum decontamination"
      Top             =   960
      Width           =   3495
      Begin VB.OptionButton optPercentile 
         Caption         =   "90%"
         Height          =   240
         Index           =   2
         Left            =   2520
         TabIndex        =   50
         Top             =   360
         Width           =   855
      End
      Begin VB.OptionButton optPercentile 
         Caption         =   "50%"
         Height          =   240
         Index           =   1
         Left            =   1380
         TabIndex        =   49
         Top             =   360
         Width           =   855
      End
      Begin VB.OptionButton optPercentile 
         Caption         =   "10%"
         Height          =   240
         Index           =   0
         Left            =   240
         TabIndex        =   2
         Top             =   360
         Width           =   855
      End
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
      Left            =   3390
      TabIndex        =   48
      Top             =   5640
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
      Left            =   3390
      TabIndex        =   47
      Top             =   5280
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
      Left            =   3390
      TabIndex        =   46
      Top             =   4920
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
      Left            =   3390
      TabIndex        =   45
      Top             =   4560
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
      Left            =   3390
      TabIndex        =   44
      Top             =   4200
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
      Left            =   3390
      TabIndex        =   43
      Top             =   3840
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
      Left            =   3390
      TabIndex        =   42
      Top             =   3480
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
      Left            =   3390
      TabIndex        =   41
      Top             =   3120
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
      Left            =   3390
      TabIndex        =   40
      Top             =   2760
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
      Left            =   3390
      TabIndex        =   39
      Top             =   2400
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
      Left            =   1995
      TabIndex        =   37
      Top             =   5640
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
      Left            =   1995
      TabIndex        =   36
      Top             =   5280
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
      Left            =   1995
      TabIndex        =   35
      Top             =   4920
      Width           =   1395
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5160
      TabIndex        =   34
      ToolTipText     =   "Save data and close"
      Top             =   600
      Width           =   1335
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
      Left            =   1995
      TabIndex        =   33
      Top             =   4560
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
      Left            =   1995
      TabIndex        =   32
      Top             =   4200
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
      Left            =   1995
      TabIndex        =   31
      Top             =   3840
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
      Left            =   1995
      TabIndex        =   30
      Top             =   3480
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
      Left            =   1995
      TabIndex        =   29
      Top             =   3120
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
      Left            =   1995
      TabIndex        =   28
      Top             =   2760
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
      Left            =   1995
      TabIndex        =   27
      Top             =   2400
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
      Left            =   720
      TabIndex        =   14
      Top             =   5640
      Width           =   1275
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   13
      Top             =   6615
      Width           =   6600
      _ExtentX        =   11642
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
      Left            =   720
      TabIndex        =   12
      Top             =   5280
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
      Left            =   720
      TabIndex        =   11
      Top             =   4920
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
      Left            =   720
      TabIndex        =   10
      Top             =   4560
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
      Left            =   720
      TabIndex        =   9
      Top             =   4200
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
      Left            =   720
      TabIndex        =   8
      Top             =   3840
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
      Left            =   720
      TabIndex        =   7
      Top             =   3480
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
      Left            =   720
      TabIndex        =   6
      Top             =   3120
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
      Left            =   720
      TabIndex        =   5
      Top             =   2760
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
      Left            =   720
      TabIndex        =   4
      Top             =   2400
      Width           =   1275
   End
   Begin VB.Label lblPaste 
      Alignment       =   2  'Center
      Caption         =   "Paste"
      Height          =   255
      Left            =   2400
      TabIndex        =   52
      ToolTipText     =   "Used to copy data from spreadsheets"
      Top             =   6120
      Width           =   615
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      Caption         =   "Pool Temp (deg F)"
      Height          =   480
      Index           =   1
      Left            =   3405
      TabIndex        =   38
      Top             =   1800
      Width           =   1365
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      Caption         =   "Pool Depth   (ft)"
      Height          =   480
      Index           =   0
      Left            =   2010
      TabIndex        =   26
      Top             =   1800
      Width           =   1335
   End
   Begin VB.Label lblRow 
      Alignment       =   2  'Center
      Caption         =   "Time (h)"
      Height          =   375
      Index           =   10
      Left            =   870
      TabIndex        =   25
      Top             =   2040
      Width           =   975
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   24
      Top             =   5340
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   23
      Top             =   4980
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   240
      TabIndex        =   22
      Top             =   5700
      Width           =   255
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   21
      Top             =   4620
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   20
      Top             =   4260
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   19
      Top             =   3900
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   18
      Top             =   3540
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   17
      Top             =   3180
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   16
      Top             =   2820
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
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
      Left            =   360
      TabIndex        =   15
      Top             =   2460
      Width           =   135
   End
   Begin VB.Shape Shape1 
      Height          =   4815
      Left            =   120
      Top             =   1680
      Width           =   4935
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      Caption         =   "Powers Aerosol Decontamination Factor Model"
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
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   4875
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      Caption         =   "Compartment Features: Overlying Pool"
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
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4005
   End
End
Attribute VB_Name = "frmPowersPool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Ntvals As Integer
Private CurrentIndex As Integer
Private ValidPercentiles(0 To 2)
'Private IgnoreModify As Boolean
Private DataModify As Boolean
Private TheFormEdit As Boolean ' pass or fail the edits
Private TheEditType As String  ' which edit to do

Private Sub cmdCancel_Click()
'  IgnoreModify = True
  InitControls
End Sub

Private Sub cmdExit_Click()
' IgnoreModify = False
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
    If DataModify Then
        cancel = EditData
        If cancel = 0 Then
          frmRadtrad.SaveState True
        End If
    End If
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

Private Sub txtCol2_LostFocus(Index As Integer)
  DoRangeEdits txtCol2(Index), 2, "Range Error at Time" + Str(Index + 1)
End Sub

Private Sub txtCol2_GotFocus(Index As Integer)
  SetSelect txtCol2(Index)
End Sub

Public Sub SaveData(ntime As Integer)
Dim j
         
   On Error GoTo errorhandler
'   On Error Resume Next
    With CompartmentArr(CurrentIndex).F3OPool.Powers
      .Count = ntime
      ReDim .times(1 To ntime) As Single, _
      .PoolDepth(1 To ntime) As Single, _
      .PoolTemp(1 To ntime) As Single
      For j = 1 To ntime
         .times(j) = CSng(txtTime(j - 1))
         .PoolDepth(j) = CSng(txtCol1(j - 1))
         .PoolTemp(j) = CSng(txtCol2(j - 1))
      Next j
      For j = 0 To 2
'        Debug.Print "pool savedata", .Percentile
        If optPercentile(j).Value Then
          .Percentile = ValidPercentiles(j)
          Exit For
        End If
      Next j
  End With
  Exit Sub

errorhandler:
Dim msg As String
If Err.Number <> 0 Then
    msg = "PowersPool SaveData Error # " & Str(Err.Number) & " was generated by " _
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
                   
  With CompartmentArr(CurrentIndex).F3OPool.Powers
    'ReDim Preserve .times(1 To MaxDimen) As Single, _
        '.PoolDepth(1 To MaxDimen) As Single, _
        '.PoolTemp(1 To MaxDimen) As Single
    For i = 1 To MaxDimen
      If i > UBound(.times) Then
       txtTime(i - 1) = Format(0, TIMEFORM)
       txtCol1(i - 1) = Format(0, SCIZERO)
       txtCol2(i - 1) = Format(0, SCIZERO)
      Else
       txtTime(i - 1) = Format(.times(i), TIMEFORM)
       txtCol1(i - 1) = ZeroFormat(.PoolDepth(i), FloatFormat)
       txtCol2(i - 1) = ZeroFormat(.PoolTemp(i), FloatFormat)
      End If
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
  End With
  'IgnoreModify = False
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
  If Not TheFormEdit Then
    ShowErrorMessage EditType, lblData(0)
  End If
End Property

Public Property Get EditType() As String
    EditType = TheEditType
End Property

Public Property Let EditType(ByVal vNewValue As String)
  TheEditType = vNewValue
  PassFormEdit = DoFormEdit(Me, TheEditType)
End Property

Private Sub txtTime_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtTime_GotFocus(Index As Integer)
  SetSelect txtTime(Index)
End Sub

Public Function EditData() As Integer
    Dim cancel As Integer
    Dim i
    
    cancel = 0
    EditType = "Numeric"
    If PassFormEdit Then
        EditType = "Times"
        If PassFormEdit Then
            Ntvals = CInt(Me.Tag) 'number of time values just stored by times edit
            Me.Tag = ""
            For i = 1 To Ntvals
              If Not DoRangeEdits(txtCol2(i - 1), 2, "Range Error at Time " + Str(i)) Then
                cancel = 1
                Exit For
              End If
            Next i
           If cancel = 0 Then
               SaveData Ntvals
               frmRadtrad.SaveState True
           End If
        Else
           cancel = 1 ' failed numeric edit;  re-edit when OK pressed
        End If
    Else
      cancel = 1 ' failed time edit
    End If
    EditData = cancel
End Function

Public Function DoRangeEdits(TB As TextBox, colnum, Title) As Boolean
Dim msg, num

 DoRangeEdits = True
 If Not IsNumeric(TB.Text) Then Exit Function
 If colnum = 1 Then Exit Function
 num = CSng(TB.Text)
 If num < 36 Or num > 212 Then
   msg = "Pool temperature should be between 36 and 212 degrees F."
   MsgBox msg, vbOKOnly + vbExclamation, Title
   DoRangeEdits = False
   TB.SetFocus
  End If
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
