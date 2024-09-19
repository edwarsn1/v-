VERSION 5.00
Begin VB.Form frmPicture 
   Caption         =   "Dose Range (Sv)"
   ClientHeight    =   10245
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   13350
   LinkTopic       =   "Form1"
   ScaleHeight     =   10245
   ScaleWidth      =   13350
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   12120
      TabIndex        =   1
      Top             =   9840
      Width           =   1095
   End
   Begin VB.PictureBox picDose 
      Height          =   9735
      Left            =   0
      Picture         =   "frmPicture.frx":0000
      ScaleHeight     =   9675
      ScaleWidth      =   13155
      TabIndex        =   0
      Top             =   0
      Width           =   13215
   End
End
Attribute VB_Name = "frmPicture"
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
