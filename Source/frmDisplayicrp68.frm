VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmDisplayICRP89 
   Caption         =   "ICRP 89 Reference Data"
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   7590
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Select Reference  Characteristics"
      Height          =   1455
      Left            =   7080
      TabIndex        =   4
      Top             =   3600
      Width           =   2655
      Begin VB.ComboBox cboName 
         Height          =   315
         Left            =   120
         TabIndex        =   6
         Text            =   "Combo1"
         Top             =   360
         Width           =   2415
      End
      Begin VB.CommandButton cmdApply 
         Caption         =   "Apply"
         Height          =   375
         Left            =   600
         TabIndex        =   5
         Top             =   840
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   8280
      TabIndex        =   3
      Top             =   5280
      Width           =   1335
   End
   Begin MSComDlg.CommonDialog dlgCom 
      Left            =   8520
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdExtExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   6000
      Width           =   1335
   End
   Begin VB.Data DataICRP89 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   "D:\Rad_ToolBox\vb\data\ICRP_89.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   8280
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "ICRP89_20Aug05"
      Top             =   120
      Visible         =   0   'False
      Width           =   1335
   End
   Begin TrueDBGrid80.TDBGrid grdDisplayICRP68 
      Bindings        =   "frmDisplayicrp68.frx":0000
      Height          =   6735
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   11880
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "Age"
      Columns(0).DataField=   "Age"
      Columns(0).DataWidth=   23
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Age Unit"
      Columns(1).DataField=   "AgeUnit"
      Columns(1).DataWidth=   255
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Gender"
      Columns(2).DataField=   "Gender"
      Columns(2).DataWidth=   255
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Value"
      Columns(3).DataField=   "Value"
      Columns(3).DataWidth=   23
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Units"
      Columns(4).DataField=   "Units"
      Columns(4).DataWidth=   255
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Reference"
      Columns(5).DataField=   "Reference"
      Columns(5).DataWidth=   255
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   6
      Splits(0)._UserFlags=   0
      Splits(0).RecordSelectors=   0   'False
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   13160660
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=6"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=1561"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1482"
      Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(5)=   "Column(0)._AlignLeft=0"
      Splits(0)._ColumnProps(6)=   "Column(1).Width=1349"
      Splits(0)._ColumnProps(7)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(8)=   "Column(1)._WidthInPix=1270"
      Splits(0)._ColumnProps(9)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(10)=   "Column(2).Width=1296"
      Splits(0)._ColumnProps(11)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(12)=   "Column(2)._WidthInPix=1217"
      Splits(0)._ColumnProps(13)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(14)=   "Column(3).Width=1958"
      Splits(0)._ColumnProps(15)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(16)=   "Column(3)._WidthInPix=1879"
      Splits(0)._ColumnProps(17)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(18)=   "Column(3)._AlignLeft=0"
      Splits(0)._ColumnProps(19)=   "Column(4).Width=1138"
      Splits(0)._ColumnProps(20)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(21)=   "Column(4)._WidthInPix=1058"
      Splits(0)._ColumnProps(22)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(23)=   "Column(5).Width=3784"
      Splits(0)._ColumnProps(24)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(25)=   "Column(5)._WidthInPix=3704"
      Splits(0)._ColumnProps(26)=   "Column(5).Order=6"
      Splits.Count    =   1
      PrintInfos(0)._StateFlags=   0
      PrintInfos(0).Name=   "piInternal 0"
      PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageHeaderHeight=   0
      PrintInfos(0).PageFooterHeight=   0
      PrintInfos.Count=   1
      AllowUpdate     =   0   'False
      DefColWidth     =   0
      HeadLines       =   2
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
      _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=62,.parent=13"
      _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=59,.parent=14"
      _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=60,.parent=15"
      _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=61,.parent=17"
      _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=66,.parent=13"
      _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=63,.parent=14"
      _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=64,.parent=15"
      _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=65,.parent=17"
      _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=70,.parent=13"
      _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=67,.parent=14"
      _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=68,.parent=15"
      _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=69,.parent=17"
      _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=74,.parent=13"
      _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=71,.parent=14"
      _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=72,.parent=15"
      _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=73,.parent=17"
      _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=78,.parent=13"
      _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=75,.parent=14"
      _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=76,.parent=15"
      _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=77,.parent=17"
      _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=82,.parent=13"
      _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=79,.parent=14"
      _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=80,.parent=15"
      _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=81,.parent=17"
      _StyleDefs(54)  =   "Named:id=33:Normal"
      _StyleDefs(55)  =   ":id=33,.parent=0"
      _StyleDefs(56)  =   "Named:id=34:Heading"
      _StyleDefs(57)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(58)  =   ":id=34,.wraptext=-1"
      _StyleDefs(59)  =   "Named:id=35:Footing"
      _StyleDefs(60)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(61)  =   "Named:id=36:Selected"
      _StyleDefs(62)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(63)  =   "Named:id=37:Caption"
      _StyleDefs(64)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(65)  =   "Named:id=38:HighlightRow"
      _StyleDefs(66)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(67)  =   "Named:id=39:EvenRow"
      _StyleDefs(68)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(69)  =   "Named:id=40:OddRow"
      _StyleDefs(70)  =   ":id=40,.parent=33"
      _StyleDefs(71)  =   "Named:id=41:RecordSelector"
      _StyleDefs(72)  =   ":id=41,.parent=34"
      _StyleDefs(73)  =   "Named:id=42:FilterBar"
      _StyleDefs(74)  =   ":id=42,.parent=33"
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
Attribute VB_Name = "frmDisplayICRP89"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmDisplayICRP68"
Dim numRows As Integer, MaxCol As Integer
Dim bAct As Boolean

Private Sub cmdApply_Click()
Dim myQuery As String

  DataICRP89.DatabaseName = gs_DataPath & "icrp_89.mdb"
  myQuery = "Select * from [ICRP89_20Aug05] where Type ='" & gsICRP89Type & _
    "' and Name ='" & cboName & "'"
  DataICRP89.RecordSource = myQuery
  DataICRP89.Refresh
  grdDisplayICRP68.ReBind
  
End Sub

Private Sub cmdExtExport_Click()
    Const PROCEDURE_NAME As String = "cmdExtExport_Click"
  
    Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, iC As Integer, Tester, C As TrueDBGrid80.Column
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
  
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = Me.Caption & " / " & cboName
    grdDisplayICRP68.MoveFirst
    j = 3
    While Not grdDisplayICRP68.EOF
      For i = 1 To 6
         gsExcel.Cells(j, i).Value = grdDisplayICRP68.Columns(i - 1)
      Next i
      grdDisplayICRP68.MoveNext
      j = j + 1
    Wend
    For j = 1 To 6
      Set C = grdDisplayICRP68.Columns(j - 1)
      gsExcel.Cells(2, j + gn_ExcelStartColumn) = C.Caption
    Next j
  
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
  Me.Hide
End Sub

Private Sub cmdPrint_Click()
  grdDisplayICRP68.PrintInfo.PageHeader = Me.Caption
  grdDisplayICRP68.PrintInfo.PreviewInitZoom = 100
  grdDisplayICRP68.PrintInfo.PrintPreview
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
  Dim myQuery As String
  Dim j As Integer, GrdCols As Integer, rsNuc As Recordset
  Dim i As Integer, Factor As Double, UnitsStart As Integer
  Dim C As TrueDBGrid80.Column
  
  On Error GoTo Error_Handler
  PositionForm Me
  Me.Caption = "ICRP 89 Reference Data for " & gsICRP89Type
  
  DataICRP89.DatabaseName = gs_DataPath & "icrp_89.mdb"
  DataICRP89.RecordSource = "Select Distinct Name from [ICRP89_20Aug05] where " & _
    "Type ='" & gsICRP89Type & "'"
  DataICRP89.Refresh
  Set rsNuc = DataICRP89.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboName.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboName.ListIndex = 0
  
  DataICRP89.DatabaseName = gs_DataPath & "icrp_89.mdb"
  myQuery = "Select * from [ICRP89_20Aug05] where Type ='" & gsICRP89Type & _
    "' and Name ='" & cboName & "'"
  DataICRP89.RecordSource = myQuery
  DataICRP89.Refresh
  grdDisplayICRP68.ReBind
  
'  For i = 1 To 2
'     Set C = grdDisplayICRP68.Columns(i)
'    C.NumberFormat = "Scientific"
'  Next i
'  dScale = Val(txtScale)
'  If dScale <> 1# Then
'    For j = 1 To gn_NucCount - 1
'      For i = 1 To numRows - 1
'        XGrid(i, j) = XGrid(i, j) * dScale
'      Next i
'    Next j
'  End If

  grdDisplayICRP68.Row = 0
  grdDisplayICRP68.Col = 0
'  grdDisplayICRP68.Array = XGrid
'  grdDisplayICRP68.Refresh
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
