VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmInhDisplay 
   Caption         =   "Inhalation dose factors"
   ClientHeight    =   7995
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   7995
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdUnits 
      Caption         =   "Select Units"
      Height          =   375
      Left            =   8280
      TabIndex        =   6
      Top             =   3960
      Width           =   1335
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   8280
      TabIndex        =   4
      Top             =   5280
      Width           =   1335
   End
   Begin MSComDlg.CommonDialog dlgCom 
      Left            =   8400
      Top             =   1320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   8880
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   2280
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmd30Export 
      Caption         =   "Export"
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   6000
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8280
      TabIndex        =   1
      Top             =   6720
      Width           =   1335
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   8280
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   3000
      Visible         =   0   'False
      Width           =   1215
   End
   Begin TrueDBGrid80.TDBGrid grdInhDisplay 
      Height          =   7815
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   13785
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).DataField=   ""
      Columns(0).NumberFormat=   "Scientific"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).DataField=   ""
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).DataField=   ""
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).DataField=   ""
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).DataField=   ""
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).DataField=   ""
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).DataField=   ""
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   0
      Columns(7)._MaxComboItems=   5
      Columns(7).DataField=   ""
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(8)._VlistStyle=   0
      Columns(8)._MaxComboItems=   5
      Columns(8).DataField=   ""
      Columns(8)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(9)._VlistStyle=   0
      Columns(9)._MaxComboItems=   5
      Columns(9).DataField=   ""
      Columns(9)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(10)._VlistStyle=   0
      Columns(10)._MaxComboItems=   5
      Columns(10).DataField=   ""
      Columns(10)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(11)._VlistStyle=   0
      Columns(11)._MaxComboItems=   5
      Columns(11).DataField=   ""
      Columns(11)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(12)._VlistStyle=   0
      Columns(12)._MaxComboItems=   5
      Columns(12).DataField=   ""
      Columns(12)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(13)._VlistStyle=   0
      Columns(13)._MaxComboItems=   5
      Columns(13).DataField=   ""
      Columns(13)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(14)._VlistStyle=   0
      Columns(14)._MaxComboItems=   5
      Columns(14).DataField=   ""
      Columns(14)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(15)._VlistStyle=   0
      Columns(15)._MaxComboItems=   5
      Columns(15).DataField=   ""
      Columns(15)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(16)._VlistStyle=   0
      Columns(16)._MaxComboItems=   5
      Columns(16).DataField=   ""
      Columns(16)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(17)._VlistStyle=   0
      Columns(17)._MaxComboItems=   5
      Columns(17).DataField=   ""
      Columns(17)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(18)._VlistStyle=   0
      Columns(18)._MaxComboItems=   5
      Columns(18).DataField=   ""
      Columns(18)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(19)._VlistStyle=   0
      Columns(19)._MaxComboItems=   5
      Columns(19).DataField=   ""
      Columns(19)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(20)._VlistStyle=   0
      Columns(20)._MaxComboItems=   5
      Columns(20).DataField=   ""
      Columns(20)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(21)._VlistStyle=   0
      Columns(21)._MaxComboItems=   5
      Columns(21).DataField=   ""
      Columns(21)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   22
      Splits(0)._UserFlags=   0
      Splits(0).SizeMode=   2
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   13160660
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=22"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(5)=   "Column(1).Width=2725"
      Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=2646"
      Splits(0)._ColumnProps(8)=   "Column(1).Visible=0"
      Splits(0)._ColumnProps(9)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(10)=   "Column(2).Width=2725"
      Splits(0)._ColumnProps(11)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(12)=   "Column(2)._WidthInPix=2646"
      Splits(0)._ColumnProps(13)=   "Column(2).Visible=0"
      Splits(0)._ColumnProps(14)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(15)=   "Column(3).Width=2725"
      Splits(0)._ColumnProps(16)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(17)=   "Column(3)._WidthInPix=2646"
      Splits(0)._ColumnProps(18)=   "Column(3).Visible=0"
      Splits(0)._ColumnProps(19)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(20)=   "Column(4).Width=2725"
      Splits(0)._ColumnProps(21)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(22)=   "Column(4)._WidthInPix=2646"
      Splits(0)._ColumnProps(23)=   "Column(4).Visible=0"
      Splits(0)._ColumnProps(24)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(25)=   "Column(5).Width=2725"
      Splits(0)._ColumnProps(26)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(27)=   "Column(5)._WidthInPix=2646"
      Splits(0)._ColumnProps(28)=   "Column(5).Visible=0"
      Splits(0)._ColumnProps(29)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(30)=   "Column(6).Width=2725"
      Splits(0)._ColumnProps(31)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(32)=   "Column(6)._WidthInPix=2646"
      Splits(0)._ColumnProps(33)=   "Column(6).Visible=0"
      Splits(0)._ColumnProps(34)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(35)=   "Column(7).Width=2725"
      Splits(0)._ColumnProps(36)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(37)=   "Column(7)._WidthInPix=2646"
      Splits(0)._ColumnProps(38)=   "Column(7).Visible=0"
      Splits(0)._ColumnProps(39)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(40)=   "Column(8).Width=2725"
      Splits(0)._ColumnProps(41)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(42)=   "Column(8)._WidthInPix=2646"
      Splits(0)._ColumnProps(43)=   "Column(8).Visible=0"
      Splits(0)._ColumnProps(44)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(45)=   "Column(8)._MinWidth=58328136"
      Splits(0)._ColumnProps(46)=   "Column(9).Width=2725"
      Splits(0)._ColumnProps(47)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(48)=   "Column(9)._WidthInPix=2646"
      Splits(0)._ColumnProps(49)=   "Column(9).Visible=0"
      Splits(0)._ColumnProps(50)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(51)=   "Column(10).Width=2725"
      Splits(0)._ColumnProps(52)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(53)=   "Column(10)._WidthInPix=2646"
      Splits(0)._ColumnProps(54)=   "Column(10).Visible=0"
      Splits(0)._ColumnProps(55)=   "Column(10).Order=11"
      Splits(0)._ColumnProps(56)=   "Column(10)._MinWidth=1"
      Splits(0)._ColumnProps(57)=   "Column(11).Width=2725"
      Splits(0)._ColumnProps(58)=   "Column(11).DividerColor=0"
      Splits(0)._ColumnProps(59)=   "Column(11)._WidthInPix=2646"
      Splits(0)._ColumnProps(60)=   "Column(11).Visible=0"
      Splits(0)._ColumnProps(61)=   "Column(11).Order=12"
      Splits(0)._ColumnProps(62)=   "Column(12).Width=2725"
      Splits(0)._ColumnProps(63)=   "Column(12).DividerColor=0"
      Splits(0)._ColumnProps(64)=   "Column(12)._WidthInPix=2646"
      Splits(0)._ColumnProps(65)=   "Column(12).Visible=0"
      Splits(0)._ColumnProps(66)=   "Column(12).Order=13"
      Splits(0)._ColumnProps(67)=   "Column(13).Width=2725"
      Splits(0)._ColumnProps(68)=   "Column(13).DividerColor=0"
      Splits(0)._ColumnProps(69)=   "Column(13)._WidthInPix=2646"
      Splits(0)._ColumnProps(70)=   "Column(13).Visible=0"
      Splits(0)._ColumnProps(71)=   "Column(13).Order=14"
      Splits(0)._ColumnProps(72)=   "Column(14).Width=2725"
      Splits(0)._ColumnProps(73)=   "Column(14).DividerColor=0"
      Splits(0)._ColumnProps(74)=   "Column(14)._WidthInPix=2646"
      Splits(0)._ColumnProps(75)=   "Column(14).Visible=0"
      Splits(0)._ColumnProps(76)=   "Column(14).Order=15"
      Splits(0)._ColumnProps(77)=   "Column(15).Width=2725"
      Splits(0)._ColumnProps(78)=   "Column(15).DividerColor=0"
      Splits(0)._ColumnProps(79)=   "Column(15)._WidthInPix=2646"
      Splits(0)._ColumnProps(80)=   "Column(15).Visible=0"
      Splits(0)._ColumnProps(81)=   "Column(15).Order=16"
      Splits(0)._ColumnProps(82)=   "Column(16).Width=2725"
      Splits(0)._ColumnProps(83)=   "Column(16).DividerColor=0"
      Splits(0)._ColumnProps(84)=   "Column(16)._WidthInPix=2646"
      Splits(0)._ColumnProps(85)=   "Column(16).Visible=0"
      Splits(0)._ColumnProps(86)=   "Column(16).Order=17"
      Splits(0)._ColumnProps(87)=   "Column(16)._MinWidth=24"
      Splits(0)._ColumnProps(88)=   "Column(17).Width=2725"
      Splits(0)._ColumnProps(89)=   "Column(17).DividerColor=0"
      Splits(0)._ColumnProps(90)=   "Column(17)._WidthInPix=2646"
      Splits(0)._ColumnProps(91)=   "Column(17).Visible=0"
      Splits(0)._ColumnProps(92)=   "Column(17).Order=18"
      Splits(0)._ColumnProps(93)=   "Column(18).Width=2725"
      Splits(0)._ColumnProps(94)=   "Column(18).DividerColor=0"
      Splits(0)._ColumnProps(95)=   "Column(18)._WidthInPix=2646"
      Splits(0)._ColumnProps(96)=   "Column(18).Visible=0"
      Splits(0)._ColumnProps(97)=   "Column(18).Order=19"
      Splits(0)._ColumnProps(98)=   "Column(19).Width=2725"
      Splits(0)._ColumnProps(99)=   "Column(19).DividerColor=0"
      Splits(0)._ColumnProps(100)=   "Column(19)._WidthInPix=2646"
      Splits(0)._ColumnProps(101)=   "Column(19).Visible=0"
      Splits(0)._ColumnProps(102)=   "Column(19).Order=20"
      Splits(0)._ColumnProps(103)=   "Column(20).Width=2725"
      Splits(0)._ColumnProps(104)=   "Column(20).DividerColor=0"
      Splits(0)._ColumnProps(105)=   "Column(20)._WidthInPix=2646"
      Splits(0)._ColumnProps(106)=   "Column(20).Visible=0"
      Splits(0)._ColumnProps(107)=   "Column(20).Order=21"
      Splits(0)._ColumnProps(108)=   "Column(21).Width=2725"
      Splits(0)._ColumnProps(109)=   "Column(21).DividerColor=0"
      Splits(0)._ColumnProps(110)=   "Column(21)._WidthInPix=2646"
      Splits(0)._ColumnProps(111)=   "Column(21).Visible=0"
      Splits(0)._ColumnProps(112)=   "Column(21).Order=22"
      Splits(1)._UserFlags=   0
      Splits(1).RecordSelectors=   0   'False
      Splits(1).RecordSelectorWidth=   503
      Splits(1).DividerColor=   13160660
      Splits(1).SpringMode=   0   'False
      Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(1)._ColumnProps(0)=   "Columns.Count=22"
      Splits(1)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
      Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
      Splits(1)._ColumnProps(6)=   "Column(0)._MinWidth=80"
      Splits(1)._ColumnProps(7)=   "Column(1).Width=2725"
      Splits(1)._ColumnProps(8)=   "Column(1).DividerColor=0"
      Splits(1)._ColumnProps(9)=   "Column(1)._WidthInPix=2646"
      Splits(1)._ColumnProps(10)=   "Column(1).Order=2"
      Splits(1)._ColumnProps(11)=   "Column(2).Width=2725"
      Splits(1)._ColumnProps(12)=   "Column(2).DividerColor=0"
      Splits(1)._ColumnProps(13)=   "Column(2)._WidthInPix=2646"
      Splits(1)._ColumnProps(14)=   "Column(2).Order=3"
      Splits(1)._ColumnProps(15)=   "Column(3).Width=2725"
      Splits(1)._ColumnProps(16)=   "Column(3).DividerColor=0"
      Splits(1)._ColumnProps(17)=   "Column(3)._WidthInPix=2646"
      Splits(1)._ColumnProps(18)=   "Column(3).Order=4"
      Splits(1)._ColumnProps(19)=   "Column(4).Width=2725"
      Splits(1)._ColumnProps(20)=   "Column(4).DividerColor=0"
      Splits(1)._ColumnProps(21)=   "Column(4)._WidthInPix=2646"
      Splits(1)._ColumnProps(22)=   "Column(4).Order=5"
      Splits(1)._ColumnProps(23)=   "Column(5).Width=2725"
      Splits(1)._ColumnProps(24)=   "Column(5).DividerColor=0"
      Splits(1)._ColumnProps(25)=   "Column(5)._WidthInPix=2646"
      Splits(1)._ColumnProps(26)=   "Column(5).Order=6"
      Splits(1)._ColumnProps(27)=   "Column(6).Width=2725"
      Splits(1)._ColumnProps(28)=   "Column(6).DividerColor=0"
      Splits(1)._ColumnProps(29)=   "Column(6)._WidthInPix=2646"
      Splits(1)._ColumnProps(30)=   "Column(6).Order=7"
      Splits(1)._ColumnProps(31)=   "Column(7).Width=2725"
      Splits(1)._ColumnProps(32)=   "Column(7).DividerColor=0"
      Splits(1)._ColumnProps(33)=   "Column(7)._WidthInPix=2646"
      Splits(1)._ColumnProps(34)=   "Column(7).Order=8"
      Splits(1)._ColumnProps(35)=   "Column(8).Width=2725"
      Splits(1)._ColumnProps(36)=   "Column(8).DividerColor=0"
      Splits(1)._ColumnProps(37)=   "Column(8)._WidthInPix=2646"
      Splits(1)._ColumnProps(38)=   "Column(8).Order=9"
      Splits(1)._ColumnProps(39)=   "Column(9).Width=2725"
      Splits(1)._ColumnProps(40)=   "Column(9).DividerColor=0"
      Splits(1)._ColumnProps(41)=   "Column(9)._WidthInPix=2646"
      Splits(1)._ColumnProps(42)=   "Column(9).Order=10"
      Splits(1)._ColumnProps(43)=   "Column(10).Width=2725"
      Splits(1)._ColumnProps(44)=   "Column(10).DividerColor=0"
      Splits(1)._ColumnProps(45)=   "Column(10)._WidthInPix=2646"
      Splits(1)._ColumnProps(46)=   "Column(10).Order=11"
      Splits(1)._ColumnProps(47)=   "Column(11).Width=2725"
      Splits(1)._ColumnProps(48)=   "Column(11).DividerColor=0"
      Splits(1)._ColumnProps(49)=   "Column(11)._WidthInPix=2646"
      Splits(1)._ColumnProps(50)=   "Column(11).Order=12"
      Splits(1)._ColumnProps(51)=   "Column(12).Width=2725"
      Splits(1)._ColumnProps(52)=   "Column(12).DividerColor=0"
      Splits(1)._ColumnProps(53)=   "Column(12)._WidthInPix=2646"
      Splits(1)._ColumnProps(54)=   "Column(12).Order=13"
      Splits(1)._ColumnProps(55)=   "Column(13).Width=2725"
      Splits(1)._ColumnProps(56)=   "Column(13).DividerColor=0"
      Splits(1)._ColumnProps(57)=   "Column(13)._WidthInPix=2646"
      Splits(1)._ColumnProps(58)=   "Column(13).Order=14"
      Splits(1)._ColumnProps(59)=   "Column(14).Width=2725"
      Splits(1)._ColumnProps(60)=   "Column(14).DividerColor=0"
      Splits(1)._ColumnProps(61)=   "Column(14)._WidthInPix=2646"
      Splits(1)._ColumnProps(62)=   "Column(14).Order=15"
      Splits(1)._ColumnProps(63)=   "Column(15).Width=2725"
      Splits(1)._ColumnProps(64)=   "Column(15).DividerColor=0"
      Splits(1)._ColumnProps(65)=   "Column(15)._WidthInPix=2646"
      Splits(1)._ColumnProps(66)=   "Column(15).Order=16"
      Splits(1)._ColumnProps(67)=   "Column(16).Width=2725"
      Splits(1)._ColumnProps(68)=   "Column(16).DividerColor=0"
      Splits(1)._ColumnProps(69)=   "Column(16)._WidthInPix=2646"
      Splits(1)._ColumnProps(70)=   "Column(16).Order=17"
      Splits(1)._ColumnProps(71)=   "Column(17).Width=2725"
      Splits(1)._ColumnProps(72)=   "Column(17).DividerColor=0"
      Splits(1)._ColumnProps(73)=   "Column(17)._WidthInPix=2646"
      Splits(1)._ColumnProps(74)=   "Column(17).Order=18"
      Splits(1)._ColumnProps(75)=   "Column(18).Width=2725"
      Splits(1)._ColumnProps(76)=   "Column(18).DividerColor=0"
      Splits(1)._ColumnProps(77)=   "Column(18)._WidthInPix=2646"
      Splits(1)._ColumnProps(78)=   "Column(18).Order=19"
      Splits(1)._ColumnProps(79)=   "Column(19).Width=2725"
      Splits(1)._ColumnProps(80)=   "Column(19).DividerColor=0"
      Splits(1)._ColumnProps(81)=   "Column(19)._WidthInPix=2646"
      Splits(1)._ColumnProps(82)=   "Column(19).Order=20"
      Splits(1)._ColumnProps(83)=   "Column(20).Width=2725"
      Splits(1)._ColumnProps(84)=   "Column(20).DividerColor=0"
      Splits(1)._ColumnProps(85)=   "Column(20)._WidthInPix=2646"
      Splits(1)._ColumnProps(86)=   "Column(20).Order=21"
      Splits(1)._ColumnProps(87)=   "Column(21).Width=2725"
      Splits(1)._ColumnProps(88)=   "Column(21).DividerColor=0"
      Splits(1)._ColumnProps(89)=   "Column(21)._WidthInPix=2646"
      Splits(1)._ColumnProps(90)=   "Column(21).Order=22"
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
      _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=224,.bold=0,.fontsize=825,.italic=0"
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
      _StyleDefs(18)  =   "Splits(0).Style:id=123,.parent=1"
      _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=132,.parent=4"
      _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=124,.parent=2"
      _StyleDefs(21)  =   "Splits(0).FooterStyle:id=125,.parent=3"
      _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=126,.parent=5"
      _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=128,.parent=6"
      _StyleDefs(24)  =   "Splits(0).EditorStyle:id=127,.parent=7"
      _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=129,.parent=8"
      _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=130,.parent=9"
      _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=131,.parent=10"
      _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=133,.parent=11"
      _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=134,.parent=12"
      _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=138,.parent=123"
      _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=135,.parent=124"
      _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=136,.parent=125"
      _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=137,.parent=127"
      _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=142,.parent=123"
      _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=139,.parent=124"
      _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=140,.parent=125"
      _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=141,.parent=127"
      _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=146,.parent=123"
      _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=143,.parent=124"
      _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=144,.parent=125"
      _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=145,.parent=127"
      _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=150,.parent=123"
      _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=147,.parent=124"
      _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=148,.parent=125"
      _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=149,.parent=127"
      _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=154,.parent=123"
      _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=151,.parent=124"
      _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=152,.parent=125"
      _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=153,.parent=127"
      _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=158,.parent=123"
      _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=155,.parent=124"
      _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=156,.parent=125"
      _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=157,.parent=127"
      _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=162,.parent=123"
      _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=159,.parent=124"
      _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=160,.parent=125"
      _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=161,.parent=127"
      _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=166,.parent=123"
      _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=163,.parent=124"
      _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=164,.parent=125"
      _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=165,.parent=127"
      _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=170,.parent=123"
      _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=167,.parent=124"
      _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=168,.parent=125"
      _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=169,.parent=127"
      _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=174,.parent=123"
      _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=171,.parent=124"
      _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=172,.parent=125"
      _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=173,.parent=127"
      _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=178,.parent=123"
      _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=175,.parent=124"
      _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=176,.parent=125"
      _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=177,.parent=127"
      _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=182,.parent=123"
      _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=179,.parent=124"
      _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=180,.parent=125"
      _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=181,.parent=127"
      _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=186,.parent=123"
      _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=183,.parent=124"
      _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=184,.parent=125"
      _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=185,.parent=127"
      _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=190,.parent=123"
      _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=187,.parent=124"
      _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=188,.parent=125"
      _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=189,.parent=127"
      _StyleDefs(86)  =   "Splits(0).Columns(14).Style:id=194,.parent=123"
      _StyleDefs(87)  =   "Splits(0).Columns(14).HeadingStyle:id=191,.parent=124"
      _StyleDefs(88)  =   "Splits(0).Columns(14).FooterStyle:id=192,.parent=125"
      _StyleDefs(89)  =   "Splits(0).Columns(14).EditorStyle:id=193,.parent=127"
      _StyleDefs(90)  =   "Splits(0).Columns(15).Style:id=198,.parent=123"
      _StyleDefs(91)  =   "Splits(0).Columns(15).HeadingStyle:id=195,.parent=124"
      _StyleDefs(92)  =   "Splits(0).Columns(15).FooterStyle:id=196,.parent=125"
      _StyleDefs(93)  =   "Splits(0).Columns(15).EditorStyle:id=197,.parent=127"
      _StyleDefs(94)  =   "Splits(0).Columns(16).Style:id=202,.parent=123"
      _StyleDefs(95)  =   "Splits(0).Columns(16).HeadingStyle:id=199,.parent=124"
      _StyleDefs(96)  =   "Splits(0).Columns(16).FooterStyle:id=200,.parent=125"
      _StyleDefs(97)  =   "Splits(0).Columns(16).EditorStyle:id=201,.parent=127"
      _StyleDefs(98)  =   "Splits(0).Columns(17).Style:id=206,.parent=123"
      _StyleDefs(99)  =   "Splits(0).Columns(17).HeadingStyle:id=203,.parent=124"
      _StyleDefs(100) =   "Splits(0).Columns(17).FooterStyle:id=204,.parent=125"
      _StyleDefs(101) =   "Splits(0).Columns(17).EditorStyle:id=205,.parent=127"
      _StyleDefs(102) =   "Splits(0).Columns(18).Style:id=210,.parent=123"
      _StyleDefs(103) =   "Splits(0).Columns(18).HeadingStyle:id=207,.parent=124"
      _StyleDefs(104) =   "Splits(0).Columns(18).FooterStyle:id=208,.parent=125"
      _StyleDefs(105) =   "Splits(0).Columns(18).EditorStyle:id=209,.parent=127"
      _StyleDefs(106) =   "Splits(0).Columns(19).Style:id=214,.parent=123"
      _StyleDefs(107) =   "Splits(0).Columns(19).HeadingStyle:id=211,.parent=124"
      _StyleDefs(108) =   "Splits(0).Columns(19).FooterStyle:id=212,.parent=125"
      _StyleDefs(109) =   "Splits(0).Columns(19).EditorStyle:id=213,.parent=127"
      _StyleDefs(110) =   "Splits(0).Columns(20).Style:id=218,.parent=123"
      _StyleDefs(111) =   "Splits(0).Columns(20).HeadingStyle:id=215,.parent=124"
      _StyleDefs(112) =   "Splits(0).Columns(20).FooterStyle:id=216,.parent=125"
      _StyleDefs(113) =   "Splits(0).Columns(20).EditorStyle:id=217,.parent=127"
      _StyleDefs(114) =   "Splits(0).Columns(21).Style:id=222,.parent=123"
      _StyleDefs(115) =   "Splits(0).Columns(21).HeadingStyle:id=219,.parent=124"
      _StyleDefs(116) =   "Splits(0).Columns(21).FooterStyle:id=220,.parent=125"
      _StyleDefs(117) =   "Splits(0).Columns(21).EditorStyle:id=221,.parent=127"
      _StyleDefs(118) =   "Splits(1).Style:id=13,.parent=1"
      _StyleDefs(119) =   "Splits(1).CaptionStyle:id=22,.parent=4"
      _StyleDefs(120) =   "Splits(1).HeadingStyle:id=14,.parent=2"
      _StyleDefs(121) =   "Splits(1).FooterStyle:id=15,.parent=3"
      _StyleDefs(122) =   "Splits(1).InactiveStyle:id=16,.parent=5"
      _StyleDefs(123) =   "Splits(1).SelectedStyle:id=18,.parent=6"
      _StyleDefs(124) =   "Splits(1).EditorStyle:id=17,.parent=7"
      _StyleDefs(125) =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
      _StyleDefs(126) =   "Splits(1).EvenRowStyle:id=20,.parent=9"
      _StyleDefs(127) =   "Splits(1).OddRowStyle:id=21,.parent=10"
      _StyleDefs(128) =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
      _StyleDefs(129) =   "Splits(1).FilterBarStyle:id=24,.parent=12"
      _StyleDefs(130) =   "Splits(1).Columns(0).Style:id=28,.parent=13"
      _StyleDefs(131) =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
      _StyleDefs(132) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
      _StyleDefs(133) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
      _StyleDefs(134) =   "Splits(1).Columns(1).Style:id=46,.parent=13"
      _StyleDefs(135) =   "Splits(1).Columns(1).HeadingStyle:id=43,.parent=14"
      _StyleDefs(136) =   "Splits(1).Columns(1).FooterStyle:id=44,.parent=15"
      _StyleDefs(137) =   "Splits(1).Columns(1).EditorStyle:id=45,.parent=17"
      _StyleDefs(138) =   "Splits(1).Columns(2).Style:id=50,.parent=13"
      _StyleDefs(139) =   "Splits(1).Columns(2).HeadingStyle:id=47,.parent=14"
      _StyleDefs(140) =   "Splits(1).Columns(2).FooterStyle:id=48,.parent=15"
      _StyleDefs(141) =   "Splits(1).Columns(2).EditorStyle:id=49,.parent=17"
      _StyleDefs(142) =   "Splits(1).Columns(3).Style:id=54,.parent=13"
      _StyleDefs(143) =   "Splits(1).Columns(3).HeadingStyle:id=51,.parent=14"
      _StyleDefs(144) =   "Splits(1).Columns(3).FooterStyle:id=52,.parent=15"
      _StyleDefs(145) =   "Splits(1).Columns(3).EditorStyle:id=53,.parent=17"
      _StyleDefs(146) =   "Splits(1).Columns(4).Style:id=58,.parent=13"
      _StyleDefs(147) =   "Splits(1).Columns(4).HeadingStyle:id=55,.parent=14"
      _StyleDefs(148) =   "Splits(1).Columns(4).FooterStyle:id=56,.parent=15"
      _StyleDefs(149) =   "Splits(1).Columns(4).EditorStyle:id=57,.parent=17"
      _StyleDefs(150) =   "Splits(1).Columns(5).Style:id=62,.parent=13"
      _StyleDefs(151) =   "Splits(1).Columns(5).HeadingStyle:id=59,.parent=14"
      _StyleDefs(152) =   "Splits(1).Columns(5).FooterStyle:id=60,.parent=15"
      _StyleDefs(153) =   "Splits(1).Columns(5).EditorStyle:id=61,.parent=17"
      _StyleDefs(154) =   "Splits(1).Columns(6).Style:id=66,.parent=13"
      _StyleDefs(155) =   "Splits(1).Columns(6).HeadingStyle:id=63,.parent=14"
      _StyleDefs(156) =   "Splits(1).Columns(6).FooterStyle:id=64,.parent=15"
      _StyleDefs(157) =   "Splits(1).Columns(6).EditorStyle:id=65,.parent=17"
      _StyleDefs(158) =   "Splits(1).Columns(7).Style:id=70,.parent=13"
      _StyleDefs(159) =   "Splits(1).Columns(7).HeadingStyle:id=67,.parent=14"
      _StyleDefs(160) =   "Splits(1).Columns(7).FooterStyle:id=68,.parent=15"
      _StyleDefs(161) =   "Splits(1).Columns(7).EditorStyle:id=69,.parent=17"
      _StyleDefs(162) =   "Splits(1).Columns(8).Style:id=74,.parent=13"
      _StyleDefs(163) =   "Splits(1).Columns(8).HeadingStyle:id=71,.parent=14"
      _StyleDefs(164) =   "Splits(1).Columns(8).FooterStyle:id=72,.parent=15"
      _StyleDefs(165) =   "Splits(1).Columns(8).EditorStyle:id=73,.parent=17"
      _StyleDefs(166) =   "Splits(1).Columns(9).Style:id=78,.parent=13"
      _StyleDefs(167) =   "Splits(1).Columns(9).HeadingStyle:id=75,.parent=14"
      _StyleDefs(168) =   "Splits(1).Columns(9).FooterStyle:id=76,.parent=15"
      _StyleDefs(169) =   "Splits(1).Columns(9).EditorStyle:id=77,.parent=17"
      _StyleDefs(170) =   "Splits(1).Columns(10).Style:id=82,.parent=13"
      _StyleDefs(171) =   "Splits(1).Columns(10).HeadingStyle:id=79,.parent=14"
      _StyleDefs(172) =   "Splits(1).Columns(10).FooterStyle:id=80,.parent=15"
      _StyleDefs(173) =   "Splits(1).Columns(10).EditorStyle:id=81,.parent=17"
      _StyleDefs(174) =   "Splits(1).Columns(11).Style:id=86,.parent=13"
      _StyleDefs(175) =   "Splits(1).Columns(11).HeadingStyle:id=83,.parent=14"
      _StyleDefs(176) =   "Splits(1).Columns(11).FooterStyle:id=84,.parent=15"
      _StyleDefs(177) =   "Splits(1).Columns(11).EditorStyle:id=85,.parent=17"
      _StyleDefs(178) =   "Splits(1).Columns(12).Style:id=90,.parent=13"
      _StyleDefs(179) =   "Splits(1).Columns(12).HeadingStyle:id=87,.parent=14"
      _StyleDefs(180) =   "Splits(1).Columns(12).FooterStyle:id=88,.parent=15"
      _StyleDefs(181) =   "Splits(1).Columns(12).EditorStyle:id=89,.parent=17"
      _StyleDefs(182) =   "Splits(1).Columns(13).Style:id=94,.parent=13"
      _StyleDefs(183) =   "Splits(1).Columns(13).HeadingStyle:id=91,.parent=14"
      _StyleDefs(184) =   "Splits(1).Columns(13).FooterStyle:id=92,.parent=15"
      _StyleDefs(185) =   "Splits(1).Columns(13).EditorStyle:id=93,.parent=17"
      _StyleDefs(186) =   "Splits(1).Columns(14).Style:id=98,.parent=13"
      _StyleDefs(187) =   "Splits(1).Columns(14).HeadingStyle:id=95,.parent=14"
      _StyleDefs(188) =   "Splits(1).Columns(14).FooterStyle:id=96,.parent=15"
      _StyleDefs(189) =   "Splits(1).Columns(14).EditorStyle:id=97,.parent=17"
      _StyleDefs(190) =   "Splits(1).Columns(15).Style:id=102,.parent=13"
      _StyleDefs(191) =   "Splits(1).Columns(15).HeadingStyle:id=99,.parent=14"
      _StyleDefs(192) =   "Splits(1).Columns(15).FooterStyle:id=100,.parent=15"
      _StyleDefs(193) =   "Splits(1).Columns(15).EditorStyle:id=101,.parent=17"
      _StyleDefs(194) =   "Splits(1).Columns(16).Style:id=106,.parent=13"
      _StyleDefs(195) =   "Splits(1).Columns(16).HeadingStyle:id=103,.parent=14"
      _StyleDefs(196) =   "Splits(1).Columns(16).FooterStyle:id=104,.parent=15"
      _StyleDefs(197) =   "Splits(1).Columns(16).EditorStyle:id=105,.parent=17"
      _StyleDefs(198) =   "Splits(1).Columns(17).Style:id=110,.parent=13"
      _StyleDefs(199) =   "Splits(1).Columns(17).HeadingStyle:id=107,.parent=14"
      _StyleDefs(200) =   "Splits(1).Columns(17).FooterStyle:id=108,.parent=15"
      _StyleDefs(201) =   "Splits(1).Columns(17).EditorStyle:id=109,.parent=17"
      _StyleDefs(202) =   "Splits(1).Columns(18).Style:id=114,.parent=13"
      _StyleDefs(203) =   "Splits(1).Columns(18).HeadingStyle:id=111,.parent=14"
      _StyleDefs(204) =   "Splits(1).Columns(18).FooterStyle:id=112,.parent=15"
      _StyleDefs(205) =   "Splits(1).Columns(18).EditorStyle:id=113,.parent=17"
      _StyleDefs(206) =   "Splits(1).Columns(19).Style:id=118,.parent=13"
      _StyleDefs(207) =   "Splits(1).Columns(19).HeadingStyle:id=115,.parent=14"
      _StyleDefs(208) =   "Splits(1).Columns(19).FooterStyle:id=116,.parent=15"
      _StyleDefs(209) =   "Splits(1).Columns(19).EditorStyle:id=117,.parent=17"
      _StyleDefs(210) =   "Splits(1).Columns(20).Style:id=122,.parent=13"
      _StyleDefs(211) =   "Splits(1).Columns(20).HeadingStyle:id=119,.parent=14"
      _StyleDefs(212) =   "Splits(1).Columns(20).FooterStyle:id=120,.parent=15"
      _StyleDefs(213) =   "Splits(1).Columns(20).EditorStyle:id=121,.parent=17"
      _StyleDefs(214) =   "Splits(1).Columns(21).Style:id=32,.parent=13"
      _StyleDefs(215) =   "Splits(1).Columns(21).HeadingStyle:id=29,.parent=14"
      _StyleDefs(216) =   "Splits(1).Columns(21).FooterStyle:id=30,.parent=15"
      _StyleDefs(217) =   "Splits(1).Columns(21).EditorStyle:id=31,.parent=17"
      _StyleDefs(218) =   "Named:id=33:Normal"
      _StyleDefs(219) =   ":id=33,.parent=0"
      _StyleDefs(220) =   "Named:id=34:Heading"
      _StyleDefs(221) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(222) =   ":id=34,.wraptext=-1"
      _StyleDefs(223) =   "Named:id=35:Footing"
      _StyleDefs(224) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(225) =   "Named:id=36:Selected"
      _StyleDefs(226) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(227) =   "Named:id=37:Caption"
      _StyleDefs(228) =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(229) =   "Named:id=38:HighlightRow"
      _StyleDefs(230) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(231) =   "Named:id=39:EvenRow"
      _StyleDefs(232) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(233) =   "Named:id=40:OddRow"
      _StyleDefs(234) =   ":id=40,.parent=33"
      _StyleDefs(235) =   "Named:id=41:RecordSelector"
      _StyleDefs(236) =   ":id=41,.parent=34"
      _StyleDefs(237) =   "Named:id=42:FilterBar"
      _StyleDefs(238) =   ":id=42,.parent=33"
   End
   Begin VB.Label lblUnits 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Sv"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   8280
      TabIndex        =   5
      Top             =   4560
      Width           =   1335
   End
End
Attribute VB_Name = "frmInhDisplay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmInhDisplay"
Dim numRows As Integer, MaxCol As Integer, UnitsStart As Integer
Dim dLastfactor As Double, sDoseType As String, sCap As String

Private Sub cmd30Export_Click()
    Const PROCEDURE_NAME As String = "cmd30Export_Click"
  
    Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, iC As Integer, Tester
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
    For j = 0 To MaxCol - 1
      iC = j + gn_ExcelStartColumn
      If InStr(gs_myTable, "Ingestion") <> 0 Or _
        InStr(Caption, "ICRP 30") <> 0 Then
        For i = 0 To numRows - 1
           gsExcel.Cells(i + 2, iC + 1).Value = xGrid(i, j)
        Next i
      Else
        For i = 0 To numRows
           gsExcel.Cells(i + 2, iC + 1).Value = xGrid(i, j)
        Next i
      End If
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
  Dim i As Integer, j As Integer
  
  If Not gb_AllDone Then
    gs_MyWhere = ""
    For j = 1 To MaxCol - 1
      For i = 0 To numRows - 1
        xGrid(i, j) = " "
      Next i
    Next j
    grdInhDisplay.Refresh
    Me.Hide
  End If
End Sub

Private Sub cmdPrint_Click()
  grdInhDisplay.PrintInfo.PageHeader = Me.Caption
  grdInhDisplay.PrintInfo.PreviewInitZoom = 100
  grdInhDisplay.PrintInfo.PrintPreview
End Sub

Private Sub cmdUnits_Click()
Dim L As Integer, i As Integer, j As Integer, k As Integer, iAct As Integer
Dim Factor As Double

    gs_Dose_Unit = fns_Dose_Units
    lblUnits = gs_Dose_Unit
    Factor = gd_DoseFactor * gd_ActFactor / dLastfactor
    For j = 1 To MaxCol - 1
      For k = 1 To gn_NucCount - 1
        If (gs_NucNames(0, k) = xGrid(0, j)) Then
          iAct = k
        End If
      Next k
      If sDoseType = "Ing" Or sCap = "ICRP 30" Then
        For i = UnitsStart To numRows - 1
 '         xGrid(i, j) = xGrid(i, j) * gd_Activity(0, iAct - 1) * Factor
         xGrid(i, j) = xGrid(i, j) * Factor
        Next i
      Else
        For i = UnitsStart To numRows
'          xGrid(i, j) = xGrid(i, j) * gd_Activity(0, iAct - 1) * Factor
          xGrid(i, j) = xGrid(i, j) * Factor
        Next i
      End If
    Next j
    dLastfactor = gd_DoseFactor * gd_ActFactor
    
    If gb_IsDoseCalc Then
      Caption = gs_myTable & " doses (" & gs_Dose_Unit & _
      ") from " & sCap
    Else
      Caption = gs_myTable & " dose coefficients (" & gs_Inh_Units & _
      ") from " & sCap
    End If
    grdInhDisplay.Refresh
    
End Sub

Private Sub Form_Load()
  Const PROCEDURE_NAME As String = "cmdForm_Load"
  Dim myQuery As String, AMAD As Single, DauPos(40) As Integer, k As Integer
  Dim done(40) As Boolean, imax As Integer, kMax As Integer
  Dim j As Integer, GrdCols As Integer, rsNuc As Recordset
  Dim i As Integer, Factor As Double
  Dim i2 As Integer, iAct As Integer, Used(40) As Boolean
  Dim C As TrueDBGrid80.Column
  
 ' On Error GoTo Error_Handler
  PositionForm Me
  
  Data1.DatabaseName = gs_DataPath & gs_myDataBase
  myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
  Data1.RecordSource = myQuery
  Data1.Refresh
  Set rsNuc = Data1.Recordset
  'MsgBox rsNuc.RecordCount
  'MsgBox myQuery
  If rsNuc.RecordCount = 0 Then
    MsgBox "No nuclides found"
    Set rsNuc = Nothing
    Exit Sub
  End If
  
  sCap = Mid(gs_myDataBase, 1, Len(gs_myDataBase) - 4)
  If sCap = "FGR12" Then
    sCap = "ICRP 30"
  End If
  i = InStr(sCap, "icrp")
  If i > 0 Then
    sCap = "ICRP " & Mid(sCap, i + 4, 2)
  End If
  If gb_IsDoseCalc Then
    Caption = gs_myTable & " doses (" & gs_Dose_Unit & _
      ") from " & sCap
    cmdUnits.Enabled = True
    cmdUnits.Visible = True
    lblUnits.Enabled = True
    lblUnits.Visible = True
    lblUnits.Caption = gs_Dose_Unit
  Else
    Caption = gs_myTable & " dose coefficients (" & gs_Inh_Units & _
      ") from " & sCap
    cmdUnits.Enabled = False
    cmdUnits.Visible = False
    lblUnits.Enabled = False
    lblUnits.Visible = False
  End If
  If InStr(gs_myTable, "Ingestion") <> 0 Then
    UnitsStart = 3
    sDoseType = "Ing"
  Else
    UnitsStart = 5
    sDoseType = "Inh"
  End If
  If sCap = "ICRP 30" Then
    UnitsStart = UnitsStart - 1
    If sDoseType = "Inh" Then
      UnitsStart = UnitsStart - 1
    End If
  End If
  If gs_myDataBase = "icrp68.mdb" Then
    AMAD = 5#
  Else
    AMAD = 1
  End If
  
  xGrid.ReDim 0, 31, 0, gn_NucCount * 6

  numRows = rsNuc.Fields.Count
  i2 = 0
  For i = 0 To numRows - 1
    xGrid(i2, 0) = rsNuc.Fields(i).Name
      If (i2 = 2 And UnitsStart = 5) Then
        i2 = i2 + 1
        xGrid(i2, MaxCol) = "AMAD"
      End If
      i2 = i2 + 1
  Next i
  If sDoseType = "Inh" Then
    For i = numRows + 1 To 31
      xGrid(i, 0) = ""
    Next i
  Else
    For i = numRows To 31
      xGrid(i, 0) = ""
    Next i
  End If
  
 ' first set daughter order
   For i = 1 To 40
     DauPos(i) = i
     Used(i) = False
   Next i
   If gb_IsDoseCalc Then
     j = 1
     rsNuc.MoveFirst
     While Not rsNuc.EOF
      For i = 0 To gn_NucCount
        If Not Used(i) Then
          If Trim(rsNuc.Fields(0).Value) = Trim(gs_NucNames(i, 0)) Then
            DauPos(j) = i + 1
            Used(i) = True
          End If
        End If
      Next i
      rsNuc.MoveNext
      j = j + 1
    Wend
' next account for missing nuclide
    For i = 1 To j - 1
      done(i) = False
    Next i
    For i = j - 1 To 1 Step -1
      imax = 0
      For k = 0 To j
      If Not done(k) And DauPos(k) > imax Then
          imax = DauPos(k)
          kMax = k
        End If
      Next k
      DauPos(kMax) = i
      done(kMax) = True
    Next i
'    For i = 2 To 40
'      If DauPos(i) = DauPos(i - 1) Then
'        For j = i To 40
'          DauPos(j) = DauPos(j) + 1
'        Next j
'      End If
'    Next i
    For i = 1 To 40
      For j = 1 To 40
        If i <> j Then
          If DauPos(i) = DauPos(j) Then
            DauPos(j) = DauPos(j) + 1
          End If
        End If
      Next j
    Next i
  End If
  
' then fill table
  rsNuc.MoveFirst
  MaxCol = 1
  While Not rsNuc.EOF
    i2 = 0
    For i = 0 To numRows - 1
      xGrid(i2, DauPos(MaxCol)) = rsNuc.Fields(i).Value 'change
      If (i2 = 2 And UnitsStart = 5) Then
        i2 = i2 + 1
        xGrid(i2, DauPos(MaxCol)) = AMAD 'change
      End If
      i2 = i2 + 1
    Next i
    rsNuc.MoveNext
    MaxCol = MaxCol + 1
  Wend
  Set rsNuc = Nothing
  
  If sDoseType = "Inh" Then
    For i = 1 To numRows
      If (xGrid(i, 0) = "E") Then
        xGrid(i, 0) = "Effective (ICRP 60)"
      ElseIf (xGrid(i, 0) = "h E") Then
        xGrid(i, 0) = "Effective (ICRP 26)"
      End If
    Next i
  Else
    For i = 1 To numRows - 1
      If (xGrid(i, 0) = "E") Then
        xGrid(i, 0) = "Effective (ICRP 60)"
      ElseIf (xGrid(i, 0) = "h E") Then
        xGrid(i, 0) = "Effective (ICRP 26)"
      End If
    Next i
  End If
  
  xGrid.ReDim 0, i2 - 1, 0, MaxCol - 1
  If MaxCol > grdInhDisplay.Columns.Count Then
    j = grdInhDisplay.Columns.Count
    For i = j To MaxCol
      Set C = grdInhDisplay.Columns.Add(i)
      C.Visible = True
    Next i
  End If
  If MaxCol <= grdInhDisplay.Columns.Count Then
    j = grdInhDisplay.Columns.Count - 1
    For i = j To MaxCol Step -1
      grdInhDisplay.Columns.Remove (i)
    Next i
  End If
  grdInhDisplay.ReBind
  
  For i = 1 To MaxCol - 1
     Set C = grdInhDisplay.Columns(i)
    C.NumberFormat = "Scientific"
    C.Width = 1000
  Next i
  If sCap = "icrp30" Then
    UnitsStart = UnitsStart - 1
  End If
  If gb_IsDoseCalc Then
    Factor = gd_ActFactor * gd_DoseFactor
    For j = 1 To MaxCol - 1
      For k = 0 To gn_NucCount
        If (Trim(gs_NucNames(0, k)) = xGrid(0, j)) Then
          iAct = k
        End If
      Next k
      If sDoseType = "Ing" Or sCap = "ICRP 30" Then
        For i = UnitsStart To numRows - 1
          If gd_Activity(0, iAct - 1) <> "" Then
            xGrid(i, j) = Val(xGrid(i, j)) * Val(gd_Activity(0, iAct - 1)) * Factor 'error
          End If
        Next i
      Else
        For i = UnitsStart To numRows
          If gd_Activity(0, iAct - 1) <> "" Then
            xGrid(i, j) = Val(xGrid(i, j)) * Val(gd_Activity(0, iAct - 1)) * Factor
          End If
        Next i
      End If
    Next j
    dLastfactor = Factor
  Else
    If gd_InhFactor <> 1 Then
      For j = 1 To MaxCol - 1
        If sDoseType = "Ing" Or sCap = "ICRP 30" Then
          For i = UnitsStart To numRows - 1
            xGrid(i, j) = xGrid(i, j) * gd_InhFactor
          Next i
        Else
          For i = UnitsStart To numRows
            xGrid(i, j) = xGrid(i, j) * gd_InhFactor
          Next i
        End If
      Next j
    End If
  End If

  grdInhDisplay.Columns(0).Width = 2000
  grdInhDisplay.Row = 0
  grdInhDisplay.Col = 0
  grdInhDisplay.Array = xGrid
  grdInhDisplay.Refresh
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
