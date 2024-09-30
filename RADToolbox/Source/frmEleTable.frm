VERSION 5.00
Object = "{54850C51-14EA-4470-A5E4-8C5DB32DC853}#1.0#0"; "vsprint8.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmEleTable 
   Caption         =   "Selected data for "
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   7590
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdRef 
      Caption         =   "Reference"
      Height          =   375
      Left            =   8160
      TabIndex        =   10
      Top             =   3960
      Width           =   1335
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   8160
      TabIndex        =   9
      Top             =   3480
      Width           =   1335
   End
   Begin TrueDBGrid80.TDBGrid grdEleDisplay 
      Height          =   7335
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   12938
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
      Columns.Count   =   18
      Splits(0)._UserFlags=   1
      Splits(0).MarqueeStyle=   5
      Splits(0).SizeMode=   2
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   13160660
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=18"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=1958"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(6)=   "Column(1).Width=2725"
      Splits(0)._ColumnProps(7)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(8)=   "Column(1)._WidthInPix=2646"
      Splits(0)._ColumnProps(9)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(10)=   "Column(1).Visible=0"
      Splits(0)._ColumnProps(11)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(12)=   "Column(1)._MinWidth=1"
      Splits(0)._ColumnProps(13)=   "Column(2).Width=2725"
      Splits(0)._ColumnProps(14)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(15)=   "Column(2)._WidthInPix=2646"
      Splits(0)._ColumnProps(16)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(17)=   "Column(2).Visible=0"
      Splits(0)._ColumnProps(18)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(19)=   "Column(2)._MinWidth=58665864"
      Splits(0)._ColumnProps(20)=   "Column(3).Width=2725"
      Splits(0)._ColumnProps(21)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(22)=   "Column(3)._WidthInPix=2646"
      Splits(0)._ColumnProps(23)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(24)=   "Column(3).Visible=0"
      Splits(0)._ColumnProps(25)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(26)=   "Column(3)._MinWidth=58785804"
      Splits(0)._ColumnProps(27)=   "Column(4).Width=2725"
      Splits(0)._ColumnProps(28)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(29)=   "Column(4)._WidthInPix=2646"
      Splits(0)._ColumnProps(30)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(31)=   "Column(4).Visible=0"
      Splits(0)._ColumnProps(32)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(33)=   "Column(5).Width=2725"
      Splits(0)._ColumnProps(34)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(35)=   "Column(5)._WidthInPix=2646"
      Splits(0)._ColumnProps(36)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(37)=   "Column(5).Visible=0"
      Splits(0)._ColumnProps(38)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(39)=   "Column(5)._MinWidth=58840704"
      Splits(0)._ColumnProps(40)=   "Column(6).Width=2725"
      Splits(0)._ColumnProps(41)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(42)=   "Column(6)._WidthInPix=2646"
      Splits(0)._ColumnProps(43)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(44)=   "Column(6).Visible=0"
      Splits(0)._ColumnProps(45)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(46)=   "Column(7).Width=2725"
      Splits(0)._ColumnProps(47)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(48)=   "Column(7)._WidthInPix=2646"
      Splits(0)._ColumnProps(49)=   "Column(7)._EditAlways=0"
      Splits(0)._ColumnProps(50)=   "Column(7).Visible=0"
      Splits(0)._ColumnProps(51)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(52)=   "Column(8).Width=2725"
      Splits(0)._ColumnProps(53)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(54)=   "Column(8)._WidthInPix=2646"
      Splits(0)._ColumnProps(55)=   "Column(8)._EditAlways=0"
      Splits(0)._ColumnProps(56)=   "Column(8).Visible=0"
      Splits(0)._ColumnProps(57)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(58)=   "Column(9).Width=2725"
      Splits(0)._ColumnProps(59)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(60)=   "Column(9)._WidthInPix=2646"
      Splits(0)._ColumnProps(61)=   "Column(9)._EditAlways=0"
      Splits(0)._ColumnProps(62)=   "Column(9).Visible=0"
      Splits(0)._ColumnProps(63)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(64)=   "Column(10).Width=2725"
      Splits(0)._ColumnProps(65)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(66)=   "Column(10)._WidthInPix=2646"
      Splits(0)._ColumnProps(67)=   "Column(10)._EditAlways=0"
      Splits(0)._ColumnProps(68)=   "Column(10).Visible=0"
      Splits(0)._ColumnProps(69)=   "Column(10).Order=11"
      Splits(0)._ColumnProps(70)=   "Column(11).Width=2725"
      Splits(0)._ColumnProps(71)=   "Column(11).DividerColor=0"
      Splits(0)._ColumnProps(72)=   "Column(11)._WidthInPix=2646"
      Splits(0)._ColumnProps(73)=   "Column(11)._EditAlways=0"
      Splits(0)._ColumnProps(74)=   "Column(11).Visible=0"
      Splits(0)._ColumnProps(75)=   "Column(11).Order=12"
      Splits(0)._ColumnProps(76)=   "Column(12).Width=2725"
      Splits(0)._ColumnProps(77)=   "Column(12).DividerColor=0"
      Splits(0)._ColumnProps(78)=   "Column(12)._WidthInPix=2646"
      Splits(0)._ColumnProps(79)=   "Column(12)._EditAlways=0"
      Splits(0)._ColumnProps(80)=   "Column(12).Visible=0"
      Splits(0)._ColumnProps(81)=   "Column(12).Order=13"
      Splits(0)._ColumnProps(82)=   "Column(13).Width=2725"
      Splits(0)._ColumnProps(83)=   "Column(13).DividerColor=0"
      Splits(0)._ColumnProps(84)=   "Column(13)._WidthInPix=2646"
      Splits(0)._ColumnProps(85)=   "Column(13)._EditAlways=0"
      Splits(0)._ColumnProps(86)=   "Column(13).Visible=0"
      Splits(0)._ColumnProps(87)=   "Column(13).Order=14"
      Splits(0)._ColumnProps(88)=   "Column(14).Width=2725"
      Splits(0)._ColumnProps(89)=   "Column(14).DividerColor=0"
      Splits(0)._ColumnProps(90)=   "Column(14)._WidthInPix=2646"
      Splits(0)._ColumnProps(91)=   "Column(14)._EditAlways=0"
      Splits(0)._ColumnProps(92)=   "Column(14).Visible=0"
      Splits(0)._ColumnProps(93)=   "Column(14).Order=15"
      Splits(0)._ColumnProps(94)=   "Column(15).Width=2725"
      Splits(0)._ColumnProps(95)=   "Column(15).DividerColor=0"
      Splits(0)._ColumnProps(96)=   "Column(15)._WidthInPix=2646"
      Splits(0)._ColumnProps(97)=   "Column(15)._EditAlways=0"
      Splits(0)._ColumnProps(98)=   "Column(15).Visible=0"
      Splits(0)._ColumnProps(99)=   "Column(15).Order=16"
      Splits(0)._ColumnProps(100)=   "Column(16).Width=2725"
      Splits(0)._ColumnProps(101)=   "Column(16).DividerColor=0"
      Splits(0)._ColumnProps(102)=   "Column(16)._WidthInPix=2646"
      Splits(0)._ColumnProps(103)=   "Column(16)._EditAlways=0"
      Splits(0)._ColumnProps(104)=   "Column(16).Visible=0"
      Splits(0)._ColumnProps(105)=   "Column(16).Order=17"
      Splits(0)._ColumnProps(106)=   "Column(17).Width=2725"
      Splits(0)._ColumnProps(107)=   "Column(17).DividerColor=0"
      Splits(0)._ColumnProps(108)=   "Column(17)._WidthInPix=2646"
      Splits(0)._ColumnProps(109)=   "Column(17)._EditAlways=0"
      Splits(0)._ColumnProps(110)=   "Column(17).Visible=0"
      Splits(0)._ColumnProps(111)=   "Column(17).Order=18"
      Splits(1)._UserFlags=   1
      Splits(1).MarqueeStyle=   5
      Splits(1).RecordSelectors=   0   'False
      Splits(1).RecordSelectorWidth=   503
      Splits(1).DividerColor=   13160660
      Splits(1).SpringMode=   0   'False
      Splits(1)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(1)._ColumnProps(0)=   "Columns.Count=18"
      Splits(1)._ColumnProps(1)=   "Column(0).Width=1958"
      Splits(1)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(1)._ColumnProps(3)=   "Column(0)._WidthInPix=1879"
      Splits(1)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(1)._ColumnProps(5)=   "Column(0).Visible=0"
      Splits(1)._ColumnProps(6)=   "Column(0).Order=1"
      Splits(1)._ColumnProps(7)=   "Column(1).Width=2725"
      Splits(1)._ColumnProps(8)=   "Column(1).DividerColor=0"
      Splits(1)._ColumnProps(9)=   "Column(1)._WidthInPix=2646"
      Splits(1)._ColumnProps(10)=   "Column(1)._EditAlways=0"
      Splits(1)._ColumnProps(11)=   "Column(1).Order=2"
      Splits(1)._ColumnProps(12)=   "Column(1)._MinWidth=248661372"
      Splits(1)._ColumnProps(13)=   "Column(2).Width=2725"
      Splits(1)._ColumnProps(14)=   "Column(2).DividerColor=0"
      Splits(1)._ColumnProps(15)=   "Column(2)._WidthInPix=2646"
      Splits(1)._ColumnProps(16)=   "Column(2)._EditAlways=0"
      Splits(1)._ColumnProps(17)=   "Column(2).Order=3"
      Splits(1)._ColumnProps(18)=   "Column(2)._MinWidth=248661372"
      Splits(1)._ColumnProps(19)=   "Column(3).Width=2725"
      Splits(1)._ColumnProps(20)=   "Column(3).DividerColor=0"
      Splits(1)._ColumnProps(21)=   "Column(3)._WidthInPix=2646"
      Splits(1)._ColumnProps(22)=   "Column(3)._EditAlways=0"
      Splits(1)._ColumnProps(23)=   "Column(3).Order=4"
      Splits(1)._ColumnProps(24)=   "Column(3)._MinWidth=248661372"
      Splits(1)._ColumnProps(25)=   "Column(4).Width=2725"
      Splits(1)._ColumnProps(26)=   "Column(4).DividerColor=0"
      Splits(1)._ColumnProps(27)=   "Column(4)._WidthInPix=2646"
      Splits(1)._ColumnProps(28)=   "Column(4)._EditAlways=0"
      Splits(1)._ColumnProps(29)=   "Column(4).Order=5"
      Splits(1)._ColumnProps(30)=   "Column(4)._MinWidth=248661372"
      Splits(1)._ColumnProps(31)=   "Column(5).Width=2725"
      Splits(1)._ColumnProps(32)=   "Column(5).DividerColor=0"
      Splits(1)._ColumnProps(33)=   "Column(5)._WidthInPix=2646"
      Splits(1)._ColumnProps(34)=   "Column(5)._EditAlways=0"
      Splits(1)._ColumnProps(35)=   "Column(5).Order=6"
      Splits(1)._ColumnProps(36)=   "Column(5)._MinWidth=248661372"
      Splits(1)._ColumnProps(37)=   "Column(6).Width=2725"
      Splits(1)._ColumnProps(38)=   "Column(6).DividerColor=0"
      Splits(1)._ColumnProps(39)=   "Column(6)._WidthInPix=2646"
      Splits(1)._ColumnProps(40)=   "Column(6)._EditAlways=0"
      Splits(1)._ColumnProps(41)=   "Column(6).Order=7"
      Splits(1)._ColumnProps(42)=   "Column(7).Width=2725"
      Splits(1)._ColumnProps(43)=   "Column(7).DividerColor=0"
      Splits(1)._ColumnProps(44)=   "Column(7)._WidthInPix=2646"
      Splits(1)._ColumnProps(45)=   "Column(7)._EditAlways=0"
      Splits(1)._ColumnProps(46)=   "Column(7).Order=8"
      Splits(1)._ColumnProps(47)=   "Column(8).Width=2725"
      Splits(1)._ColumnProps(48)=   "Column(8).DividerColor=0"
      Splits(1)._ColumnProps(49)=   "Column(8)._WidthInPix=2646"
      Splits(1)._ColumnProps(50)=   "Column(8)._EditAlways=0"
      Splits(1)._ColumnProps(51)=   "Column(8).Order=9"
      Splits(1)._ColumnProps(52)=   "Column(8)._MinWidth=248526720"
      Splits(1)._ColumnProps(53)=   "Column(9).Width=2725"
      Splits(1)._ColumnProps(54)=   "Column(9).DividerColor=0"
      Splits(1)._ColumnProps(55)=   "Column(9)._WidthInPix=2646"
      Splits(1)._ColumnProps(56)=   "Column(9)._EditAlways=0"
      Splits(1)._ColumnProps(57)=   "Column(9).Order=10"
      Splits(1)._ColumnProps(58)=   "Column(9)._MinWidth=248541984"
      Splits(1)._ColumnProps(59)=   "Column(10).Width=2725"
      Splits(1)._ColumnProps(60)=   "Column(10).DividerColor=0"
      Splits(1)._ColumnProps(61)=   "Column(10)._WidthInPix=2646"
      Splits(1)._ColumnProps(62)=   "Column(10)._EditAlways=0"
      Splits(1)._ColumnProps(63)=   "Column(10).Order=11"
      Splits(1)._ColumnProps(64)=   "Column(10)._MinWidth=92"
      Splits(1)._ColumnProps(65)=   "Column(11).Width=2725"
      Splits(1)._ColumnProps(66)=   "Column(11).DividerColor=0"
      Splits(1)._ColumnProps(67)=   "Column(11)._WidthInPix=2646"
      Splits(1)._ColumnProps(68)=   "Column(11)._EditAlways=0"
      Splits(1)._ColumnProps(69)=   "Column(11).Order=12"
      Splits(1)._ColumnProps(70)=   "Column(11)._MinWidth=168"
      Splits(1)._ColumnProps(71)=   "Column(12).Width=2725"
      Splits(1)._ColumnProps(72)=   "Column(12).DividerColor=0"
      Splits(1)._ColumnProps(73)=   "Column(12)._WidthInPix=2646"
      Splits(1)._ColumnProps(74)=   "Column(12)._EditAlways=0"
      Splits(1)._ColumnProps(75)=   "Column(12).Order=13"
      Splits(1)._ColumnProps(76)=   "Column(13).Width=2725"
      Splits(1)._ColumnProps(77)=   "Column(13).DividerColor=0"
      Splits(1)._ColumnProps(78)=   "Column(13)._WidthInPix=2646"
      Splits(1)._ColumnProps(79)=   "Column(13)._EditAlways=0"
      Splits(1)._ColumnProps(80)=   "Column(13).Order=14"
      Splits(1)._ColumnProps(81)=   "Column(14).Width=2725"
      Splits(1)._ColumnProps(82)=   "Column(14).DividerColor=0"
      Splits(1)._ColumnProps(83)=   "Column(14)._WidthInPix=2646"
      Splits(1)._ColumnProps(84)=   "Column(14)._EditAlways=0"
      Splits(1)._ColumnProps(85)=   "Column(14).Order=15"
      Splits(1)._ColumnProps(86)=   "Column(14)._MinWidth=9"
      Splits(1)._ColumnProps(87)=   "Column(15).Width=2725"
      Splits(1)._ColumnProps(88)=   "Column(15).DividerColor=0"
      Splits(1)._ColumnProps(89)=   "Column(15)._WidthInPix=2646"
      Splits(1)._ColumnProps(90)=   "Column(15)._EditAlways=0"
      Splits(1)._ColumnProps(91)=   "Column(15).Order=16"
      Splits(1)._ColumnProps(92)=   "Column(15)._MinWidth=10"
      Splits(1)._ColumnProps(93)=   "Column(16).Width=2725"
      Splits(1)._ColumnProps(94)=   "Column(16).DividerColor=0"
      Splits(1)._ColumnProps(95)=   "Column(16)._WidthInPix=2646"
      Splits(1)._ColumnProps(96)=   "Column(16)._EditAlways=0"
      Splits(1)._ColumnProps(97)=   "Column(16).Order=17"
      Splits(1)._ColumnProps(98)=   "Column(16)._MinWidth=11"
      Splits(1)._ColumnProps(99)=   "Column(17).Width=2725"
      Splits(1)._ColumnProps(100)=   "Column(17).DividerColor=0"
      Splits(1)._ColumnProps(101)=   "Column(17)._WidthInPix=2646"
      Splits(1)._ColumnProps(102)=   "Column(17)._EditAlways=0"
      Splits(1)._ColumnProps(103)=   "Column(17).Order=18"
      Splits(1)._ColumnProps(104)=   "Column(17)._MinWidth=1573376"
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
      HeadLines       =   4
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
      _StyleDefs(18)  =   "Splits(0).Style:id=56,.parent=1"
      _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=65,.parent=4"
      _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=57,.parent=2"
      _StyleDefs(21)  =   "Splits(0).FooterStyle:id=58,.parent=3"
      _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=59,.parent=5"
      _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=61,.parent=6"
      _StyleDefs(24)  =   "Splits(0).EditorStyle:id=60,.parent=7"
      _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=62,.parent=8"
      _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=63,.parent=9"
      _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=64,.parent=10"
      _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=66,.parent=11"
      _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=67,.parent=12"
      _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=71,.parent=56"
      _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=68,.parent=57"
      _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=69,.parent=58"
      _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=70,.parent=60"
      _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=75,.parent=56"
      _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=72,.parent=57"
      _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=73,.parent=58"
      _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=74,.parent=60"
      _StyleDefs(38)  =   "Splits(0).Columns(2).Style:id=79,.parent=56"
      _StyleDefs(39)  =   "Splits(0).Columns(2).HeadingStyle:id=76,.parent=57"
      _StyleDefs(40)  =   "Splits(0).Columns(2).FooterStyle:id=77,.parent=58"
      _StyleDefs(41)  =   "Splits(0).Columns(2).EditorStyle:id=78,.parent=60"
      _StyleDefs(42)  =   "Splits(0).Columns(3).Style:id=83,.parent=56"
      _StyleDefs(43)  =   "Splits(0).Columns(3).HeadingStyle:id=80,.parent=57"
      _StyleDefs(44)  =   "Splits(0).Columns(3).FooterStyle:id=81,.parent=58"
      _StyleDefs(45)  =   "Splits(0).Columns(3).EditorStyle:id=82,.parent=60"
      _StyleDefs(46)  =   "Splits(0).Columns(4).Style:id=87,.parent=56"
      _StyleDefs(47)  =   "Splits(0).Columns(4).HeadingStyle:id=84,.parent=57"
      _StyleDefs(48)  =   "Splits(0).Columns(4).FooterStyle:id=85,.parent=58"
      _StyleDefs(49)  =   "Splits(0).Columns(4).EditorStyle:id=86,.parent=60"
      _StyleDefs(50)  =   "Splits(0).Columns(5).Style:id=91,.parent=56"
      _StyleDefs(51)  =   "Splits(0).Columns(5).HeadingStyle:id=88,.parent=57"
      _StyleDefs(52)  =   "Splits(0).Columns(5).FooterStyle:id=89,.parent=58"
      _StyleDefs(53)  =   "Splits(0).Columns(5).EditorStyle:id=90,.parent=60"
      _StyleDefs(54)  =   "Splits(0).Columns(6).Style:id=95,.parent=56"
      _StyleDefs(55)  =   "Splits(0).Columns(6).HeadingStyle:id=92,.parent=57"
      _StyleDefs(56)  =   "Splits(0).Columns(6).FooterStyle:id=93,.parent=58"
      _StyleDefs(57)  =   "Splits(0).Columns(6).EditorStyle:id=94,.parent=60"
      _StyleDefs(58)  =   "Splits(0).Columns(7).Style:id=99,.parent=56"
      _StyleDefs(59)  =   "Splits(0).Columns(7).HeadingStyle:id=96,.parent=57"
      _StyleDefs(60)  =   "Splits(0).Columns(7).FooterStyle:id=97,.parent=58"
      _StyleDefs(61)  =   "Splits(0).Columns(7).EditorStyle:id=98,.parent=60"
      _StyleDefs(62)  =   "Splits(0).Columns(8).Style:id=103,.parent=56"
      _StyleDefs(63)  =   "Splits(0).Columns(8).HeadingStyle:id=100,.parent=57"
      _StyleDefs(64)  =   "Splits(0).Columns(8).FooterStyle:id=101,.parent=58"
      _StyleDefs(65)  =   "Splits(0).Columns(8).EditorStyle:id=102,.parent=60"
      _StyleDefs(66)  =   "Splits(0).Columns(9).Style:id=107,.parent=56"
      _StyleDefs(67)  =   "Splits(0).Columns(9).HeadingStyle:id=104,.parent=57"
      _StyleDefs(68)  =   "Splits(0).Columns(9).FooterStyle:id=105,.parent=58"
      _StyleDefs(69)  =   "Splits(0).Columns(9).EditorStyle:id=106,.parent=60"
      _StyleDefs(70)  =   "Splits(0).Columns(10).Style:id=111,.parent=56"
      _StyleDefs(71)  =   "Splits(0).Columns(10).HeadingStyle:id=108,.parent=57"
      _StyleDefs(72)  =   "Splits(0).Columns(10).FooterStyle:id=109,.parent=58"
      _StyleDefs(73)  =   "Splits(0).Columns(10).EditorStyle:id=110,.parent=60"
      _StyleDefs(74)  =   "Splits(0).Columns(11).Style:id=115,.parent=56"
      _StyleDefs(75)  =   "Splits(0).Columns(11).HeadingStyle:id=112,.parent=57"
      _StyleDefs(76)  =   "Splits(0).Columns(11).FooterStyle:id=113,.parent=58"
      _StyleDefs(77)  =   "Splits(0).Columns(11).EditorStyle:id=114,.parent=60"
      _StyleDefs(78)  =   "Splits(0).Columns(12).Style:id=119,.parent=56"
      _StyleDefs(79)  =   "Splits(0).Columns(12).HeadingStyle:id=116,.parent=57"
      _StyleDefs(80)  =   "Splits(0).Columns(12).FooterStyle:id=117,.parent=58"
      _StyleDefs(81)  =   "Splits(0).Columns(12).EditorStyle:id=118,.parent=60"
      _StyleDefs(82)  =   "Splits(0).Columns(13).Style:id=123,.parent=56"
      _StyleDefs(83)  =   "Splits(0).Columns(13).HeadingStyle:id=120,.parent=57"
      _StyleDefs(84)  =   "Splits(0).Columns(13).FooterStyle:id=121,.parent=58"
      _StyleDefs(85)  =   "Splits(0).Columns(13).EditorStyle:id=122,.parent=60"
      _StyleDefs(86)  =   "Splits(0).Columns(14).Style:id=127,.parent=56"
      _StyleDefs(87)  =   "Splits(0).Columns(14).HeadingStyle:id=124,.parent=57"
      _StyleDefs(88)  =   "Splits(0).Columns(14).FooterStyle:id=125,.parent=58"
      _StyleDefs(89)  =   "Splits(0).Columns(14).EditorStyle:id=126,.parent=60"
      _StyleDefs(90)  =   "Splits(0).Columns(15).Style:id=131,.parent=56"
      _StyleDefs(91)  =   "Splits(0).Columns(15).HeadingStyle:id=128,.parent=57"
      _StyleDefs(92)  =   "Splits(0).Columns(15).FooterStyle:id=129,.parent=58"
      _StyleDefs(93)  =   "Splits(0).Columns(15).EditorStyle:id=130,.parent=60"
      _StyleDefs(94)  =   "Splits(0).Columns(16).Style:id=135,.parent=56"
      _StyleDefs(95)  =   "Splits(0).Columns(16).HeadingStyle:id=132,.parent=57"
      _StyleDefs(96)  =   "Splits(0).Columns(16).FooterStyle:id=133,.parent=58"
      _StyleDefs(97)  =   "Splits(0).Columns(16).EditorStyle:id=134,.parent=60"
      _StyleDefs(98)  =   "Splits(0).Columns(17).Style:id=191,.parent=56"
      _StyleDefs(99)  =   "Splits(0).Columns(17).HeadingStyle:id=136,.parent=57"
      _StyleDefs(100) =   "Splits(0).Columns(17).FooterStyle:id=137,.parent=58"
      _StyleDefs(101) =   "Splits(0).Columns(17).EditorStyle:id=138,.parent=60"
      _StyleDefs(102) =   "Splits(1).Style:id=13,.parent=1"
      _StyleDefs(103) =   "Splits(1).CaptionStyle:id=22,.parent=4"
      _StyleDefs(104) =   "Splits(1).HeadingStyle:id=14,.parent=2"
      _StyleDefs(105) =   "Splits(1).FooterStyle:id=15,.parent=3"
      _StyleDefs(106) =   "Splits(1).InactiveStyle:id=16,.parent=5"
      _StyleDefs(107) =   "Splits(1).SelectedStyle:id=18,.parent=6"
      _StyleDefs(108) =   "Splits(1).EditorStyle:id=17,.parent=7"
      _StyleDefs(109) =   "Splits(1).HighlightRowStyle:id=19,.parent=8"
      _StyleDefs(110) =   "Splits(1).EvenRowStyle:id=20,.parent=9"
      _StyleDefs(111) =   "Splits(1).OddRowStyle:id=21,.parent=10"
      _StyleDefs(112) =   "Splits(1).RecordSelectorStyle:id=23,.parent=11"
      _StyleDefs(113) =   "Splits(1).FilterBarStyle:id=24,.parent=12"
      _StyleDefs(114) =   "Splits(1).Columns(0).Style:id=28,.parent=13"
      _StyleDefs(115) =   "Splits(1).Columns(0).HeadingStyle:id=25,.parent=14"
      _StyleDefs(116) =   "Splits(1).Columns(0).FooterStyle:id=26,.parent=15"
      _StyleDefs(117) =   "Splits(1).Columns(0).EditorStyle:id=27,.parent=17"
      _StyleDefs(118) =   "Splits(1).Columns(1).Style:id=43,.parent=13"
      _StyleDefs(119) =   "Splits(1).Columns(1).HeadingStyle:id=30,.parent=14"
      _StyleDefs(120) =   "Splits(1).Columns(1).FooterStyle:id=31,.parent=15"
      _StyleDefs(121) =   "Splits(1).Columns(1).EditorStyle:id=32,.parent=17"
      _StyleDefs(122) =   "Splits(1).Columns(2).Style:id=47,.parent=13"
      _StyleDefs(123) =   "Splits(1).Columns(2).HeadingStyle:id=44,.parent=14"
      _StyleDefs(124) =   "Splits(1).Columns(2).FooterStyle:id=45,.parent=15"
      _StyleDefs(125) =   "Splits(1).Columns(2).EditorStyle:id=46,.parent=17"
      _StyleDefs(126) =   "Splits(1).Columns(3).Style:id=51,.parent=13"
      _StyleDefs(127) =   "Splits(1).Columns(3).HeadingStyle:id=48,.parent=14"
      _StyleDefs(128) =   "Splits(1).Columns(3).FooterStyle:id=49,.parent=15"
      _StyleDefs(129) =   "Splits(1).Columns(3).EditorStyle:id=50,.parent=17"
      _StyleDefs(130) =   "Splits(1).Columns(4).Style:id=55,.parent=13"
      _StyleDefs(131) =   "Splits(1).Columns(4).HeadingStyle:id=52,.parent=14"
      _StyleDefs(132) =   "Splits(1).Columns(4).FooterStyle:id=53,.parent=15"
      _StyleDefs(133) =   "Splits(1).Columns(4).EditorStyle:id=54,.parent=17"
      _StyleDefs(134) =   "Splits(1).Columns(5).Style:id=142,.parent=13"
      _StyleDefs(135) =   "Splits(1).Columns(5).HeadingStyle:id=139,.parent=14"
      _StyleDefs(136) =   "Splits(1).Columns(5).FooterStyle:id=140,.parent=15"
      _StyleDefs(137) =   "Splits(1).Columns(5).EditorStyle:id=141,.parent=17"
      _StyleDefs(138) =   "Splits(1).Columns(6).Style:id=146,.parent=13"
      _StyleDefs(139) =   "Splits(1).Columns(6).HeadingStyle:id=143,.parent=14"
      _StyleDefs(140) =   "Splits(1).Columns(6).FooterStyle:id=144,.parent=15"
      _StyleDefs(141) =   "Splits(1).Columns(6).EditorStyle:id=145,.parent=17"
      _StyleDefs(142) =   "Splits(1).Columns(7).Style:id=150,.parent=13"
      _StyleDefs(143) =   "Splits(1).Columns(7).HeadingStyle:id=147,.parent=14"
      _StyleDefs(144) =   "Splits(1).Columns(7).FooterStyle:id=148,.parent=15"
      _StyleDefs(145) =   "Splits(1).Columns(7).EditorStyle:id=149,.parent=17"
      _StyleDefs(146) =   "Splits(1).Columns(8).Style:id=154,.parent=13"
      _StyleDefs(147) =   "Splits(1).Columns(8).HeadingStyle:id=151,.parent=14"
      _StyleDefs(148) =   "Splits(1).Columns(8).FooterStyle:id=152,.parent=15"
      _StyleDefs(149) =   "Splits(1).Columns(8).EditorStyle:id=153,.parent=17"
      _StyleDefs(150) =   "Splits(1).Columns(9).Style:id=158,.parent=13"
      _StyleDefs(151) =   "Splits(1).Columns(9).HeadingStyle:id=155,.parent=14"
      _StyleDefs(152) =   "Splits(1).Columns(9).FooterStyle:id=156,.parent=15"
      _StyleDefs(153) =   "Splits(1).Columns(9).EditorStyle:id=157,.parent=17"
      _StyleDefs(154) =   "Splits(1).Columns(10).Style:id=162,.parent=13"
      _StyleDefs(155) =   "Splits(1).Columns(10).HeadingStyle:id=159,.parent=14"
      _StyleDefs(156) =   "Splits(1).Columns(10).FooterStyle:id=160,.parent=15"
      _StyleDefs(157) =   "Splits(1).Columns(10).EditorStyle:id=161,.parent=17"
      _StyleDefs(158) =   "Splits(1).Columns(11).Style:id=166,.parent=13"
      _StyleDefs(159) =   "Splits(1).Columns(11).HeadingStyle:id=163,.parent=14"
      _StyleDefs(160) =   "Splits(1).Columns(11).FooterStyle:id=164,.parent=15"
      _StyleDefs(161) =   "Splits(1).Columns(11).EditorStyle:id=165,.parent=17"
      _StyleDefs(162) =   "Splits(1).Columns(12).Style:id=170,.parent=13"
      _StyleDefs(163) =   "Splits(1).Columns(12).HeadingStyle:id=167,.parent=14"
      _StyleDefs(164) =   "Splits(1).Columns(12).FooterStyle:id=168,.parent=15"
      _StyleDefs(165) =   "Splits(1).Columns(12).EditorStyle:id=169,.parent=17"
      _StyleDefs(166) =   "Splits(1).Columns(13).Style:id=174,.parent=13"
      _StyleDefs(167) =   "Splits(1).Columns(13).HeadingStyle:id=171,.parent=14"
      _StyleDefs(168) =   "Splits(1).Columns(13).FooterStyle:id=172,.parent=15"
      _StyleDefs(169) =   "Splits(1).Columns(13).EditorStyle:id=173,.parent=17"
      _StyleDefs(170) =   "Splits(1).Columns(14).Style:id=178,.parent=13"
      _StyleDefs(171) =   "Splits(1).Columns(14).HeadingStyle:id=175,.parent=14"
      _StyleDefs(172) =   "Splits(1).Columns(14).FooterStyle:id=176,.parent=15"
      _StyleDefs(173) =   "Splits(1).Columns(14).EditorStyle:id=177,.parent=17"
      _StyleDefs(174) =   "Splits(1).Columns(15).Style:id=182,.parent=13"
      _StyleDefs(175) =   "Splits(1).Columns(15).HeadingStyle:id=179,.parent=14"
      _StyleDefs(176) =   "Splits(1).Columns(15).FooterStyle:id=180,.parent=15"
      _StyleDefs(177) =   "Splits(1).Columns(15).EditorStyle:id=181,.parent=17"
      _StyleDefs(178) =   "Splits(1).Columns(16).Style:id=186,.parent=13"
      _StyleDefs(179) =   "Splits(1).Columns(16).HeadingStyle:id=183,.parent=14"
      _StyleDefs(180) =   "Splits(1).Columns(16).FooterStyle:id=184,.parent=15"
      _StyleDefs(181) =   "Splits(1).Columns(16).EditorStyle:id=185,.parent=17"
      _StyleDefs(182) =   "Splits(1).Columns(17).Style:id=190,.parent=13"
      _StyleDefs(183) =   "Splits(1).Columns(17).HeadingStyle:id=187,.parent=14"
      _StyleDefs(184) =   "Splits(1).Columns(17).FooterStyle:id=188,.parent=15"
      _StyleDefs(185) =   "Splits(1).Columns(17).EditorStyle:id=189,.parent=17"
      _StyleDefs(186) =   "Named:id=33:Normal"
      _StyleDefs(187) =   ":id=33,.parent=0"
      _StyleDefs(188) =   "Named:id=34:Heading"
      _StyleDefs(189) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(190) =   ":id=34,.wraptext=-1"
      _StyleDefs(191) =   "Named:id=35:Footing"
      _StyleDefs(192) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(193) =   "Named:id=36:Selected"
      _StyleDefs(194) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(195) =   "Named:id=37:Caption"
      _StyleDefs(196) =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(197) =   "Named:id=38:HighlightRow"
      _StyleDefs(198) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(199) =   "Named:id=39:EvenRow"
      _StyleDefs(200) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(201) =   "Named:id=40:OddRow"
      _StyleDefs(202) =   ":id=40,.parent=33"
      _StyleDefs(203) =   "Named:id=41:RecordSelector"
      _StyleDefs(204) =   ":id=41,.parent=34"
      _StyleDefs(205) =   "Named:id=42:FilterBar"
      _StyleDefs(206) =   ":id=42,.parent=33"
      _StyleDefs(207) =   "Named:id=29:Approximation"
      _StyleDefs(208) =   ":id=29,.parent=33,.bgcolor=&H80FFFF&,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(209) =   ":id=29,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(210) =   ":id=29,.fontname=MS Sans Serif"
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   8280
      TabIndex        =   8
      Top             =   6480
      Width           =   1335
   End
   Begin VSPrinter8LibCtl.VSPrinter VSPrinter 
      Height          =   735
      Left            =   8640
      TabIndex        =   7
      Top             =   3600
      Visible         =   0   'False
      Width           =   495
      _cx             =   873
      _cy             =   1296
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
      Zoom            =   -0.473484848484849
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
   Begin MSComDlg.CommonDialog dlgCom 
      Left            =   9120
      Top             =   5160
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   8280
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   5160
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton cmdExtExport 
      Caption         =   "Export"
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   6000
      Width           =   1335
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   "D:\Rad_ToolBox\vb\data\electron.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   8160
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Ac"
      Top             =   4680
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8280
      TabIndex        =   0
      Top             =   6960
      Width           =   1335
   End
   Begin VB.Label lblDevices 
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "When two nuclides are listed for a type of device, only one is present in a single device."
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
      Height          =   1335
      Left            =   8160
      TabIndex        =   6
      Top             =   2040
      Width           =   1620
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblMANote 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000004&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mass energy- absorption coefficients that are interpolated have a green background."
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
      Height          =   1200
      Left            =   8160
      TabIndex        =   5
      Top             =   840
      Width           =   1620
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblPlot 
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Double-click any column to plot those data."
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
      Height          =   735
      Left            =   8160
      TabIndex        =   4
      Top             =   120
      Width           =   1620
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmEleTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MODULE_NAME As String = "frmEleTable"
Dim numRows As Integer, MaxCol As Integer
Dim IsStable(100) As String * 1

Private Sub cmdExtExport_Click()
    Const PROCEDURE_NAME As String = "cmdExtExport_Click"
  
    Dim C As TrueDBGrid80.Column
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
'    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = gs_NucSelected
    gsExcel.Cells(1, 1 + gn_ExcelStartColumn) = Me.Caption
    For j = 1 To MaxCol
      Set C = grdEleDisplay.Columns(j - 1)
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

Private Sub cmdHelp_Click()
Const PROCEDURE_NAME As String = "cmdEleHelp_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   If gs_myTable = "bioassay" Then
     FN = gs_HelpPath & "Bioassay.chm"
   Else
     FN = gs_HelpPath & "A1A2.chm"
   End If
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
End Sub

Private Sub cmdOK_Click()
  Dim i As Integer, j As Integer
  On Error Resume Next
  gs_MyWhere = ""
  For j = 0 To MaxCol - 1
    For i = 0 To numRows - 1
      xGrid(i, j) = ""
    Next i
  Next j
  grdEleDisplay.ClearCellStyle -1
  grdEleDisplay.Refresh
  Me.Hide
End Sub

Private Sub cmdPrint_Click()
  grdEleDisplay.PrintInfo.PageHeader = Me.Caption
  grdEleDisplay.PrintInfo.PreviewInitZoom = 100
  grdEleDisplay.PrintInfo.PrintPreview
End Sub

Private Sub cmdRef_Click()
 Dim i As Integer, nRefs As Integer, sStr As String, Index As Integer
  
  Index = 22
  nRefs = gs_References(Index, 0)
  sStr = ""
  For i = 1 To nRefs
    sStr = sStr & vbCr & vbLf & gs_References(Index, i) & vbLf
  Next i
  MsgBox sStr, 0, "References"
End Sub

Private Sub Form_Load()
  Const PROCEDURE_NAME As String = "cmdForm_Load"
  Dim myQuery As String, MassCount As Integer, dFac As Double
  Dim j As Integer, GrdCols As Integer, rsNuc As Recordset, k As Integer
  Dim i As Integer, Factor As Double, UnitsStart As Integer, SkipIt As Boolean
  Dim C As TrueDBGrid80.Column, aVar As Variant, PhoIn As Double
  Dim xMaterial(13, 3), nEles As Integer, MD As String * 50, sSelected As String
  Dim FileName As String, outString As String, iE As Integer, sStr As String
  
  'On Error GoTo Error_Handler
  PositionForm Me
  Me.Width = 10005
 
  lblMANote.Caption = ""
  lblDevices.Visible = False
  cmdHelp.Visible = False
  cmdHelp.Enabled = False
  cmdRef.Enabled = False
  cmdRef.Visible = False
  If gs_myTable = "KermaP" Then
    If gs_NucSelected = "User-defined" Then
      Caption = "Photon Kerma for " & gs_UserMaterialName
    Else
      If gs_AbsorberType = "Ele" Then
        Caption = "Photon Kerma for " & gs_EleSelected
      Else
        Caption = "Photon Kerma for " & gs_MatSelected
      End If
    End If
  ElseIf gs_myTable = "KermaN" Then
    If gs_NucSelected = "User-defined" Then
      Caption = "Neutron Kerma for " & gs_UserMaterialName
    Else
      If gs_AbsorberType = "Ele" Then
        Caption = "Neutron Kerma for " & gs_EleSelected
      Else
        Caption = "Neutron Kerma for " & gs_MatSelected
      End If
    End If
  ElseIf gs_myTable = "bioassay" Then
    Me.Width = 11500
    i = Len(Trim(gs_NucSelected))
    sStr = Mid(gs_NucSelected, 1, i - 1)
    outString = Mid(gs_NucSelected, i, 1)
    Caption = "Bioassay data of occupational inhalation intakes of " & sStr _
      & " ICRP 68, Absorption Type " & outString
    cmdHelp.Visible = True
    cmdHelp.Enabled = True
  ElseIf gs_myTable = "BioPublic" Then
    If InStr(gs_NucSelected, "Medical") <> 0 Then
      Caption = gs_NucSelected
    ElseIf InStr(gs_NucSelected, "Naturally") <> 0 Then
      Caption = gs_NucSelected
    ElseIf InStr(gs_NucSelected, "Building") <> 0 Then
      Caption = "Concentrations in Building Materials (pCi/g)"
    ElseIf InStr(gs_NucSelected, "Devices") <> 0 Then
      Caption = "Concentrations in Devices"
      lblDevices.Visible = True
    ElseIf InStr(gs_NucSelected, "Natural") <> 0 Then
      Caption = "Estimated Annual Dose Equivalent in the US from Natural Background Radiation"
    ElseIf InStr(gs_NucSelected, "Body") <> 0 Then
      Caption = "Annual Dose Equivalent to Tissues from Natural Radionuclides in the Body"
    ElseIf InStr(gs_NucSelected, "A1A2") <> 0 Then
      Caption = "A1/A2 Table"
      cmdHelp.Visible = True
      cmdHelp.Enabled = True
      cmdRef.Enabled = True
      cmdRef.Visible = True
    ElseIf InStr(gs_NucSelected, "Background") = 0 Then
      Caption = "Inhalation Rates (" & gs_NucSelected & ")"
    Else
      Caption = gs_NucSelected
    End If
  ElseIf gs_myTable = "Element" Then
    Data1.DatabaseName = gs_DataPath & gs_myTable & ".mdb"
    If gs_AtomType = "Neutron Cross Section" Then
      myQuery = "Select " & gs_Columns & " from " & gs_EleSelected & _
        " where [Isotopic Composition] > 0 order by [Mass Number]"
    ElseIf InStr(gs_Columns, "Symbol") > 0 Then
      myQuery = "Select " & gs_Columns & " from Elements order by Symbol"
    Else
      myQuery = "Select Density from Elements where Symbol = '" & _
        gs_EleSelected & "'"
    End If
    Data1.RecordSource = myQuery
    Data1.Refresh
    Set rsNuc = Data1.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "None found"
      Exit Sub
    End If
    rsNuc.MoveFirst
    If gs_AtomType = "Neutron Cross Section" Then
      Caption = "Thermal Neutron Capture Cross Sections (b) for " & gs_EleSelected
    ElseIf Not InStr(gs_Columns, "Symbol") < 0 Then
      Caption = gs_myTable & " data for " & gs_EleSelected & "; Density = " & rsNuc.Fields(0) & " g/cm^3"
    End If
  ElseIf gs_myTable = "PhotonField" Or gs_myTable = "NeutronField" Then
    Caption = gs_myTable & " data for " & gs_NucSelected
  ElseIf gs_myTable = "Material" Then
    Data1.DatabaseName = gs_DataPath & gs_myTable & ".mdb"
    If gs_AbsorberType = "Tissue" Then
      myQuery = "Select * from MatNames where  MatName = '" & _
        gs_NucSelected & "'"
    ElseIf gs_MatSelected <> "" Then
      myQuery = "Select * from MatNames where MatName = '" & _
        gs_MatSelected & "'"
    Else
      myQuery = "Select * from MatNames where MatName = '" & _
        gs_NucSelected & "'"
    End If
    Data1.RecordSource = myQuery
    Data1.Refresh
    Set rsNuc = Data1.Recordset
    rsNuc.MoveFirst
    If Len(Trim(rsNuc.Fields(2))) <> 0 Then
      If gs_AbsorberType = "Tissue" Then
        Caption = gs_myTable & " data for " & gs_NucSelected & " (" & _
          rsNuc.Fields(2) & "); Density = " & rsNuc.Fields(3) & " g/cm^3"
      ElseIf gs_MatSelected <> "" Then
        Caption = gs_myTable & " data for " & gs_MatSelected & " (" & _
          rsNuc.Fields(2) & "); Density = " & rsNuc.Fields(3) & " g/cm^3"
      Else
        Caption = gs_myTable & " data for " & gs_NucSelected & " (" & _
          rsNuc.Fields(2) & "); Density = " & rsNuc.Fields(3) & " g/cm^3"
      End If
    Else
      If gs_AbsorberType = "Tissue" Then
        Caption = gs_myTable & " data for " & gs_NucSelected & _
        "; Density = " & rsNuc.Fields(3) & " g/cm^3"
      ElseIf gs_MatSelected <> "" Then
        Caption = gs_myTable & " data for " & gs_MatSelected & _
        "; Density = " & rsNuc.Fields(3) & " g/cm^3"
      Else
        Caption = gs_myTable & " data for " & gs_NucSelected & _
        "; Density = " & rsNuc.Fields(3) & " g/cm^3"
      End If
    End If
  Else
    If gs_AbsorberType = "Ele" Then
      Caption = gs_myTable & " absorber data for " & gs_EleSelected
    ElseIf gs_AbsorberType = "Mat" Then
      Caption = gs_myTable & " absorber data for " & gs_MatSelected
    Else
      Caption = gs_myTable & " absorber data for " & gs_NucSelected
    End If
  End If
  Data1.DatabaseName = gs_DataPath & gs_myTable & ".mdb"
  If gs_myTable = "PhotonField" Or gs_myTable = "NeutronField" Then
    If Mid(gs_NucSelected, 1, 1) <> "O" Then
      myQuery = "SELECT * FROM [Geometry] WHERE GEOMETRY = '" & _
        Trim(gs_NucSelected) & "'"
      Data1.RecordSource = myQuery
      Data1.Refresh
      Set rsNuc = Data1.Recordset
      rsNuc.MoveFirst
      Caption = gs_myTable & "  data for " & rsNuc.Fields(1).Value _
        & " geometry"
    End If
  ElseIf gs_NucSelected = "Organ Masses ICRP 72" Then
    Caption = "ICRP Reference Organ Masses and Total Body (" & gs_Mass_Units & ")"
  ElseIf gs_NucSelected = "Organ Masses ICRP 89" Then
    Caption = "ICRP 89 Reference Organ Masses and Total Body (" & gs_Mass_Units & ")"
  End If
  
  If gs_myTable = "Electron" Then
    xGrid.ReDim 0, 80, 0, 7
    lblMANote.Visible = False
    lblPlot.Visible = True
  ElseIf gs_myTable = "Photon" Then
    xGrid.ReDim 0, 400, 0, 9
    Xapprox.ReDim 0, 200, 0, 0
    lblMANote.Visible = True
    lblPlot.Visible = True
  ElseIf gs_myTable = "Material" Then
    lblMANote.Visible = False
    xGrid.ReDim 0, 13, 0, 3
    lblPlot.Visible = False
  ElseIf gs_myTable = "Element" Then
    If gs_AtomType = "Mass" And gs_NucSelected <> "Elements" Then
      lblMANote.Visible = True
    Else
      lblMANote.Visible = False
    End If
    If gs_AtomType = "Neutron Cross Section" Then
      xGrid.ReDim 0, 12, 0, 3
    ElseIf gs_NucSelected = "Elements" Then
      xGrid.ReDim 0, 100, 0, 1
    Else
      xGrid.ReDim 0, 40, 0, 2
    End If
    lblPlot.Visible = False
  ElseIf gs_myTable = "Alpha" Then
    lblMANote.Visible = False
    xGrid.ReDim 0, 80, 0, 5
    lblPlot.Visible = True
  ElseIf gs_myTable = "PhotonField" Then
    lblMANote.Visible = False
    lblPlot.Visible = True
    If Mid(gs_NucSelected, 1, 1) = "O" Then
      xGrid.ReDim 0, 30, 0, 5
    Else
      xGrid.ReDim 0, 25, 0, 25
    End If
  ElseIf gs_myTable = "NeutronField" Then
    lblMANote.Visible = False
    lblPlot.Visible = True
    If Mid(gs_NucSelected, 1, 1) = "O" Then
      xGrid.ReDim 0, 55, 0, 2
    Else
      xGrid.ReDim 0, 55, 0, 25
    End If
  ElseIf gs_myTable = "OrganMasses" Then
    lblMANote.Visible = False
    If gs_NucSelected = "Organ Masses ICRP 72" Then
      xGrid.ReDim 0, 29, 0, 6
    Else
      xGrid.ReDim 0, 25, 0, 2
    End If
    lblPlot.Visible = False
  ElseIf gs_myTable = "BioPublic" Then
    lblMANote.Visible = False
    If gs_NucSelected = "Air Intake Worker" Then
      xGrid.ReDim 0, 2, 0, 6
    ElseIf gs_NucSelected = "Air Intake Public" Then
      xGrid.ReDim 0, 28, 0, 5
    ElseIf gs_NucSelected = "Usage Gender Specific" Then
      xGrid.ReDim 0, 9, 0, 8
    ElseIf gs_NucSelected = "Natural Background" Then
      xGrid.ReDim 0, 6, 0, 4
    ElseIf gs_NucSelected = "Background in Body" Then
      xGrid.ReDim 0, 11, 0, 3
    ElseIf gs_NucSelected = "Medical Doses" Then
      xGrid.ReDim 0, 2, 0, 1
    ElseIf gs_NucSelected = "Naturally Occurring" Then
      xGrid.ReDim 0, 8, 0, 2
    ElseIf gs_NucSelected = "Building Materials" Then
      xGrid.ReDim 0, 2, 0, 10
    ElseIf gs_NucSelected = "Devices" Then
      xGrid.ReDim 0, 10, 0, 3
    ElseIf gs_NucSelected = "A1A2" Then
      xGrid.ReDim 0, 388, 0, 6
    End If
    lblPlot.Visible = False
  ElseIf gs_myTable = "bioassay" Then
    lblMANote.Visible = False
    xGrid.ReDim 0, 65, 0, 10
  ElseIf gs_myTable = "KermaP" Then
    lblMANote.Visible = False
    xGrid.ReDim 0, 190, 0, 1
  ElseIf gs_myTable = "KermaN" Then
    lblMANote.Visible = False
    xGrid.ReDim 0, 174, 0, 1
  End If
  
' KEITH look here
  If gs_AbsorberType = "Mat" And InStr(gs_myTable, "Kerma") = 0 _
    And InStr(gs_myTable, "OrganMasses") = 0 And InStr(gs_myTable, "BioPublic") = 0 Then
      
    If gs_MatSelected = "User-defined" Then
      nEles = g_NumUserEles - 1
      For i = 0 To nEles
        xMaterial(i, 1) = g_UserMaterial(i, 0)
        xMaterial(i, 2) = g_UserMaterial(i, 1)
      Next i
      gs_MatSelected = gs_UserMaterialName
      Caption = gs_myTable & " data for " & gs_MatSelected
    Else
      Data1.DatabaseName = gs_DataPath & "material.mdb"
      If gs_MatSelected <> "" Then
        myQuery = "SELECT * FROM [" & gs_MatSelected & "]"
      Else
        myQuery = "SELECT * FROM [" & gs_NucSelected & "]"
      End If

      Data1.RecordSource = myQuery
      Data1.Refresh
  
      Set rsNuc = Data1.Recordset
      MaxCol = 3
      rsNuc.MoveFirst
      j = 0
      While Not rsNuc.EOF
        For i = 0 To MaxCol - 1
          xMaterial(j, i) = rsNuc.Fields(i).Value
        Next i
        j = j + 1
        rsNuc.MoveNext
      Wend
      nEles = j - 1
      Set rsNuc = Nothing
    End If
    
    Data1.DatabaseName = gs_DataPath & gs_myTable & ".mdb"
    If gs_myTable = "Photon" Then
      myQuery = "SELECT " & gs_Columns & " FROM [" & xMaterial(0, 1) & "]"
      Data1.RecordSource = myQuery
      Data1.Refresh
      Set rsNuc = Data1.Recordset
      MaxCol = rsNuc.Fields.Count
      Set rsNuc = Nothing
      FileName = App.Path & "\temp\photon.dat"
      Open FileName For Output As #10
      Print #10, MaxCol - 1, ", ", nEles + 1
      outString = "'" & xMaterial(0, 1) & "'"
      For iE = 1 To nEles
        outString = outString & ", '" & xMaterial(iE, 1) & "'"
      Next iE
      Print #10, outString
    End If
      
' need to set db to elements
    For iE = 0 To nEles
      myQuery = "SELECT " & gs_Columns & " FROM [" & xMaterial(iE, 1) & "]"
'      MsgBox myQuery
      Data1.RecordSource = myQuery
      Data1.Refresh
      Set rsNuc = Data1.Recordset

      rsNuc.MoveFirst
      MaxCol = rsNuc.Fields.Count
      j = 0
      While Not rsNuc.EOF
        If gs_myTable <> "Photon" Then
          xGrid(j, 0) = rsNuc.Fields(0).Value
          If (iE = 0) Then
            For i = 1 To MaxCol - 1
              If IsNumeric(rsNuc.Fields(i).Value) Then
                If rsNuc.Fields(i).Value > 0# Then
                  xGrid(j, i) = rsNuc.Fields(i).Value * xMaterial(iE, 2)
                Else
                  xGrid(j, i) = 0#
                End If
              End If
            Next i
          Else
            For i = 1 To MaxCol - 1
              If IsNumeric(rsNuc.Fields(i).Value) Then
                If rsNuc.Fields(i).Value > 0# Then
                  xGrid(j, i) = xGrid(j, i) + rsNuc.Fields(i).Value * xMaterial(iE, 2)
                End If
              End If
            Next i
          End If
        Else
          outString = rsNuc.Fields(0).Value & ", '" & xMaterial(iE, 1) & "'"
          For i = 1 To MaxCol - 1
            If IsNumeric(rsNuc.Fields(i).Value) Then
              outString = outString & ", " & rsNuc.Fields(i).Value * xMaterial(iE, 2)
            Else
              outString = outString & ", " & -99#
            End If
          Next i
          Print #10, outString
        End If
        j = j + 1
        rsNuc.MoveNext
      Wend
    Next iE
' interpolate missing values by photon energy here
    If gs_myTable = "Photon" Then
      Close #10
      MD = App.Path
      Call Interp_Photon(MD)

      FileName = App.Path & "\temp\photon.tmp"
      Open FileName For Input As #10
  
      iE = 0
      While Not EOF(10)
        Input #10, PhoIn
        xGrid(iE, 0) = PhoIn
        For i = 1 To MaxCol - 1
          Input #10, PhoIn
          xGrid(iE, i) = PhoIn
        Next i
       iE = iE + 1
      Wend
      Close #10
    End If
    GoTo Skip_Read:
  End If
  
  SkipIt = False
  If gs_myTable = "Material" And gs_Columns <> "*" Then
    If gs_AbsorberType = "Tissue" Then
      myQuery = "SELECT " & gs_Columns & " FROM [" & gs_NucSelected & "]" & _
        " Inner Join Elements On [" & gs_NucSelected & "].Symbol = Elements.Symbol"
    ElseIf gs_MatSelected <> "" Then
      myQuery = "SELECT " & gs_Columns & " FROM [" & gs_MatSelected & "]" & _
        " Inner Join Elements On [" & gs_MatSelected & "].Symbol = Elements.Symbol"
    Else
      myQuery = "SELECT " & gs_Columns & " FROM [" & gs_NucSelected & "]" & _
        " Inner Join Elements On [" & gs_NucSelected & "].Symbol = Elements.Symbol"
    End If
  ElseIf gs_NucSelected = "User-defined" And _
    (gs_myTable = "KermaN" Or gs_myTable = "KermaP") Then
    SkipIt = True
    MaxCol = 2
    If gs_myTable = "KermaN" Then
      For i = 0 To g_NumUserEles
        For j = 0 To g_KermaNucCount
          If g_UserMaterial(i, 0) = g_NKermaNuc(j, 1) Then
            g_UserMaterial(i, 0) = g_NKermaNuc(j, 2)
          End If
        Next j
      Next i
      numRows = 174
    Else
      numRows = 190
    End If
    For i = 0 To numRows
      For j = 0 To MaxCol - 1
        xGrid(i, j) = ""
      Next j
    Next i
    j = 0
    myQuery = "SELECT " & gs_Columns & " FROM [" & g_UserMaterial(0, 0) & "]"
    Data1.RecordSource = myQuery
    Data1.Refresh
    Set rsNuc = Data1.Recordset
    While Not rsNuc.EOF
      xGrid(j, 0) = rsNuc.Fields(0).Value
      For i = 1 To MaxCol - 1
        xGrid(j, i) = rsNuc.Fields(i).Value * g_UserMaterial(0, 1)
      Next i
      j = j + 1
      rsNuc.MoveNext
    Wend
    For k = 1 To g_NumUserEles - 1
      j = 0
      myQuery = "SELECT " & gs_Columns & " FROM [" & g_UserMaterial(k, 0) & "]"
      Data1.RecordSource = myQuery
      Data1.Refresh
      Set rsNuc = Data1.Recordset
      While Not rsNuc.EOF
        For i = 1 To MaxCol - 1
          If (rsNuc.Fields(i).Value <> "-0.01") Then
            xGrid(j, i) = xGrid(j, i) + rsNuc.Fields(i).Value * g_UserMaterial(k, 1)
          End If
        Next i
        j = j + 1
        rsNuc.MoveNext
      Wend
    Next k
    
  Else
    If gs_AtomType = "Neutron Cross Section" Then
      myQuery = "Select " & gs_Columns & " from " & gs_EleSelected & _
        " where [Isotopic Composition] > 0 order by [Mass Number]"
    ElseIf gs_AbsorberType = "Mat" Then
      myQuery = "SELECT " & gs_Columns & " FROM [" & gs_MatSelected & "]"
    ElseIf gs_AbsorberType = "Ele" Then
      myQuery = "SELECT " & gs_Columns & " FROM [" & gs_EleSelected & "]"
    Else
      myQuery = "SELECT " & gs_Columns & " FROM [" & gs_NucSelected & "]"
    End If
  End If
  
  If SkipIt Then GoTo Skip_Read
  
  Data1.RecordSource = myQuery
  Data1.Refresh
  
  Set rsNuc = Data1.Recordset
  MaxCol = rsNuc.Fields.Count

  rsNuc.MoveFirst
  j = 0
  i = InStr(gs_Columns, gPhoType(8))
  If (i > 0) Then
    While Not rsNuc.EOF
      For i = 0 To MaxCol - 2
        xGrid(j, i) = rsNuc.Fields(i).Value
      Next i
      Xapprox(j, 0) = rsNuc.Fields(MaxCol - 1).Value
      j = j + 1
      rsNuc.MoveNext
    Wend
  
  Else
    If gs_myTable = "Element" And gs_AtomType = "Abundance" Then
      While Not rsNuc.EOF
        If (rsNuc.Fields(1).Value <> 0) Then
          For i = 0 To MaxCol - 1
            xGrid(j, i) = rsNuc.Fields(i).Value
          Next i
          j = j + 1
        End If
        rsNuc.MoveNext
      Wend
    ElseIf gs_myTable = "Element" And gs_AtomType = "Mass" And gs_NucSelected <> "Elements" Then
      While Not rsNuc.EOF
        If (rsNuc.Fields(1).Value <> 0) Then
          For i = 0 To MaxCol - 2
            xGrid(j, i) = rsNuc.Fields(i).Value
          Next i
          IsStable(j) = rsNuc.Fields(MaxCol - 1).Value
          j = j + 1
        End If
        MassCount = j - 1
        rsNuc.MoveNext
      Wend
    Else
      While Not rsNuc.EOF
        For i = 0 To MaxCol - 1
          xGrid(j, i) = rsNuc.Fields(i).Value
          If (xGrid(j, i) = "-0.01") Then
            xGrid(j, i) = ""
          End If
        Next i
        j = j + 1
        rsNuc.MoveNext
      Wend
    End If
  End If
  
Skip_Read:
  gn_NucCount = j
  numRows = j
  xGrid.ReDim 0, numRows - 1, 0, MaxCol - 1
  If MaxCol > grdEleDisplay.Columns.Count Then
    j = grdEleDisplay.Columns.Count - 1
    For i = MaxCol + 1 To j
      Set C = grdEleDisplay.Columns.Add(i)
      C.Visible = True
    Next i
  End If
  If MaxCol <= grdEleDisplay.Columns.Count Then
    j = grdEleDisplay.Columns.Count - 1
    For i = j To MaxCol + 1 Step -1
      grdEleDisplay.Columns.Remove (i)
    Next i
  End If
  grdEleDisplay.ReBind
  
  i = InStr(gs_Columns, gPhoType(8))
  If (i > 0) Then
    MaxCol = MaxCol - 1
    grdEleDisplay.Columns(MaxCol - 1).FetchStyle = dbgFetchCellStyleColumn
    lblMANote.Caption = _
    "NOTE: Mass energy- absorption coefficients that are interpolated have a green background."
'  End If
  ElseIf gs_myTable = "Element" And gs_AtomType = "Mass" And gs_NucSelected <> "Elements" Then
    MaxCol = MaxCol - 1
    grdEleDisplay.Columns(0).FetchStyle = dbgFetchCellStyleColumn
    lblMANote.Caption = _
    "NOTE: The mass number of stable isotopes has a red background;" & _
      " primorial has grey; cosmogenic blue. "
  Else
    lblMANote.Visible = False
  End If
  
  For i = 0 To MaxCol - 1
    Set C = grdEleDisplay.Columns(i)
    C.Caption = rsNuc.Fields(i).Name
    If gs_myTable = "Electron" Then
      For j = 0 To 6
        If C.Caption = gEleType(j) Then
          If gEleUnit(j) <> "" Then
            C.Caption = C.Caption & vbLf & "(" & gEleUnit(j) & ")"
          End If
        End If
      Next j
      C.NumberFormat = "Scientific"
      C.Width = 1400
    ElseIf gs_myTable = "bioassay" Then
      If i = 0 Then
        C.Caption = C.Caption & vbLf & "(days)"
      End If
      C.Width = 1400
      C.NumberFormat = "Scientific"
    ElseIf gs_myTable = "Photon" Then
      For j = 0 To 8
        If C.Caption = gPhoType(j) Then
          If gPhoUnit(j) <> "" Then
            C.Caption = C.Caption & vbLf & "(" & gPhoUnit(j) & ")"
          End If
        End If
      Next j
      C.Width = 1400
      C.NumberFormat = "Scientific"
    ElseIf gs_myTable = "Alpha" Then
      For j = 0 To 4
        If C.Caption = gAlpType(j) Then
          If gAlpUnit(j) <> "" Then
            C.Caption = C.Caption & vbLf & "(" & gAlpUnit(j) & ")"
          End If
        End If
      Next j
      C.Width = 1400
      C.NumberFormat = "Scientific"
    ElseIf gs_myTable = "Element" Then
      If i = 2 Then
        C.NumberFormat = "Scientific"
      End If
    ElseIf gs_myTable = "Material" Then
      C.Width = 900
      If i = 2 Then
        C.NumberFormat = "Edit Mask"
        C.EditMask = "#.######"
      End If
    ElseIf gs_myTable = "PhotonField" Then
      If Mid(gs_NucSelected, 1, 1) = "O" Then
        j = InStr(C.Caption, "000")
        If j > 0 Then
          outString = C.Caption
          Mid(outString, j, 3) = "0.0"
          C.Caption = outString
        End If
''
        C.Caption = C.Caption & vbLf & "(" & gPhoFldUnit(i, 1) & ")"
        C.Width = 1700
      Else
        C.Caption = C.Caption & vbLf & "(" & gPhoFldUnit(i, 2) & ")"
        C.Width = 900
      End If
      C.NumberFormat = "Scientific"
    ElseIf gs_myTable = "NeutronField" Then
      If Mid(gs_NucSelected, 1, 1) = "O" Then
        C.Caption = C.Caption & vbLf & "(" & gNeuFldUnit(i, 1) & ")"
        C.Width = 1900
      Else
        C.Caption = C.Caption & vbLf & "(" & gNeuFldUnit(i, 2) & ")"
        C.Width = 900
      End If
        C.NumberFormat = "Scientific"
    ElseIf gs_myTable = "OrganMasses" Then
      If C.Caption = "Organ" Then
        C.Width = 2100
      Else
        C.Width = 900
        C.NumberFormat = "Scientific"
      End If
    ElseIf gs_NucSelected = "Devices" And gs_myTable = "BioPublic" Then
      If C.Caption = "Device" Then
        C.Width = 2100
      End If
    ElseIf gs_myTable = "KermaP" Or gs_myTable = "KermaN" Then
      C.NumberFormat = "Scientific"
      If C.Caption = "Energy" Then
        C.Caption = C.Caption & vbLf & "(MeV)"
      ElseIf C.Caption = "Kerma" Then
        C.Caption = C.Caption & vbLf & "(" & gsKerma_Unit & ")"
      End If
    End If
  Next i
  Set rsNuc = Nothing
  
  If gs_myTable = "OrganMasses" Then
    If gs_NucSelected = "Organ Masses ICRP 72" Then
      For i = 0 To 6
        aVar = xGrid(24, i)
        xGrid(24, i) = xGrid(25, i)
        xGrid(25, i) = xGrid(26, i)
        xGrid(26, i) = aVar
      Next i
    Else
      For i = 0 To 1
        aVar = xGrid(24, i)
'        XGrid(24, i) = XGrid(25, i)
'        XGrid(25, i) = XGrid(26, i)
'        XGrid(26, i) = aVar
      Next i
    End If
  End If
  
  If gs_myTable = "Electron" Or gs_myTable = "Alpha" Then
    If gd_PhotonFactor <> 1 Or gd_EnergyFactor <> 1 Then
      For j = 1 To MaxCol - 1
        Set C = grdEleDisplay.Columns(j)
        If (InStr(C.Caption, "Stop") <> 0 Or InStr(C.Caption, "CSDA") <> 0) Then
          For i = 0 To numRows - 1
            If (InStr(C.Caption, "CSDA") <> 0) Then
              xGrid(i, j) = xGrid(i, j) / gd_PhotonFactor
            Else
              xGrid(i, j) = xGrid(i, j) * gd_EnergyFactor * gd_PhotonFactor
            End If
          Next i
        End If
      Next j
    End If
  ElseIf gs_myTable = "Photon" Then
    If gd_PhotonFactor <> 1 Then
      For j = 1 To MaxCol - 1
        For i = 0 To numRows - 1
          xGrid(i, j) = xGrid(i, j) * gd_PhotonFactor
        Next i
      Next j
    End If
  ElseIf gs_myTable = "NeutronField" Then
    If gd_FieldFactor <> 1 Then
      For j = 1 To MaxCol - 1
        For i = 0 To numRows - 1
          If (IsNumeric(xGrid(i, j))) Then
            xGrid(i, j) = xGrid(i, j) * gd_FieldFactor
          End If
        Next i
      Next j
    End If
  ElseIf gs_myTable = "PhotonField" Then
    If gd_FieldFactor <> 1 Then
      If Mid(gs_NucSelected, 1, 1) = "O" Then
        j = 3
        For i = 0 To numRows - 1
          xGrid(i, j) = xGrid(i, j) * gd_FieldFactor
        Next i
      End If
    End If
  ElseIf gs_myTable = "KermaP" Or gs_myTable = "KermaN" Then
    If gd_KermaFactor <> 1 Then
      j = 1
      For i = 0 To numRows - 1
        xGrid(i, j) = xGrid(i, j) * gd_KermaFactor
      Next i
    End If
  ElseIf gs_myTable = "OrganMasses" Then
    If gd_MassFactor <> 1 Then
      If gs_NucSelected = "Organ Masses ICRP 72" Then
        For j = 1 To 6
          For i = 0 To 26
            xGrid(i, j) = xGrid(i, j) * gd_MassFactor
          Next i
        Next j
      Else
        For j = 1 To 2
          For i = 0 To 25
            xGrid(i, j) = xGrid(i, j) * gd_MassFactor
          Next i
        Next j
      End If
    End If
  ElseIf gs_myTable = "bioassay" Then
    If gd_BioassayFactor <> 1 And gd_BioassayFactor <> 0 Then
      gd_BioassayFactor = Log(0.5) / gd_BioassayFactor
      For i = 0 To numRows - 1
        dFac = Exp(-gd_BioassayFactor * xGrid(i, 0))
        For j = 1 To MaxCol - 1
          xGrid(i, j) = xGrid(i, j) * dFac
        Next j
      Next i
    End If
  End If

  grdEleDisplay.Row = 0
  grdEleDisplay.Col = 0
  grdEleDisplay.Array = xGrid
  grdEleDisplay.Refresh
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

Private Sub grdEleDisplay_DblClick()
  Const PROCEDURE_NAME As String = "grdEleDisplay_DblClick"
  Dim i As Integer, myX As Double, myY As Double, ColIndex As Integer
  Dim myCaption As String, myCount As Integer, j As Integer, myMin As Double
  
  If gs_myTable = "Material" Or gs_myTable = "Element" Or gs_myTable = "OrganMasses" _
    Or gs_myTable = "BioPublic" Then
    Exit Sub
  End If
  ColIndex = grdEleDisplay.Col
  gs_ColSelected = ColIndex
  If xGrid(2, gs_ColSelected) <= 0 Then
    MsgBox "Not enough data to plot."
    Exit Sub
  End If
  On Error GoTo Error_Handler
  
  With frmElePlot
' set up caption
    If gs_AbsorberType = "Ele" Then
      .Caption = gs_myTable & " data for " & gs_EleSelected
    ElseIf gs_AbsorberType = "Mat" Then
      .Caption = gs_myTable & " data for " & gs_MatSelected
    ElseIf gs_myTable = "bioassay" Then
      .Caption = Me.Caption
    Else
      .Caption = gs_myTable & " data for " & gs_NucSelected
    End If
      
    myCaption = frmEleTable.grdEleDisplay.Columns(0).Caption
    i = InStr(myCaption, vbLf)
    If (i > 0) Then
      Mid(myCaption, i, 1) = " "
    End If
    .gphRad.BottomTitle = myCaption
    myCaption = frmEleTable.grdEleDisplay.Columns(gs_ColSelected).Caption
    i = InStr(myCaption, vbLf)
    If (i > 0) Then
      Mid(myCaption, i, 1) = " "
    End If
    i = InStr(myCaption, gPhoType(8))
    If gs_myTable = "bioassay" Then
      If ColIndex = 2 Or ColIndex = 4 Then
        myCaption = myCaption & " (Bq-24 h/Bq-intake)"
      Else
        myCaption = myCaption & " (Bq/Bq-intake)"
      End If
    End If
    
' count points
    If (i > 0) Then
      For j = 0 To gn_NucCount
        If (xGrid(j, 0) = 20#) Then
          myCount = j + 1
          Exit For
        End If
      Next j
    ElseIf gs_myTable = "NeutronField" Then
      myCount = 0
      For j = 0 To gn_NucCount - 1
        If (Len(Trim(xGrid(j, gs_ColSelected))) > 0) Then
          myCount = j + 1
        End If
      Next j
    ElseIf gs_myTable = "PhotonField" Then
      If Mid(gs_NucSelected, 1, 1) = "O" And Mid(myCaption, 1, 4) = "Hp(0" Then
        myCount = 17
      Else
        myCount = gn_NucCount
      End If
    Else
      myCount = gn_NucCount
    End If
'    myCount = myCount - 1
    
' set up graph
    .gphRad.GraphType = graphLinLog
    .gphRad.GraphStyle = 4
    .gphRad.LeftTitle = myCaption
    .gphRad.NumSets = 1
'    .gphRad.IndexStyle = graphEnhanced
    .gphRad.NumPoints = myCount
    .gphRad.XAxisMin = xGrid(0, 0)
    .gphRad.YAxisMin = 0
    
    If gs_myTable = "NeutronField" Then
      .gphRad.XAxisMax = 1000#
      If xGrid(myCount - 1, gs_ColSelected) < 0 Then
         myCount = myCount - 7
        .gphRad.NumPoints = myCount
        .gphRad.XAxisMax = 100
      End If
      .gphRad.YAxisMax = xGrid(myCount - 1, gs_ColSelected)
    ElseIf gs_myTable = "bioassay" Then
       i = myCount - 1
       While (xGrid(i, 0) = 0 Or xGrid(i, 0) = "")
         i = i - 1
       Wend
       myCount = i + 1
      .gphRad.XAxisMax = xGrid(i, 0)
      .gphRad.YAxisMax = xGrid(1, gs_ColSelected)
      .gphRad.XAxisStyle = 0
      .gphRad.GraphType = graphLogLog
      .cmdAxis.Caption = "Set to Lin/Log"
      myMin = xGrid(2, gs_ColSelected)
      For i = 1 To myCount - 1
        If xGrid(i, gs_ColSelected) < myMin And xGrid(i, gs_ColSelected) <> 0 Then
          myMin = xGrid(i, gs_ColSelected)
        End If
      Next i
    Else
       i = myCount - 1
       While (xGrid(i, 0) = 0 Or xGrid(i, 0) = "")
         i = i - 1
       Wend
       myCount = i + 1
      .gphRad.XAxisMax = xGrid(i, 0)
      .gphRad.YAxisMax = xGrid(i, gs_ColSelected)
    End If
    
    For i = 1 To myCount - 1
      If .gphRad.YAxisMax < xGrid(i, gs_ColSelected) Then
        .gphRad.YAxisMax = xGrid(i, gs_ColSelected)
      End If
    Next i
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
      myY = xGrid(i, gs_ColSelected)
      .gphRad.Data(i + 1) = myY
      myX = xGrid(i, 0)
      .gphRad.XPos(i + 1) = myX
    Next i
    i = InStr(myCaption, gPhoType(8))
    If (i > 0) Then
      .gphRad.OverlayGraph = 1
      .gphRad.OverlayGraphStyle = 2
      .gphRad.OverlaySymbol = 0
      .gphRad.OverlayColor = 4
      j = 1
      For i = 0 To myCount - 1
        If (Xapprox(i + 1, 0) = "I") Then
          myY = xGrid(i, gs_ColSelected)
          .gphRad.OverlayData(j) = myY
          myX = xGrid(i, 0)
          .gphRad.OverlayXPos(j) = myX
          j = j + 1
        End If
      Next i
    End If
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

Private Sub grdEleDisplay_FetchCellStyle(ByVal Condition As Integer, ByVal Split As Integer, Bookmark As Variant, ByVal Col As Integer, ByVal CellStyle As TrueDBGrid80.StyleDisp)
  If gs_myTable = "Element" And gs_AtomType = "Mass" And gs_NucSelected <> "Elements" Then
    If (IsStable(Bookmark) = "Y") Then
      CellStyle.BackColor = RGB(220, 100, 100) 'red
    ElseIf (IsStable(Bookmark) = "P") Then
      CellStyle.BackColor = RGB(200, 200, 200) 'grey
    ElseIf (IsStable(Bookmark) = "C") Then
      CellStyle.BackColor = RGB(140, 140, 280) 'blue/violet
    End If
  ElseIf gs_NucSelected <> "Elements" Then
    If (Xapprox(Bookmark, 0) = "I") Then
      CellStyle.BackColor = RGB(220, 255, 200)
    End If
  End If
End Sub

Private Sub grdEleDisplay_HeadClick(ByVal ColIndex As Integer)
   grdEleDisplay.Col = ColIndex
   If gs_myTable = "Element" And gs_NucSelected = "Elements" Then
     xGrid.QuickSort 0, 99, ColIndex, XORDER_ASCEND, XTYPE_STRING
     grdEleDisplay.Refresh
   ElseIf gs_myTable = "Material" Then
     If ColIndex = 0 Then
       xGrid.QuickSort 0, gn_NucCount - 1, ColIndex, XORDER_ASCEND, XTYPE_INTEGER
     Else
       xGrid.QuickSort 0, gn_NucCount - 1, ColIndex, XORDER_ASCEND, XTYPE_STRING
     End If
     grdEleDisplay.Refresh
   End If
End Sub

Private Sub LogLogInterp(x1 As Double, Y1 As Double, x2 As Double, _
  Y2 As Double, x As Double, Result As Double)
  Dim lX1 As Double, lX2 As Double, lY1 As Double, lY2 As Double, _
    lX As Double

  lX1 = Log(x1)
  lX2 = Log(x2)
  lY1 = Log(Y1)
  lY2 = Log(Y2)
  lX = Log(x)
  Result = lY1 + ((lX - lX1) * (lY2 - lY1) / (lX2 - lX1))
  Result = Exp(Result)

End Sub

