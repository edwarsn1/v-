VERSION 5.00
Object = "{827E9F53-96A4-11CF-823E-000021570103}#1.0#0"; "graphs32.ocx"
Begin VB.Form frmElePlot 
   Caption         =   "Plot"
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10875
   LinkTopic       =   "Form1"
   ScaleHeight     =   7590
   ScaleWidth      =   10875
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   6240
      TabIndex        =   3
      Top             =   7080
      Width           =   1335
   End
   Begin VB.CommandButton cmdAxis 
      Caption         =   "Set to Log/Log"
      Height          =   375
      Left            =   7800
      TabIndex        =   2
      Top             =   7080
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   9360
      TabIndex        =   1
      Top             =   7080
      Width           =   1335
   End
   Begin GraphsLib.Graph gphRad 
      Height          =   6855
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   10575
      _Version        =   393216
      _ExtentX        =   18653
      _ExtentY        =   12091
      _StockProps     =   96
      BorderStyle     =   1
      Background      =   "15~-1~-1~-1~-1~-1~-1"
      BottomTitle     =   "Kinetic Energy (MeV)_"
      ColorData       =   "0"
      FontSize        =   "200~110~100~100"
      GraphType       =   15
      GridLineStyle   =   2
      GridStyle       =   3
      LeftTitle       =   "varies"
      LeftTitleStyle  =   1
      OverlayColor    =   "0"
      OverlayPattern  =   "3"
      OverlaySymbol   =   "0"
      PatternData     =   "2"
      SymbolData      =   "1"
      XAxisStyle      =   2
      LabelXFormat    =   "0.0E+00"
      LabelYFormat    =   "0.0E+00~"
   End
End
Attribute VB_Name = "frmElePlot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmElePlot"

Private Sub cmdAxis_Click()
  If gphRad.GraphType = graphLinLog Then
    gphRad.GraphType = graphLogLog
    cmdAxis.Caption = "Set to Lin/Log"
    If gNoLines Then
      gphRad.GridStyle = 2
'      gphRad.Ticks = graphXTicksOnly
'      gphRad.SDKPaint = 1
    Else
      gphRad.GridStyle = 3
    End If
  Else
    gphRad.GraphType = graphLinLog
    cmdAxis.Caption = "Set to Log/Log"
    gphRad.GridStyle = 3
  End If
  gphRad.DrawMode = 3
End Sub

Private Sub cmdOK_Click()
  Me.Hide
End Sub

Private Sub cmdPrint_Click()
  gphRad.PrintStyle = 2
  gphRad.GraphTitle = Me.Caption
  gphRad.DrawMode = graphPrint
End Sub

Private Sub Form_Load()
  PositionForm Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
  cmdOK_Click
End Sub

Private Sub gphRad_SDKPaint()
Dim xOrigin As Double, yOrigin As Double, yLength As Double
Dim nTicks As Integer, R As Integer

With gphRad
  xOrigin = .SDKInfo(7)
  yOrigin = .SDKInfo(8)
  yLength = .SDKInfo(6)

  If .YAxisTicks > 6 Then
    nTicks = .YAxisTicks / 2
  Else
    nTicks = .YAxisTicks
  End If
' draw the y-log axis using GS API
  R = GSLogAxis(xOrigin, yOrigin, yLength, 35, nTicks, AXTICKTHRU + AXISY, LSSOLID, BLACK)

' OR draw the y axis using GS API
'  r = GSAxis(xOrigin, yOrigin, yLength, 35, .YAxisTicks, 0, AXTICKTHRU + AXISY, LSSOLID, BLACK)
End With

If gphRad.DrawMode = 3 Then
  R = GSWinPaint(WPPAINT) 'redraw GS calls if in bit-blit mode
End If
End Sub
