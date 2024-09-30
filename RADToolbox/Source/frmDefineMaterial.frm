VERSION 5.00
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form frmDefineMaterial 
   Caption         =   "Define a new material"
   ClientHeight    =   4395
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6930
   LinkTopic       =   "Form1"
   ScaleHeight     =   4395
   ScaleWidth      =   6930
   StartUpPosition =   3  'Windows Default
   Begin VB.Data dataEle 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   4920
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   2280
      Visible         =   0   'False
      Width           =   1065
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4800
      TabIndex        =   4
      Top             =   2880
      Width           =   1095
   End
   Begin TrueDBGrid80.TDBGrid grdMaterialDef 
      Height          =   3255
      Left            =   1200
      TabIndex        =   3
      Top             =   720
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   5741
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "Element"
      Columns(0).DataField=   ""
      Columns(0).DataWidth=   2
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Mass Fraction"
      Columns(1).DataField=   ""
      Columns(1).NumberFormat=   "Scientific"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   2
      Splits(0)._UserFlags=   0
      Splits(0).RecordSelectorWidth=   503
      Splits(0).DividerColor=   12632256
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=2"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=1508"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1429"
      Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(5)=   "Column(1).Width=2328"
      Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=2249"
      Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
      Splits.Count    =   1
      PrintInfos(0)._StateFlags=   0
      PrintInfos(0).Name=   "piInternal 0"
      PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageHeaderHeight=   0
      PrintInfos(0).PageFooterHeight=   0
      PrintInfos.Count=   1
      AllowDelete     =   -1  'True
      DataMode        =   4
      DefColWidth     =   0
      HeadLines       =   1
      FootLines       =   1
      MultipleLines   =   0
      CellTipsWidth   =   0
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
      _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=252,.bold=0,.fontsize=825,.italic=0"
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
      _StyleDefs(38)  =   "Named:id=33:Normal"
      _StyleDefs(39)  =   ":id=33,.parent=0"
      _StyleDefs(40)  =   "Named:id=34:Heading"
      _StyleDefs(41)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(42)  =   ":id=34,.wraptext=-1"
      _StyleDefs(43)  =   "Named:id=35:Footing"
      _StyleDefs(44)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(45)  =   "Named:id=36:Selected"
      _StyleDefs(46)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(47)  =   "Named:id=37:Caption"
      _StyleDefs(48)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(49)  =   "Named:id=38:HighlightRow"
      _StyleDefs(50)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(51)  =   "Named:id=39:EvenRow"
      _StyleDefs(52)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(53)  =   "Named:id=40:OddRow"
      _StyleDefs(54)  =   ":id=40,.parent=33"
      _StyleDefs(55)  =   "Named:id=41:RecordSelector"
      _StyleDefs(56)  =   ":id=41,.parent=34"
      _StyleDefs(57)  =   "Named:id=42:FilterBar"
      _StyleDefs(58)  =   ":id=42,.parent=33"
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   1200
      TabIndex        =   1
      Top             =   120
      Width           =   2895
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4800
      TabIndex        =   0
      Top             =   3480
      Width           =   1095
   End
   Begin VB.Label Label2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Note: When you have finished entering data, you must click on the row below the data you have entered."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   4320
      TabIndex        =   5
      Top             =   720
      Width           =   2415
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Material name:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   240
      Width           =   1035
   End
End
Attribute VB_Name = "frmDefineMaterial"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MODULE_NAME As String = "frmDefineMaterial"
Dim xMatDef As New XArrayDB

Private Sub cmdCancel_Click()
  gs_UserMaterialName = "Cancel"
  Me.Hide
End Sub

Private Sub Form_Load()
 Const PROCEDURE_NAME As String = "Form_Load"
  Dim sHeader(11) As String, RBE As Boolean, i As Integer, j As Integer
  Dim sIn As String, din As Double, C As Column, sLowHigh
  
  On Error GoTo Error_Handler
  PositionForm Me
  xMatDef.ReDim 0, 19, 0, 1
  
  grdMaterialDef.Array = xMatDef
  grdMaterialDef.Refresh
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
  cmdExit_Click
End Sub

Private Sub cmdExit_Click()
Dim i As Integer, sStr As String, rsEle As Recordset, total As Double
Dim j As Integer, bMatch As Boolean
  
  If Len(Trim(txtName)) = 0 Then
    MsgBox "Please enter a material name"
    Exit Sub
  End If
  total = 0
  For i = 0 To 19
    If Trim(xMatDef(i, 0)) <> "" Then
      If Not IsNumeric(xMatDef(i, 1)) Then
        MsgBox xMatDef(i, 1) & " must be a number"
        Exit Sub
      End If
      If xMatDef(i, 1) > 1 Then
        MsgBox xMatDef(i, 1) & " should be <= 1"
        Exit Sub
      End If
      total = total + xMatDef(i, 1)
    End If
  Next i
  If total <= 0 Then
    MsgBox "The sum of the fractions must be > 0"
    Exit Sub
  End If
  If total < 1 Then
    MsgBox "Fractions sum to " & total & vbCrLf & "They will be renormalized to 1.0"
    For i = 0 To 19
      If Trim(xMatDef(i, 0)) <> "" Then
        xMatDef(i, 1) = xMatDef(i, 1) / total
      End If
    Next i
    total = 1
  End If
  If gs_myTable = "Alpha" Or gs_myTable = "Electron" Or gs_myTable = "Photon" Or gs_myTable = "KermaN" Or gs_myTable = "KermaP" Then
    dataEle.DatabaseName = gs_DataPath & gs_myTable & ".mdb"
  Else
    dataEle.DatabaseName = gs_DataPath & "geoProg" & ".mdb"
  End If
  gs_UserMaterialName = txtName
  g_UserMaterial.ReDim 0, 20, 0, 1
  g_NumUserEles = 0
  For i = 0 To 19
    If Trim(xMatDef(i, 0)) <> "" Then
      bMatch = False
      sStr = Mid(xMatDef(i, 0), 1, 1)
      sStr = UCase(sStr)
      If Len(Trim(xMatDef(i, 0))) > 1 Then
        xMatDef(i, 0) = sStr & Mid(xMatDef(i, 0), 2, 1)
      Else
        xMatDef(i, 0) = sStr
      End If
      If gs_myTable = "KermaN" Then
        dataEle.RecordSource = "Select element from elements where Element = '" & _
          xMatDef(i, 0) & "'"
        dataEle.Refresh
        If dataEle.Recordset.RecordCount < 1 Then
          dataEle.RecordSource = "Select element from elements"
          dataEle.Refresh
          dataEle.Recordset.MoveFirst
          While Not dataEle.Recordset.EOF
            sStr = dataEle.Recordset.Fields(0)
            j = InStr(sStr, "-")
            If j > 0 Then
              If Mid(sStr, 1, j - 1) = xMatDef(i, 0) Then
                bMatch = True
              End If
            End If
            dataEle.Recordset.MoveNext
          Wend
        Else
          bMatch = True
        End If
      ElseIf gs_myTable = "Photon" Then
        dataEle.RecordSource = "Select Name from elements where Name = '" & _
          xMatDef(i, 0) & "'"
      ElseIf gs_myTable = "KermaP" Then
        dataEle.RecordSource = "Select element from elements where Element = '" & _
          xMatDef(i, 0) & "'"
      ElseIf gs_myTable = "Electron" Or gs_myTable = "Alpha" Then
        dataEle.RecordSource = "Select Name from elements where Name = '" & _
          xMatDef(i, 0) & "'"
      Else
        dataEle.RecordSource = "Select Symbol from elements where Symbol = '" & _
          xMatDef(i, 0) & "'"
      End If
      dataEle.Refresh
      If dataEle.Recordset.RecordCount < 1 And Not bMatch Then
        MsgBox xMatDef(i, 0) & " is not a valid element name and will not be used"
      Else
        g_UserMaterial(g_NumUserEles, 0) = xMatDef(i, 0)
        g_UserMaterial(g_NumUserEles, 1) = xMatDef(i, 1)
        g_NumUserEles = g_NumUserEles + 1
      End If
    End If
  Next i
  If g_NumUserEles < 1 Then
    MsgBox "No valid elements entered"
  End If
  b_UserDefinedMat = True
  Me.Hide
'  End
End Sub
