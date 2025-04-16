VERSION 5.00
Begin VB.Form frmSplash 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4980
   ClientLeft      =   48
   ClientTop       =   48
   ClientWidth     =   7728
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4980
   ScaleWidth      =   7728
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   5
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Begin..."
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   360
      TabIndex        =   4
      Top             =   4080
      Width           =   1215
   End
   Begin VB.Frame fraMainFrame 
      BackColor       =   &H00FFFFFF&
      Height          =   4815
      Left            =   120
      TabIndex        =   0
      Top             =   45
      Width           =   7500
      Begin VB.CommandButton Command1 
         Caption         =   "Details..."
         Height          =   255
         Left            =   5755
         TabIndex        =   9
         Top             =   3120
         Width           =   855
      End
      Begin VB.PictureBox picLogo 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         ClipControls    =   0   'False
         FillColor       =   &H00FFFFFF&
         Height          =   660
         Index           =   0
         Left            =   240
         ScaleHeight     =   660
         ScaleWidth      =   660
         TabIndex        =   1
         Top             =   360
         Width           =   660
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Label3"
         Height          =   255
         Left            =   6120
         TabIndex        =   10
         Top             =   4440
         Width           =   1335
      End
      Begin VB.Label Label4 
         BackColor       =   &H80000005&
         Caption         =   "Modified by Alion / ITSO"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4560
         TabIndex        =   8
         Top             =   2880
         Width           =   2655
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "A Simplified Model for Radionuclide Transport and Removal and Dose Estimation."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1095
         Left            =   360
         TabIndex        =   7
         Top             =   2880
         Width           =   2535
      End
      Begin VB.Label lblProductName 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Radtrad 3.10"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   2280
         TabIndex        =   3
         Tag             =   "Product"
         Top             =   1800
         Width           =   3075
      End
      Begin VB.Label lblCompany 
         BackStyle       =   0  'Transparent
         Caption         =   "U.S. Nuclear Regulatory Commission"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   720
         Left            =   1200
         TabIndex        =   2
         Tag             =   "Company"
         Top             =   360
         Width           =   1635
      End
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   495
      Left            =   3120
      TabIndex        =   6
      Top             =   2160
      Width           =   1215
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdCancel_Click()
  End
End Sub

Private Sub cmdStart_Click()
  Unload Me
  frmRadtrad.Show
End Sub

Private Sub Command1_Click()
    frmITSmodifications.Show
End Sub

Private Sub Form_Load()
'    lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
   'lblProductName.Caption = App.Title
   Label3 = "Version " & App.Major & "." & App.Minor & "." & App.Revision
End Sub
