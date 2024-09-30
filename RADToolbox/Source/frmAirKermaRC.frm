VERSION 5.00
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmAirKermaRC 
   Caption         =   "Air-Kerma Rate Constants"
   ClientHeight    =   2040
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6510
   LinkTopic       =   "Form1"
   ScaleHeight     =   2040
   ScaleWidth      =   6510
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdHelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   5040
      TabIndex        =   4
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   5040
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton cmdExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   5040
      TabIndex        =   2
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "OK"
      Height          =   375
      Left            =   5040
      TabIndex        =   1
      Top             =   1560
      Width           =   1215
   End
   Begin TrueDBGrid80.TDBGrid grdAK 
      Height          =   1815
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   3201
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "Units"
      Columns(0).DataField=   ""
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Constant          "
      Columns(1).DataField=   ""
      Columns(1).NumberFormat=   "Scientific"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Coefficient         "
      Columns(2).DataField=   ""
      Columns(2).NumberFormat=   "Scientific"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   3
      Splits(0)._UserFlags=   0
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   13160660
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=3"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=3651"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=3572"
      Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(5)=   "Column(1).Width=2011"
      Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=1931"
      Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(9)=   "Column(2).Width=2143"
      Splits(0)._ColumnProps(10)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(2)._WidthInPix=2064"
      Splits(0)._ColumnProps(12)=   "Column(2).Order=3"
      Splits.Count    =   1
      PrintInfos(0)._StateFlags=   0
      PrintInfos(0).Name=   "piInternal 0"
      PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageHeaderHeight=   0
      PrintInfos(0).PageFooterHeight=   0
      PrintInfos.Count=   1
      AllowUpdate     =   0   'False
      DataMode        =   4
      DefColWidth     =   0
      HeadLines       =   1
      FootLines       =   1
      MultipleLines   =   0
      CellTipsWidth   =   0
      DeadAreaBackColor=   13160660
      RowDividerColor =   13160660
      RowSubDividerColor=   13160660
      DirectionAfterEnter=   1
      DirectionAfterTab=   1
      MaxRows         =   250000
      _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
      _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
      _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
      _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
      _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
      _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
      _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
      _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
      _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
      _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
      _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
      _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
      _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
      _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
      _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
      _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
      _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
      _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
      _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
      _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
      _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
      _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
      _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
      _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
      _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
      _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
      _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
      _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
      _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
      _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
      _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
      _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
      _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=32,.parent=13"
      _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=29,.parent=14"
      _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=30,.parent=15"
      _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=31,.parent=17"
      _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=46,.parent=13"
      _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14"
      _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
      _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
      _StyleDefs(42)  =   "Named:id=33:Normal"
      _StyleDefs(43)  =   ":id=33,.parent=0"
      _StyleDefs(44)  =   "Named:id=34:Heading"
      _StyleDefs(45)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(46)  =   ":id=34,.wraptext=-1"
      _StyleDefs(47)  =   "Named:id=35:Footing"
      _StyleDefs(48)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(49)  =   "Named:id=36:Selected"
      _StyleDefs(50)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(51)  =   "Named:id=37:Caption"
      _StyleDefs(52)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(53)  =   "Named:id=38:HighlightRow"
      _StyleDefs(54)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(55)  =   "Named:id=39:EvenRow"
      _StyleDefs(56)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(57)  =   "Named:id=40:OddRow"
      _StyleDefs(58)  =   ":id=40,.parent=33"
      _StyleDefs(59)  =   "Named:id=41:RecordSelector"
      _StyleDefs(60)  =   ":id=41,.parent=34"
      _StyleDefs(61)  =   "Named:id=42:FilterBar"
      _StyleDefs(62)  =   ":id=42,.parent=33"
   End
End
Attribute VB_Name = "frmAirKermaRC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmAirKermaRC"
Dim xAK As New XArrayDB, numRows As Integer

Private Sub cmdExit_Click()
  Me.Hide
End Sub

Private Sub cmdExport_Click()
    Const PROCEDURE_NAME As String = "cmdExtExport_Click"
  
    Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, iC As Integer, Tester
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
  
    For j = 0 To 2
      iC = j + gn_ExcelStartColumn
      For i = 0 To numRows - 1
         gsExcel.Cells(i + 2, iC + 1).Value = xAK(i, j)
      Next i
    Next j
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = Me.Caption
    gn_ExcelStartColumn = gn_ExcelStartColumn + 2
  
    gsExcel.Visible = True
    Exit Sub

2:  WhichErr = "Open"
' the following line causes the error if Excel is not installed
    Set gsExcel = CreateObject("Excel.Application")
    gsExcel.Workbooks.Add
    gn_ExcelStartColumn = 0
    gsExcel.Visible = False
    GoTo 1

Error_Handler:
  If (WhichErr = "Not Open") Then
    Err.Clear
    Resume 2
  ElseIf (WhichErr = "Open") Then
    MsgBox "Cannot export; Excel is not installed on this computer."
    Exit Sub
  Else
    gud_PrgErr.Number = Err.Number
    gud_PrgErr.Severity = 5
    gud_PrgErr.Description = Err.Description
    gud_PrgErr.Module = MODULE_NAME
    gud_PrgErr.Procedure = PROCEDURE_NAME
    Call Display_UI_Error
  End If

End Sub

Private Sub cmdHelp_Click()
 Dim FN As String
   FN = gs_HelpPath & "ICRUGamma.chm"
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
End Sub

Private Sub cmdPrint_Click()
  grdAK.PrintInfo.PageHeader = Me.Caption
  grdAK.PrintInfo.PreviewInitZoom = 100
  grdAK.PrintInfo.PrintPreview
End Sub

Private Sub Form_Load()
Dim AKRC(1300) As Double, AKRF(1300) As Double, i As Integer, n As String
Dim Nucs(1300) As String * 7, AKRec As String * 52, FN As String

  PositionForm Me
  xAK.ReDim 0, 2, 0, 2
  
  FN = gs_DataPath & "GammaCns.txt"
    Open FN For Random As #10 Len = 52
    i = 1
    While Not EOF(10)
      Get #10, i + 6, AKRec
      n = Mid(AKRec, 1, 7)
      If Trim(n) = gAirKermaNuc Then
        Nucs(1) = Mid(AKRec, 1, 7)
        AKRC(1) = Val(Mid(AKRec, 31, 9))
        AKRF(1) = Val(Mid(AKRec, 42, 9))
      End If
      i = i + 1
    Wend
    Close #10
    Me.Caption = "Air-Kerma Rate Constant for " & Nucs(1)
    xAK.ReDim 0, 1, 0, 2
    xAK(0, 0) = "SI          (Gy m^2 / (Bq s)"
    xAK(0, 1) = AKRC(1)
    xAK(0, 2) = AKRF(1)
    xAK(1, 0) = "Non-SI (rad m^2 / (mCi h)"
    xAK(1, 1) = AKRC(1) * 13320000000000# ' 1.332E13
    xAK(1, 2) = AKRF(1) * 13320000000000#
    grdAK.Array = xAK
    
End Sub
