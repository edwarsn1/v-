VERSION 5.00
Object = "{54850C51-14EA-4470-A5E4-8C5DB32DC853}#1.0#0"; "vsprint8.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmFileViewer 
   Appearance      =   0  'Flat
   Caption         =   "File Name"
   ClientHeight    =   7830
   ClientLeft      =   1320
   ClientTop       =   1275
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "MS Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   HelpContextID   =   12
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   7830
   ScaleWidth      =   11880
   Begin VSPrinter8LibCtl.VSPrinter VSP 
      Height          =   375
      Left            =   9000
      TabIndex        =   4
      Top             =   7440
      Visible         =   0   'False
      Width           =   1215
      _cx             =   2143
      _cy             =   661
      Appearance      =   1
      BorderStyle     =   1
      Enabled         =   -1  'True
      MousePointer    =   0
      BackColor       =   -2147483643
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty HdrFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      AutoRTF         =   -1  'True
      Preview         =   -1  'True
      DefaultDevice   =   0   'False
      PhysicalPage    =   -1  'True
      AbortWindow     =   -1  'True
      AbortWindowPos  =   0
      AbortCaption    =   "Printing..."
      AbortTextButton =   "Cancel"
      AbortTextDevice =   "on the %s on %s"
      AbortTextPage   =   "Now printing Page %d of"
      FileName        =   ""
      MarginLeft      =   1440
      MarginTop       =   1440
      MarginRight     =   1440
      MarginBottom    =   1440
      MarginHeader    =   0
      MarginFooter    =   0
      IndentLeft      =   0
      IndentRight     =   0
      IndentFirst     =   0
      IndentTab       =   720
      SpaceBefore     =   0
      SpaceAfter      =   0
      LineSpacing     =   100
      Columns         =   1
      ColumnSpacing   =   180
      ShowGuides      =   2
      LargeChangeHorz =   300
      LargeChangeVert =   300
      SmallChangeHorz =   30
      SmallChangeVert =   30
      Track           =   0   'False
      ProportionalBars=   -1  'True
      Zoom            =   -2.74621212121212
      ZoomMode        =   3
      ZoomMax         =   400
      ZoomMin         =   10
      ZoomStep        =   25
      EmptyColor      =   -2147483636
      TextColor       =   0
      HdrColor        =   0
      BrushColor      =   0
      BrushStyle      =   0
      PenColor        =   0
      PenStyle        =   0
      PenWidth        =   0
      PageBorder      =   0
      Header          =   ""
      Footer          =   ""
      TableSep        =   "|;"
      TableBorder     =   7
      TablePen        =   0
      TablePenLR      =   0
      TablePenTB      =   0
      NavBar          =   3
      NavBarColor     =   -2147483633
      ExportFormat    =   0
      URL             =   ""
      Navigation      =   3
      NavBarMenuText  =   "Whole &Page|Page &Width|&Two Pages|Thumb&nail"
      AutoLinkNavigate=   0   'False
      AccessibleName  =   ""
      AccessibleDescription=   ""
      AccessibleValue =   ""
      AccessibleRole  =   9
   End
   Begin RichTextLib.RichTextBox txtFileContents 
      Height          =   6855
      Left            =   120
      TabIndex        =   2
      Top             =   0
      Width           =   11655
      _ExtentX        =   20558
      _ExtentY        =   12091
      _Version        =   393217
      ScrollBars      =   2
      TextRTF         =   $"FRMFILEV.frx":0000
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
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
      Left            =   10680
      TabIndex        =   1
      Top             =   7440
      Width           =   1095
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
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
      Left            =   10680
      TabIndex        =   0
      Top             =   6960
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog CMDialog1 
      Left            =   240
      Top             =   5280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label lblDecay 
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"FRMFILEV.frx":0083
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   120
      TabIndex        =   3
      Top             =   6960
      Width           =   10215
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmFileViewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmFileViewer"

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub cmdPrint_Click()
  Const PROCEDURE_NAME As String = "Print_Click"
   Dim s As String
   Dim sText As String
   Dim sFile As String
   On Error GoTo Error_Handler
   
      frmVP.VP.AutoRTF = True
'      If optDestination = "Printer" Then
        frmVP.VP.Preview = False
'      Else
'        frmVP.VP.Preview = True
'      End If
      frmVP.VP.FileName = gView_File_Name
      frmVP.VP.StartDoc
      sFile = gView_File_Name
      sText = ""
      Open sFile For Input As #1
      While Not EOF(1)
         Line Input #1, s
         sText = sText & s & vbCrLf
      Wend
      Close #1

      frmVP.VP.Paragraph = sText
      frmVP.VP.EndDoc
      MousePointer = 0
   
'      If optDestination = "Printer" Then
        frmVP.VP.PrintDoc
'      Else
'        frmVP.VP.ZoomMode = zmPageWidth
'        frmVP.Show vbModal
'        Set frmVP = Nothing
'      End If
   Exit Sub
   
Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub Form_Load()
  Const PROCEDURE_NAME As String = "Form_Load"
  On Error GoTo Error_Handler
  PositionForm Me
  
  frmFileViewer.txtFileContents.FileName = gView_File_Name
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub Form_Unload(Cancel As Integer)
  cmdOK_Click
End Sub

