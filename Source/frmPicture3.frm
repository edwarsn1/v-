VERSION 5.00
Begin VB.Form frmPicture3 
   Caption         =   "Periodic Table (from NIST)"
   ClientHeight    =   12930
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   17955
   LinkTopic       =   "Form1"
   ScaleHeight     =   12930
   ScaleWidth      =   17955
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   1680
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
   Begin VB.Image Image1 
      Height          =   13005
      Left            =   120
      Picture         =   "frmPicture3.frx":0000
      Top             =   0
      Width           =   17775
   End
End
Attribute VB_Name = "frmPicture3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdExit_Click()
  Me.Hide
End Sub

Private Sub Form_Load()
  PositionForm Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
  cmdExit_Click
End Sub
