VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmDisplayDecayCalc 
   Caption         =   "Results of Decay Calculation"
   ClientHeight    =   7620
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   7620
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Height          =   2415
      Left            =   4920
      TabIndex        =   8
      Top             =   4680
      Width           =   3135
      Begin VB.CommandButton cmdCopy 
         Caption         =   "Copy"
         Height          =   375
         Left            =   1080
         TabIndex        =   9
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Note that some of the nuclides available in the decay data are not present in the lists of internal dose coefficients."
         Height          =   615
         Left            =   120
         TabIndex        =   11
         Top             =   1680
         Width           =   2895
      End
      Begin VB.Label Label1 
         Caption         =   $"frmDisplayDecCalc.frx":0000
         Height          =   975
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   2895
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Parent Initial Activity:"
      Height          =   1455
      Left            =   8040
      TabIndex        =   5
      Top             =   3120
      Width           =   1695
      Begin VB.CommandButton cmdApply 
         Caption         =   "Apply"
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   840
         Width           =   975
      End
      Begin VB.TextBox txtScale 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.000E+00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   6
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Text            =   "1.0"
         Top             =   360
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Bq"
         Height          =   375
         Left            =   1200
         TabIndex        =   12
         Top             =   480
         Width           =   255
      End
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   8280
      TabIndex        =   4
      Top             =   4800
      Width           =   1335
   End
   Begin MSComDlg.CommonDialog dlgCom 
      Left            =   8520
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   8640
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   1560
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton cmdExtExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   5760
      Width           =   1335
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   8280
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Air Submersion"
      Top             =   120
      Visible         =   0   'False
      Width           =   1335
   End
   Begin TrueDBGrid80.TDBGrid grdDisplayDecayCalc 
      Height          =   6735
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   4575
      _ExtentX        =   8070
      _ExtentY        =   11880
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "Nuclide"
      Columns(0).DataField=   "Nuclide"
      Columns(0).DataWidth=   255
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Activity (Bq)"
      Columns(1).DataField=   ""
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Integrated Activity (s)"
      Columns(2).DataField=   ""
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   3
      Splits(0)._UserFlags=   0
      Splits(0).SizeMode=   2
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   13160660
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=3"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=1958"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
      Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(5)=   "Column(0)._MinWidth=1"
      Splits(0)._ColumnProps(6)=   "Column(1).Width=2725"
      Splits(0)._ColumnProps(7)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
      Splits(0)._ColumnProps(9)=   "Column(1).Visible=0"
      Splits(0)._ColumnProps(10)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(11)=   "Column(2).Width=2725"
      Splits(0)._ColumnProps(12)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(13)=   "Column(2)._WidthInPix=2646"
      Splits(0)._ColumnProps(14)=   "Column(2).Visible=0"
      Splits(0)._ColumnProps(15)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(16)=   "Column(2)._MinWidth=7602176"
      Splits(1)._UserFlags=   0
      Splits(1).RecordSelectors=   0   'False
      Splits(1).RecordSelectorWidth=   503
      Splits(1).DividerColor=   13160660
      Splits(1).SpringMode=   0   'False
      Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(1)._ColumnProps(0)=   "Columns.Count=3"
      Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
      Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
      Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
      Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
      Splits(1)._ColumnProps(6)=   "Column(1).Width=2249"
      Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
      Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2170"
      Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
      Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
      Splits(1)._ColumnProps(11)=   "Column(2).Width=2752"
      Splits(1)._ColumnProps(12)=   "Column(2).DividerColor=0"
      Splits(1)._ColumnProps(13)=   "Column(2)._WidthInPix=2672"
      Splits(1)._ColumnProps(14)=   "Column(2).Order=3"
      Splits.Count    =   2
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
      _StyleDefs(18)  =   "Splits(0).Style:id=29,.parent=1"
      _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=48,.parent=4"
      _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=30,.parent=2"
      _StyleDefs(21)  =   "Splits(0).FooterStyle:id=31,.parent=3"
      _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=32,.parent=5"
      _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=44,.parent=6"
      _StyleDefs(24)  =   "Splits(0).EditorStyle:id=43,.parent=7"
      _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=45,.parent=8"
      _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=46,.parent=9"
      _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=47,.parent=10"
      _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=49,.parent=11"
      _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=50,.parent=12"
      _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=54,.parent=29"
      _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=51,.parent=30"
      _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=52,.parent=31"
      _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=53,.parent=43"
      _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=58,.parent=29"
      _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=55,.parent=30"
      _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=56,.parent=31"
      _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=57,.parent=43"
      _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=62,.parent=29"
      _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=59,.parent=30"
      _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=60,.parent=31"
      _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=61,.parent=43"
      _StyleDefs(42)  =   "Splits(1).Style:id=13,.parent=1"
      _StyleDefs(43)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
      _StyleDefs(44)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
      _StyleDefs(45)  =   "Splits(1).FooterStyle:id=15,.parent=3"
      _StyleDefs(46)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
      _StyleDefs(47)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
      _StyleDefs(48)  =   "Splits(1).EditorStyle:id=17,.parent=7"
      _StyleDefs(49)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
      _StyleDefs(50)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
      _StyleDefs(51)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
      _StyleDefs(52)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
      _StyleDefs(53)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
      _StyleDefs(54)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
      _StyleDefs(55)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
      _StyleDefs(56)  =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
      _StyleDefs(57)  =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
      _StyleDefs(58)  =   "Splits(1).Columns(1).Style:id=142,.parent=13"
      _StyleDefs(59)  =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
      _StyleDefs(60)  =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
      _StyleDefs(61)  =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
      _StyleDefs(62)  =   "Splits(1).Columns(2).Style:id=146,.parent=13"
      _StyleDefs(63)  =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
      _StyleDefs(64)  =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
      _StyleDefs(65)  =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
      _StyleDefs(66)  =   "Named:id=33:Normal"
      _StyleDefs(67)  =   ":id=33,.parent=0"
      _StyleDefs(68)  =   "Named:id=34:Heading"
      _StyleDefs(69)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(70)  =   ":id=34,.wraptext=-1"
      _StyleDefs(71)  =   "Named:id=35:Footing"
      _StyleDefs(72)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(73)  =   "Named:id=36:Selected"
      _StyleDefs(74)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(75)  =   "Named:id=37:Caption"
      _StyleDefs(76)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(77)  =   "Named:id=38:HighlightRow"
      _StyleDefs(78)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(79)  =   "Named:id=39:EvenRow"
      _StyleDefs(80)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(81)  =   "Named:id=40:OddRow"
      _StyleDefs(82)  =   ":id=40,.parent=33"
      _StyleDefs(83)  =   "Named:id=41:RecordSelector"
      _StyleDefs(84)  =   ":id=41,.parent=34"
      _StyleDefs(85)  =   "Named:id=42:FilterBar"
      _StyleDefs(86)  =   ":id=42,.parent=33"
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8280
      TabIndex        =   0
      Top             =   6720
      Width           =   1335
   End
End
Attribute VB_Name = "frmDisplayDecayCalc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmDisplayDecayCalc"
Dim numRows As Integer, MaxCol As Integer, oldScale As Double
Dim bAct As Boolean

Private Sub cmdApply_Click()
  Dim dScale As Double, NewVal As Double, i As Integer, j As Integer
  
  dScale = Val(txtScale)
  NewVal = dScale / oldScale
  oldScale = dScale
  dScale = NewVal
  If dScale <> 1# Then
    For j = 1 To MaxCol - 1
      For i = 0 To numRows - 1
        xGrid(i, j) = xGrid(i, j) * dScale
      Next i
    Next j
  End If

  grdDisplayDecayCalc.Row = 0
  grdDisplayDecayCalc.Col = 0
  grdDisplayDecayCalc.Array = xGrid
  grdDisplayDecayCalc.Refresh

End Sub

Private Sub cmdExtExport_Click()
    Const PROCEDURE_NAME As String = "cmdExtExport_Click"
  
    Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, iC As Integer, Tester
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
  
    For j = 0 To MaxCol - 1
      iC = j + gn_ExcelStartColumn
      For i = 0 To numRows - 1
         gsExcel.Cells(i + 3, iC + 1).Value = xGrid(i, j)
      Next i
    Next j
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = Me.Caption
    gsExcel.Cells(2, 1 + gn_ExcelStartColumn) = "Nuclide"
    gsExcel.Cells(2, 2 + gn_ExcelStartColumn) = "Activity"
    gsExcel.Cells(2, 3 + gn_ExcelStartColumn) = "Integrated Activity (days)"
    gn_ExcelStartColumn = gn_ExcelStartColumn + MaxCol + 1
  
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

Private Sub cmdOK_Click()
  Dim i As Integer, j As Integer
  
  If Not gb_AllDone Then
    gs_MyWhere = ""
    For j = 0 To MaxCol - 1
      For i = 0 To numRows - 1
        xGrid(i, j) = ""
      Next i
    Next j
    grdDisplayDecayCalc.Refresh
    Me.Hide
  End If
End Sub

Private Sub cmdPrint_Click()
  grdDisplayDecayCalc.PrintInfo.PageHeader = Me.Caption
  grdDisplayDecayCalc.PrintInfo.PreviewInitZoom = 100
  grdDisplayDecayCalc.PrintInfo.PrintPreview
End Sub

Private Sub cmdCopy_Click()
Dim i As Integer

  For i = 0 To numRows - 1
    gd_CopyArray(i, 0) = Trim(xGrid(i, 0))
    If (bAct) Then
      gd_CopyArray(i, 1) = xGrid(i, 1)
    Else
      gd_CopyArray(i, 1) = xGrid(i, 2)
    End If
  Next i
  For i = numRows To 29
    gd_CopyArray(i, 0) = ""
    gd_CopyArray(i, 1) = ""
  Next i

End Sub

Private Sub Form_Load()
  Const PROCEDURE_NAME As String = "cmdForm_Load"
  
  Dim j As Integer, GrdCols As Integer
  Dim i As Integer, Factor As Double, UnitsStart As Integer
  Dim C As TrueDBGrid80.Column, FN As String
  Dim sNuc As String, a As Double, AI As Double, dScale As Double
  On Error GoTo Error_Handler
  PositionForm Me
    FN = gs_TempPath & "display.txt"
 
  oldScale = 1#
  MaxCol = 3
  Open FN For Input As #10
  Input #10, numRows
  xGrid.ReDim 0, numRows - 1, 0, 3
  For i = 0 To numRows - 1
    Input #10, sNuc, a, AI
    xGrid(i, 0) = sNuc
    xGrid(i, 1) = a
  '  xGrid(i, 2) = AI * 86400#
    xGrid(i, 2) = AI '
  Next i
  Close #10
  
'  rsNuc.MoveFirst
  
  grdDisplayDecayCalc.ReBind
  
  For i = 1 To 2
     Set C = grdDisplayDecayCalc.Columns(i)
    C.NumberFormat = "Scientific"
  Next i
  dScale = Val(txtScale)
  If dScale <> 1# Then
    For j = 1 To gn_NucCount - 1
      For i = 1 To numRows - 1
        xGrid(i, j) = xGrid(i, j) * dScale
      Next i
    Next j
  End If

  grdDisplayDecayCalc.Row = 0
  grdDisplayDecayCalc.Col = 0
  grdDisplayDecayCalc.Array = xGrid
  grdDisplayDecayCalc.Refresh
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

Private Sub grdDisplayDecayCalc_HeadClick(ByVal ColIndex As Integer)
  If ColIndex = 1 Then
    bAct = True
  Else
    bAct = False
  End If
End Sub
