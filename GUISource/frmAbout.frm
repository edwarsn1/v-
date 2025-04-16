VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About Radtrad"
   ClientHeight    =   3624
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   5652
   ClipControls    =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3624
   ScaleWidth      =   5652
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Tag             =   "About Radtrad"
   Begin VB.PictureBox picIcon 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   480
      Left            =   240
      ScaleHeight     =   480
      ScaleMode       =   0  'User
      ScaleWidth      =   480
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   240
      Width           =   480
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   4245
      TabIndex        =   0
      Tag             =   "OK"
      Top             =   3120
      Width           =   1260
   End
   Begin VB.Label lblVersion 
      Caption         =   "Code Revision"
      Height          =   225
      Index           =   1
      Left            =   1050
      TabIndex        =   6
      Tag             =   "Version"
      Top             =   1080
      Width           =   4125
   End
   Begin VB.Label lblDescription 
      Alignment       =   2  'Center
      Caption         =   "App Description"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   720
      Left            =   1080
      TabIndex        =   5
      Tag             =   "App Description"
      Top             =   1605
      Width           =   4080
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "Application Title"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   960
      TabIndex        =   4
      Tag             =   "Application Title"
      Top             =   240
      Width           =   4125
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   225
      X2              =   5450
      Y1              =   2430
      Y2              =   2430
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   240
      X2              =   5450
      Y1              =   2445
      Y2              =   2445
   End
   Begin VB.Label lblVersion 
      Caption         =   "Version"
      Height          =   225
      Index           =   0
      Left            =   1050
      TabIndex        =   3
      Tag             =   "Version"
      Top             =   780
      Width           =   4125
   End
   Begin VB.Label lblDisclaimer 
      ForeColor       =   &H00000000&
      Height          =   825
      Left            =   255
      TabIndex        =   2
      Tag             =   "Warning: ..."
      Top             =   2625
      Width           =   3870
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Form_Load()
'    lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
    lblVersion(0).Caption = "Input Format: " + Appl.VersionStamp
    lblVersion(1).Caption = "Code Revision: " + Appl.CodeRevisionStamp
    lblTitle.Caption = App.Title
    lblDescription = "A Simplified Model for Radionuclide Transport and Removal and Dose Estimation"
    lblDisclaimer = "Open Radtrad301Help.htm in your browser for an overview of installing and running Radtrad."
End Sub

Private Sub cmdOK_Click()
        Unload Me
End Sub


