VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmInhDisplayDau 
   Caption         =   "Air Submersion dose"
   ClientHeight    =   7995
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   7995
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin TabDlg.SSTab extTab 
      Height          =   7815
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   13785
      _Version        =   393216
      TabOrientation  =   1
      Tabs            =   20
      Tab             =   16
      TabHeight       =   520
      TabCaption(0)   =   "Tab 0"
      TabPicture(0)   =   "frmDisplayDau.frx":0000
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "grdInhDisplayDau(0)"
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "Tab 1"
      TabPicture(1)   =   "frmDisplayDau.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "grdInhDisplayDau(1)"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Tab 2"
      TabPicture(2)   =   "frmDisplayDau.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "grdInhDisplayDau(2)"
      Tab(2).ControlCount=   1
      TabCaption(3)   =   "Tab 3"
      TabPicture(3)   =   "frmDisplayDau.frx":0054
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "grdInhDisplayDau(3)"
      Tab(3).ControlCount=   1
      TabCaption(4)   =   "Tab 4"
      TabPicture(4)   =   "frmDisplayDau.frx":0070
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "grdInhDisplayDau(4)"
      Tab(4).ControlCount=   1
      TabCaption(5)   =   "Tab 5"
      TabPicture(5)   =   "frmDisplayDau.frx":008C
      Tab(5).ControlEnabled=   0   'False
      Tab(5).Control(0)=   "grdInhDisplayDau(5)"
      Tab(5).ControlCount=   1
      TabCaption(6)   =   "Tab 6"
      TabPicture(6)   =   "frmDisplayDau.frx":00A8
      Tab(6).ControlEnabled=   0   'False
      Tab(6).Control(0)=   "grdInhDisplayDau(6)"
      Tab(6).ControlCount=   1
      TabCaption(7)   =   "Tab 7"
      TabPicture(7)   =   "frmDisplayDau.frx":00C4
      Tab(7).ControlEnabled=   0   'False
      Tab(7).Control(0)=   "grdInhDisplayDau(7)"
      Tab(7).ControlCount=   1
      TabCaption(8)   =   "Tab 8"
      TabPicture(8)   =   "frmDisplayDau.frx":00E0
      Tab(8).ControlEnabled=   0   'False
      Tab(8).Control(0)=   "grdInhDisplayDau(8)"
      Tab(8).ControlCount=   1
      TabCaption(9)   =   "Tab 9"
      TabPicture(9)   =   "frmDisplayDau.frx":00FC
      Tab(9).ControlEnabled=   0   'False
      Tab(9).Control(0)=   "grdInhDisplayDau(9)"
      Tab(9).ControlCount=   1
      TabCaption(10)  =   "Tab 10"
      TabPicture(10)  =   "frmDisplayDau.frx":0118
      Tab(10).ControlEnabled=   0   'False
      Tab(10).Control(0)=   "grdInhDisplayDau(10)"
      Tab(10).ControlCount=   1
      TabCaption(11)  =   "Tab 11"
      TabPicture(11)  =   "frmDisplayDau.frx":0134
      Tab(11).ControlEnabled=   0   'False
      Tab(11).Control(0)=   "grdInhDisplayDau(11)"
      Tab(11).ControlCount=   1
      TabCaption(12)  =   "Tab 12"
      TabPicture(12)  =   "frmDisplayDau.frx":0150
      Tab(12).ControlEnabled=   0   'False
      Tab(12).Control(0)=   "grdInhDisplayDau(12)"
      Tab(12).ControlCount=   1
      TabCaption(13)  =   "Tab 13"
      TabPicture(13)  =   "frmDisplayDau.frx":016C
      Tab(13).ControlEnabled=   0   'False
      Tab(13).Control(0)=   "grdInhDisplayDau(13)"
      Tab(13).ControlCount=   1
      TabCaption(14)  =   "Tab 14"
      TabPicture(14)  =   "frmDisplayDau.frx":0188
      Tab(14).ControlEnabled=   0   'False
      Tab(14).Control(0)=   "grdInhDisplayDau(14)"
      Tab(14).ControlCount=   1
      TabCaption(15)  =   "Tab 15"
      TabPicture(15)  =   "frmDisplayDau.frx":01A4
      Tab(15).ControlEnabled=   0   'False
      Tab(15).Control(0)=   "grdInhDisplayDau(15)"
      Tab(15).ControlCount=   1
      TabCaption(16)  =   "Tab 16"
      TabPicture(16)  =   "frmDisplayDau.frx":01C0
      Tab(16).ControlEnabled=   -1  'True
      Tab(16).Control(0)=   "grdInhDisplayDau(16)"
      Tab(16).Control(0).Enabled=   0   'False
      Tab(16).ControlCount=   1
      TabCaption(17)  =   "Tab 17"
      TabPicture(17)  =   "frmDisplayDau.frx":01DC
      Tab(17).ControlEnabled=   0   'False
      Tab(17).Control(0)=   "grdInhDisplayDau(17)"
      Tab(17).ControlCount=   1
      TabCaption(18)  =   "Tab 18"
      TabPicture(18)  =   "frmDisplayDau.frx":01F8
      Tab(18).ControlEnabled=   0   'False
      Tab(18).Control(0)=   "grdInhDisplayDau(18)"
      Tab(18).ControlCount=   1
      TabCaption(19)  =   "Tab 19"
      TabPicture(19)  =   "frmDisplayDau.frx":0214
      Tab(19).ControlEnabled=   0   'False
      Tab(19).Control(0)=   "grdInhDisplayDau(19)"
      Tab(19).ControlCount=   1
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5175
         Index           =   0
         Left            =   -74760
         TabIndex        =   5
         Top             =   105
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   9128
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   4935
         Index           =   1
         Left            =   -74880
         TabIndex        =   6
         Top             =   240
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8705
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   2
         Left            =   -74880
         TabIndex        =   7
         Top             =   120
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   4935
         Index           =   3
         Left            =   -75000
         TabIndex        =   8
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8705
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   4
         Left            =   -74760
         TabIndex        =   9
         Top             =   120
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   5
         Left            =   -75000
         TabIndex        =   10
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   6
         Left            =   -75000
         TabIndex        =   11
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   7
         Left            =   -75000
         TabIndex        =   12
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   8
         Left            =   -75000
         TabIndex        =   13
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   9
         Left            =   -75000
         TabIndex        =   14
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   10
         Left            =   -75000
         TabIndex        =   15
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   11
         Left            =   -75000
         TabIndex        =   16
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   12
         Left            =   -75000
         TabIndex        =   17
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   13
         Left            =   -75000
         TabIndex        =   18
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   14
         Left            =   -75000
         TabIndex        =   19
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   15
         Left            =   -75000
         TabIndex        =   20
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   6495
         Index           =   16
         Left            =   0
         TabIndex        =   21
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   11456
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   17
         Left            =   -75000
         TabIndex        =   22
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   18
         Left            =   -75000
         TabIndex        =   23
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdInhDisplayDau 
         Height          =   5055
         Index           =   19
         Left            =   -75000
         TabIndex        =   24
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
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
         Columns.Count   =   14
         Splits(0)._UserFlags=   0
         Splits(0).SizeMode=   2
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=14"
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
         Splits(0)._ColumnProps(17)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(18)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(20)=   "Column(3).Visible=0"
         Splits(0)._ColumnProps(21)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(22)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(23)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(25)=   "Column(4).Visible=0"
         Splits(0)._ColumnProps(26)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(27)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(28)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(30)=   "Column(5).Visible=0"
         Splits(0)._ColumnProps(31)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(32)=   "Column(5)._MinWidth=14"
         Splits(0)._ColumnProps(33)=   "Column(6).Width=2725"
         Splits(0)._ColumnProps(34)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(6)._WidthInPix=2646"
         Splits(0)._ColumnProps(36)=   "Column(6).Visible=0"
         Splits(0)._ColumnProps(37)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(38)=   "Column(7).Width=2725"
         Splits(0)._ColumnProps(39)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(40)=   "Column(7)._WidthInPix=2646"
         Splits(0)._ColumnProps(41)=   "Column(7).Visible=0"
         Splits(0)._ColumnProps(42)=   "Column(7).Order=8"
         Splits(0)._ColumnProps(43)=   "Column(8).Width=2725"
         Splits(0)._ColumnProps(44)=   "Column(8).DividerColor=0"
         Splits(0)._ColumnProps(45)=   "Column(8)._WidthInPix=2646"
         Splits(0)._ColumnProps(46)=   "Column(8).Visible=0"
         Splits(0)._ColumnProps(47)=   "Column(8).Order=9"
         Splits(0)._ColumnProps(48)=   "Column(8)._MinWidth=1"
         Splits(0)._ColumnProps(49)=   "Column(9).Width=2725"
         Splits(0)._ColumnProps(50)=   "Column(9).DividerColor=0"
         Splits(0)._ColumnProps(51)=   "Column(9)._WidthInPix=2646"
         Splits(0)._ColumnProps(52)=   "Column(9).Visible=0"
         Splits(0)._ColumnProps(53)=   "Column(9).Order=10"
         Splits(0)._ColumnProps(54)=   "Column(9)._MinWidth=56671184"
         Splits(0)._ColumnProps(55)=   "Column(10).Width=2725"
         Splits(0)._ColumnProps(56)=   "Column(10).DividerColor=0"
         Splits(0)._ColumnProps(57)=   "Column(10)._WidthInPix=2646"
         Splits(0)._ColumnProps(58)=   "Column(10).Visible=0"
         Splits(0)._ColumnProps(59)=   "Column(10).Order=11"
         Splits(0)._ColumnProps(60)=   "Column(10)._MinWidth=58329884"
         Splits(0)._ColumnProps(61)=   "Column(11).Width=2725"
         Splits(0)._ColumnProps(62)=   "Column(11).DividerColor=0"
         Splits(0)._ColumnProps(63)=   "Column(11)._WidthInPix=2646"
         Splits(0)._ColumnProps(64)=   "Column(11).Visible=0"
         Splits(0)._ColumnProps(65)=   "Column(11).Order=12"
         Splits(0)._ColumnProps(66)=   "Column(12).Width=2725"
         Splits(0)._ColumnProps(67)=   "Column(12).DividerColor=0"
         Splits(0)._ColumnProps(68)=   "Column(12)._WidthInPix=2646"
         Splits(0)._ColumnProps(69)=   "Column(12).Visible=0"
         Splits(0)._ColumnProps(70)=   "Column(12).Order=13"
         Splits(0)._ColumnProps(71)=   "Column(12)._MinWidth=10"
         Splits(0)._ColumnProps(72)=   "Column(13).Width=2725"
         Splits(0)._ColumnProps(73)=   "Column(13).DividerColor=0"
         Splits(0)._ColumnProps(74)=   "Column(13)._WidthInPix=2646"
         Splits(0)._ColumnProps(75)=   "Column(13).Visible=0"
         Splits(0)._ColumnProps(76)=   "Column(13).Order=14"
         Splits(1)._UserFlags=   0
         Splits(1).RecordSelectors=   0   'False
         Splits(1).RecordSelectorWidth=   503
         Splits(1).DividerColor=   13160660
         Splits(1).SpringMode=   0   'False
         Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(1)._ColumnProps(0)=   "Columns.Count=14"
         Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
         Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
         Splits(1)._ColumnProps(4)=   "Column(0).Visible=0"
         Splits(1)._ColumnProps(5)=   "Column(0).Order=1"
         Splits(1)._ColumnProps(6)=   "Column(1).Width=2725"
         Splits(1)._ColumnProps(7)=   "Column(1).DividerColor=0"
         Splits(1)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
         Splits(1)._ColumnProps(9)=   "Column(1).Order=2"
         Splits(1)._ColumnProps(10)=   "Column(1)._MinWidth=248661372"
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
         Splits(1)._ColumnProps(23)=   "Column(4)._MinWidth=248526720"
         Splits(1)._ColumnProps(24)=   "Column(5).Width=2725"
         Splits(1)._ColumnProps(25)=   "Column(5).DividerColor=0"
         Splits(1)._ColumnProps(26)=   "Column(5)._WidthInPix=2646"
         Splits(1)._ColumnProps(27)=   "Column(5).Order=6"
         Splits(1)._ColumnProps(28)=   "Column(5)._MinWidth=248541984"
         Splits(1)._ColumnProps(29)=   "Column(6).Width=2725"
         Splits(1)._ColumnProps(30)=   "Column(6).DividerColor=0"
         Splits(1)._ColumnProps(31)=   "Column(6)._WidthInPix=2646"
         Splits(1)._ColumnProps(32)=   "Column(6).Order=7"
         Splits(1)._ColumnProps(33)=   "Column(6)._MinWidth=92"
         Splits(1)._ColumnProps(34)=   "Column(7).Width=2725"
         Splits(1)._ColumnProps(35)=   "Column(7).DividerColor=0"
         Splits(1)._ColumnProps(36)=   "Column(7)._WidthInPix=2646"
         Splits(1)._ColumnProps(37)=   "Column(7).Order=8"
         Splits(1)._ColumnProps(38)=   "Column(7)._MinWidth=168"
         Splits(1)._ColumnProps(39)=   "Column(8).Width=2725"
         Splits(1)._ColumnProps(40)=   "Column(8).DividerColor=0"
         Splits(1)._ColumnProps(41)=   "Column(8)._WidthInPix=2646"
         Splits(1)._ColumnProps(42)=   "Column(8).Order=9"
         Splits(1)._ColumnProps(43)=   "Column(9).Width=2725"
         Splits(1)._ColumnProps(44)=   "Column(9).DividerColor=0"
         Splits(1)._ColumnProps(45)=   "Column(9)._WidthInPix=2646"
         Splits(1)._ColumnProps(46)=   "Column(9).Order=10"
         Splits(1)._ColumnProps(47)=   "Column(10).Width=2725"
         Splits(1)._ColumnProps(48)=   "Column(10).DividerColor=0"
         Splits(1)._ColumnProps(49)=   "Column(10)._WidthInPix=2646"
         Splits(1)._ColumnProps(50)=   "Column(10).Order=11"
         Splits(1)._ColumnProps(51)=   "Column(10)._MinWidth=9"
         Splits(1)._ColumnProps(52)=   "Column(11).Width=2725"
         Splits(1)._ColumnProps(53)=   "Column(11).DividerColor=0"
         Splits(1)._ColumnProps(54)=   "Column(11)._WidthInPix=2646"
         Splits(1)._ColumnProps(55)=   "Column(11).Order=12"
         Splits(1)._ColumnProps(56)=   "Column(11)._MinWidth=10"
         Splits(1)._ColumnProps(57)=   "Column(12).Width=2725"
         Splits(1)._ColumnProps(58)=   "Column(12).DividerColor=0"
         Splits(1)._ColumnProps(59)=   "Column(12)._WidthInPix=2646"
         Splits(1)._ColumnProps(60)=   "Column(12).Order=13"
         Splits(1)._ColumnProps(61)=   "Column(12)._MinWidth=11"
         Splits(1)._ColumnProps(62)=   "Column(13).Width=2725"
         Splits(1)._ColumnProps(63)=   "Column(13).DividerColor=0"
         Splits(1)._ColumnProps(64)=   "Column(13)._WidthInPix=2646"
         Splits(1)._ColumnProps(65)=   "Column(13).Order=14"
         Splits(1)._ColumnProps(66)=   "Column(13)._MinWidth=1573376"
         Splits.Count    =   2
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=66,.parent=29"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=30"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=31"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=43"
         _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=70,.parent=29"
         _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=67,.parent=30"
         _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=68,.parent=31"
         _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=69,.parent=43"
         _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=74,.parent=29"
         _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=71,.parent=30"
         _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=72,.parent=31"
         _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=73,.parent=43"
         _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=78,.parent=29"
         _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=75,.parent=30"
         _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=76,.parent=31"
         _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=77,.parent=43"
         _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=82,.parent=29"
         _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=79,.parent=30"
         _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=80,.parent=31"
         _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=81,.parent=43"
         _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=86,.parent=29"
         _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=83,.parent=30"
         _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=84,.parent=31"
         _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=85,.parent=43"
         _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=90,.parent=29"
         _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=87,.parent=30"
         _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=88,.parent=31"
         _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=89,.parent=43"
         _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=94,.parent=29"
         _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=91,.parent=30"
         _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=92,.parent=31"
         _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=93,.parent=43"
         _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=98,.parent=29"
         _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=95,.parent=30"
         _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=96,.parent=31"
         _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=97,.parent=43"
         _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=102,.parent=29"
         _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=99,.parent=30"
         _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=100,.parent=31"
         _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=101,.parent=43"
         _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=106,.parent=29"
         _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=103,.parent=30"
         _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=104,.parent=31"
         _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=105,.parent=43"
         _StyleDefs(86)  =   "Splits(1).Style:id=13,.parent=1"
         _StyleDefs(87)  =   "Splits(1).CaptionStyle:id=22,.parent=4"
         _StyleDefs(88)  =   "Splits(1).HeadingStyle:id=14,.parent=2"
         _StyleDefs(89)  =   "Splits(1).FooterStyle:id=15,.parent=3"
         _StyleDefs(90)  =   "Splits(1).InactiveStyle:id=16,.parent=5"
         _StyleDefs(91)  =   "Splits(1).SelectedStyle:id=18,.parent=6"
         _StyleDefs(92)  =   "Splits(1).EditorStyle:id=17,.parent=7"
         _StyleDefs(93)  =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(94)  =   "Splits(1).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(95)  =   "Splits(1).OddRowStyle:id=21,.parent=10"
         _StyleDefs(96)  =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(97)  =   "Splits(1).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(98)  =   "Splits(1).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(99)  =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(100) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(101) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(102) =   "Splits(1).Columns(1).Style:id=142,.parent=13"
         _StyleDefs(103) =   "Splits(1).Columns(1).HeadingStyle:id=139,.parent=14"
         _StyleDefs(104) =   "Splits(1).Columns(1).FooterStyle:id=140,.parent=15"
         _StyleDefs(105) =   "Splits(1).Columns(1).EditorStyle:id=141,.parent=17"
         _StyleDefs(106) =   "Splits(1).Columns(2).Style:id=146,.parent=13"
         _StyleDefs(107) =   "Splits(1).Columns(2).HeadingStyle:id=143,.parent=14"
         _StyleDefs(108) =   "Splits(1).Columns(2).FooterStyle:id=144,.parent=15"
         _StyleDefs(109) =   "Splits(1).Columns(2).EditorStyle:id=145,.parent=17"
         _StyleDefs(110) =   "Splits(1).Columns(3).Style:id=150,.parent=13"
         _StyleDefs(111) =   "Splits(1).Columns(3).HeadingStyle:id=147,.parent=14"
         _StyleDefs(112) =   "Splits(1).Columns(3).FooterStyle:id=148,.parent=15"
         _StyleDefs(113) =   "Splits(1).Columns(3).EditorStyle:id=149,.parent=17"
         _StyleDefs(114) =   "Splits(1).Columns(4).Style:id=154,.parent=13"
         _StyleDefs(115) =   "Splits(1).Columns(4).HeadingStyle:id=151,.parent=14"
         _StyleDefs(116) =   "Splits(1).Columns(4).FooterStyle:id=152,.parent=15"
         _StyleDefs(117) =   "Splits(1).Columns(4).EditorStyle:id=153,.parent=17"
         _StyleDefs(118) =   "Splits(1).Columns(5).Style:id=158,.parent=13"
         _StyleDefs(119) =   "Splits(1).Columns(5).HeadingStyle:id=155,.parent=14"
         _StyleDefs(120) =   "Splits(1).Columns(5).FooterStyle:id=156,.parent=15"
         _StyleDefs(121) =   "Splits(1).Columns(5).EditorStyle:id=157,.parent=17"
         _StyleDefs(122) =   "Splits(1).Columns(6).Style:id=162,.parent=13"
         _StyleDefs(123) =   "Splits(1).Columns(6).HeadingStyle:id=159,.parent=14"
         _StyleDefs(124) =   "Splits(1).Columns(6).FooterStyle:id=160,.parent=15"
         _StyleDefs(125) =   "Splits(1).Columns(6).EditorStyle:id=161,.parent=17"
         _StyleDefs(126) =   "Splits(1).Columns(7).Style:id=166,.parent=13"
         _StyleDefs(127) =   "Splits(1).Columns(7).HeadingStyle:id=163,.parent=14"
         _StyleDefs(128) =   "Splits(1).Columns(7).FooterStyle:id=164,.parent=15"
         _StyleDefs(129) =   "Splits(1).Columns(7).EditorStyle:id=165,.parent=17"
         _StyleDefs(130) =   "Splits(1).Columns(8).Style:id=170,.parent=13"
         _StyleDefs(131) =   "Splits(1).Columns(8).HeadingStyle:id=167,.parent=14"
         _StyleDefs(132) =   "Splits(1).Columns(8).FooterStyle:id=168,.parent=15"
         _StyleDefs(133) =   "Splits(1).Columns(8).EditorStyle:id=169,.parent=17"
         _StyleDefs(134) =   "Splits(1).Columns(9).Style:id=174,.parent=13"
         _StyleDefs(135) =   "Splits(1).Columns(9).HeadingStyle:id=171,.parent=14"
         _StyleDefs(136) =   "Splits(1).Columns(9).FooterStyle:id=172,.parent=15"
         _StyleDefs(137) =   "Splits(1).Columns(9).EditorStyle:id=173,.parent=17"
         _StyleDefs(138) =   "Splits(1).Columns(10).Style:id=178,.parent=13"
         _StyleDefs(139) =   "Splits(1).Columns(10).HeadingStyle:id=175,.parent=14"
         _StyleDefs(140) =   "Splits(1).Columns(10).FooterStyle:id=176,.parent=15"
         _StyleDefs(141) =   "Splits(1).Columns(10).EditorStyle:id=177,.parent=17"
         _StyleDefs(142) =   "Splits(1).Columns(11).Style:id=182,.parent=13"
         _StyleDefs(143) =   "Splits(1).Columns(11).HeadingStyle:id=179,.parent=14"
         _StyleDefs(144) =   "Splits(1).Columns(11).FooterStyle:id=180,.parent=15"
         _StyleDefs(145) =   "Splits(1).Columns(11).EditorStyle:id=181,.parent=17"
         _StyleDefs(146) =   "Splits(1).Columns(12).Style:id=186,.parent=13"
         _StyleDefs(147) =   "Splits(1).Columns(12).HeadingStyle:id=183,.parent=14"
         _StyleDefs(148) =   "Splits(1).Columns(12).FooterStyle:id=184,.parent=15"
         _StyleDefs(149) =   "Splits(1).Columns(12).EditorStyle:id=185,.parent=17"
         _StyleDefs(150) =   "Splits(1).Columns(13).Style:id=190,.parent=13"
         _StyleDefs(151) =   "Splits(1).Columns(13).HeadingStyle:id=187,.parent=14"
         _StyleDefs(152) =   "Splits(1).Columns(13).FooterStyle:id=188,.parent=15"
         _StyleDefs(153) =   "Splits(1).Columns(13).EditorStyle:id=189,.parent=17"
         _StyleDefs(154) =   "Named:id=33:Normal"
         _StyleDefs(155) =   ":id=33,.parent=0"
         _StyleDefs(156) =   "Named:id=34:Heading"
         _StyleDefs(157) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(158) =   ":id=34,.wraptext=-1"
         _StyleDefs(159) =   "Named:id=35:Footing"
         _StyleDefs(160) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(161) =   "Named:id=36:Selected"
         _StyleDefs(162) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(163) =   "Named:id=37:Caption"
         _StyleDefs(164) =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(165) =   "Named:id=38:HighlightRow"
         _StyleDefs(166) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(167) =   "Named:id=39:EvenRow"
         _StyleDefs(168) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(169) =   "Named:id=40:OddRow"
         _StyleDefs(170) =   ":id=40,.parent=33"
         _StyleDefs(171) =   "Named:id=41:RecordSelector"
         _StyleDefs(172) =   ":id=41,.parent=34"
         _StyleDefs(173) =   "Named:id=42:FilterBar"
         _StyleDefs(174) =   ":id=42,.parent=33"
      End
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   8400
      TabIndex        =   3
      Top             =   5280
      Width           =   1335
   End
   Begin MSComDlg.CommonDialog dlgCom 
      Left            =   9240
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   9120
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton cmdExtExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   8400
      TabIndex        =   1
      Top             =   6000
      Width           =   1335
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   "D:\Rad_ToolBox\Rad_Toolbox.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   8520
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Air Submersion"
      Top             =   1440
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8400
      TabIndex        =   0
      Top             =   6720
      Width           =   1335
   End
End
Attribute VB_Name = "frmInhDisplayDau"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmInhDisplayDau"
Dim numRows As Integer, MaxCol(20) As Integer
Private Type Xs
  x As New XArrayDB
End Type
Dim xGrd(20) As Xs

Private Sub cmdExtExport_Click()
    Const PROCEDURE_NAME As String = "cmdExtExport_Click"
  
    Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, iC As Integer, Tester, P As Integer
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
  
    P = extTab.Tab
    For j = 0 To MaxCol(P) - 1
      iC = j + gn_ExcelStartColumn
      For i = 0 To numRows - 1
         gsExcel.Cells(i + 2, iC + 1).Value = xGrd(P).x(i, j)
      Next i
      If InStr(gs_myTable, "Ingestion") <> 0 Or _
        InStr(Caption, "ICRP 30") <> 0 Then
        For i = 0 To numRows - 1
           gsExcel.Cells(i + 2, iC + 1).Value = xGrd(P).x(i, j)
        Next i
      Else
        For i = 0 To numRows
           gsExcel.Cells(i + 2, iC + 1).Value = xGrd(P).x(i, j)
        Next i
      End If
    
    Next j
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = Me.Caption
      gn_ExcelStartColumn = gn_ExcelStartColumn + MaxCol(P) + 1
  
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
  Dim i As Integer, j As Integer, P As Integer
  
  If Not gb_AllDone Then
    For P = 0 To gn_Parent - 1
      gs_MyWhereArray(P) = ""
      xGrd(P).x.Clear
      grdInhDisplayDau(P).Refresh
    Next P
    Me.Hide
  End If
  
End Sub

Private Sub cmdPrint_Click()
  Dim P As Integer
  P = extTab.Tab
  grdInhDisplayDau(P).PrintInfo.PageHeader = Me.Caption
  grdInhDisplayDau(P).PrintInfo.PreviewInitZoom = 100
  grdInhDisplayDau(P).PrintInfo.PrintPreview
End Sub

Private Sub Form_Load()
  Const PROCEDURE_NAME As String = "cmdForm_Load"
  Dim myQuery As String, sCap As String, AMAD As Single
  Dim j As Integer, k As Integer, GrdCols As Integer, rsNuc As Recordset
  Dim i As Integer, Factor As Double, UnitsStart As Integer
  Dim i2 As Integer, sDoseType As String, AnyFound As Boolean, DauPos(40) As Integer
  Dim C As TrueDBGrid80.Column, P As Integer, nTabsHeight As Integer
  Dim imax As Integer, kMax As Integer, done(40) As Boolean
  
  On Error GoTo Error_Handler
  PositionForm Me
  nTabsHeight = extTab.Height - extTab.TabHeight - (extTab.TabHeight * gn_Parent) / 3
  If (nTabsHeight > 6730) Then
    nTabsHeight = 6730
  End If
  For i = 0 To gn_Parent - 1
    extTab.TabEnabled(i) = True
    extTab.TabVisible(i) = True
    grdInhDisplayDau(i).Top = 100
    grdInhDisplayDau(i).Left = 240
    grdInhDisplayDau(i).Height = nTabsHeight - 200
  Next i
  For i = gn_Parent To 19
    extTab.TabEnabled(i) = False
    extTab.TabVisible(i) = False
  Next i
  sCap = Mid(gs_myDataBase, 1, Len(gs_myDataBase) - 4)
  If Mid(sCap, 1, 1) = "r" Then
    sCap = "ICRP 30"
  End If
  i = InStr(sCap, "icrp")
  If i > 0 Then
    sCap = "ICRP " & Mid(sCap, i + 4, 2)
  End If
  Caption = gs_myTable & " dose coefficients (" & gs_Inh_Units & _
    ") from " & sCap
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
  
  Data1.DatabaseName = gs_DataPath & gs_myDataBase
  AnyFound = False
  For P = 0 To gn_Parent - 1
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhereArray(P + 1)
    Data1.RecordSource = myQuery
    Data1.Refresh
  
    Set rsNuc = Data1.Recordset
    xGrd(P).x.ReDim 0, 31, 0, gn_DauCount(P + 1) * 7
    numRows = rsNuc.Fields.Count
    i2 = 0
    For i = 0 To numRows - 1
      xGrd(P).x(i2, 0) = rsNuc.Fields(i).Name
        If (i2 = 2 And UnitsStart = 5) Then
          i2 = i2 + 1
          xGrd(P).x(i2, MaxCol(P)) = "AMAD"
        End If
        i2 = i2 + 1
    Next i
    If sDoseType = "Inh" Then
      For i = numRows + 1 To 31
        xGrd(P).x(i, 0) = ""
      Next i
    Else
      For i = numRows To 31
        xGrd(P).x(i, 0) = ""
      Next i
    End If
    If rsNuc.RecordCount > 0 Then
      AnyFound = True
      j = 0
' first set daughter order
      rsNuc.MoveFirst
      While Not rsNuc.EOF
        For i = 1 To gn_DauCount(P + 1) + 1
          If Trim(rsNuc.Fields(0).Value) = Trim(gs_NucNames(i, P + 1)) Then
            DauPos(j) = i
          End If
        Next i
        rsNuc.MoveNext
        j = j + 1
      Wend
' next account for multiple occurances of the same nuclide
      For i = 0 To j - 1
        done(i) = False
      Next i
      For i = j - 1 To 0 Step -1
        imax = 0
        For k = 0 To j - 1
          If Not done(k) And DauPos(k) > imax Then
            imax = DauPos(k)
            kMax = k
          End If
        Next k
        DauPos(kMax) = i + 1
        done(kMax) = True
      Next i
' then fill table
      rsNuc.MoveFirst
      MaxCol(P) = 1
      While Not rsNuc.EOF
        i2 = 0
        For i = 0 To numRows - 1
          xGrd(P).x(i2, DauPos(MaxCol(P) - 1)) = rsNuc.Fields(i).Value
          If (i2 = 2 And UnitsStart = 5) Then
            i2 = i2 + 1
            xGrd(P).x(i2, DauPos(MaxCol(P) - 1)) = AMAD
          End If
          i2 = i2 + 1
        Next i
        rsNuc.MoveNext
        MaxCol(P) = MaxCol(P) + 1
      Wend
      Set rsNuc = Nothing
  
      If sDoseType = "Inh" Then
        For i = 1 To numRows
          If (xGrd(P).x(i, 0) = "E") Then
            xGrd(P).x(i, 0) = "Effective (ICRP 60)"
          ElseIf (xGrd(P).x(i, 0) = "h E") Then
            xGrd(P).x(i, 0) = "Effective (ICRP 26)"
          End If
        Next i
      Else
        For i = 1 To numRows - 1
          If (xGrd(P).x(i, 0) = "E") Then
            xGrd(P).x(i, 0) = "Effective (ICRP 60)"
          ElseIf (xGrd(P).x(i, 0) = "h E") Then
            xGrd(P).x(i, 0) = "Effective (ICRP 26)"
          End If
        Next i
      End If
    
      extTab.TabCaption(P) = gs_NucNames(1, P + 1)
    
      xGrd(P).x.ReDim 0, i2 - 1, 0, MaxCol(P) - 1
      If MaxCol(P) > grdInhDisplayDau(P).Columns.Count Then
        j = grdInhDisplayDau(P).Columns.Count - 1
        For i = j To MaxCol(P) + 1
          Set C = grdInhDisplayDau(P).Columns.Add(i)
          C.Visible = True
        Next i
      End If
      If MaxCol(P) <= grdInhDisplayDau(P).Columns.Count Then
        j = grdInhDisplayDau(P).Columns.Count - 1
        For i = j To MaxCol(P) Step -1
          grdInhDisplayDau(P).Columns.Remove (i)
        Next i
      End If
      grdInhDisplayDau(P).ReBind
  
      For i = 1 To MaxCol(P) - 1
         Set C = grdInhDisplayDau(P).Columns(i)
        C.NumberFormat = "Scientific"
        C.Width = 1000
      Next i
      If sCap = "icrp30" Then
        UnitsStart = UnitsStart - 1
      End If
      If gd_InhFactor <> 1 Then
        For j = 1 To MaxCol(P) - 1
          If sDoseType = "Ing" Or sCap = "ICRP 30" Then
            For i = UnitsStart To numRows - 1
              xGrd(P).x(i, j) = xGrd(P).x(i, j) * gd_InhFactor
            Next i
          Else
            For i = UnitsStart To numRows
              xGrd(P).x(i, j) = xGrd(P).x(i, j) * gd_InhFactor
            Next i
          End If
        Next j
      End If

      grdInhDisplayDau(P).Columns(0).Width = 2000
      grdInhDisplayDau(P).Row = 0
      grdInhDisplayDau(P).Col = 0
      grdInhDisplayDau(P).Array = xGrd(P).x
      grdInhDisplayDau(P).Refresh
      extTab.Tab = 0
     End If
  Next P
  If Not AnyFound Then
    MsgBox "No nuclides found"
  End If
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
