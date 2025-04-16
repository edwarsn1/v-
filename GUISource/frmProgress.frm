VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form frmProgress 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   1068
   ClientLeft      =   12
   ClientTop       =   12
   ClientWidth     =   3108
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1068
   ScaleWidth      =   3108
   StartUpPosition =   1  'CenterOwner
   Begin ComctlLib.ProgressBar ProgressBar1 
      Height          =   300
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   2700
      _ExtentX        =   4763
      _ExtentY        =   529
      _Version        =   327682
      Appearance      =   1
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Radtrad Calculation is running.."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   120
      Width           =   3135
   End
End
Attribute VB_Name = "frmProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

