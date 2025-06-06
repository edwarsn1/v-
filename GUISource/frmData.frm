VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form frmData 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00EDF1DC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Data Form"
   ClientHeight    =   6516
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   8064
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
   MinButton       =   0   'False
   ScaleHeight     =   6516
   ScaleWidth      =   8064
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   6000
      TabIndex        =   48
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtLambdaAerosol 
      Height          =   375
      Left            =   6360
      TabIndex        =   75
      ToolTipText     =   "When DF reaches this value RADTRAD divide the Aerosol spray removal rate by 10"
      Top             =   3720
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdFilterFailure 
      Caption         =   "Failure"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5040
      TabIndex        =   70
      ToolTipText     =   "Edit filter failure timestep"
      Top             =   600
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   2040
      TabIndex        =   69
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   720
      TabIndex        =   68
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   3360
      TabIndex        =   67
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   4680
      TabIndex        =   66
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   6000
      TabIndex        =   65
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   0
      Left            =   2040
      TabIndex        =   64
      Top             =   1920
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   2040
      TabIndex        =   63
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   2040
      TabIndex        =   62
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   2040
      TabIndex        =   61
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   2040
      TabIndex        =   60
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   2040
      TabIndex        =   59
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   2040
      TabIndex        =   58
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   2040
      TabIndex        =   57
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   2040
      TabIndex        =   56
      Top             =   5160
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   3360
      TabIndex        =   55
      Top             =   5160
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   6000
      TabIndex        =   52
      Top             =   5160
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   6000
      TabIndex        =   51
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   6000
      TabIndex        =   50
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   6000
      TabIndex        =   49
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   6000
      TabIndex        =   47
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   6000
      TabIndex        =   46
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   6000
      TabIndex        =   9
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtCol4 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   0
      Left            =   6000
      TabIndex        =   5
      Top             =   1920
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   4680
      TabIndex        =   45
      Top             =   5160
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   4680
      TabIndex        =   44
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   4680
      TabIndex        =   43
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   4680
      TabIndex        =   42
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   4680
      TabIndex        =   41
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   4680
      TabIndex        =   40
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   4680
      TabIndex        =   39
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   4680
      TabIndex        =   8
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtCol3 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   0
      Left            =   4680
      TabIndex        =   4
      Top             =   1920
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   3360
      TabIndex        =   38
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   3360
      TabIndex        =   37
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   3360
      TabIndex        =   36
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   3360
      TabIndex        =   35
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   3360
      TabIndex        =   34
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   3360
      TabIndex        =   11
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   3360
      TabIndex        =   7
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   0
      Left            =   3360
      TabIndex        =   3
      Top             =   1920
      Width           =   1315
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   375
      Left            =   6360
      TabIndex        =   32
      ToolTipText     =   "Save data and close"
      Top             =   600
      Width           =   1575
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Reset"
      Height          =   375
      Left            =   6360
      TabIndex        =   31
      ToolTipText     =   "Restore original data"
      Top             =   120
      Width           =   1575
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   720
      TabIndex        =   18
      Top             =   5160
      Width           =   1315
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   372
      Left            =   0
      TabIndex        =   17
      Top             =   6144
      Width           =   8064
      _ExtentX        =   14224
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
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   720
      TabIndex        =   16
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   720
      TabIndex        =   15
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   720
      TabIndex        =   14
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   720
      TabIndex        =   13
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   720
      TabIndex        =   12
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   720
      TabIndex        =   10
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   720
      TabIndex        =   6
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   375
      Index           =   0
      Left            =   720
      TabIndex        =   2
      Top             =   1920
      Width           =   1315
   End
   Begin VB.TextBox txtAerosolDF 
      Height          =   375
      Left            =   6360
      TabIndex        =   71
      ToolTipText     =   "When DF reaches this value RADTRAD will stop Aerosol decontamination from sprays"
      Top             =   2520
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox txtElementalDF 
      Height          =   375
      Left            =   6360
      TabIndex        =   72
      ToolTipText     =   "When DF reaches this value RADTRAD will stop Elemental decontamination from sprays"
      Top             =   4920
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.PictureBox LambdaGraphic 
      BackColor       =   &H00EDF1DC&
      BorderStyle     =   0  'None
      Height          =   225
      Left            =   6360
      ScaleHeight     =   228
      ScaleWidth      =   1332
      TabIndex        =   77
      ToolTipText     =   "SRP 6.5.2-12 (c) indicates a DF=50 is acceptable"
      Top             =   3240
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label lblPaste 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   "Paste"
      Height          =   255
      Left            =   3720
      TabIndex        =   78
      Top             =   5640
      Width           =   615
   End
   Begin ComctlLib.ImageList ImageList 
      Left            =   7560
      Top             =   5280
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   90
      ImageHeight     =   15
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   2
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmData.frx":0000
            Key             =   "Lambda Blue"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmData.frx":005E
            Key             =   "Lambda Beige"
         EndProperty
      EndProperty
   End
   Begin VB.Label lblLambdaAerosol 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   " DF Limit"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6240
      TabIndex        =   76
      Top             =   3480
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
      Caption         =   "xxxxxxxxxxx"
      Height          =   240
      Index           =   3
      Left            =   6162
      TabIndex        =   54
      Top             =   1560
      Width           =   990
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
      Caption         =   "xxxxxxxxxxx"
      Height          =   240
      Index           =   2
      Left            =   4842
      TabIndex        =   53
      Top             =   1560
      Visible         =   0   'False
      Width           =   990
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
      Caption         =   "xxxxxxxxxxx"
      Height          =   240
      Index           =   1
      Left            =   3522
      TabIndex        =   33
      Top             =   1560
      Visible         =   0   'False
      Width           =   990
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
      Caption         =   "xxxxxxxxxxx"
      Height          =   240
      Index           =   0
      Left            =   2202
      TabIndex        =   30
      Top             =   1560
      Width           =   990
   End
   Begin VB.Label lblRow 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   "Time (h)"
      Height          =   255
      Index           =   10
      Left            =   840
      TabIndex        =   29
      Top             =   1560
      Width           =   975
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   28
      Top             =   4860
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   27
      Top             =   4500
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   240
      TabIndex        =   26
      Top             =   5220
      Width           =   255
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   25
      Top             =   4140
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   24
      Top             =   3780
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   23
      Top             =   3420
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   22
      Top             =   3060
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   21
      Top             =   2700
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   20
      Top             =   2340
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
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
      Left            =   360
      TabIndex        =   19
      Top             =   1980
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00D8D8D8&
      Height          =   4815
      Left            =   120
      Top             =   1200
      Width           =   7815
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
      Caption         =   "subtitle"
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
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      BackColor       =   &H00EDF1DC&
      Caption         =   "title"
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
      TabIndex        =   0
      Top             =   120
      Width           =   405
   End
   Begin VB.Label lblElementalDF 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   "Elemental DF Limit"
      Height          =   495
      Left            =   6240
      TabIndex        =   74
      ToolTipText     =   "SRP 6.5.2-12 (d) indicates a DF=200 is acceptable"
      Top             =   4440
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label lblAerosolDF 
      Alignment       =   2  'Center
      BackColor       =   &H00EDF1DC&
      Caption         =   "Aerosol DF Limit"
      Height          =   495
      Left            =   6240
      TabIndex        =   73
      ToolTipText     =   "Value of the Decontamination Factor at which no further decontamination is allowed. DF of 1000 is a reasonable limit"
      Top             =   2040
      Visible         =   0   'False
      Width           =   1455
   End
End
Attribute VB_Name = "frmData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MaxDimen = 10
Const maxcols = 5
Const AER = 1
Const ELI = 2
Const ORI = 3
Dim DataModify As Boolean
'Dim IgnoreModify As Boolean
Dim Iodine As Integer
Dim Ntvals As Integer
Dim CurrentIndex As Integer
Dim NumDataCols As Integer
Dim NumPasteCols As Integer
Dim IgnoreRangeEdits As Boolean
Public FilterType As String

Private fPercentMsg As Boolean
Private TheHeader As String ' identifies data being requested
Private TheFormEdit As Boolean ' pass or fail the edits
Private TheEditType As String  ' which edit to do

Property Get HeaderType() As String
  HeaderType = TheHeader
End Property

Property Let HeaderType(ByVal vNewValue As String)
  TheHeader = vNewValue
  SetHeadings 'initcontrols called from here
End Property

Private Sub cmdCancel_Click()
 SetHeadings
End Sub

Public Sub EnableFilterFailure()
    cmdFilterFailure.Visible = True
End Sub

Private Sub cmdFilterFailure_Click()
    
    Load frmFilterFailure
    With frmFilterFailure
        .FilterType = FilterType
        .Show , Me
    End With
End Sub

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub Form_Activate()
    CheckClipboard
End Sub

Private Sub Form_Load()
  SetTabIndex
  
  If Len(frmCompartment.DataOwner) > 0 Then
    CurrentIndex = frmCompartment.CurrentIndex
    Me.HeaderType = frmCompartment.DataOwner
    frmCompartment.DataOwner = ""
    Me.BackColor = GetBackColor("Compartment")
    Set LambdaGraphic.Picture = ImageList.ListImages("Lambda Beige").Picture
  ElseIf Len(frmPathway.DataOwner) > 0 Then
    CurrentIndex = frmPathway.CurrentIndex
    Me.HeaderType = frmPathway.DataOwner
    frmPathway.DataOwner = ""
    Iodine = frmPathway.Iodine
    Me.BackColor = GetBackColor("Pathway")
    Set LambdaGraphic.Picture = ImageList.ListImages("Lambda Blue").Picture
  End If
  
  SetControlColor Me
  
End Sub

Public Sub SetHeadings()
  Dim i, j, n
  Dim HeaderSet As HeadingRecord
  
On Error GoTo HeadingsError

  IgnoreRangeEdits = False
  With HeaderSet
    For i = 1 To MaxDimen
      .times(i) = 0#
      For j = 1 To 4
        .Values(j, i) = 0#
      Next j
   Next i
  End With
  
  'Message flag to display warning only once
  fPercentMsg = False
  
  Select Case HeaderType

    Case "dfTPFilter":
      NumDataCols = 4
      With HeaderSet
        .Title = SetPathwayTitle
      
        .Caption = "Pathway Transfer Mechanisms: Filters"
        .Subtitle = "Filter Efficiencies (percent)"
        .ColHeadings(0) = "Flow Rate(cfm)"
        .ColHeadings(1) = "Aerosol"
        .ColHeadings(2) = "Elemental I"
        .ColHeadings(3) = "Organic I"
        FilterType = "Pathway"
      End With
      
      With PathwayArr(CurrentIndex).TM1Filter
      ' redim to max, but preserve any read-in values
        'Not any more - JCK
        'ReDim Preserve .times(1 To MaxDimen) As Single, _
          '.FlowRates(1 To MaxDimen) As Single, _
          '.AerH(1 To MaxDimen) As Single, _
          '.ElemIH(1 To MaxDimen) As Single, _
          '.OrgIH(1 To MaxDimen) As Single
          
        j = 0
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next
        For j = 1 To NumDataCols
          Select Case j
           Case 1:
            For i = 1 To MaxDimen
                If i > UBound(.FlowRates) Then
                    HeaderSet.Values(j, i) = 0
                Else
                    HeaderSet.Values(j, i) = .FlowRates(i)
                End If
            Next i
          Case 2:
            For i = 1 To MaxDimen
                If i > UBound(.AerH) Then
                    HeaderSet.Values(j, i) = 0
                Else
                    HeaderSet.Values(j, i) = .AerH(i)
                End If
            Next i
          Case 3:
            For i = 1 To MaxDimen
                If i > UBound(.ElemIH) Then
                    HeaderSet.Values(j, i) = 0
                Else
                    HeaderSet.Values(j, i) = .ElemIH(i)
                End If
            Next i
          Case 4:
            For i = 1 To MaxDimen
                If i > UBound(.OrgIH) Then
                    HeaderSet.Values(j, i) = 0
                Else
                    HeaderSet.Values(j, i) = .OrgIH(i)
                End If
            Next i
          End Select
        Next j

      End With
     
    Case "dfTPiping":
      NumDataCols = 4
      With HeaderSet
        
        .Title = SetPathwayTitle
        .Caption = "Pathway Transfer Mechanisms: Piping"
        .Subtitle = "Decontamination Factors (dimensionless)"
        .ColHeadings(0) = "Flow Rate (cfm)"
        .ColHeadings(1) = "Aerosol"
        .ColHeadings(2) = "Elem I"
        .ColHeadings(3) = "Organic I"
      End With
     
      With PathwayArr(CurrentIndex).TM0Piping
      
        'ReDim Preserve .times(1 To MaxDimen) As Single, _
          '.FlowRates(1 To MaxDimen) As Single, _
          '.AerosolDF(1 To MaxDimen) As Single, _
          '.ElemIDF(1 To MaxDimen) As Single, _
          '.OrgIDF(1 To MaxDimen) As Single
          
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next i
        For j = 1 To NumDataCols
          Select Case j
           Case 1:
            For i = 1 To MaxDimen
              If i > UBound(.FlowRates) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .FlowRates(i)
              End If
            Next i
           Case 2:
            For i = 1 To MaxDimen
              If i > UBound(.AerosolDF) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .AerosolDF(i)
              End If
            Next i
           Case 3:
            For i = 1 To MaxDimen
              If i > UBound(.ElemIDF) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ElemIDF(i)
              End If
            Next i
          Case 4:
            For i = 1 To MaxDimen
              If i > UBound(.OrgIDF) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .OrgIDF(i)
              End If
            Next i
         End Select
        Next j
       
       End With
    
    'frmData is no longer used for Supression Pool - JCK
    'see frmSuPool, which was derived from frmData for ver 3.3
    'see frmGeneric in 3.10
'    Case "dfTPSupo":
'      NumDataCols = 4
'      With HeaderSet

        
'        .title = SetPathwayTitle
'        .Caption = "Pathway Transfer Mechanisms: Generic"
'        .Subtitle = "Decontamination Factors (dimensionless)"
'        .ColHeadings(0) = "Flow Rate(cfm)"
'        .ColHeadings(1) = "Aerosol"
'        .ColHeadings(2) = "Elemental I"
'        .ColHeadings(3) = "Organic I"
'      End With
'      With PathwayArr(CurrentIndex).TM2Supo
'        ReDim Preserve .times(1 To MaxDimen) As Single, _
'          .FlowRates(1 To MaxDimen) As Single, _
'          .AerosolDF(1 To MaxDimen) As Single, _
'          .ElemIDF(1 To MaxDimen) As Single, _
'          .OrgIDF(1 To MaxDimen) As Single
'
'        For i = 1 To MaxDimen
'          HeaderSet.times(i) = .times(i)
'        Next
'        For j = 1 To NumDataCols
'          Select Case j
'           Case 1:
'            For i = 1 To MaxDimen
'               HeaderSet.Values(j, i) = .FlowRates(i)
'            Next i
'           Case 2:
'            For i = 1 To MaxDimen
'               HeaderSet.Values(j, i) = .AerosolDF(i)
'            Next i
'          Case 3:
'            For i = 1 To MaxDimen
'               HeaderSet.Values(j, i) = .ElemIDF(i)
'            Next i
'          Case 4:
'            For i = 1 To MaxDimen
'               HeaderSet.Values(j, i) = .OrgIDF(i)
'            Next i
'         End Select
'        Next j
'        ShowModels
'       End With
       
    Case "dfTPLeak":
        NumDataCols = 1
        With HeaderSet
          .Title = SetPathwayTitle
            .Caption = "Pathway Transfer Mechanisms: Air Leakage"
            .Subtitle = "Air Leakage Rates (percent/day)"
            .ColHeadings(0) = "Leakage Rate"
            .ColHeadings(1) = ""
            .ColHeadings(2) = ""
            .ColHeadings(3) = ""
        End With
        With PathwayArr(CurrentIndex).TM3Leak
             'ReDim Preserve .times(1 To MaxDimen) As Single, _
               '.LeakageRates(1 To MaxDimen) As Single
               
            For i = 1 To MaxDimen
              If i > UBound(.times) Then
                HeaderSet.times(i) = 0
                HeaderSet.Values(1, i) = 0
              Else
                HeaderSet.times(i) = .times(i)
                HeaderSet.Values(1, i) = .LeakageRates(i)
              End If
            Next i
        End With
        
    Case "dfCOSpray2":
      NumDataCols = 2
      txtTime(0).Enabled = True
      
      With HeaderSet
        .Title = SetCompartmentTitle
        .Caption = "Compartment Features: Sprays"
         
        .Subtitle = "Removal Coefficients (1/hour)"
        .ColHeadings(0) = "Elemental I"
        .ColHeadings(1) = "Organic I"
        .ColHeadings(2) = ""
        .ColHeadings(3) = ""
      End With

      With lblElementalDF
        .Visible = True
        .Top = LambdaGraphic.Top - 500
        .Left = .Left - 600
      End With
      With txtElementalDF
        .Visible = True
        .Top = txtLambdaAerosol.Top - 500
        .Left = .Left - 600
      End With

      With CompartmentArr(CurrentIndex).F0Sprays
         'ReDim Preserve .times(1 To MaxDimen) As Single, _
                         '.ElemRemoval(1 To MaxDimen) As Single, _
                         '.OrgRemoval(1 To MaxDimen) As Single
   
         For i = 1 To MaxDimen
           If i > UBound(.times) Then
             HeaderSet.times(i) = 0
           Else
             HeaderSet.times(i) = .times(i)
           End If
         Next i
 
         For j = 1 To NumDataCols
          Select Case j
           Case 1:
            For i = 1 To MaxDimen
              If i > UBound(.ElemRemoval) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ElemRemoval(i)
            End If
            Next i
           Case 2:
            For i = 1 To MaxDimen
              If i > UBound(.OrgRemoval) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .OrgRemoval(i)
              End If
            Next i
          End Select
         Next j

        If .ElementalDF = 0 Then
            .ElementalDF = 1000000#
        End If
         HeaderSet.ElementalDF = .ElementalDF
      End With
      
    Case "dfCOSpray3":
      NumDataCols = 3
      txtTime(0).Enabled = True
      
      With HeaderSet
        .Title = SetCompartmentTitle
        .Caption = "Compartment Features: Sprays"
         
        .Subtitle = "Removal Coefficients (1/hour)"
       .ColHeadings(0) = "Aerosol"
       .ColHeadings(1) = "Elemental I"
       .ColHeadings(2) = "Organic I"
       .ColHeadings(3) = ""
      End With
      
      lblElementalDF.Visible = True
      txtElementalDF.Visible = True
      
      lblAerosolDF.Visible = True
      txtAerosolDF.Visible = True
      
      LambdaGraphic.Visible = True
      lblLambdaAerosol.Visible = True
      txtLambdaAerosol.Visible = True
       
      With CompartmentArr(CurrentIndex).F0Sprays
         'ReDim Preserve .times(1 To MaxDimen) As Single, _
                        '.AerosolRemoval(1 To MaxDimen) As Single, _
                         '.ElemRemoval(1 To MaxDimen) As Single, _
                         '.OrgRemoval(1 To MaxDimen) As Single
   
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next i
        
        For j = 1 To NumDataCols
          Select Case j
           Case AER:
            For i = 1 To MaxDimen
              If i > UBound(.AerosolRemoval) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .AerosolRemoval(i)
              End If
            Next i
           Case ELI:
            For i = 1 To MaxDimen
              If i > UBound(.ElemRemoval) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ElemRemoval(i)
              End If
            Next i
           Case ORI:
            For i = 1 To MaxDimen
              If i > UBound(.OrgRemoval) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .OrgRemoval(i)
              End If
            Next i
          End Select
        Next j
        If .AerosolDF = 0 Then
            .AerosolDF = 1000000#
        End If
        HeaderSet.AerosolDF = .AerosolDF
        If .LambdaAerosol = 0 Then
            .LambdaAerosol = 1000000#
        End If
        HeaderSet.LambdaAerosolDF = .LambdaAerosol
        If .ElementalDF = 0 Then
            .ElementalDF = 1000000#
        End If
        HeaderSet.ElementalDF = .ElementalDF
       End With


    Case "dfCORefil":
        NumDataCols = 4
        With HeaderSet
   
          .Title = SetCompartmentTitle
          .Caption = "Compartment Features: Recirculating Filters"
         .Subtitle = "Filter Efficiencies (percent)"
         .ColHeadings(0) = "Flow Rate(cfm)"
         .ColHeadings(1) = "Aerosol"
         .ColHeadings(2) = "Elemental I"
         .ColHeadings(3) = "Organic I"
         FilterType = "Recirc"
        End With
        
        With CompartmentArr(CurrentIndex).F1ReFilters
        'ReDim Preserve .times(1 To MaxDimen) As Single, _
           '.FlowRates(1 To MaxDimen) As Single, _
           '.AeroEffic(1 To MaxDimen) As Single, _
           '.ElemIEffic(1 To MaxDimen), _
           '.OrgIEffic(1 To MaxDimen)
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next
        For j = 1 To NumDataCols
          Select Case j
           Case 1:
            For i = 1 To MaxDimen
              If i > UBound(.FlowRates) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .FlowRates(i)
              End If
            Next i
           Case 2:
            For i = 1 To MaxDimen
              If i > UBound(.AeroEffic) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .AeroEffic(i)
              End If
            Next i
           Case 3:
            For i = 1 To MaxDimen
              If i > UBound(.ElemIEffic) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ElemIEffic(i)
              End If
            Next i
           Case 4:
            For i = 1 To MaxDimen
              If i > UBound(.OrgIEffic) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .OrgIEffic(i)
            End If
            Next i
          End Select
        Next j
        End With
        
    Case "dfCODepos2":
      NumDataCols = 1 'removal coefficient
      With HeaderSet
        .Title = SetCompartmentTitle
       .Caption = "Compartment Features: Natural Deposition"
       .Subtitle = "Removal Coefficients (1/hour)"
    
       .ColHeadings(0) = "Elemental I"
       .ColHeadings(1) = ""
       .ColHeadings(2) = ""
       .ColHeadings(3) = ""
       End With
       With CompartmentArr(CurrentIndex).F2Deposition
          'ReDim Preserve .times(1 To MaxDimen) As Single, _
                         '.ElemRemoval(1 To MaxDimen) As Single
                        
            For i = 1 To MaxDimen
              If i > UBound(.times) Then
                HeaderSet.times(i) = 0
              Else
                HeaderSet.times(i) = .times(i)
              End If
            Next i
            For j = 1 To NumDataCols
                For i = 1 To MaxDimen
                    If i > UBound(.ElemRemoval) Then
                        HeaderSet.Values(j, i) = 0
                    Else
                        HeaderSet.Values(j, i) = .ElemRemoval(i)
                    End If
                Next i
            Next j
       End With
       
    Case "dfCODepos3":
      NumDataCols = 2 'removal coefficient
      With HeaderSet
        .Title = SetCompartmentTitle
       .Caption = "Compartment Features: Natural Deposition"
       .Subtitle = "Removal Coefficients (1/hour)"
       .ColHeadings(0) = "Aerosol"
       .ColHeadings(1) = "Elemental I"
       .ColHeadings(2) = ""
       .ColHeadings(3) = ""
       End With
       With CompartmentArr(CurrentIndex).F2Deposition
          'ReDim Preserve .times(1 To MaxDimen) As Single, _
                         '.AerosolRemoval(1 To MaxDimen) As Single, _
                         '.ElemRemoval(1 To MaxDimen) As Single
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next i
        For j = 1 To NumDataCols
          Select Case j
           Case AER:
            For i = 1 To MaxDimen
              If i > UBound(.AerosolRemoval) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .AerosolRemoval(i)
              End If
            Next i
           Case ELI:
            For i = 1 To MaxDimen
              If i > UBound(.ElemRemoval) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ElemRemoval(i)
              End If
            Next i
          End Select
        Next j
       End With
       
    Case "dfCOHenryDep":
      NumDataCols = 2 ' fall height adn particle density
      With HeaderSet
         .Title = SetCompartmentTitle
       .Caption = "Compartment Features: Natural Deposition"
       .Subtitle = "Henry Aerosol Deposition Model"
       .ColHeadings(0) = "Fall Height (ft)"
       .ColHeadings(1) = "Particle Density (g/cm^3)"
       .ColHeadings(2) = ""
       .ColHeadings(3) = ""
       End With
       With CompartmentArr(CurrentIndex).F2Deposition.Henry
          'ReDim Preserve .times(1 To MaxDimen) As Single, _
                         '.FallHeight(1 To MaxDimen) As Single, _
                         '.ParticleDensity(1 To MaxDimen) As Single
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next i
        For j = 1 To NumDataCols
          Select Case j
           Case AER:
            For i = 1 To MaxDimen
              If i > UBound(.FallHeight) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .FallHeight(i)
              End If
            Next i
           Case ELI:
            For i = 1 To MaxDimen
              If i > UBound(.ParticleDensity) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ParticleDensity(i)
              End If
            Next i
          End Select
        Next j
       End With
       
    Case "dfCOPool2":
      NumDataCols = 2 'user-defined decontamination factor
      With HeaderSet
        .Title = SetCompartmentTitle
       .Caption = "Compartment Features: Overlying Pool"
   
       .Subtitle = "Decontamination Factors (dimensionless)"
        .ColHeadings(0) = "Elemental I"
        .ColHeadings(1) = "Organic I"
        .ColHeadings(2) = ""
        .ColHeadings(3) = ""
      End With
      With CompartmentArr(CurrentIndex).F3OPool
        'ReDim Preserve .times(1 To MaxDimen) As Single, _
                       '.ElemDecon(1 To MaxDimen) As Single, _
                       '.OrgDecon(1 To MaxDimen) As Single
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next i
        For j = 1 To NumDataCols
          Select Case j
           Case 1:
            For i = 1 To MaxDimen
              If i > UBound(.ElemDecon) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ElemDecon(i)
              End If
            Next i
           Case 2:
            For i = 1 To MaxDimen
              If i > UBound(.OrgDecon) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .OrgDecon(i)
              End If
            Next i
          End Select
        Next j
     End With
     
    Case "dfCOPool3":
      NumDataCols = 3 'user-defined decontamination factor
      With HeaderSet
        .Title = SetCompartmentTitle
       .Caption = "Compartment Features: Overlying Pool"
       .Subtitle = "Decontamination Factors (dimensionless)"
        .ColHeadings(0) = "Aerosol"
        .ColHeadings(1) = "Elemental I"
        .ColHeadings(2) = "Organic I"
        .ColHeadings(3) = ""
      End With
      With CompartmentArr(CurrentIndex).F3OPool
        'ReDim Preserve .times(1 To MaxDimen) As Single, _
                       '.AerosolDecon(1 To MaxDimen) As Single, _
                       '.ElemDecon(1 To MaxDimen) As Single, _
                       '.OrgDecon(1 To MaxDimen) As Single
        For i = 1 To MaxDimen
          If i > UBound(.times) Then
            HeaderSet.times(i) = 0
          Else
            HeaderSet.times(i) = .times(i)
          End If
        Next i
        For j = 1 To NumDataCols
          Select Case j
           Case AER:
            For i = 1 To MaxDimen
              If i > UBound(.AerosolDecon) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .AerosolDecon(i)
              End If
            Next i
           Case ELI:
            For i = 1 To MaxDimen
              If i > UBound(.ElemDecon) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .ElemDecon(i)
              End If
            Next i
           Case ORI:
            For i = 1 To MaxDimen
              If i > UBound(.OrgDecon) Then
                HeaderSet.Values(j, i) = 0
              Else
                HeaderSet.Values(j, i) = .OrgDecon(i)
              End If
            Next i
          End Select
        Next j
     End With
     
    Case Else:
      MsgBox Me.HeaderType
  End Select
 
  With HeaderSet
    InitControls .Caption, .ColHeadings, .times, _
                   .Values, .Showselect, .Subtitle, .Title
  End With
  

  With HeaderSet
      txtAerosolDF = .AerosolDF
      txtLambdaAerosol = .LambdaAerosolDF
      txtElementalDF = .ElementalDF
  End With

  n = 0
  While n < NumDataCols
   lblHeading(n).Visible = True
   Select Case n
    Case 3:
     For j = 0 To MaxDimen - 1
       txtCol4(j).Visible = True
     Next j
    Case 2:
     For j = 0 To MaxDimen - 1
       txtCol3(j).Visible = True
     Next j
    Case 1:
     For j = 0 To MaxDimen - 1
       txtCol2(j).Visible = True
     Next j
    Case 0:
     For j = 0 To MaxDimen - 1
       txtCol1(j).Visible = True
     Next j
   End Select
   n = n + 1
  Wend
  n = 4
  While n > NumDataCols
    lblHeading(n - 1).Visible = False
    Select Case n
      Case 4:
        For j = 0 To MaxDimen - 1
          txtCol4(j).Visible = False
        Next j
      Case 3:
        For j = 0 To MaxDimen - 1
          txtCol3(j).Visible = False
        Next j
      Case 2:
        For j = 0 To MaxDimen - 1
          txtCol2(j).Visible = False
        Next j
      Case 1:
        For j = 0 To MaxDimen - 1
          txtCol1(j).Visible = False
        Next j
    End Select
    n = n - 1
  Wend
  
  NumPasteCols = NumDataCols + 1
  With txtTime(0)
    lblPaste.Left = .Left + .Width * NumPasteCols / 2 - lblPaste.Width / 2
  End With

  DataModify = False
  Exit Sub
  
HeadingsError:
    MsgBox Err.Description, vbExclamation, "frmData.SetHeadings()"
    Exit Sub
    Resume Next
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

Private Sub txtAerosolDF_Change()
    DataModify = True
End Sub

Private Sub txtAerosolDF_GotFocus()
    SetSelect txtAerosolDF
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

Private Sub txtCol1_LostFocus(Index As Integer)
   DoRangeEdits txtCol1(Index), 1, "Range Error at Time" + Str(Index + 1)
End Sub

Private Sub txtCol2_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol2_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
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
        Case vbKeyRight
            If NumDataCols > 2 Then
                txtCol3(Index).SetFocus
            End If
    End Select
End Sub

Private Sub txtCol2_LostFocus(Index As Integer)
   DoRangeEdits txtCol2(Index), 2, "Range Error at Time" + Str(Index + 1)
End Sub

Private Sub txtCol2_GotFocus(Index As Integer)
    SetSelect txtCol2(Index)
End Sub

Private Sub txtCol3_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol3_GotFocus(Index As Integer)
  SetSelect txtCol3(Index)
End Sub

Private Sub txtCol3_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next
    
    Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtCol3(Index - 1).SetFocus
            Else
                txtCol3(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtCol3(Index + 1).SetFocus
            Else
                txtCol3(0).SetFocus
            End If
        Case vbKeyLeft
            txtCol2(Index).SetFocus
        Case vbKeyRight
            If NumDataCols > 3 Then
                txtCol4(Index).SetFocus
            End If
    End Select
End Sub

Private Sub txtCol3_LostFocus(Index As Integer)
  DoRangeEdits txtCol3(Index), 3, "Range Error at Time" + Str(Index + 1)
End Sub

Private Sub txtCol4_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol4_GotFocus(Index As Integer)
  SetSelect txtCol4(Index)
End Sub

Public Sub SaveData(ntime)
   Dim j
'   On Error GoTo errorhandler
   On Error Resume Next

   Select Case Me.HeaderType
   
    Case "dfTPFilter":
      With PathwayArr(CurrentIndex).TM1Filter
        ReDim .times(1 To ntime) As Single, _
         .FlowRates(1 To ntime) As Single, _
         .AerH(1 To ntime) As Single, _
         .ElemIH(1 To ntime) As Single, _
         .OrgIH(1 To ntime) As Single
        
        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .FlowRates(j) = CSng(txtCol1(j - 1))
           .AerH(j) = CSng(txtCol2(j - 1))
           .ElemIH(j) = CSng(txtCol3(j - 1))
           .OrgIH(j) = CSng(txtCol4(j - 1))
        Next j
        .Count = ntime
        
        If .FailureData(1) = 0 Then
          .FailureData(1) = 720
        End If
        If .StopTime = 0 Then
          .StopTime = 720
        End If
      End With
      
    Case "dfTPiping":
 
        With PathwayArr(CurrentIndex).TM0Piping
          If .AModelNum = 1 Then 'User-specified parameters, not Brockmann model
              ReDim .times(1 To ntime) As Single, _
                    .FlowRates(1 To ntime) As Single, _
                    .AerosolDF(1 To ntime) As Single, _
                    .ElemIDF(1 To ntime) As Single, _
                    .OrgIDF(1 To ntime) As Single
          
              For j = 1 To ntime
                 .times(j) = CSng(txtTime(j - 1))
                 .FlowRates(j) = CSng(txtCol1(j - 1))
                 .AerosolDF(j) = CSng(txtCol2(j - 1))
                 .ElemIDF(j) = CSng(txtCol3(j - 1))
                 .OrgIDF(j) = CSng(txtCol4(j - 1))
              Next j
          End If
          
          .Count = ntime
        End With
    
    Case "dfTPLeak":
      With PathwayArr(CurrentIndex).TM3Leak
           ReDim .times(1 To ntime) As Single, _
                 .LeakageRates(1 To ntime) As Single
           For j = 1 To ntime
               .times(j) = CSng(txtTime(j - 1))
               .LeakageRates(j) = CSng(txtCol1(j - 1))
           Next j
           .Count = ntime

      End With
  
  Case "dfCOSpray2":
      With CompartmentArr(CurrentIndex).F0Sprays
        ReDim .times(1 To ntime) As Single, _
             .ElemRemoval(1 To ntime) As Single, _
             .OrgRemoval(1 To ntime) As Single
        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .ElemRemoval(j) = CSng(txtCol1(j - 1))
           .OrgRemoval(j) = CSng(txtCol2(j - 1))
        Next j
        .Count = ntime
        If ntime > 0 Then
            .ElementalDF = CSng(txtElementalDF)
        End If
      End With
      
   Case "dfCOSpray3":
      With CompartmentArr(CurrentIndex).F0Sprays
        ReDim .times(1 To ntime) As Single, _
             .AerosolRemoval(1 To ntime) As Single, _
             .ElemRemoval(1 To ntime) As Single, _
             .OrgRemoval(1 To ntime) As Single
        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .AerosolRemoval(j) = CSng(txtCol1(j - 1))
           .ElemRemoval(j) = CSng(txtCol2(j - 1))
           .OrgRemoval(j) = CSng(txtCol3(j - 1))
        Next j
        .Count = ntime
        If ntime > 0 Then
            .AerosolDF = CSng(txtAerosolDF)
            .LambdaAerosol = CSng(txtLambdaAerosol)
            .ElementalDF = CSng(txtElementalDF)
        End If
      End With
      
    Case "dfCORefil":
      With CompartmentArr(CurrentIndex).F1ReFilters
           ReDim .times(1 To ntime) As Single, _
                 .FlowRates(1 To ntime) As Single, _
                 .AeroEffic(1 To ntime) As Single, _
                 .ElemIEffic(1 To ntime) As Single, _
                 .OrgIEffic(1 To ntime) As Single
           For j = 1 To ntime
               .times(j) = CSng(txtTime(j - 1))
               .FlowRates(j) = CSng(txtCol1(j - 1))
               .AeroEffic(j) = CSng(txtCol2(j - 1))
               .ElemIEffic(j) = CSng(txtCol3(j - 1))
               .OrgIEffic(j) = CSng(txtCol4(j - 1))
           Next j
           .Count = ntime
           
           If .FailureData(1) = 0 Then
             .FailureData(1) = 720
           End If
           If .StopTime = 0 Then
             .StopTime = 720
           End If
      End With
      
    Case "dfCODepos2":
      With CompartmentArr(CurrentIndex).F2Deposition
        ReDim .times(1 To ntime) As Single, _
             .ElemRemoval(1 To ntime) As Single
    
        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .ElemRemoval(j) = CSng(txtCol1(j - 1))
        Next j
        .Count = ntime
      End With
      
    Case "dfCOHenryDep"
      With CompartmentArr(CurrentIndex).F2Deposition.Henry
       ReDim .times(1 To ntime) As Single, _
             .FallHeight(1 To ntime) As Single, _
             .ParticleDensity(1 To ntime) As Single
    
        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .FallHeight(j) = CSng(txtCol1(j - 1))
           .ParticleDensity(j) = CSng(txtCol2(j - 1))
        Next j
        .Count = ntime
      End With
      
    Case "dfCODepos3":
      With CompartmentArr(CurrentIndex).F2Deposition
        ReDim .times(1 To ntime) As Single, _
             .AerosolRemoval(1 To ntime) As Single, _
             .ElemRemoval(1 To ntime) As Single
        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .AerosolRemoval(j) = CSng(txtCol1(j - 1))
           .ElemRemoval(j) = CSng(txtCol2(j - 1))
        Next j
        .Count = ntime
'        debug.print "dfCODepos3 ntime = " + Str(ntime)
      End With
      
    Case "dfCOPool2"

          With CompartmentArr(CurrentIndex).F3OPool
            ReDim .times(1 To ntime) As Single, _
                  .ElemDecon(1 To ntime) As Single, _
                  .OrgDecon(1 To ntime) As Single
            For j = 1 To ntime
               .times(j) = CSng(txtTime(j - 1))
               .ElemDecon(j) = CSng(txtCol1(j - 1))
               .OrgDecon(j) = CSng(txtCol2(j - 1))
            Next j
            .Count = ntime
          End With
    
          
      Case "dfCOPool3"
'          MsgBox "ntime = " + Str(ntime)
          With CompartmentArr(CurrentIndex).F3OPool
            ReDim .times(1 To ntime) As Single, _
                  .AerosolDecon(1 To ntime) As Single, _
                  .ElemDecon(1 To ntime) As Single, _
                  .OrgDecon(1 To ntime) As Single
            For j = 1 To ntime
               .times(j) = CSng(txtTime(j - 1))
               .AerosolDecon(j) = CSng(txtCol1(j - 1))
               .ElemDecon(j) = CSng(txtCol2(j - 1))
               .OrgDecon(j) = CSng(txtCol3(j - 1))
            Next j
            .Count = ntime
          End With
 
  End Select
   
Exit Sub

errorhandler:
Dim Msg As String
If Err.Number <> 0 Then
    Msg = "Error # " & Str(Err.Number) & " was generated by " _
            & Err.Source & Chr(13) & Err.Description
    MsgBox Msg, vbOKOnly + vbExclamation, "Error"
End If
End Sub

Public Sub InitControls(Cap As String, ColHeadings, _
        times, Values, Showselect As Boolean, Subtitle As String, _
        Title As String)
' called from setheadings when
' fill form controls with this particular type of data, from headerrecord in module1.
    Dim i, j
    Dim AControl As Control
    
   For Each AControl In Controls
     If TypeOf AControl Is TextBox Then AControl.Text = ""
    If TypeOf AControl Is TextBox Or TypeOf AControl Is ComboBox Then
      AControl.BackColor = vbWhite
      AControl.ForeColor = vbBlack
    End If
  Next
  
    Me.Caption = Cap
    lblData(0) = Title
    lblData(1) = Subtitle

    For i = 0 To NumDataCols - 1
      lblHeading(i) = ColHeadings(i)
    Next i
    
    For i = 1 To MaxDimen
       txtTime(i - 1) = Format(times(i), TIMEFORM)
       txtCol1(i - 1) = ZeroFormat(Values(1, i), FloatFormat)
       txtCol2(i - 1) = ZeroFormat(Values(2, i), FloatFormat)
       txtCol3(i - 1) = ZeroFormat(Values(3, i), FloatFormat)
       txtCol4(i - 1) = ZeroFormat(Values(4, i), FloatFormat)
    Next i
    'Always initialize
    txtTime(0) = SourceTerm.DelayTime
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
            Exit Do
        Else
            txtTime(j).Text = PasteData(0)
        End If
        txtCol1(j).Text = PasteData(1)
        txtCol2(j).Text = PasteData(2)
        txtCol3(j).Text = PasteData(3)
        txtCol4(j).Text = PasteData(4)
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

Private Sub txtCol4_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next
    
    Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtCol4(Index - 1).SetFocus
            Else
                txtCol4(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtCol4(Index + 1).SetFocus
            Else
                txtCol4(0).SetFocus
            End If
        Case vbKeyLeft
            txtCol3(Index).SetFocus
    End Select
End Sub

Private Sub txtCol4_LostFocus(Index As Integer)
  DoRangeEdits txtCol4(Index), 4, "Range Error at Time" + Str(Index + 1)
End Sub

Private Sub txtElementalDF_Change()
    DataModify = True
End Sub

Private Sub txtElementalDF_GotFocus()
    SetSelect txtElementalDF
End Sub

Private Sub txtLambdaAerosol_Change()
    DataModify = True
End Sub

Private Sub txtTime_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtTime_GotFocus(Index As Integer)
  SetSelect txtTime(Index)
End Sub

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

Public Sub SetTabIndex()
  Dim i
  
  For i = 0 To MaxDimen - 1
    txtTime(i).TabIndex = i * maxcols + 3
    txtTime(i).Tag = "time"
    txtCol1(i).TabIndex = i * maxcols + 4
    txtCol1(i).Tag = "num"
    txtCol2(i).TabIndex = i * maxcols + 5
    txtCol2(i).Tag = "num"
    txtCol3(i).TabIndex = i * maxcols + 6
    txtCol3(i).Tag = "num"
    txtCol4(i).TabIndex = i * maxcols + 7
    txtCol4(i).Tag = "num"
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
              If Not DoRangeEdits(txtCol1(i - 1), 1, "Range Error at Time" + Str(i)) Then
                cancel = 1
                Exit For
              End If
              If Not DoRangeEdits(txtCol2(i - 1), 2, "Range Error at Time" + Str(i)) Then
                cancel = 1
                Exit For
              End If
              If Not DoRangeEdits(txtCol3(i - 1), 3, "Range Error at Time" + Str(i)) Then
                cancel = 1
                Exit For
              End If
              If Not DoRangeEdits(txtCol4(i - 1), 4, "Range Error at Time" + Str(i)) Then
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
      cancel = 1 ' failed numeric edit
    End If
    EditData = cancel
End Function

Public Sub ShowModels()
  Dim i
  With PathwayArr(CurrentIndex).TM2Supo
 
    If .Models(AER) Then
      For i = 0 To MaxDimen - 1
        txtCol2(i).Enabled = True
      Next i
    Else
      For i = 0 To MaxDimen - 1
        txtCol2(i).Enabled = False
      Next i
    End If
  
    If .Models(ELI) Then
      For i = 0 To MaxDimen - 1
        txtCol3(i).Enabled = True
      Next i
    Else
      For i = 0 To MaxDimen - 1
        txtCol3(i).Enabled = False
      Next i
    End If
    
    If .Models(ORI) Then
      For i = 0 To MaxDimen - 1
        txtCol4(i).Enabled = True
      Next i
    Else
      For i = 0 To MaxDimen - 1
        txtCol4(i).Enabled = False
      Next i
    End If
  End With
End Sub

Public Function DoRangeEdits(TB As TextBox, colnum, Title) As Boolean
Dim Msg, num, res
Dim Reply As VbMsgBoxResult

  DoRangeEdits = True
  If IgnoreRangeEdits Then Exit Function
  If Not IsNumeric(TB.Text) Then Exit Function
  
  
  Select Case HeaderType
     Case "dfTPiping" ' decon factor >=1
       If colnum = 1 Then Exit Function ' col1 is flow rate
       num = CSng(TB.Text)
       If num < 1 Then
         Msg = "Decontamination Factors must be 1 or greater."
         res = MsgBox(Msg, vbOKCancel + vbExclamation, Title)
         If res = vbOK Then
           DoRangeEdits = False
           TB.SetFocus
         ElseIf res = vbCancel Then
           IgnoreRangeEdits = True
         End If
       End If
       
     Case "dfTPSupo"   ' decon factor >= 1
       If colnum = 1 Then Exit Function ' col1 is flow rate
       num = CSng(TB.Text)
       If num < 1 Then
         Msg = "Decontamination Factors must be 1 or greater."
         MsgBox Msg, vbOKOnly + vbExclamation, Title
         DoRangeEdits = False
         TB.SetFocus
       End If
       
     Case "dfTPFilter" ' percent
       If colnum = 1 Then Exit Function ' col1 is flow rate
       num = CSng(TB.Text)
       If num < 0 Or num > 100 Then
         Msg = "Filter Efficiencies must be within 0 - 100 percent."
         MsgBox Msg, vbOKOnly + vbExclamation, Title
         DoRangeEdits = False
         TB.SetFocus
       ElseIf num > 0 And num < 1 And Not fPercentMsg Then
         fPercentMsg = True
         Msg = "Entry is less than 1%" & vbCrLf & "Is this correct?"
         Reply = MsgBox(Msg, vbYesNo Or vbQuestion, "Percentage Required")
         If Reply = vbNo Then
            DoRangeEdits = False
            TB.SetFocus
         End If
       End If
       
     Case "dfCORefil" ' percent
       'If colnum = 4 Then Exit Function ' col4 not used - Now it is - JCK
       If colnum = 1 Then Exit Function ' col1 is flow rate
       num = CSng(TB.Text)
       If num < 0 Or num > 100 Then
         Msg = "Filter Efficiencies must be within 0 - 100 percent."
         MsgBox Msg, vbOKOnly + vbExclamation, Title
         DoRangeEdits = False
         TB.SetFocus
       ElseIf num > 0 And num < 1 And Not fPercentMsg Then
         fPercentMsg = True
         Msg = "Entry is less than 1%" & vbCrLf & "Is this correct?"
         Reply = MsgBox(Msg, vbYesNo Or vbQuestion, "Percentage Required")
         If Reply = vbNo Then
            DoRangeEdits = False
            TB.SetFocus
         End If
       End If
       
     Case "dfCOPool2" 'decon factor >= 1
       If colnum = 3 Or colnum = 4 Then Exit Function
       num = CSng(TB.Text)
       If num < 1 Then
         Msg = "Decontamination Factors must be 1 or greater."
         MsgBox Msg, vbOKOnly + vbExclamation, Title
         DoRangeEdits = False
         TB.SetFocus
       End If
       
     Case "dfCOPool3" ' decon factor >= 1
       If colnum = 4 Then Exit Function
       num = CSng(TB.Text)
       If num < 1 Then
         Msg = "Decontamination Factors must be 1 or greater."
         MsgBox Msg, vbOKOnly + vbExclamation, Title
         DoRangeEdits = False
         TB.SetFocus
       End If
  End Select
End Function

Public Function SetPathwayTitle() As String
       Select Case PathwayArr(CurrentIndex).Name
          Case "Unused"
            SetPathwayTitle = "Pathway " + Format(CurrentIndex)
          Case Else
            SetPathwayTitle = "Pathway " + Format(CurrentIndex) + ": " + _
                   PathwayArr(CurrentIndex).Name
        End Select
End Function

Public Function SetCompartmentTitle() As String
       Select Case CompartmentArr(CurrentIndex).Name
          Case "Unused"
            SetCompartmentTitle = "Compartment " + Format(CurrentIndex)
          Case Else
            SetCompartmentTitle = "Compartment " + Format(CurrentIndex) + ": " + _
                   CompartmentArr(CurrentIndex).Name
        End Select
End Function
