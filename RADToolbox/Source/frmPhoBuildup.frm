VERSION 5.00
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmPhoBuildup 
   Caption         =   "Form1"
   ClientHeight    =   7125
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10260
   LinkTopic       =   "Form1"
   ScaleHeight     =   7125
   ScaleWidth      =   10260
   StartUpPosition =   3  'Windows Default
   Begin VB.Data dataGP2 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   2160
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8760
      TabIndex        =   3
      Top             =   6720
      Width           =   1335
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   8760
      TabIndex        =   2
      Top             =   6240
      Width           =   1335
   End
   Begin VB.CommandButton cmdEarlyExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   8760
      TabIndex        =   1
      Top             =   5760
      Width           =   1335
   End
   Begin VB.Data dataGP 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   2160
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin TrueDBGrid80.TDBGrid grdGP 
      CausesValidation=   0   'False
      Height          =   5535
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   9763
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).DataField=   ""
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).DataField=   ""
      Columns(1).NumberFormat=   "Scientific"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).DataField=   ""
      Columns(2).NumberFormat=   "Scientific"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).DataField=   ""
      Columns(3).NumberFormat=   "Scientific"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).DataField=   ""
      Columns(4).NumberFormat=   "Scientific"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).DataField=   ""
      Columns(5).NumberFormat=   "Scientific"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).DataField=   ""
      Columns(6).NumberFormat=   "Scientific"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   0
      Columns(7)._MaxComboItems=   5
      Columns(7).DataField=   ""
      Columns(7).NumberFormat=   "Scientific"
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(8)._VlistStyle=   0
      Columns(8)._MaxComboItems=   5
      Columns(8).DataField=   ""
      Columns(8).NumberFormat=   "Scientific"
      Columns(8)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(9)._VlistStyle=   0
      Columns(9)._MaxComboItems=   5
      Columns(9).DataField=   ""
      Columns(9).NumberFormat=   "Scientific"
      Columns(9)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   10
      Splits(0)._UserFlags=   0
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   12632256
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=10"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(5)=   "Column(1).Width=2725"
      Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=2646"
      Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(9)=   "Column(2).Width=2725"
      Splits(0)._ColumnProps(10)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(2)._WidthInPix=2646"
      Splits(0)._ColumnProps(12)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(13)=   "Column(3).Width=2725"
      Splits(0)._ColumnProps(14)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(15)=   "Column(3)._WidthInPix=2646"
      Splits(0)._ColumnProps(16)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(17)=   "Column(4).Width=2725"
      Splits(0)._ColumnProps(18)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(19)=   "Column(4)._WidthInPix=2646"
      Splits(0)._ColumnProps(20)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(21)=   "Column(5).Width=2725"
      Splits(0)._ColumnProps(22)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(23)=   "Column(5)._WidthInPix=2646"
      Splits(0)._ColumnProps(24)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(25)=   "Column(6).Width=2725"
      Splits(0)._ColumnProps(26)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(27)=   "Column(6)._WidthInPix=2646"
      Splits(0)._ColumnProps(28)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(29)=   "Column(7).Width=2725"
      Splits(0)._ColumnProps(30)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(31)=   "Column(7)._WidthInPix=2646"
      Splits(0)._ColumnProps(32)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(33)=   "Column(8).Width=2725"
      Splits(0)._ColumnProps(34)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(35)=   "Column(8)._WidthInPix=2646"
      Splits(0)._ColumnProps(36)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(37)=   "Column(9).Width=2725"
      Splits(0)._ColumnProps(38)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(39)=   "Column(9)._WidthInPix=2646"
      Splits(0)._ColumnProps(40)=   "Column(9).Order=10"
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
      InsertMode      =   0   'False
      DeadAreaBackColor=   12632256
      RowDividerColor =   12632256
      RowSubDividerColor=   12632256
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
      _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=50,.parent=13"
      _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=47,.parent=14"
      _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=48,.parent=15"
      _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=49,.parent=17"
      _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=54,.parent=13"
      _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=51,.parent=14"
      _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=52,.parent=15"
      _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=53,.parent=17"
      _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=58,.parent=13"
      _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=55,.parent=14"
      _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=56,.parent=15"
      _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=57,.parent=17"
      _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=62,.parent=13"
      _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=59,.parent=14"
      _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=60,.parent=15"
      _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=61,.parent=17"
      _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=66,.parent=13"
      _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=63,.parent=14"
      _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=64,.parent=15"
      _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=65,.parent=17"
      _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=70,.parent=13"
      _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=67,.parent=14"
      _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=68,.parent=15"
      _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=69,.parent=17"
      _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=74,.parent=13"
      _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=71,.parent=14"
      _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=72,.parent=15"
      _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=73,.parent=17"
      _StyleDefs(70)  =   "Named:id=33:Normal"
      _StyleDefs(71)  =   ":id=33,.parent=0"
      _StyleDefs(72)  =   "Named:id=34:Heading"
      _StyleDefs(73)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(74)  =   ":id=34,.wraptext=-1"
      _StyleDefs(75)  =   "Named:id=35:Footing"
      _StyleDefs(76)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(77)  =   "Named:id=36:Selected"
      _StyleDefs(78)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(79)  =   "Named:id=37:Caption"
      _StyleDefs(80)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(81)  =   "Named:id=38:HighlightRow"
      _StyleDefs(82)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(83)  =   "Named:id=39:EvenRow"
      _StyleDefs(84)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(85)  =   "Named:id=40:OddRow"
      _StyleDefs(86)  =   ":id=40,.parent=33"
      _StyleDefs(87)  =   "Named:id=41:RecordSelector"
      _StyleDefs(88)  =   ":id=41,.parent=34"
      _StyleDefs(89)  =   "Named:id=42:FilterBar"
      _StyleDefs(90)  =   ":id=42,.parent=33"
   End
End
Attribute VB_Name = "frmPhoBuildup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmPhoBuildup"
Dim xFactor As New XArrayDB
Dim numRows As Integer, MaxCol As Integer
Dim x(9) As Double, eleData(25, 5) As Double

Private Sub cmdEarlyExport_Click()
    Const PROCEDURE_NAME As String = "cmdExport_Click"
  
    Dim C As TrueDBGrid80.Column
    Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, iC As Integer, jEnd As Integer, Tester
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
  
    jEnd = MaxCol
    For j = 0 To jEnd
      iC = j + gn_ExcelStartColumn
      For i = 0 To numRows
        If gs_myTable = "Buildup Coefficients" Then
          gsExcel.Cells(i + 3, iC + 1) = xGrid(i, j)
        Else
          gsExcel.Cells(i + 3, iC + 1) = xFactor(i, j)
        End If
      Next i
    Next j
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = Me.Caption
    For j = 1 To MaxCol + 1
      Set C = grdGP.Columns(j - 1)
      gsExcel.Cells(2, j + gn_ExcelStartColumn) = C.Caption
    Next j
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
  Me.Hide
End Sub

Private Sub cmdPrint_Click()
  grdGP.PrintInfo.PageHeader = Me.Caption
  grdGP.PrintInfo.PreviewInitZoom = 100
  grdGP.PrintInfo.PrintPreview
End Sub

Private Sub Form_Load()
 Const PROCEDURE_NAME As String = "Form_Load"
  Dim i As Integer, j As Integer, C As Column, rsNuc2 As Recordset
  Dim GP_Parm(23, 25, 6) As Variant, bHead As Boolean
  Dim Td As TableDef, iTable As Integer, nEle As Integer, nEG As Integer
  Dim Xcross(23, 25) As Variant, XMatRatio(25) As Double
  Dim nMatEles As Integer, Chem(20) As String, WFract(50) As Double
  Dim Ex As Double, Ratio As Double, jStart As Integer, Chx(25) As String
  Dim R As Double, zEq As Double, k As Integer, Eg(25) As Double, Fraction(25, 2) As Double
  Dim zElem(25) As Integer, nX As Integer, GP_Mat(25, 5) As Double
  
  On Error GoTo Error_Handler
  PositionForm Me
  If gs_MatSelected = "User-defined" Then
    If gs_myTable = "Buildup Coefficients" Then
      Me.Caption = "GP Buildup Coefficients for " & gs_UserMaterialName
    Else
      Me.Caption = gs_UserMaterialName & _
        ": Photon Buildup as Function of Energy and Mean Free Path"
    End If
  Else
    If gs_myTable = "Buildup Coefficients" Then
      If gs_AbsorberType = "Ele" Then
        Me.Caption = "GP Buildup Coefficients for " & gs_EleSelected
      Else
        Me.Caption = "GP Buildup Coefficients for " & gs_MatSelected
      End If
    Else
      If gs_AbsorberType = "Ele" Then
        Me.Caption = gs_EleSelected & _
         ": Photon Buildup as Function of Energy and Mean Free Path"
      Else
        Me.Caption = gs_MatSelected & _
         ": Photon Buildup as Function of Energy and Mean Free Path"
      End If
    End If
  End If
  x(1) = 0.5
  x(2) = 1#
  x(3) = 2#
  x(4) = 4#
  x(5) = 8#
  x(6) = 10#
  x(7) = 20#
  x(8) = 40#
  x(9) = 60#
  
  xGrid.Clear
  xGrid.ReDim 0, 25, 0, 5
  xFactor.ReDim 0, 24, 0, 9
  xFactor.Clear
  
  If gs_AbsorberType = "Ele" Then
' for elements here
    dataGP.DatabaseName = gs_DataPath & "geoProg.mdb"
    dataGP.RecordSource = "Select E, B, C, A, Xk, D from " & gs_EleSelected
    dataGP.Refresh
    Set rsNuc = dataGP.Recordset
    If gs_myTable = "Buildup Coefficients" Then
      For i = 0 To 5
        grdGP.Columns(i).Caption = rsNuc.Fields(i).Name
      Next i
    End If
    rsNuc.MoveFirst
    j = 0
    MaxCol = 5
    While Not rsNuc.EOF
      eleData(j, 0) = rsNuc.Fields(0)
      eleData(j, 1) = rsNuc.Fields(1)
      eleData(j, 2) = rsNuc.Fields(2)
      eleData(j, 3) = rsNuc.Fields(3)
      eleData(j, 4) = rsNuc.Fields(4)
      eleData(j, 5) = rsNuc.Fields(5)
      rsNuc.MoveNext
      j = j + 1
    Wend
    Set rsNuc = Nothing
    numRows = j - 1
    If gs_myTable = "Buildup Coefficients" Then
      If grdGP.Columns.Count = 10 Then
        For i = 9 To 6 Step -1
          grdGP.Columns.Remove i
        Next i
      End If
      For i = 0 To 5
        For j = 0 To numRows
          xGrid(j, i) = eleData(j, i)
        Next j
        grdGP.Columns(i).Width = 900
      Next i
      grdGP.Columns(0).Caption = grdGP.Columns(0).Caption & " (MeV)"
      grdGP.Array = xGrid
    Else
'  compute factors here
      If grdGP.Columns.Count = 6 Then
        For i = 7 To 10
          Set C = grdGP.Columns.Add(i)
          C.Visible = True
        Next i
      End If
      For i = 1 To 9
        Set C = grdGP.Columns(i)
        C.Width = 900
        C.NumberFormat = "Scientific"
      Next i
      MaxCol = 9
      
      For i = 0 To 9
        If i = 0 Then
          grdGP.Columns(i).Caption = "E (Mev)"
        Else
          grdGP.Columns(i).Caption = x(i)
        End If
      Next i
      For i = 0 To numRows
        Call BuildUp(eleData(i, 0), eleData(i, 1), eleData(i, 2), eleData(i, 3), _
          eleData(i, 4), eleData(i, 5), i)
      Next i
      grdGP.Array = xFactor
    End If
  Else

' for Materials here

' get Z for elements
    dataGP.DatabaseName = gs_DataPath & "GeoProg.mdb"
    dataGP.RecordSource = "Select * from Elements"
    dataGP.Refresh
    Set rsNuc = dataGP.Recordset
    rsNuc.MoveFirst
    nX = 0
    While Not rsNuc.EOF
      zElem(nX) = rsNuc.Fields(0)
      Chx(nX) = rsNuc.Fields(1)
      rsNuc.MoveNext
      nX = nX + 1
    Wend
' get gpdata
    bHead = True
    For iTable = 0 To nX - 1
        dataGP.RecordSource = "Select * from " & Chx(iTable)
        dataGP.Refresh
        Set rsNuc = dataGP.Recordset
        rsNuc.MoveFirst
        j = 0
        MaxCol = 5
        While Not rsNuc.EOF
          If iTable = 0 Then
            Eg(j) = rsNuc.Fields(1)
           GP_Mat(j, 0) = Eg(j)
          End If
          For i = 1 To 5
            GP_Parm(iTable, j, i) = rsNuc.Fields(i + 1)
          Next i
          If gs_myTable = "Buildup Coefficients" And bHead Then
            For i = 0 To 5
              grdGP.Columns(i).Caption = rsNuc.Fields(i + 1)
            Next i
            bHead = False
          End If
          rsNuc.MoveNext
          j = j + 1
        Wend
    Next iTable
    Set rsNuc = Nothing
    nEle = iTable
    nEG = j - 1
' get element cross section data
    dataGP.DatabaseName = gs_DataPath & "Photon.mdb"
    For i = 0 To nEle - 1
        jStart = 0
        dataGP.RecordSource = "Select * from " & Chx(i)
        dataGP.Refresh
        Set rsNuc = dataGP.Recordset
        rsNuc.MoveFirst
        While Not rsNuc.EOF
          For j = jStart To nEG
            R = Eg(j) / rsNuc.Fields(0)
            If R > 0.999 And R < 1.001 Then
              Xcross(i, j) = rsNuc.Fields(2) / rsNuc.Fields(6)
              jStart = jStart + 1
              Exit For
            End If
          Next j
          rsNuc.MoveNext
        Wend
    Next i
    Set rsNuc2 = Nothing
' get material composition
    If gs_MatSelected = "User-defined" Then
      For i = 0 To g_NumUserEles - 1
        Chem(i) = g_UserMaterial(i, 0)
        WFract(i) = g_UserMaterial(i, 1)
      Next i
      nMatEles = g_NumUserEles
    Else
      dataGP.DatabaseName = gs_DataPath & "Material.mdb"
      dataGP.RecordSource = "Select * from [" & gs_MatSelected & "]"
      dataGP.Refresh
      Set rsNuc = dataGP.Recordset
      rsNuc.MoveFirst
      nMatEles = 0
      While Not rsNuc.EOF
        Chem(nMatEles) = rsNuc.Fields(1)
        WFract(nMatEles) = rsNuc.Fields(2)
        rsNuc.MoveNext
        nMatEles = nMatEles + 1
      Wend
    End If
    
'  Compute the ratio of the compton scatter cross-section to the total
'  for the material
    For i = 0 To nEG
      Fraction(i, 1) = 0
      Fraction(i, 2) = 0
      XMatRatio(i) = 0
    Next i
    dataGP.DatabaseName = gs_DataPath & "Photon.mdb"
    For i = 0 To nMatEles - 1
      dataGP.RecordSource = "SELECT * FROM [" & Chem(i) & "]"
      dataGP.Refresh
      Set rsNuc = dataGP.Recordset
      rsNuc.MoveFirst
      jStart = 0
      Do While Not rsNuc.EOF
         Ex = rsNuc.Fields(0)
         If Ex > Eg(nEG) Then Exit Do
         For j = jStart To nEG
            Ratio = Eg(j) / Ex
            If Ratio > 0.999 And Ratio < 1.001 Then
               Fraction(j, 1) = Fraction(j, 1) + WFract(i) * rsNuc.Fields(2)
               Fraction(j, 2) = Fraction(j, 2) + WFract(i) * rsNuc.Fields(6)
               jStart = jStart + 1
               Exit For
            End If
         Next j
         'If j = nEG Then Exit Do
         rsNuc.MoveNext
      Loop
   Next i
   For j = 0 To nEG
     If Fraction(j, 2) <> 0 Then
       XMatRatio(j) = Fraction(j, 1) / Fraction(j, 2)
     Else
       MsgBox "error in scatter cross-section at Eg(j)=" & Eg(j) & " " & j
     End If
   Next j

    For j = 0 To nEG
      R = XMatRatio(j)
      zEq = 0#
      xGrid(j, 0) = Eg(j)
      For k = 1 To 5
        GP_Mat(j, k) = 0
      Next k
      
      For i = 1 To nEle - 1
         If (R > 0.9999) And (Xcross(i, j) > 0.9999) Then
               zEq = zElem(i)
               For k = 1 To 5
                  GP_Mat(j, k) = GP_Parm(i, j, k)
                  xGrid(j, k) = GP_Mat(j, k)
               Next k
               Exit For
         ElseIf R >= Xcross(i - 1, j) And R <= Xcross(i, j) Then
            zEq = Zfun(zElem(i - 1), zElem(i), Xcross(i - 1, j), Xcross(i, j), R)
            For k = 1 To 5
               GP_Mat(j, k) = Zfun1(zElem(i - 1), zElem(i), GP_Parm(i - 1, j, k), GP_Parm(i, j, k), zEq)
               xGrid(j, k) = GP_Mat(j, k)
            Next k
            Exit For
         ElseIf R >= Xcross(i, j) And R <= Xcross(i - 1, j) Then
            zEq = Zfun(zElem(i), zElem(i - 1), Xcross(i, j), Xcross(i - 1, j), R)
            For k = 1 To 5
               GP_Mat(j, k) = Zfun1(zElem(i), zElem(i - 1), GP_Parm(i, j, k), GP_Parm(i - 1, j, k), zEq)
               xGrid(j, k) = GP_Mat(j, k)
            Next k
            Exit For
         End If
      Next i
    Next j
    
    numRows = j - 1
    If gs_myTable = "Buildup Coefficients" Then
      If grdGP.Columns.Count = 10 Then
        For i = 9 To 6 Step -1
          grdGP.Columns.Remove i
        Next i
      End If
      For i = 0 To 5
        grdGP.Columns(i).Width = 900
      Next i
      grdGP.Columns(0).Caption = "E (MeV)"
      grdGP.Columns(1).Caption = "B"
      grdGP.Columns(2).Caption = "C"
      grdGP.Columns(3).Caption = "A"
      grdGP.Columns(4).Caption = "XK"
      grdGP.Columns(5).Caption = "D"
      grdGP.Array = xGrid
    Else
'  compute factors here
      If grdGP.Columns.Count = 6 Then
        For i = 7 To 10
          Set C = grdGP.Columns.Add(i)
          C.Visible = True
        Next i
      End If
      For i = 1 To 9
        Set C = grdGP.Columns(i)
        C.Width = 900
        C.NumberFormat = "Scientific"
      Next i
      MaxCol = 9
'  compute factors here
      For i = 0 To numRows
        Call BuildUp(GP_Mat(i, 0), GP_Mat(i, 1), GP_Mat(i, 2), GP_Mat(i, 3), _
          GP_Mat(i, 4), GP_Mat(i, 5), i)
      Next i
      grdGP.Array = xFactor
      For i = 0 To 9
        If i = 0 Then
          grdGP.Columns(i).Caption = "E (Mev)"
        Else
          grdGP.Columns(i).Caption = x(i)
        End If
      Next i
    End If
    Set rsNuc = Nothing
  End If
' end material else section

  grdGP.Columns(0).Width = 700
  grdGP.Row = 0
  grdGP.Col = 0
  grdGP.Refresh
  grdGP.MarqueeStyle = dbgHighlightCell
  Exit Sub

Error_Handler:
   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Sub BuildUp(E_MeV As Double, b As Double, C As Double, a As Double, Xk As Double, _
  D As Double, i As Integer)
    Dim Zk As Double
    Dim bup As Double
    Dim ztanh2 As Double
    Dim arg As Double
    Dim j As Integer
    On Error Resume Next
    
    ztanh2 = tanh(-2)
    xFactor(i, 0) = E_MeV
    For j = 1 To 9
      arg = x(j) / Xk - 2#
      Zk = C * x(j) ^ a + _
          D * (tanh(arg) - ztanh2) / (1# - ztanh2)
      If Zk = 1# Then
        bup = (b - 1#) * x(j)
      Else
        bup = (b - 1#) * (Zk ^ x(j) - 1#) / (Zk - 1#)
      End If
      bup = 1# + bup
      xFactor(i, j) = bup
   Next j
 End Sub
 
 Function Zfun(Z1, Z2, R1, R2, R) As Double
   Zfun = (Z1 * Log(R2 / R) + Z2 * Log(R / R1)) / Log(R2 / R1)
 End Function

 Function Zfun1(Z1, Z2, R1, R2, Z) As Double
   Zfun1 = R1 + (R2 - R1) / (Z2 - Z1) * (Z - Z1)
 End Function

 Function tanh(x#) As Double
    tanh = (Exp(x#) - Exp(-x#)) / (Exp(x#) + Exp(-x#))
 End Function

Private Sub Form_Unload(Cancel As Integer)
  cmdOK_Click
End Sub

Private Sub grdgp_DblClick()
  Const PROCEDURE_NAME As String = "grdGP_DblClick"
  Dim i As Integer, myX As Double, myY As Double, ColIndex As Integer
  Dim myCaption As String, myCount As Integer, j As Integer, myMin As Double
  
  ColIndex = grdGP.Col
  gs_ColSelected = ColIndex
  On Error GoTo Error_Handler
  
  With frmElePlot
' set up caption
    myCaption = frmPhoBuildup.grdGP.Columns(0).Caption
    .Caption = frmPhoBuildup.Caption & " : " & myCaption
    .gphRad.BottomTitle = myCaption
    myCaption = frmPhoBuildup.grdGP.Columns(gs_ColSelected).Caption
    
' count points
     myCount = numRows
'    myCount = myCount - 1
    
' set up graph
    .gphRad.GraphType = graphLinLog
    .gphRad.GraphStyle = 4
    .gphRad.LeftTitle = myCaption
    .gphRad.NumSets = 1
'    .gphRad.IndexStyle = graphEnhanced
    .gphRad.NumPoints = myCount
    
    If gs_myTable = "Buildup Coefficients" Then
      .gphRad.YAxisMin = xGrid(0, gs_ColSelected)
      .gphRad.XAxisMin = xGrid(0, 0)
      .gphRad.XAxisMax = xGrid(numRows, 0)
      .gphRad.YAxisMax = xGrid(numRows, gs_ColSelected)
      For i = 1 To myCount - 1
        If .gphRad.YAxisMax < xGrid(i, gs_ColSelected) Then
          .gphRad.YAxisMax = xGrid(i, gs_ColSelected)
        End If
        If .gphRad.XAxisMax < xGrid(i, 0) Then
          .gphRad.XAxisMax = xGrid(i, 0)
        End If
        If .gphRad.YAxisMin < xGrid(i, gs_ColSelected) Then
          .gphRad.YAxisMin = xGrid(i, gs_ColSelected)
        End If
        If .gphRad.YAxisMin < xGrid(i, 0) Then
          .gphRad.YAxisMin = xGrid(i, 0)
        End If
      Next i
    Else
      .gphRad.YAxisMin = xFactor(0, gs_ColSelected)
      .gphRad.XAxisMin = xFactor(0, 0)
      .gphRad.XAxisMax = xFactor(numRows, 0)
      .gphRad.YAxisMax = xFactor(numRows, gs_ColSelected)
      For i = 1 To myCount - 1
        If .gphRad.YAxisMax < xFactor(i, gs_ColSelected) Then
          .gphRad.YAxisMax = xFactor(i, gs_ColSelected)
        End If
        If .gphRad.XAxisMax < xFactor(i, 0) Then
          .gphRad.XAxisMax = xFactor(i, 0)
        End If
        If .gphRad.YAxisMin < xFactor(i, gs_ColSelected) Then
          .gphRad.YAxisMin = xFactor(i, gs_ColSelected)
        End If
        If .gphRad.YAxisMin < xFactor(i, 0) Then
          .gphRad.YAxisMin = xFactor(i, 0)
        End If
      Next i
    End If
    
    gNoLines = False
    If gs_myTable = "bioassay" Then
      If .gphRad.YAxisMax / myMin > 100000000# Then
        gNoLines = True
        .gphRad.GridStyle = 2
      Else
        gNoLines = False
      End If
    End If
    For i = 0 To myCount - 1
      If gs_myTable = "Buildup Coefficients" Then
        myY = xGrid(i, gs_ColSelected)
        myX = xGrid(i, 0)
      Else
        myY = xFactor(i, gs_ColSelected)
        myX = xFactor(i, 0)
      End If
      .gphRad.Data(i + 1) = myY
      .gphRad.XPos(i + 1) = myX
    Next i
    .gphRad.DrawMode = 3
  End With
  frmElePlot.Show vbModal
  Set frmElePlot = Nothing
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub
