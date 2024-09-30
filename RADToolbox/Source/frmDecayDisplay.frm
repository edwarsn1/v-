VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmRadDisplay 
   Caption         =   "Radiations Data"
   ClientHeight    =   7680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9105
   LinkTopic       =   "Form1"
   ScaleHeight     =   7680
   ScaleWidth      =   9105
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   7680
      TabIndex        =   8
      Top             =   6000
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
      Left            =   4320
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   7320
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.CommandButton cmdExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   7680
      TabIndex        =   3
      Top             =   6600
      Width           =   1335
   End
   Begin TabDlg.SSTab tabRad 
      Height          =   6975
      Left            =   360
      TabIndex        =   1
      Top             =   120
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   12303
      _Version        =   393216
      Tabs            =   4
      Tab             =   2
      TabsPerRow      =   2
      TabHeight       =   794
      TabCaption(0)   =   "Monoenergetic Electrons"
      TabPicture(0)   =   "frmDecayDisplay.frx":0000
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "grdElectron"
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "Beta Transitions (Average Energy)"
      TabPicture(1)   =   "frmDecayDisplay.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "grdBeta"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Photons"
      TabPicture(2)   =   "frmDecayDisplay.frx":0038
      Tab(2).ControlEnabled=   -1  'True
      Tab(2).Control(0)=   "grdPhoton"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).ControlCount=   1
      TabCaption(3)   =   "Alpha Particles"
      TabPicture(3)   =   "frmDecayDisplay.frx":0054
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "grdAlpha"
      Tab(3).ControlCount=   1
      Begin TrueDBGrid80.TDBGrid grdElectron 
         Height          =   5535
         Left            =   -74520
         TabIndex        =   2
         Top             =   1320
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   9763
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "ICODE"
         Columns(0).DataField=   ""
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(1)._VlistStyle=   0
         Columns(1)._MaxComboItems=   5
         Columns(1).Caption=   "Radiation"
         Columns(1).DataField=   ""
         Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(2)._VlistStyle=   0
         Columns(2)._MaxComboItems=   5
         Columns(2).Caption=   "Intensity"
         Columns(2).DataField=   ""
         Columns(2).NumberFormat=   "Scientific"
         Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(3)._VlistStyle=   0
         Columns(3)._MaxComboItems=   5
         Columns(3).Caption=   "Energy (MeV)"
         Columns(3).DataField=   ""
         Columns(3).NumberFormat=   "Scientific"
         Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   4
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=4"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1085"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1005"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(5)=   "Column(1).Width=3916"
         Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=3836"
         Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(9)=   "Column(2).Width=1958"
         Splits(0)._ColumnProps(10)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(11)=   "Column(2)._WidthInPix=1879"
         Splits(0)._ColumnProps(12)=   "Column(2).Order=3"
         Splits(0)._ColumnProps(13)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(14)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(15)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(16)=   "Column(3).Order=4"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=124,.bold=0,.fontsize=825,.italic=0"
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
         _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=50,.parent=13"
         _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=47,.parent=14"
         _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=48,.parent=15"
         _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=49,.parent=17"
         _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=46,.parent=13"
         _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14"
         _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
         _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=32,.parent=13"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=29,.parent=14"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=30,.parent=15"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=31,.parent=17"
         _StyleDefs(46)  =   "Named:id=33:Normal"
         _StyleDefs(47)  =   ":id=33,.parent=0"
         _StyleDefs(48)  =   "Named:id=34:Heading"
         _StyleDefs(49)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(50)  =   ":id=34,.wraptext=-1"
         _StyleDefs(51)  =   "Named:id=35:Footing"
         _StyleDefs(52)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(53)  =   "Named:id=36:Selected"
         _StyleDefs(54)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(55)  =   "Named:id=37:Caption"
         _StyleDefs(56)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(57)  =   "Named:id=38:HighlightRow"
         _StyleDefs(58)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(59)  =   "Named:id=39:EvenRow"
         _StyleDefs(60)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(61)  =   "Named:id=40:OddRow"
         _StyleDefs(62)  =   ":id=40,.parent=33"
         _StyleDefs(63)  =   "Named:id=41:RecordSelector"
         _StyleDefs(64)  =   ":id=41,.parent=34"
         _StyleDefs(65)  =   "Named:id=42:FilterBar"
         _StyleDefs(66)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdBeta 
         Height          =   5775
         Left            =   -74520
         TabIndex        =   4
         Top             =   1080
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   10186
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "ICODE"
         Columns(0).DataField=   ""
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(1)._VlistStyle=   0
         Columns(1)._MaxComboItems=   5
         Columns(1).Caption=   "Radiation"
         Columns(1).DataField=   ""
         Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(2)._VlistStyle=   0
         Columns(2)._MaxComboItems=   5
         Columns(2).Caption=   "Intensity"
         Columns(2).DataField=   ""
         Columns(2).NumberFormat=   "Scientific"
         Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(3)._VlistStyle=   0
         Columns(3)._MaxComboItems=   5
         Columns(3).Caption=   "Energy (MeV)"
         Columns(3).DataField=   ""
         Columns(3).NumberFormat=   "Scientific"
         Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   4
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=4"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1085"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1005"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(5)=   "Column(1).Width=3836"
         Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=3757"
         Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(9)=   "Column(2).Width=1958"
         Splits(0)._ColumnProps(10)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(11)=   "Column(2)._WidthInPix=1879"
         Splits(0)._ColumnProps(12)=   "Column(2).Order=3"
         Splits(0)._ColumnProps(13)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(14)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(15)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(16)=   "Column(3).Order=4"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=124,.bold=0,.fontsize=825,.italic=0"
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
         _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=50,.parent=13"
         _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=47,.parent=14"
         _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=48,.parent=15"
         _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=49,.parent=17"
         _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=46,.parent=13"
         _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14"
         _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
         _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=32,.parent=13"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=29,.parent=14"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=30,.parent=15"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=31,.parent=17"
         _StyleDefs(46)  =   "Named:id=33:Normal"
         _StyleDefs(47)  =   ":id=33,.parent=0"
         _StyleDefs(48)  =   "Named:id=34:Heading"
         _StyleDefs(49)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(50)  =   ":id=34,.wraptext=-1"
         _StyleDefs(51)  =   "Named:id=35:Footing"
         _StyleDefs(52)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(53)  =   "Named:id=36:Selected"
         _StyleDefs(54)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(55)  =   "Named:id=37:Caption"
         _StyleDefs(56)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(57)  =   "Named:id=38:HighlightRow"
         _StyleDefs(58)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(59)  =   "Named:id=39:EvenRow"
         _StyleDefs(60)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(61)  =   "Named:id=40:OddRow"
         _StyleDefs(62)  =   ":id=40,.parent=33"
         _StyleDefs(63)  =   "Named:id=41:RecordSelector"
         _StyleDefs(64)  =   ":id=41,.parent=34"
         _StyleDefs(65)  =   "Named:id=42:FilterBar"
         _StyleDefs(66)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdPhoton 
         Height          =   5775
         Left            =   480
         TabIndex        =   5
         Top             =   1080
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   10186
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "ICODE"
         Columns(0).DataField=   ""
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(1)._VlistStyle=   0
         Columns(1)._MaxComboItems=   5
         Columns(1).Caption=   "Radiation"
         Columns(1).DataField=   ""
         Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(2)._VlistStyle=   0
         Columns(2)._MaxComboItems=   5
         Columns(2).Caption=   "Intensity"
         Columns(2).DataField=   ""
         Columns(2).NumberFormat=   "Scientific"
         Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(3)._VlistStyle=   0
         Columns(3)._MaxComboItems=   5
         Columns(3).Caption=   "Energy (MeV)"
         Columns(3).DataField=   ""
         Columns(3).NumberFormat=   "Scientific"
         Columns(3).EditMask=   "#.####E###"
         Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   4
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=4"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1085"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1005"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(5)=   "Column(1).Width=2805"
         Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=2725"
         Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(9)=   "Column(2).Width=1958"
         Splits(0)._ColumnProps(10)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(11)=   "Column(2)._WidthInPix=1879"
         Splits(0)._ColumnProps(12)=   "Column(2).Order=3"
         Splits(0)._ColumnProps(13)=   "Column(3).Width=2725"
         Splits(0)._ColumnProps(14)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(15)=   "Column(3)._WidthInPix=2646"
         Splits(0)._ColumnProps(16)=   "Column(3).Order=4"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=124,.bold=0,.fontsize=825,.italic=0"
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
         _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=50,.parent=13"
         _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=47,.parent=14"
         _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=48,.parent=15"
         _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=49,.parent=17"
         _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=46,.parent=13"
         _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14"
         _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
         _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
         _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=32,.parent=13"
         _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=29,.parent=14"
         _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=30,.parent=15"
         _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=31,.parent=17"
         _StyleDefs(46)  =   "Named:id=33:Normal"
         _StyleDefs(47)  =   ":id=33,.parent=0"
         _StyleDefs(48)  =   "Named:id=34:Heading"
         _StyleDefs(49)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(50)  =   ":id=34,.wraptext=-1"
         _StyleDefs(51)  =   "Named:id=35:Footing"
         _StyleDefs(52)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(53)  =   "Named:id=36:Selected"
         _StyleDefs(54)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(55)  =   "Named:id=37:Caption"
         _StyleDefs(56)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(57)  =   "Named:id=38:HighlightRow"
         _StyleDefs(58)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(59)  =   "Named:id=39:EvenRow"
         _StyleDefs(60)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(61)  =   "Named:id=40:OddRow"
         _StyleDefs(62)  =   ":id=40,.parent=33"
         _StyleDefs(63)  =   "Named:id=41:RecordSelector"
         _StyleDefs(64)  =   ":id=41,.parent=34"
         _StyleDefs(65)  =   "Named:id=42:FilterBar"
         _StyleDefs(66)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdAlpha 
         Height          =   5655
         Left            =   -74520
         TabIndex        =   6
         Top             =   1200
         Width           =   5175
         _ExtentX        =   9128
         _ExtentY        =   9975
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "ICODE"
         Columns(0).DataField=   ""
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(1)._VlistStyle=   0
         Columns(1)._MaxComboItems=   5
         Columns(1).Caption=   "Intensity"
         Columns(1).DataField=   ""
         Columns(1).NumberFormat=   "Scientific"
         Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(2)._VlistStyle=   0
         Columns(2)._MaxComboItems=   5
         Columns(2).Caption=   "Energy (MeV)"
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
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1085"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1005"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(5)=   "Column(1).Width=1958"
         Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=1879"
         Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(9)=   "Column(2).Width=2725"
         Splits(0)._ColumnProps(10)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(11)=   "Column(2)._WidthInPix=2646"
         Splits(0)._ColumnProps(12)=   "Column(2).Order=3"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
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
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=124,.bold=0,.fontsize=825,.italic=0"
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
         _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=46,.parent=13"
         _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=43,.parent=14"
         _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=44,.parent=15"
         _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=45,.parent=17"
         _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=32,.parent=13"
         _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=29,.parent=14"
         _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=30,.parent=15"
         _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=31,.parent=17"
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
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   7680
      TabIndex        =   0
      Top             =   7200
      Width           =   1335
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H8000000A&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Click Intensity or Energy Header to sort."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   225
      Left            =   240
      TabIndex        =   7
      Top             =   7320
      Width           =   3450
   End
End
Attribute VB_Name = "frmRadDisplay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmRadDisplay"
Dim XElectron As New XArrayDB
Dim XPhoton As New XArrayDB
Dim XAlpha As New XArrayDB
Dim XBeta As New XArrayDB, sForExport As String
Dim nB As Integer, ne As Integer, nP As Integer, nA As Integer

Private Sub cmdExport_Click()
Const PROCEDURE_NAME As String = "cmdExport_Click"
  
    Dim icols As Long, irows As Long, WhichErr As String
    Dim i As Long, j As Long, k As Long, iC As Integer, Tester
  
    WhichErr = "Not Open"
    On Error GoTo Error_Handler
    Tester = gsExcel.Cells(1, 1)
1:  WhichErr = "Other"
    If tabRad.Tab = 0 Then ' electrons
      For j = 1 To 3
        If j = 1 Then
          k = 1
        Else
          k = j + 1
        End If
        iC = j + gn_ExcelStartColumn
        For i = 1 To ne
           gsExcel.Cells(i + 2, iC).Value = XElectron(i, k)
        Next i
      Next j
      gsExcel.Cells(1, gn_ExcelStartColumn + 1) = frmRadDisplay.Caption
      gsExcel.Cells(2, gn_ExcelStartColumn + 1) = "electron energy/intensity data"
      gsExcel.Cells(2, gn_ExcelStartColumn + 2) = gs_NucSelected
      gsExcel.Cells(2, gn_ExcelStartColumn + 3) = sForExport
      For j = 1 To 3
        iC = j + gn_ExcelStartColumn
        gsExcel.Cells(3, iC) = grdElectron.Columns(j).Caption
      Next j
      gn_ExcelStartColumn = gn_ExcelStartColumn + 3 + 1
    ElseIf tabRad.Tab = 1 Then ' betas
      For j = 1 To 3
        If j = 1 Then
          k = 1
        Else
          k = j + 1
        End If
        iC = j + gn_ExcelStartColumn
        For i = 1 To nB
           gsExcel.Cells(i + 2, iC).Value = XBeta(i, k)
        Next i
      Next j
      gsExcel.Cells(1, gn_ExcelStartColumn + 1) = frmRadDisplay.Caption
      gsExcel.Cells(2, gn_ExcelStartColumn + 1) = "beta energy/intensity data"
      gsExcel.Cells(2, gn_ExcelStartColumn + 2) = gs_NucSelected
      gsExcel.Cells(2, gn_ExcelStartColumn + 3) = sForExport
      For j = 1 To 3
        iC = j + gn_ExcelStartColumn
        gsExcel.Cells(3, iC) = grdBeta.Columns(j).Caption
      Next j
      gn_ExcelStartColumn = gn_ExcelStartColumn + 3 + 1
    ElseIf tabRad.Tab = 2 Then ' photons
      For j = 1 To 3
        If j = 1 Then
          k = 1
        Else
          k = j + 1
        End If
        iC = j + gn_ExcelStartColumn
        For i = 1 To nP
           gsExcel.Cells(i + 2, iC).Value = XPhoton(i, k)
        Next i
      Next j
      gsExcel.Cells(1, gn_ExcelStartColumn + 1) = frmRadDisplay.Caption
      gsExcel.Cells(2, gn_ExcelStartColumn + 1) = "photon energy/intensity data"
      gsExcel.Cells(2, 2 + gn_ExcelStartColumn) = gs_NucSelected
      gsExcel.Cells(2, 3 + gn_ExcelStartColumn) = sForExport
      For j = 1 To 3
        iC = j + gn_ExcelStartColumn
        gsExcel.Cells(3, iC) = grdPhoton.Columns(j).Caption
      Next j
      gn_ExcelStartColumn = gn_ExcelStartColumn + 3 + 1
    ElseIf tabRad.Tab = 3 Then ' alphas
      For j = 1 To 3
        iC = j + gn_ExcelStartColumn
        For i = 1 To nA
           gsExcel.Cells(i + 2, iC).Value = XAlpha(i, j)
        Next i
      Next j
      gsExcel.Cells(1, gn_ExcelStartColumn + 1) = frmRadDisplay.Caption
      gsExcel.Cells(2, gn_ExcelStartColumn + 1) = "alpha energy/intensity data"
      gsExcel.Cells(2, 2 + gn_ExcelStartColumn) = gs_NucSelected
      gsExcel.Cells(2, 3 + gn_ExcelStartColumn) = sForExport
      For j = 0 To 2
        iC = j + gn_ExcelStartColumn
        gsExcel.Cells(3, iC + 1) = grdAlpha.Columns(j).Caption
      Next j
      gn_ExcelStartColumn = gn_ExcelStartColumn + 3 + 1
    End If
  
    gsExcel.Visible = True
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
  XElectron.Clear
  XBeta.Clear
  XAlpha.Clear
  XPhoton.Clear
  Me.Hide
End Sub

Private Sub cmdPrint_Click()
  Select Case tabRad.Tab
    Case 0
      grdElectron.PrintInfo.PageHeader = Me.Caption & "; " & tabRad.TabCaption(0)
      grdElectron.PrintInfo.PreviewInitZoom = 100
      grdElectron.PrintInfo.PrintPreview
    Case 1
      grdBeta.PrintInfo.PageHeader = Me.Caption & "; " & tabRad.TabCaption(1)
      grdBeta.PrintInfo.PreviewInitZoom = 100
      grdBeta.PrintInfo.PrintPreview
    Case 2
      grdPhoton.PrintInfo.PageHeader = Me.Caption & "; " & tabRad.TabCaption(2)
      grdPhoton.PrintInfo.PreviewInitZoom = 100
      grdPhoton.PrintInfo.PrintPreview
    Case 3
      grdAlpha.PrintInfo.PageHeader = Me.Caption & "; " & tabRad.TabCaption(3)
      grdAlpha.PrintInfo.PreviewInitZoom = 100
      grdAlpha.PrintInfo.PrintPreview
    End Select
End Sub

Private Sub Form_Load()
  Dim FN As String, RadRec As String * 31, ThisRec As Long
  Dim RadFirst As Long, RadCount As Integer, ICODE As Integer
  Dim Energy As Double, Intensity As Double, RadEnd As Long
  Dim RadDesc(8) As String, HL As String, Limits(5) As Double
  Dim Psum As Double, Esum As Double, Asum As Double, Bsum As Double
  Dim nPtot As Integer, nEtot As Integer, nAtot As Integer, nBtot As Integer
  Dim Pcutoff As Double, Ecutoff As Double, Acutoff As Double, Bcutoff As Double
  
  RadDesc(1) = "Gamma ray"
  RadDesc(2) = "X ray"
  RadDesc(3) = "Annihilation quanta"
  RadDesc(4) = "Beta + particle"
  RadDesc(5) = "Beta - particle"
  RadDesc(6) = "Internal conversion electron"
  RadDesc(7) = "Auger eletron"
  RadDesc(8) = "Alpha particle"
  
  Limits(0) = 0.2
  Limits(1) = 0.1
  Limits(2) = 0.01
  Limits(3) = 0.001
  Limits(4) = 0#
  
  PositionForm Me
  
  If gs_DecayDataSource = "ICRP-07" Then
    Data1.DatabaseName = gs_DataPath & "icrp07-index.mdb"
    Data1.RecordSource = "Select * from [ICRP-07] where [Nuclide] = '" & gs_NucSelected & "'"
  Else
    Data1.DatabaseName = gs_DataPath & "jaeri_03.mdb"
    Data1.RecordSource = "Select * from [jaeri_03 Index] where [Nuclide] = '" & gs_NucSelected & "'"
  End If
  Data1.Refresh
  Set rsNuc = Data1.Recordset
  If rsNuc.RecordCount = 0 Then
    MsgBox "Nuclide not available." & vbCrLf & "Please select another."
    Exit Sub
  End If
  rsNuc.MoveFirst
  HL = Str(rsNuc![Half Life])
  Me.Caption = gs_DecayDataSource & " Radiations of " & _
    Trim(gs_NucSelected) & ";  HL = " & HL & " " & _
    Trim(rsNuc![Half Life Units]) & ",  Mode = " & rsNuc![Decay Mode] & _
    "; >" & Str(100 * Limits(gn_Cutoff)) _
    & "% of Sum(I*E)"
  sForExport = HL & Trim(rsNuc![Half Life Units]) & ", " & rsNuc![Decay Mode]
  
'electrons
  If rsNuc![Electron Num].Value = 0 Then
    tabRad.TabEnabled(0) = False
  Else
    tabRad.TabEnabled(0) = True
    XElectron.ReDim 1, rsNuc![Electron Num].Value, 1, 4
  End If
'Betas
  If rsNuc![Beta Particle Num].Value = 0 Then
    tabRad.TabEnabled(1) = False
  Else
    tabRad.TabEnabled(1) = True
    XBeta.ReDim 1, rsNuc![Beta Particle Num].Value, 1, 4
  End If
'photons
  If rsNuc![Photons lt 10 keV].Value = 0 And rsNuc![Photons ge 10 keV].Value = 0 Then
    tabRad.TabEnabled(2) = False
  Else
    tabRad.TabEnabled(2) = True
    nP = rsNuc![Photons lt 10 keV].Value + rsNuc![Photons ge 10 keV].Value
    XPhoton.ReDim 1, nP, 1, 4
    nP = 0
  End If
'alphas
  If rsNuc![Alpha Particle Num].Value = 0 Then
    tabRad.TabEnabled(3) = False
  Else
    tabRad.TabEnabled(3) = True
    XAlpha.ReDim 1, rsNuc![Alpha Particle Num].Value, 1, 4
  End If
  
  If tabRad.TabEnabled(2) Then
    tabRad.Tab = 2
  ElseIf tabRad.TabEnabled(1) Then
    tabRad.Tab = 1
  ElseIf tabRad.TabEnabled(0) Then
    tabRad.Tab = 0
  Else
    tabRad.Tab = 3
  End If
  
  nP = 0
  ne = 0
  nA = 0
  nB = 0
  nPtot = 0
  nEtot = 0
  nAtot = 0
  nBtot = 0
  Psum = 0
  Esum = 0
  Asum = 0
  Bsum = 0
  
  RadFirst = rsNuc![Rad Loc]
'  RadCount = rsNuc.Fields(9).Value
'  RadEnd = RadFirst + RadCount - 1
  If gs_DecayDataSource = "ICRP-07" Then
    FN = gs_DataPath & "icrp-07.rad"
    Open FN For Random As #20 Len = 31
    Get #20, RadFirst, RadRec
    RadCount = Val(Mid(RadRec, 21))
    RadEnd = RadFirst + RadCount - 1
  Else
    FN = gs_DataPath & "jaeri_03.rad"
    Open FN For Random As #20 Len = 27
  End If
  If (gn_Cutoff <> 4) Then
    For ThisRec = RadFirst To RadEnd
      Get #20, ThisRec, RadRec
      ICODE = Val(Mid$(RadRec, 1, 2))
      Intensity = Val(Mid$(RadRec, 3, 12))
      Energy = Val(Mid$(RadRec, 15, 12))
      If ICODE = 1 Or ICODE = 2 Or ICODE = 3 Then
        Psum = Psum + (Energy * Intensity)
      ElseIf ICODE = 4 Or ICODE = 5 Then
        Bsum = Bsum + (Energy * Intensity)
      ElseIf ICODE = 6 Or ICODE = 7 Then
        Esum = Esum + (Energy * Intensity)
      ElseIf ICODE = 8 Then
        Asum = Asum + (Energy * Intensity)
      End If
    Next ThisRec
    Psum = Psum * Limits(gn_Cutoff)
    Bsum = Bsum * Limits(gn_Cutoff)
    Esum = Esum * Limits(gn_Cutoff)
    Asum = Asum * Limits(gn_Cutoff)
    
  End If
  For ThisRec = RadFirst + 1 To RadEnd + 1
    Get #20, ThisRec, RadRec
    ICODE = Val(Mid$(RadRec, 1, 2))
    Intensity = Val(Mid$(RadRec, 3, 12))
    Energy = Val(Mid$(RadRec, 15, 12))
    If ICODE = 1 Or ICODE = 2 Or ICODE = 3 Then
      nPtot = nPtot + 1
      If (Energy * Intensity > Psum) Then
        nP = nP + 1
        XPhoton(nP, 1) = ICODE
        XPhoton(nP, 2) = RadDesc(ICODE)
        XPhoton(nP, 3) = Intensity
        XPhoton(nP, 4) = Energy
      End If
    ElseIf ICODE = 4 Or ICODE = 5 Then
      nBtot = nBtot + 1
      If (Energy * Intensity > Bsum) Then
        nB = nB + 1
        XBeta(nB, 1) = ICODE
        XBeta(nB, 2) = RadDesc(ICODE)
        XBeta(nB, 3) = Intensity
        XBeta(nB, 4) = Energy
      End If
    ElseIf ICODE = 6 Or ICODE = 7 Then
      nEtot = nEtot + 1
      If (Energy * Intensity > Esum) Then
        ne = ne + 1
        XElectron(ne, 1) = ICODE
        XElectron(ne, 2) = RadDesc(ICODE)
        XElectron(ne, 3) = Intensity
        XElectron(ne, 4) = Energy
      End If
    ElseIf ICODE = 8 Then
      nAtot = nAtot + 1
      If (Energy * Intensity > Asum) Then
        nA = nA + 1
        XAlpha(nA, 1) = ICODE
'        XAlpha(nA, 2) = RadDesc(ICODE)
        XAlpha(nA, 2) = Intensity
        XAlpha(nA, 3) = Energy
      End If
    End If
  Next ThisRec
  Close #20
  If (nP = 0) Then
    tabRad.TabCaption(2) = "No photons"
  Else
    tabRad.TabCaption(2) = Str(nP) & " of " & Str(nPtot) & " Photons"
  End If
  If (nA = 0) Then
    tabRad.TabCaption(3) = "No Alpha Particles"
  Else
    tabRad.TabCaption(3) = Str(nA) & " of " & Str(nAtot) & " Alpha Particles"
  End If
  If (ne = 0) Then
    tabRad.TabCaption(0) = "No Monoenergetic Electrons"
  Else
    tabRad.TabCaption(0) = Str(ne) & " of " & Str(nEtot) & " Monoenergetic Electrons"
  End If
  If (nB = 0) Then
    tabRad.TabCaption(1) = "No Beta Transitions"
  Else
    tabRad.TabCaption(1) = Str(nB) & " of " & Str(nBtot) & " Beta Transitions (Average Energy)"
  End If
  
 
  grdElectron.Array = XElectron
  grdElectron.Refresh
  grdBeta.Array = XBeta
  grdBeta.Refresh
  grdAlpha.Array = XAlpha
  grdAlpha.Refresh
  grdPhoton.Array = XPhoton
  grdPhoton.Refresh


End Sub

Private Sub Form_Unload(Cancel As Integer)
  cmdOK_Click
End Sub

Private Sub grdAlpha_HeadClick(ByVal ColIndex As Integer)
  If ColIndex = 1 Then
    XAlpha.QuickSort 1, nA, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  ElseIf ColIndex = 2 Then
    XAlpha.QuickSort 1, nA, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  End If
  grdAlpha.Array = XAlpha
  grdAlpha.Refresh
End Sub

Private Sub grdBeta_HeadClick(ByVal ColIndex As Integer)
  If ColIndex = 2 Then
    XBeta.QuickSort 1, nB, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  ElseIf ColIndex = 3 Then
    XBeta.QuickSort 1, nB, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  End If
  grdBeta.Array = XBeta
  grdBeta.Refresh
End Sub

Private Sub grdElectron_HeadClick(ByVal ColIndex As Integer)
  If ColIndex = 2 Then
    XElectron.QuickSort 1, ne, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  ElseIf ColIndex = 3 Then
    XElectron.QuickSort 1, ne, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  End If
  grdElectron.Array = XElectron
  grdElectron.Refresh
End Sub

Private Sub grdPhoton_HeadClick(ByVal ColIndex As Integer)
  If ColIndex = 2 Then
    XPhoton.QuickSort 1, nP, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  ElseIf ColIndex = 3 Then
    XPhoton.QuickSort 1, nP, ColIndex + 1, XORDER_ASCEND, XTYPE_DOUBLE
  End If
  grdPhoton.Array = XPhoton
  grdPhoton.Refresh
End Sub
