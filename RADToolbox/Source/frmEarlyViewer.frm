VERSION 5.00
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmEarlyViewer 
   Caption         =   "Form1"
   ClientHeight    =   6210
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   6210
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   8280
      TabIndex        =   3
      Top             =   5160
      Width           =   1335
   End
   Begin VB.CommandButton cmdEarlyExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   4680
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8280
      TabIndex        =   1
      Top             =   5640
      Width           =   1335
   End
   Begin TrueDBGrid80.TDBGrid grdEarly 
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   9615
      _ExtentX        =   16960
      _ExtentY        =   7435
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
      Columns(10)._VlistStyle=   0
      Columns(10)._MaxComboItems=   5
      Columns(10).DataField=   ""
      Columns(10).NumberFormat=   "Scientific"
      Columns(10)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(11)._VlistStyle=   0
      Columns(11)._MaxComboItems=   5
      Columns(11).DataField=   ""
      Columns(11).NumberFormat=   "Scientific"
      Columns(11)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(12)._VlistStyle=   0
      Columns(12)._MaxComboItems=   5
      Columns(12).DataField=   ""
      Columns(12).NumberFormat=   "Scientific"
      Columns(12)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(13)._VlistStyle=   0
      Columns(13)._MaxComboItems=   5
      Columns(13).DataField=   ""
      Columns(13).NumberFormat=   "Scientific"
      Columns(13)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(14)._VlistStyle=   0
      Columns(14)._MaxComboItems=   5
      Columns(14).DataField=   ""
      Columns(14).NumberFormat=   "Scientific"
      Columns(14)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(15)._VlistStyle=   0
      Columns(15)._MaxComboItems=   5
      Columns(15).DataField=   ""
      Columns(15).NumberFormat=   "Scientific"
      Columns(15)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(16)._VlistStyle=   0
      Columns(16)._MaxComboItems=   5
      Columns(16).DataField=   ""
      Columns(16).NumberFormat=   "Scientific"
      Columns(16)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(17)._VlistStyle=   0
      Columns(17)._MaxComboItems=   5
      Columns(17).DataField=   ""
      Columns(17).NumberFormat=   "Scientific"
      Columns(17)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(18)._VlistStyle=   0
      Columns(18)._MaxComboItems=   5
      Columns(18).DataField=   ""
      Columns(18).NumberFormat=   "Scientific"
      Columns(18)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(19)._VlistStyle=   0
      Columns(19)._MaxComboItems=   5
      Columns(19).DataField=   ""
      Columns(19).NumberFormat=   "Scientific"
      Columns(19)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(20)._VlistStyle=   0
      Columns(20)._MaxComboItems=   5
      Columns(20).DataField=   ""
      Columns(20).NumberFormat=   "Scientific"
      Columns(20)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   21
      Splits(0)._UserFlags=   0
      Splits(0).SizeMode=   2
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   13160660
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=21"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=1852"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1773"
      Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(5)=   "Column(1).Width=1429"
      Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=1349"
      Splits(0)._ColumnProps(8)=   "Column(1).Visible=0"
      Splits(0)._ColumnProps(9)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(10)=   "Column(1)._MinWidth=57615136"
      Splits(0)._ColumnProps(11)=   "Column(2).Width=1482"
      Splits(0)._ColumnProps(12)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(13)=   "Column(2)._WidthInPix=1402"
      Splits(0)._ColumnProps(14)=   "Column(2).Visible=0"
      Splits(0)._ColumnProps(15)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(16)=   "Column(3).Width=1561"
      Splits(0)._ColumnProps(17)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(18)=   "Column(3)._WidthInPix=1482"
      Splits(0)._ColumnProps(19)=   "Column(3).Visible=0"
      Splits(0)._ColumnProps(20)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(21)=   "Column(4).Width=1508"
      Splits(0)._ColumnProps(22)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(23)=   "Column(4)._WidthInPix=1429"
      Splits(0)._ColumnProps(24)=   "Column(4).Visible=0"
      Splits(0)._ColumnProps(25)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(26)=   "Column(4)._MinWidth=57905328"
      Splits(0)._ColumnProps(27)=   "Column(5).Width=1508"
      Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=1429"
      Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
      Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(32)=   "Column(6).Width=1508"
      Splits(0)._ColumnProps(33)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(34)=   "Column(6)._WidthInPix=1429"
      Splits(0)._ColumnProps(35)=   "Column(6).Visible=0"
      Splits(0)._ColumnProps(36)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(37)=   "Column(7).Width=1508"
      Splits(0)._ColumnProps(38)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(39)=   "Column(7)._WidthInPix=1429"
      Splits(0)._ColumnProps(40)=   "Column(7).Visible=0"
      Splits(0)._ColumnProps(41)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(42)=   "Column(8).Width=1561"
      Splits(0)._ColumnProps(43)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(44)=   "Column(8)._WidthInPix=1482"
      Splits(0)._ColumnProps(45)=   "Column(8).Visible=0"
      Splits(0)._ColumnProps(46)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(47)=   "Column(9).Width=1535"
      Splits(0)._ColumnProps(48)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(49)=   "Column(9)._WidthInPix=1455"
      Splits(0)._ColumnProps(50)=   "Column(9).Visible=0"
      Splits(0)._ColumnProps(51)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(52)=   "Column(10).Width=1561"
      Splits(0)._ColumnProps(53)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(54)=   "Column(10)._WidthInPix=1482"
      Splits(0)._ColumnProps(55)=   "Column(10).Visible=0"
      Splits(0)._ColumnProps(56)=   "Column(10).Order=11"
      Splits(0)._ColumnProps(57)=   "Column(11).Width=2725"
      Splits(0)._ColumnProps(58)=   "Column(11).DividerColor=0"
      Splits(0)._ColumnProps(59)=   "Column(11)._WidthInPix=2646"
      Splits(0)._ColumnProps(60)=   "Column(11).Order=12"
      Splits(0)._ColumnProps(61)=   "Column(12).Width=2725"
      Splits(0)._ColumnProps(62)=   "Column(12).DividerColor=0"
      Splits(0)._ColumnProps(63)=   "Column(12)._WidthInPix=2646"
      Splits(0)._ColumnProps(64)=   "Column(12).Order=13"
      Splits(0)._ColumnProps(65)=   "Column(13).Width=2725"
      Splits(0)._ColumnProps(66)=   "Column(13).DividerColor=0"
      Splits(0)._ColumnProps(67)=   "Column(13)._WidthInPix=2646"
      Splits(0)._ColumnProps(68)=   "Column(13).Order=14"
      Splits(0)._ColumnProps(69)=   "Column(14).Width=2725"
      Splits(0)._ColumnProps(70)=   "Column(14).DividerColor=0"
      Splits(0)._ColumnProps(71)=   "Column(14)._WidthInPix=2646"
      Splits(0)._ColumnProps(72)=   "Column(14).Order=15"
      Splits(0)._ColumnProps(73)=   "Column(15).Width=2725"
      Splits(0)._ColumnProps(74)=   "Column(15).DividerColor=0"
      Splits(0)._ColumnProps(75)=   "Column(15)._WidthInPix=2646"
      Splits(0)._ColumnProps(76)=   "Column(15).Order=16"
      Splits(0)._ColumnProps(77)=   "Column(16).Width=2725"
      Splits(0)._ColumnProps(78)=   "Column(16).DividerColor=0"
      Splits(0)._ColumnProps(79)=   "Column(16)._WidthInPix=2646"
      Splits(0)._ColumnProps(80)=   "Column(16).Order=17"
      Splits(0)._ColumnProps(81)=   "Column(17).Width=2725"
      Splits(0)._ColumnProps(82)=   "Column(17).DividerColor=0"
      Splits(0)._ColumnProps(83)=   "Column(17)._WidthInPix=2646"
      Splits(0)._ColumnProps(84)=   "Column(17).Order=18"
      Splits(0)._ColumnProps(85)=   "Column(18).Width=2725"
      Splits(0)._ColumnProps(86)=   "Column(18).DividerColor=0"
      Splits(0)._ColumnProps(87)=   "Column(18)._WidthInPix=2646"
      Splits(0)._ColumnProps(88)=   "Column(18).Order=19"
      Splits(0)._ColumnProps(89)=   "Column(19).Width=2725"
      Splits(0)._ColumnProps(90)=   "Column(19).DividerColor=0"
      Splits(0)._ColumnProps(91)=   "Column(19)._WidthInPix=2646"
      Splits(0)._ColumnProps(92)=   "Column(19).Order=20"
      Splits(0)._ColumnProps(93)=   "Column(20).Width=2725"
      Splits(0)._ColumnProps(94)=   "Column(20).DividerColor=0"
      Splits(0)._ColumnProps(95)=   "Column(20)._WidthInPix=2646"
      Splits(0)._ColumnProps(96)=   "Column(20).Order=21"
      Splits(1)._UserFlags=   0
      Splits(1).RecordSelectors=   0   'False
      Splits(1).RecordSelectorWidth=   503
      Splits(1).DividerColor=   13160660
      Splits(1).SpringMode=   0   'False
      Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(1)._ColumnProps(0)=   "Columns.Count=21"
      Splits(1)._ColumnProps(1)=   "Column(0).Width=1852"
      Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1773"
      Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
      Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
      Splits(1)._ColumnProps(6)=   "Column(1).Width=1429"
      Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
      Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=1349"
      Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
      Splits(1)._ColumnProps(10)=   "Column(2).Width=1482"
      Splits(1)._ColumnProps(11)=   "Column(2).DividerColor=0"
      Splits(1)._ColumnProps(12)=   "Column(2)._WidthInPix=1402"
      Splits(1)._ColumnProps(13)=   "Column(2).Order=3"
      Splits(1)._ColumnProps(14)=   "Column(3).Width=1561"
      Splits(1)._ColumnProps(15)=   "Column(3).DividerColor=0"
      Splits(1)._ColumnProps(16)=   "Column(3)._WidthInPix=1482"
      Splits(1)._ColumnProps(17)=   "Column(3).Order=4"
      Splits(1)._ColumnProps(18)=   "Column(4).Width=1508"
      Splits(1)._ColumnProps(19)=   "Column(4).DividerColor=0"
      Splits(1)._ColumnProps(20)=   "Column(4)._WidthInPix=1429"
      Splits(1)._ColumnProps(21)=   "Column(4).Order=5"
      Splits(1)._ColumnProps(22)=   "Column(5).Width=1508"
      Splits(1)._ColumnProps(23)=   "Column(5).DividerColor=0"
      Splits(1)._ColumnProps(24)=   "Column(5)._WidthInPix=1429"
      Splits(1)._ColumnProps(25)=   "Column(5).Order=6"
      Splits(1)._ColumnProps(26)=   "Column(6).Width=1508"
      Splits(1)._ColumnProps(27)=   "Column(6).DividerColor=0"
      Splits(1)._ColumnProps(28)=   "Column(6)._WidthInPix=1429"
      Splits(1)._ColumnProps(29)=   "Column(6).Order=7"
      Splits(1)._ColumnProps(30)=   "Column(7).Width=1508"
      Splits(1)._ColumnProps(31)=   "Column(7).DividerColor=0"
      Splits(1)._ColumnProps(32)=   "Column(7)._WidthInPix=1429"
      Splits(1)._ColumnProps(33)=   "Column(7).Order=8"
      Splits(1)._ColumnProps(34)=   "Column(8).Width=1561"
      Splits(1)._ColumnProps(35)=   "Column(8).DividerColor=0"
      Splits(1)._ColumnProps(36)=   "Column(8)._WidthInPix=1482"
      Splits(1)._ColumnProps(37)=   "Column(8).Order=9"
      Splits(1)._ColumnProps(38)=   "Column(9).Width=1535"
      Splits(1)._ColumnProps(39)=   "Column(9).DividerColor=0"
      Splits(1)._ColumnProps(40)=   "Column(9)._WidthInPix=1455"
      Splits(1)._ColumnProps(41)=   "Column(9).Order=10"
      Splits(1)._ColumnProps(42)=   "Column(10).Width=1561"
      Splits(1)._ColumnProps(43)=   "Column(10).DividerColor=0"
      Splits(1)._ColumnProps(44)=   "Column(10)._WidthInPix=1482"
      Splits(1)._ColumnProps(45)=   "Column(10).Order=11"
      Splits(1)._ColumnProps(46)=   "Column(11).Width=2725"
      Splits(1)._ColumnProps(47)=   "Column(11).DividerColor=0"
      Splits(1)._ColumnProps(48)=   "Column(11)._WidthInPix=2646"
      Splits(1)._ColumnProps(49)=   "Column(11).Order=12"
      Splits(1)._ColumnProps(50)=   "Column(12).Width=2725"
      Splits(1)._ColumnProps(51)=   "Column(12).DividerColor=0"
      Splits(1)._ColumnProps(52)=   "Column(12)._WidthInPix=2646"
      Splits(1)._ColumnProps(53)=   "Column(12).Order=13"
      Splits(1)._ColumnProps(54)=   "Column(13).Width=2725"
      Splits(1)._ColumnProps(55)=   "Column(13).DividerColor=0"
      Splits(1)._ColumnProps(56)=   "Column(13)._WidthInPix=2646"
      Splits(1)._ColumnProps(57)=   "Column(13).Order=14"
      Splits(1)._ColumnProps(58)=   "Column(14).Width=2725"
      Splits(1)._ColumnProps(59)=   "Column(14).DividerColor=0"
      Splits(1)._ColumnProps(60)=   "Column(14)._WidthInPix=2646"
      Splits(1)._ColumnProps(61)=   "Column(14).Order=15"
      Splits(1)._ColumnProps(62)=   "Column(15).Width=2725"
      Splits(1)._ColumnProps(63)=   "Column(15).DividerColor=0"
      Splits(1)._ColumnProps(64)=   "Column(15)._WidthInPix=2646"
      Splits(1)._ColumnProps(65)=   "Column(15).Order=16"
      Splits(1)._ColumnProps(66)=   "Column(16).Width=2725"
      Splits(1)._ColumnProps(67)=   "Column(16).DividerColor=0"
      Splits(1)._ColumnProps(68)=   "Column(16)._WidthInPix=2646"
      Splits(1)._ColumnProps(69)=   "Column(16).Order=17"
      Splits(1)._ColumnProps(70)=   "Column(17).Width=2725"
      Splits(1)._ColumnProps(71)=   "Column(17).DividerColor=0"
      Splits(1)._ColumnProps(72)=   "Column(17)._WidthInPix=2646"
      Splits(1)._ColumnProps(73)=   "Column(17).Order=18"
      Splits(1)._ColumnProps(74)=   "Column(18).Width=2725"
      Splits(1)._ColumnProps(75)=   "Column(18).DividerColor=0"
      Splits(1)._ColumnProps(76)=   "Column(18)._WidthInPix=2646"
      Splits(1)._ColumnProps(77)=   "Column(18).Order=19"
      Splits(1)._ColumnProps(78)=   "Column(19).Width=2725"
      Splits(1)._ColumnProps(79)=   "Column(19).DividerColor=0"
      Splits(1)._ColumnProps(80)=   "Column(19)._WidthInPix=2646"
      Splits(1)._ColumnProps(81)=   "Column(19).Order=20"
      Splits(1)._ColumnProps(82)=   "Column(20).Width=2725"
      Splits(1)._ColumnProps(83)=   "Column(20).DividerColor=0"
      Splits(1)._ColumnProps(84)=   "Column(20)._WidthInPix=2646"
      Splits(1)._ColumnProps(85)=   "Column(20).Order=21"
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
      HeadLines       =   0
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
      _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=88,.parent=4"
      _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=30,.parent=2"
      _StyleDefs(21)  =   "Splits(0).FooterStyle:id=31,.parent=3"
      _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=32,.parent=5"
      _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=84,.parent=6"
      _StyleDefs(24)  =   "Splits(0).EditorStyle:id=83,.parent=7"
      _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=85,.parent=8"
      _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=86,.parent=9"
      _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=87,.parent=10"
      _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=89,.parent=11"
      _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=90,.parent=12"
      _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=94,.parent=29"
      _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=91,.parent=30"
      _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=92,.parent=31"
      _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=93,.parent=83"
      _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=98,.parent=29"
      _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=95,.parent=30"
      _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=96,.parent=31"
      _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=97,.parent=83"
      _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=102,.parent=29"
      _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=99,.parent=30"
      _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=100,.parent=31"
      _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=101,.parent=83"
      _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=106,.parent=29"
      _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=103,.parent=30"
      _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=104,.parent=31"
      _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=105,.parent=83"
      _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=110,.parent=29"
      _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=107,.parent=30"
      _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=108,.parent=31"
      _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=109,.parent=83"
      _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=114,.parent=29"
      _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=111,.parent=30"
      _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=112,.parent=31"
      _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=113,.parent=83"
      _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=118,.parent=29"
      _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=115,.parent=30"
      _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=116,.parent=31"
      _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=117,.parent=83"
      _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=122,.parent=29"
      _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=119,.parent=30"
      _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=120,.parent=31"
      _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=121,.parent=83"
      _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=126,.parent=29"
      _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=123,.parent=30"
      _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=124,.parent=31"
      _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=125,.parent=83"
      _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=130,.parent=29"
      _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=127,.parent=30"
      _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=128,.parent=31"
      _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=129,.parent=83"
      _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=134,.parent=29"
      _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=131,.parent=30"
      _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=132,.parent=31"
      _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=133,.parent=83"
      _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=138,.parent=29"
      _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=135,.parent=30"
      _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=136,.parent=31"
      _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=137,.parent=83"
      _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=146,.parent=29"
      _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=143,.parent=30"
      _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=144,.parent=31"
      _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=145,.parent=83"
      _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=154,.parent=29"
      _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=151,.parent=30"
      _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=152,.parent=31"
      _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=153,.parent=83"
      _StyleDefs(86)  =   "Splits(0).Columns(14).Style:id=162,.parent=29"
      _StyleDefs(87)  =   "Splits(0).Columns(14).HeadingStyle:id=159,.parent=30"
      _StyleDefs(88)  =   "Splits(0).Columns(14).FooterStyle:id=160,.parent=31"
      _StyleDefs(89)  =   "Splits(0).Columns(14).EditorStyle:id=161,.parent=83"
      _StyleDefs(90)  =   "Splits(0).Columns(15).Style:id=170,.parent=29"
      _StyleDefs(91)  =   "Splits(0).Columns(15).HeadingStyle:id=167,.parent=30"
      _StyleDefs(92)  =   "Splits(0).Columns(15).FooterStyle:id=168,.parent=31"
      _StyleDefs(93)  =   "Splits(0).Columns(15).EditorStyle:id=169,.parent=83"
      _StyleDefs(94)  =   "Splits(0).Columns(16).Style:id=178,.parent=29"
      _StyleDefs(95)  =   "Splits(0).Columns(16).HeadingStyle:id=175,.parent=30"
      _StyleDefs(96)  =   "Splits(0).Columns(16).FooterStyle:id=176,.parent=31"
      _StyleDefs(97)  =   "Splits(0).Columns(16).EditorStyle:id=177,.parent=83"
      _StyleDefs(98)  =   "Splits(0).Columns(17).Style:id=186,.parent=29"
      _StyleDefs(99)  =   "Splits(0).Columns(17).HeadingStyle:id=183,.parent=30"
      _StyleDefs(100) =   "Splits(0).Columns(17).FooterStyle:id=184,.parent=31"
      _StyleDefs(101) =   "Splits(0).Columns(17).EditorStyle:id=185,.parent=83"
      _StyleDefs(102) =   "Splits(0).Columns(18).Style:id=194,.parent=29"
      _StyleDefs(103) =   "Splits(0).Columns(18).HeadingStyle:id=191,.parent=30"
      _StyleDefs(104) =   "Splits(0).Columns(18).FooterStyle:id=192,.parent=31"
      _StyleDefs(105) =   "Splits(0).Columns(18).EditorStyle:id=193,.parent=83"
      _StyleDefs(106) =   "Splits(0).Columns(19).Style:id=202,.parent=29"
      _StyleDefs(107) =   "Splits(0).Columns(19).HeadingStyle:id=199,.parent=30"
      _StyleDefs(108) =   "Splits(0).Columns(19).FooterStyle:id=200,.parent=31"
      _StyleDefs(109) =   "Splits(0).Columns(19).EditorStyle:id=201,.parent=83"
      _StyleDefs(110) =   "Splits(0).Columns(20).Style:id=210,.parent=29"
      _StyleDefs(111) =   "Splits(0).Columns(20).HeadingStyle:id=207,.parent=30"
      _StyleDefs(112) =   "Splits(0).Columns(20).FooterStyle:id=208,.parent=31"
      _StyleDefs(113) =   "Splits(0).Columns(20).EditorStyle:id=209,.parent=83"
      _StyleDefs(114) =   "Splits(1).Style:id=13,.parent=1"
      _StyleDefs(115) =   "Splits(1).CaptionStyle:id=22,.parent=4"
      _StyleDefs(116) =   "Splits(1).HeadingStyle:id=14,.parent=2"
      _StyleDefs(117) =   "Splits(1).FooterStyle:id=15,.parent=3"
      _StyleDefs(118) =   "Splits(1).InactiveStyle:id=16,.parent=5"
      _StyleDefs(119) =   "Splits(1).SelectedStyle:id=18,.parent=6"
      _StyleDefs(120) =   "Splits(1).EditorStyle:id=17,.parent=7"
      _StyleDefs(121) =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
      _StyleDefs(122) =   "Splits(1).EvenRowStyle:id=20,.parent=9"
      _StyleDefs(123) =   "Splits(1).OddRowStyle:id=21,.parent=10"
      _StyleDefs(124) =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
      _StyleDefs(125) =   "Splits(1).FilterBarStyle:id=24,.parent=12"
      _StyleDefs(126) =   "Splits(1).Columns(0).Style:id=28,.parent=13"
      _StyleDefs(127) =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
      _StyleDefs(128) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
      _StyleDefs(129) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
      _StyleDefs(130) =   "Splits(1).Columns(1).Style:id=46,.parent=13"
      _StyleDefs(131) =   "Splits(1).Columns(1).HeadingStyle:id=43,.parent=14"
      _StyleDefs(132) =   "Splits(1).Columns(1).FooterStyle:id=44,.parent=15"
      _StyleDefs(133) =   "Splits(1).Columns(1).EditorStyle:id=45,.parent=17"
      _StyleDefs(134) =   "Splits(1).Columns(2).Style:id=50,.parent=13"
      _StyleDefs(135) =   "Splits(1).Columns(2).HeadingStyle:id=47,.parent=14"
      _StyleDefs(136) =   "Splits(1).Columns(2).FooterStyle:id=48,.parent=15"
      _StyleDefs(137) =   "Splits(1).Columns(2).EditorStyle:id=49,.parent=17"
      _StyleDefs(138) =   "Splits(1).Columns(3).Style:id=54,.parent=13"
      _StyleDefs(139) =   "Splits(1).Columns(3).HeadingStyle:id=51,.parent=14"
      _StyleDefs(140) =   "Splits(1).Columns(3).FooterStyle:id=52,.parent=15"
      _StyleDefs(141) =   "Splits(1).Columns(3).EditorStyle:id=53,.parent=17"
      _StyleDefs(142) =   "Splits(1).Columns(4).Style:id=58,.parent=13"
      _StyleDefs(143) =   "Splits(1).Columns(4).HeadingStyle:id=55,.parent=14"
      _StyleDefs(144) =   "Splits(1).Columns(4).FooterStyle:id=56,.parent=15"
      _StyleDefs(145) =   "Splits(1).Columns(4).EditorStyle:id=57,.parent=17"
      _StyleDefs(146) =   "Splits(1).Columns(5).Style:id=62,.parent=13"
      _StyleDefs(147) =   "Splits(1).Columns(5).HeadingStyle:id=59,.parent=14"
      _StyleDefs(148) =   "Splits(1).Columns(5).FooterStyle:id=60,.parent=15"
      _StyleDefs(149) =   "Splits(1).Columns(5).EditorStyle:id=61,.parent=17"
      _StyleDefs(150) =   "Splits(1).Columns(6).Style:id=66,.parent=13"
      _StyleDefs(151) =   "Splits(1).Columns(6).HeadingStyle:id=63,.parent=14"
      _StyleDefs(152) =   "Splits(1).Columns(6).FooterStyle:id=64,.parent=15"
      _StyleDefs(153) =   "Splits(1).Columns(6).EditorStyle:id=65,.parent=17"
      _StyleDefs(154) =   "Splits(1).Columns(7).Style:id=70,.parent=13"
      _StyleDefs(155) =   "Splits(1).Columns(7).HeadingStyle:id=67,.parent=14"
      _StyleDefs(156) =   "Splits(1).Columns(7).FooterStyle:id=68,.parent=15"
      _StyleDefs(157) =   "Splits(1).Columns(7).EditorStyle:id=69,.parent=17"
      _StyleDefs(158) =   "Splits(1).Columns(8).Style:id=74,.parent=13"
      _StyleDefs(159) =   "Splits(1).Columns(8).HeadingStyle:id=71,.parent=14"
      _StyleDefs(160) =   "Splits(1).Columns(8).FooterStyle:id=72,.parent=15"
      _StyleDefs(161) =   "Splits(1).Columns(8).EditorStyle:id=73,.parent=17"
      _StyleDefs(162) =   "Splits(1).Columns(9).Style:id=78,.parent=13"
      _StyleDefs(163) =   "Splits(1).Columns(9).HeadingStyle:id=75,.parent=14"
      _StyleDefs(164) =   "Splits(1).Columns(9).FooterStyle:id=76,.parent=15"
      _StyleDefs(165) =   "Splits(1).Columns(9).EditorStyle:id=77,.parent=17"
      _StyleDefs(166) =   "Splits(1).Columns(10).Style:id=82,.parent=13"
      _StyleDefs(167) =   "Splits(1).Columns(10).HeadingStyle:id=79,.parent=14"
      _StyleDefs(168) =   "Splits(1).Columns(10).FooterStyle:id=80,.parent=15"
      _StyleDefs(169) =   "Splits(1).Columns(10).EditorStyle:id=81,.parent=17"
      _StyleDefs(170) =   "Splits(1).Columns(11).Style:id=142,.parent=13"
      _StyleDefs(171) =   "Splits(1).Columns(11).HeadingStyle:id=139,.parent=14"
      _StyleDefs(172) =   "Splits(1).Columns(11).FooterStyle:id=140,.parent=15"
      _StyleDefs(173) =   "Splits(1).Columns(11).EditorStyle:id=141,.parent=17"
      _StyleDefs(174) =   "Splits(1).Columns(12).Style:id=150,.parent=13"
      _StyleDefs(175) =   "Splits(1).Columns(12).HeadingStyle:id=147,.parent=14"
      _StyleDefs(176) =   "Splits(1).Columns(12).FooterStyle:id=148,.parent=15"
      _StyleDefs(177) =   "Splits(1).Columns(12).EditorStyle:id=149,.parent=17"
      _StyleDefs(178) =   "Splits(1).Columns(13).Style:id=158,.parent=13"
      _StyleDefs(179) =   "Splits(1).Columns(13).HeadingStyle:id=155,.parent=14"
      _StyleDefs(180) =   "Splits(1).Columns(13).FooterStyle:id=156,.parent=15"
      _StyleDefs(181) =   "Splits(1).Columns(13).EditorStyle:id=157,.parent=17"
      _StyleDefs(182) =   "Splits(1).Columns(14).Style:id=166,.parent=13"
      _StyleDefs(183) =   "Splits(1).Columns(14).HeadingStyle:id=163,.parent=14"
      _StyleDefs(184) =   "Splits(1).Columns(14).FooterStyle:id=164,.parent=15"
      _StyleDefs(185) =   "Splits(1).Columns(14).EditorStyle:id=165,.parent=17"
      _StyleDefs(186) =   "Splits(1).Columns(15).Style:id=174,.parent=13"
      _StyleDefs(187) =   "Splits(1).Columns(15).HeadingStyle:id=171,.parent=14"
      _StyleDefs(188) =   "Splits(1).Columns(15).FooterStyle:id=172,.parent=15"
      _StyleDefs(189) =   "Splits(1).Columns(15).EditorStyle:id=173,.parent=17"
      _StyleDefs(190) =   "Splits(1).Columns(16).Style:id=182,.parent=13"
      _StyleDefs(191) =   "Splits(1).Columns(16).HeadingStyle:id=179,.parent=14"
      _StyleDefs(192) =   "Splits(1).Columns(16).FooterStyle:id=180,.parent=15"
      _StyleDefs(193) =   "Splits(1).Columns(16).EditorStyle:id=181,.parent=17"
      _StyleDefs(194) =   "Splits(1).Columns(17).Style:id=190,.parent=13"
      _StyleDefs(195) =   "Splits(1).Columns(17).HeadingStyle:id=187,.parent=14"
      _StyleDefs(196) =   "Splits(1).Columns(17).FooterStyle:id=188,.parent=15"
      _StyleDefs(197) =   "Splits(1).Columns(17).EditorStyle:id=189,.parent=17"
      _StyleDefs(198) =   "Splits(1).Columns(18).Style:id=198,.parent=13"
      _StyleDefs(199) =   "Splits(1).Columns(18).HeadingStyle:id=195,.parent=14"
      _StyleDefs(200) =   "Splits(1).Columns(18).FooterStyle:id=196,.parent=15"
      _StyleDefs(201) =   "Splits(1).Columns(18).EditorStyle:id=197,.parent=17"
      _StyleDefs(202) =   "Splits(1).Columns(19).Style:id=206,.parent=13"
      _StyleDefs(203) =   "Splits(1).Columns(19).HeadingStyle:id=203,.parent=14"
      _StyleDefs(204) =   "Splits(1).Columns(19).FooterStyle:id=204,.parent=15"
      _StyleDefs(205) =   "Splits(1).Columns(19).EditorStyle:id=205,.parent=17"
      _StyleDefs(206) =   "Splits(1).Columns(20).Style:id=214,.parent=13"
      _StyleDefs(207) =   "Splits(1).Columns(20).HeadingStyle:id=211,.parent=14"
      _StyleDefs(208) =   "Splits(1).Columns(20).FooterStyle:id=212,.parent=15"
      _StyleDefs(209) =   "Splits(1).Columns(20).EditorStyle:id=213,.parent=17"
      _StyleDefs(210) =   "Named:id=33:Normal"
      _StyleDefs(211) =   ":id=33,.parent=0"
      _StyleDefs(212) =   "Named:id=34:Heading"
      _StyleDefs(213) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(214) =   ":id=34,.wraptext=-1"
      _StyleDefs(215) =   "Named:id=35:Footing"
      _StyleDefs(216) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(217) =   "Named:id=36:Selected"
      _StyleDefs(218) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(219) =   "Named:id=37:Caption"
      _StyleDefs(220) =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(221) =   "Named:id=38:HighlightRow"
      _StyleDefs(222) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(223) =   "Named:id=39:EvenRow"
      _StyleDefs(224) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(225) =   "Named:id=40:OddRow"
      _StyleDefs(226) =   ":id=40,.parent=33"
      _StyleDefs(227) =   "Named:id=41:RecordSelector"
      _StyleDefs(228) =   ":id=41,.parent=34"
      _StyleDefs(229) =   "Named:id=42:FilterBar"
      _StyleDefs(230) =   ":id=42,.parent=33"
   End
End
Attribute VB_Name = "frmEarlyViewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmEarlyViewer"
Dim xEarly As New XArrayDB
Dim numRows As Integer, MaxCol As Integer

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
      For i = 0 To numRows + 1
         gsExcel.Cells(i + 2, iC + 1).Value = xEarly(i, j)
      Next i
    Next j
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = Me.Caption
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
  grdEarly.PrintInfo.PageHeader = Me.Caption
  grdEarly.PrintInfo.PreviewInitZoom = 100
  grdEarly.PrintInfo.PrintPreview
End Sub

Private Sub Form_Load()
 Const PROCEDURE_NAME As String = "Form_Load"
  Dim sHeader(11) As String, RBE As Boolean, i As Integer, j As Integer
  Dim sIn As String, din As Double, C As Column, sLowHigh
  
  On Error GoTo Error_Handler
  PositionForm Me
  xEarly.ReDim 0, 7, 0, 21
  
  Open gView_File_Name For Input As #1
  Input #1, sHeader(1)
  If (sHeader(1) = "Error, table could not be created.") Then
    MsgBox sHeader(1)
    Close #1
    Me.Hide
    Exit Sub
  Else
    gs_myTable = sHeader(1)
    If InStr(gs_myTable, "Low") Then
      sLowHigh = "Low LET"
    ElseIf InStr(gs_myTable, "High") Then
      sLowHigh = "High LET"
    Else
      sLowHigh = ""
    End If
  End If
  
  For i = 0 To 6
    Input #1, sHeader(i)
  Next i
  RBE = False
  If sHeader(6) <> "Tmax (d)" Then
    RBE = True
    numRows = 6
    For i = 7 To 10
      Input #1, sHeader(i)
    Next i
    sHeader(10) = "Time (d)"
  Else
    sHeader(6) = "Time (d)"
    numRows = 6
  End If
  
  xEarly(0, 0) = "Nuclide"
  xEarly(1, 0) = sHeader(1)
  xEarly(3, 0) = "Tissue"
  If RBE Then
    xEarly(2, 0) = sHeader(10)
    xEarly(4, 0) = sHeader(2)
    xEarly(5, 0) = sHeader(4)
    xEarly(6, 0) = sHeader(6)
    xEarly(7, 0) = sHeader(8)
    For i = 2 To 9
      Input #1, sHeader(i)
    Next i
    xEarly(3, 1) = "Low LET"
    xEarly(3, 2) = "High LET"
  Else
    xEarly(2, 0) = sHeader(6)
    xEarly(4, 0) = sHeader(2)
    xEarly(5, 0) = sHeader(3)
    xEarly(6, 0) = sHeader(4)
    xEarly(7, 0) = sHeader(5)
    xEarly(3, 1) = sLowHigh
  End If
  
  MaxCol = 1
  While Not EOF(1)
    Input #1, sIn
    xEarly(0, 1) = sIn
    Input #1, sIn
    xEarly(1, 1) = sIn
    If RBE Then
      xEarly(3, MaxCol) = "Low LET"
      xEarly(3, MaxCol + 1) = "High LET"
      For i = 4 To 7
        Input #1, din
        xEarly(i, MaxCol) = din
        Input #1, din
        xEarly(i, MaxCol + 1) = din
      Next i
      Input #1, din
      xEarly(2, MaxCol) = din
      MaxCol = MaxCol + 2
    Else
      xEarly(3, MaxCol) = sLowHigh
      For i = 4 To 7
        Input #1, din
        xEarly(i, MaxCol) = din
      Next i
      Input #1, din
      xEarly(2, MaxCol) = din
      MaxCol = MaxCol + 1
    End If
  Wend
  Close #1
  If gs_UseRBE = "Y" Then
    xEarly(1, MaxCol) = "RBE"
    For i = 1 To 4
      xEarly(i + 1, MaxCol) = XRBE(i, 1)
    Next i
  End If
 
  xEarly.ReDim 0, 7, 0, MaxCol
  If MaxCol > grdEarly.Columns.Count Then
    j = grdEarly.Columns.Count - 1
    For i = MaxCol + 1 To j
      Set C = grdEarly.Columns.Add(i)
      C.Visible = True
    Next i
  End If
  If MaxCol <= grdEarly.Columns.Count Then
    j = grdEarly.Columns.Count - 1
    For i = j To MaxCol + 1 Step -1
      grdEarly.Columns.Remove (i)
    Next i
  End If
  For j = 1 To MaxCol - 1
    grdEarly.Splits(1).Columns(j).Width = 800
  Next j
  grdEarly.ReBind

   
  If gd_EarlyFactor <> 1 Then
    For i = 4 To 7
      For j = 1 To MaxCol - 1
        xEarly(i, j) = xEarly(i, j) * gd_EarlyFactor
      Next j
    Next i
  End If

  grdEarly.Array = xEarly
  grdEarly.Refresh
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

