VERSION 5.00
Begin VB.Form frmPicture2 
   Caption         =   "Dose Range (rem)"
   ClientHeight    =   10575
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   13545
   LinkTopic       =   "Form1"
   ScaleHeight     =   10575
   ScaleWidth      =   13545
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   12240
      TabIndex        =   1
      Top             =   10080
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      Height          =   9735
      Left            =   120
      Picture         =   "frmPicture2.frx":0000
      ScaleHeight     =   9675
      ScaleWidth      =   13275
      TabIndex        =   0
      Top             =   240
      Width           =   13335
   End
End
Attribute VB_Name = "frmPicture2"
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
