VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmBrockBixler 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00EDF1DC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Piping Deposition Parameters"
   ClientHeight    =   8595
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10170
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
   ScaleHeight     =   8595
   ScaleWidth      =   10170
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtdeposition 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   7680
      TabIndex        =   10
      Tag             =   "num"
      ToolTipText     =   "User may use own values (or Bixler-Cline) for the velocity"
      Top             =   7260
      Width           =   1335
   End
   Begin VB.Frame fraConditions 
      BackColor       =   &H00EDF1DC&
      Caption         =   "Conditions"
      Height          =   2415
      Left            =   4320
      TabIndex        =   58
      Top             =   1440
      Width           =   2295
      Begin VB.TextBox txtConditions 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Index           =   0
         Left            =   480
         TabIndex        =   4
         Tag             =   "num"
         ToolTipText     =   "Temperature of the pipe wall (550 F typical)"
         Top             =   1680
         Width           =   1335
      End
      Begin VB.TextBox txtConditions 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Index           =   1
         Left            =   480
         TabIndex        =   3
         Tag             =   "num"
         ToolTipText     =   "Pressure in the pipe (typically atmospheric, cfm)"
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label lblConditions 
         Alignment       =   2  'Center
         BackColor       =   &H00EDF1DC&
         Caption         =   "Pressure  (psi)"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   60
         ToolTipText     =   "Pressure in the pipe (typically atmospheric)"
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label lblConditions 
         Alignment       =   2  'Center
         BackColor       =   &H00EDF1DC&
         Caption         =   "Wall temperature (deg F)"
         Height          =   495
         Index           =   0
         Left            =   240
         TabIndex        =   59
         ToolTipText     =   "Temperature of the pipe wall (550 F typical)"
         Top             =   1200
         Width           =   1815
      End
   End
   Begin VB.Frame fraAerosol 
      BackColor       =   &H00EDF1DC&
      Caption         =   "Aerosol"
      Height          =   1575
      Left            =   4320
      TabIndex        =   56
      ToolTipText     =   "Guidance is available in AEB 98-03, default is best estimate value"
      Top             =   4080
      Width           =   2295
      Begin VB.TextBox txtAerosol 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   480
         TabIndex        =   23
         Tag             =   "num"
         ToolTipText     =   "Guidance is available in AEB 98-03, default is best estimate value"
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label lblAerosolSize 
         Alignment       =   2  'Center
         BackColor       =   &H00EDF1DC&
         Caption         =   "Median Settling Velocity (m/s)"
         Height          =   555
         Left            =   240
         TabIndex        =   57
         ToolTipText     =   "Guidance is available in AEB 98-03, default is best estimate value"
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00EDF1DC&
      Caption         =   "Geometry"
      Height          =   4215
      Left            =   7080
      TabIndex        =   51
      Top             =   1440
      Width           =   2535
      Begin VB.TextBox txtGeometry 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Index           =   2
         Left            =   600
         TabIndex        =   2
         Tag             =   "num"
         ToolTipText     =   "Bend angles in the pipe are summed (typically used for condensers, not MSIV's)"
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox txtGeometry 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Index           =   3
         Left            =   600
         TabIndex        =   62
         ToolTipText     =   "Not a user input, displayed as a user note"
         Top             =   3480
         Width           =   1335
      End
      Begin VB.TextBox txtGeometry 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Index           =   1
         Left            =   600
         TabIndex        =   1
         Tag             =   "num"
         ToolTipText     =   "Include only horizontal lengths"
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox txtGeometry 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Index           =   0
         Left            =   600
         TabIndex        =   0
         Tag             =   "num"
         ToolTipText     =   "Volume and Surface Area are of the pipe"
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label lblGeometry 
         Alignment       =   2  'Center
         BackColor       =   &H00EDF1DC&
         Caption         =   "Total Pipe Bend Angle (deg)"
         Height          =   495
         Index           =   5
         Left            =   360
         TabIndex        =   55
         ToolTipText     =   "Bend angles in the pipe are summed (typically used for condensers, not MSIV's)"
         Top             =   2160
         Width           =   1815
      End
      Begin VB.Label lblGeometry 
         Alignment       =   2  'Center
         BackColor       =   &H00EDF1DC&
         Caption         =   "Diameter (ft)"
         Height          =   255
         Index           =   4
         Left            =   480
         TabIndex        =   54
         ToolTipText     =   "Not a user input, displayed as a user note"
         Top             =   3240
         Width           =   1575
      End
      Begin VB.Label lblGeometry 
         Alignment       =   2  'Center
         BackColor       =   &H00EDF1DC&
         Caption         =   "Total surface area  (sq ft)"
         Height          =   495
         Index           =   1
         Left            =   600
         TabIndex        =   53
         ToolTipText     =   "Include only horizontal lengths"
         Top             =   1080
         Width           =   1335
      End
      Begin VB.Label lblGeometry 
         Alignment       =   2  'Center
         BackColor       =   &H00EDF1DC&
         Caption         =   "Volume  (cu ft)"
         Height          =   195
         Index           =   0
         Left            =   480
         TabIndex        =   52
         ToolTipText     =   "Volume and Surface Area are of the pipe"
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame fraElem_Organic 
      BackColor       =   &H00EDF1DC&
      Caption         =   "Elemental && Organic Settling"
      Height          =   2055
      Left            =   4320
      TabIndex        =   49
      ToolTipText     =   "User may use own values (or Bixler-Cline) for the velocity"
      Top             =   5880
      Width           =   5295
      Begin VB.OptionButton optVapor 
         BackColor       =   &H00EDF1DC&
         Caption         =   "Fixed"
         Height          =   255
         Index           =   2
         Left            =   3840
         TabIndex        =   8
         ToolTipText     =   "Specify a value for velocity"
         Top             =   425
         Width           =   1000
      End
      Begin VB.OptionButton optVapor 
         BackColor       =   &H00EDF1DC&
         Caption         =   "Bixler"
         Height          =   255
         Index           =   1
         Left            =   2280
         TabIndex        =   7
         ToolTipText     =   "Use Bixler-Cline velocity"
         Top             =   425
         Width           =   1335
      End
      Begin VB.OptionButton optVapor 
         BackColor       =   &H00EDF1DC&
         Caption         =   "None"
         Height          =   255
         Index           =   0
         Left            =   720
         TabIndex        =   6
         ToolTipText     =   "No option implies total re-volatilization"
         Top             =   425
         Width           =   1215
      End
      Begin VB.TextBox txtdeposition 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   375
         Index           =   0
         Left            =   3360
         TabIndex        =   9
         Tag             =   "num"
         ToolTipText     =   "User may use own values (or Bixler-Cline) for the velocity"
         Top             =   875
         Width           =   1335
      End
      Begin VB.Label lblVelocity 
         BackColor       =   &H00EDF1DC&
         Caption         =   "Organic Velocity (ft/sec)"
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   64
         ToolTipText     =   "User may use own values (or Bixler-Cline) for the velocity"
         Top             =   1425
         Width           =   2415
      End
      Begin VB.Label lblVelocity 
         BackColor       =   &H00EDF1DC&
         Caption         =   "Elemental Velocity (ft/sec)"
         Height          =   255
         Index           =   4
         Left            =   840
         TabIndex        =   50
         ToolTipText     =   "User may use own values (or Bixler-Cline) for the velocity"
         Top             =   920
         Width           =   2535
      End
   End
   Begin VB.OptionButton optHomogenous 
      BackColor       =   &H00EDF1DC&
      Caption         =   "Homogenous flow model"
      Height          =   255
      Left            =   960
      TabIndex        =   12
      ToolTipText     =   "Select original (slug) model or NRC preferred (homogeneous) model"
      Top             =   1680
      Width           =   3135
   End
   Begin VB.OptionButton optSlug 
      BackColor       =   &H00EDF1DC&
      Caption         =   "Slug flow model"
      Height          =   255
      Left            =   960
      TabIndex        =   11
      ToolTipText     =   "Select original (slug) model or NRC preferred (homogeneous) model"
      Top             =   2160
      Width           =   2295
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
      Left            =   2175
      TabIndex        =   5
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   3600
      Width           =   1335
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
      Left            =   960
      TabIndex        =   48
      Top             =   3960
      Width           =   1215
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
      Left            =   960
      TabIndex        =   47
      Top             =   4320
      Width           =   1215
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
      Left            =   960
      TabIndex        =   46
      Top             =   4680
      Width           =   1215
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
      Left            =   2175
      TabIndex        =   45
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   3960
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
      Index           =   2
      Left            =   2175
      TabIndex        =   44
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   4320
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
      Index           =   3
      Left            =   2175
      TabIndex        =   43
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   4680
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Reset"
      Height          =   375
      Left            =   8160
      TabIndex        =   25
      ToolTipText     =   "Restore original data"
      Top             =   240
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
      Index           =   9
      Left            =   2175
      TabIndex        =   42
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   6840
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
      Index           =   8
      Left            =   2175
      TabIndex        =   41
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   6480
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
      Index           =   7
      Left            =   2175
      TabIndex        =   40
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   6120
      Width           =   1335
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&OK"
      Height          =   375
      Left            =   8160
      TabIndex        =   27
      ToolTipText     =   "Save data and close"
      Top             =   720
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
      Left            =   2175
      TabIndex        =   39
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   5760
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
      Index           =   5
      Left            =   2175
      TabIndex        =   38
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   5400
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
      Index           =   4
      Left            =   2175
      TabIndex        =   37
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   5040
      Width           =   1335
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
      Left            =   960
      TabIndex        =   21
      Top             =   6840
      Width           =   1215
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   20
      Top             =   8220
      Width           =   10170
      _ExtentX        =   17939
      _ExtentY        =   661
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
      Left            =   960
      TabIndex        =   19
      Top             =   6480
      Width           =   1215
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
      Left            =   960
      TabIndex        =   18
      Top             =   6120
      Width           =   1215
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
      Left            =   960
      TabIndex        =   17
      Top             =   5760
      Width           =   1215
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
      Left            =   960
      TabIndex        =   16
      Top             =   5400
      Width           =   1215
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
      Left            =   960
      TabIndex        =   15
      Top             =   5040
      Width           =   1215
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
      Left            =   960
      TabIndex        =   14
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Label lblVelocity 
      BackColor       =   &H00EDF1DC&
      Caption         =   "Elemental Velocity (ft/sec)"
      Height          =   255
      Index           =   0
      Left            =   4800
      TabIndex        =   63
      ToolTipText     =   "User may use own values (or Bixler-Cline) for the velocity"
      Top             =   7320
      Width           =   2895
   End
   Begin VB.Label lblPaste 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   "Paste"
      Height          =   255
      Left            =   1860
      TabIndex        =   61
      ToolTipText     =   "Used to copy data from spreadsheets"
      Top             =   7320
      Width           =   615
   End
   Begin VB.Shape Shape1 
      Height          =   4815
      Left            =   360
      Top             =   2880
      Width           =   3495
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   "Flow Rate (scfm)"
      Height          =   480
      Index           =   0
      Left            =   2235
      TabIndex        =   36
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Label lblTime 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   "Time (h)"
      Height          =   255
      Left            =   1080
      TabIndex        =   35
      ToolTipText     =   "Flow in the pipe with the broken valve (cfm)"
      Top             =   3240
      Width           =   975
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   34
      Top             =   6540
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   33
      Top             =   6180
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   480
      TabIndex        =   32
      Top             =   6900
      Width           =   255
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   31
      Top             =   5820
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   30
      Top             =   5460
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   29
      Top             =   5100
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   28
      Top             =   4740
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   26
      Top             =   4380
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   24
      Top             =   4020
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00D8D8D8&
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
      Left            =   600
      TabIndex        =   22
      Top             =   3660
      Width           =   135
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
      Caption         =   "Transfer Pathways: Piping"
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
      TabIndex        =   13
      Top             =   360
      Width           =   2715
   End
End
Attribute VB_Name = "frmBrockBixler"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Private Ntvals As Integer
Private CurrentIndex As Integer 'current index of PathwayArr
Private TheFormEdit As Boolean ' pass or fail the edits
Private TheEditType As String  ' which edit to do
Private DataModify As Boolean

Private Sub cmdCancel_Click()
  InitControls
End Sub

Private Sub cmdExit_Click()
  Unload Me
End Sub

Private Sub Form_Activate()
    CheckClipboard
End Sub

Private Sub Form_Load()
  SetTabIndex
  CurrentIndex = frmPathway.CurrentIndex
  InitControls
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CheckClipboard
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
    If DataModify Then
        cancel = EditData
        If cancel = 0 Then frmRadtrad.SaveState True
    End If
End Sub

Private Sub Form_Resize()
  If Me.WindowState = vbNormal Then
    AdjustToScreen Me
  End If
End Sub

Private Sub lblPaste_Click()
    PasteToTable
End Sub

Private Sub optHomogenous_Click()
    DataModify = True
End Sub

Private Sub optSlug_Click()
    DataModify = True
End Sub

Private Sub optVapor_Click(Index As Integer)
Dim i As Integer

    For i = 0 To 1
        With txtdeposition(i)
            If Index = 2 Then
                .BackColor = vbWindowBackground
                .Enabled = True
            Else
                .BackColor = vbButtonFace
                .Enabled = False
            End If
        End With
    Next
    DataModify = True
End Sub

Private Sub txtAerosol_Change()
    DataModify = True
End Sub

Private Sub txtAerosol_GotFocus()
    SetSelect txtAerosol
End Sub

Private Sub txtCol1_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtConditions_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtConditions_GotFocus(Index As Integer)
    SetSelect txtConditions(Index)
End Sub

Private Sub txtConditions_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyUp
            If Index = 0 Then
                txtConditions(1).SetFocus
            End If
        Case vbKeyDown
            If Index = 0 Then
                txtCol1(0).SetFocus
            Else
                txtConditions(0).SetFocus
            End If
        Case vbKeyRight
            txtGeometry(0).SetFocus
    End Select
End Sub

Private Sub txtdeposition_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtDeposition_GotFocus(Index As Integer)
    SetSelect txtdeposition(Index)
End Sub

Private Sub txtGeometry_Change(Index As Integer)
Dim Area As Single, Volume As Single
Dim Diameter As Single, Length As Single

    If Index = 0 Or Index = 1 Then
        Volume = val(txtGeometry(0))
        Area = val(txtGeometry(1))
        If Volume > 0 And Area > 0 Then
            Diameter = Volume / Area * 4
            Length = Area / (Diameter * 3.14159)
            'Display calculated values
            txtGeometry(3) = Format(Diameter, "0.000")
        End If
    End If
    DataModify = True
End Sub

Private Sub txtGeometry_GotFocus(Index As Integer)
  SetSelect txtGeometry(Index)
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
                txtConditions(1).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtCol1(Index + 1).SetFocus
            Else
                txtCol1(0).SetFocus
            End If
        Case vbKeyLeft
            txtTime(Index).SetFocus
    End Select
End Sub

Public Sub SaveData(ntime As Integer)
   Dim i

   On Error GoTo errorhandler
'   On Error Resume Next

  With PathwayArr(CurrentIndex).TM0Piping
    If optSlug Then
        .AModelNum = 2
    Else
        .AModelNum = 3
    End If
    
    With .BrockmannA
    .FlowModel = IIf(optHomogenous, 1, 2)
    ReDim .times(1 To ntime) As Single, _
     .FlowRates(1 To ntime) As Single ', _
     '.UpstreamPressure(1 To ntime) As Single, _
     '.GasTemp(1 To ntime) As Single, _
     '.VaporDensity(1 To ntime) As Single
    .Count = ntime
    For i = 1 To ntime
       .times(i) = CSng(txtTime(i - 1))
       .FlowRates(i) = CSng(txtCol1(i - 1))
       '.UpstreamPressure(i) = CSng(txtCol2(i - 1))
       '.GasTemp(i) = CSng(txtCol3(i - 1))
       '.VaporDensity(i) = CSng(txtCol4(i - 1))
    Next i
    End With
    
    With .BrockmannA
      .WallTemp = CSng(txtConditions(0))
      'Pressure is always stored in atmospheres
      .Pressure = CSng(txtConditions(1))
      
      .FlowModel = IIf(optHomogenous, 1, 2)
      .Volume = CSng(txtGeometry(0))
      .TotalSurfaceArea = CSng(txtGeometry(1))
      If .Volume > 0 And .TotalSurfaceArea > 0 Then
        .Diameter = CSng(txtGeometry(3))
      End If
      .BendAngle = CSng(txtGeometry(2))
      .ElementalVelocity = CSng(txtdeposition(0))
      .OrganicVelocity = CSng(txtdeposition(1))
      .VaporModel = GetVaporModel
      .SettlingVelocity = CSng(txtAerosol)
    End With
    .EModelNum = GetVaporModel
    .OModelNum = .EModelNum
    If .EModelNum = 3 Then
        .BrockmannA.ElementalVelocity = CSng(txtdeposition(0))
        .BrockmannA.OrganicVelocity = CSng(txtdeposition(1))
    End If
  End With
Exit Sub

errorhandler:
Dim Msg As String
If Err.Number <> 0 Then
    Msg = Err.Description
    MsgBox Msg, vbOKOnly + vbExclamation, "Error Saving"
End If
End Sub

Private Function GetVaporModel() As Integer
Dim Model As Integer
Dim i As Integer

    'Interim implementation - JCK
    For i = 0 To 2
        If optVapor(i) Then
            Exit For
        End If
    Next
    
    Select Case i
        Case 0
           Model = 1
        Case 1
           Model = 2
        Case 2
           Model = 3
    End Select
    GetVaporModel = Model
End Function

Public Sub SetTabIndex()
  Dim i, j, maxcols
  ' set tab order and mark for numeric edit
  maxcols = 2
  'j = txtTime(0).TabIndex
  j = 6
  For i = 1 To MaxDimen - 1
    txtTime(i).TabIndex = j
    txtTime(i).Tag = "time"
    txtCol1(i).TabIndex = j + 1
    txtCol1(i).Tag = "num"
    j = j + maxcols
  Next i
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
  
  lblData(0) = "Pathway " + Format(CurrentIndex) + ": " + _
                   PathwayArr(CurrentIndex).Name
                   
  With PathwayArr(CurrentIndex).TM0Piping
    'Select Case .AModelNum -- changed 5/2006 JCK
    '  Case 2
    '    optSlug = True
    '  Case 3
        optHomogenous = True
    'End Select
    
    With .BrockmannA
        'ReDim Preserve .times(1 To MaxDimen) As Single, _
                        '.FlowRates(1 To MaxDimen) As Single
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            txtTime(i - 1) = Format(0, TIMEFORM)
            txtCol1(i - 1) = Format(0, SCIZERO)
          Else
            txtTime(i - 1) = Format(.times(i), TIMEFORM)
            txtCol1(i - 1) = ZeroFormat(.FlowRates(i), FloatFormat)
          End If
        Next i

        txtGeometry(0) = ZeroFormat(.Volume, FloatFormat)
        txtGeometry(1) = ZeroFormat(.TotalSurfaceArea, FloatFormat)
        txtGeometry(2) = Format(.BendAngle, "0.000")
        
        If .WallTemp = 0 Then .WallTemp = 32
        If .Pressure = 0 Then .Pressure = 14.7
        
        txtConditions(0) = Format(.WallTemp, "0.000")
        'Pressure is always stored in atmospheres
        txtConditions(1) = Format(.Pressure, "0.000")

        txtdeposition(0) = ZeroFormat(.ElementalVelocity, FloatFormat)
        txtdeposition(1) = ZeroFormat(.OrganicVelocity, FloatFormat)
        
        If .SettlingVelocity = 0 Then
            .SettlingVelocity = 0.00117
        End If
        txtAerosol = ZeroFormat(.SettlingVelocity, FloatFormat)

        If .times(1) = 0 And .Volume = 0 And .TotalSurfaceArea = 0 Then
            optVapor(0) = True
        End If
      End With
      
      If Not optVapor(0) Then 'Default set above for blank form
        Select Case .EModelNum
          Case 1
              optVapor(0) = True
          Case 2
              optVapor(1) = True
          Case 3
              optVapor(2) = True
        End Select
      End If
    End With
    
    For i = 0 To 2 'JCK
      Select Case i
        Case 0, 1, 2
          txtGeometry(i).Tag = "num"
      End Select
      If i < 2 Then
          txtConditions(i).Tag = "num"
      End If
    Next
    txtAerosol.Tag = "num"
    txtdeposition(0).Tag = "num"
    txtdeposition(1).Tag = "num"
    
    'Belcourt added to always initialize
    txtTime(0) = SourceTerm.DelayTime
    
    'Always last:
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

Private Sub txtGeometry_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyU
            If Index > 0 Then
                txtGeometry(Index - 1).SetFocus
            End If
        Case vbKeyDown
            If Index = 3 Then
                txtConditions(1).SetFocus
            Else
                txtGeometry(Index + 1).SetFocus
            End If
        Case vbKeyLeft
            txtConditions(1).SetFocus
    End Select
End Sub

Private Sub txtTime_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtTime_GotFocus(Index As Integer)
  SetSelect txtTime(Index)
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

Public Property Get EditType() As Variant
   EditType = TheEditType
End Property

Public Property Let EditType(ByVal vNewValue As Variant)
  TheEditType = vNewValue
  PassFormEdit = DoFormEdit(Me, TheEditType)
End Property

Public Function EditData() As Integer
  Dim cancel
    Dim i
    
    cancel = 0
    EditType = "Numeric"
    If PassFormEdit Then
        EditType = "Nonzero"
        If PassFormEdit Then
            EditType = "Times"
            If PassFormEdit Then
                Ntvals = CInt(Me.Tag) 'number of time values just stored by times edit
                Me.Tag = ""
                For i = 1 To Ntvals
                  If Not DoRangeEdits(txtCol1(i - 1), 1, "Range Error at Time" + Str(i)) Then
                    cancel = 1
                    Exit For
                  End If
                Next i
               If cancel = 0 Then
                   SaveData Ntvals
                   frmRadtrad.SaveState True
                End If
            Else
               cancel = 1 ' failed time edit;  re-edit when OK pressed
            End If
        Else
          cancel = 1 'failed nonzero edit (geometry)
        End If
    Else
      cancel = 1 ' failed numeric edit
    End If
  EditData = cancel
End Function

Public Function DoRangeEdits(TB As TextBox, colnum, Title) As Boolean
Dim Msg, num

 DoRangeEdits = True
 If Not IsNumeric(TB.Text) Then Exit Function
 If colnum <> 3 Then Exit Function
 num = CSng(TB.Text)
 If num < 32 And TB.Enabled Then
   Msg = "Gas temperature should be greater than 32 degrees F."
   MsgBox Msg, vbOKOnly + vbExclamation, Title
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
