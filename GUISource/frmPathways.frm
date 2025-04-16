VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Begin VB.Form frmPathway 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E6ECCE&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Pathway"
   ClientHeight    =   6960
   ClientLeft      =   3456
   ClientTop       =   2328
   ClientWidth     =   9264
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.6
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6960
   ScaleWidth      =   9264
   Begin VB.Frame fraOutput 
      BackColor       =   &H00E6ECCE&
      Caption         =   "Output Mode"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   240
      TabIndex        =   28
      ToolTipText     =   "Allows the edit of activity (or mass) transport by chemical group and activity by nuclide"
      Top             =   3840
      Width           =   2655
      Begin VB.OptionButton optOutput 
         BackColor       =   &H00E6ECCE&
         Caption         =   "Nuclide && transport at end only"
         Height          =   495
         Index           =   3
         Left            =   240
         TabIndex        =   33
         Top             =   1800
         Width           =   2085
      End
      Begin VB.OptionButton optOutput 
         BackColor       =   &H00E6ECCE&
         Caption         =   "Nuclide && transport, each step"
         Height          =   495
         Index           =   2
         Left            =   240
         TabIndex        =   32
         ToolTipText     =   "Also edit the nuclide distribution of what has been deposited"
         Top             =   1235
         Width           =   2300
      End
      Begin VB.OptionButton optOutput 
         BackColor       =   &H00E6ECCE&
         Caption         =   "Transport each step"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   30
         Top             =   840
         Width           =   2375
      End
      Begin VB.OptionButton optOutput 
         BackColor       =   &H00E6ECCE&
         Caption         =   "None"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   29
         Top             =   435
         Value           =   -1  'True
         Width           =   1575
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Reset"
      Height          =   375
      Left            =   7560
      TabIndex        =   19
      ToolTipText     =   "Restore original data"
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&OK"
      Height          =   375
      Left            =   7560
      TabIndex        =   18
      ToolTipText     =   "Save data and close"
      Top             =   600
      Width           =   1215
   End
   Begin TabDlg.SSTab sstPathway 
      Height          =   3735
      Left            =   3240
      TabIndex        =   5
      Top             =   2280
      Width           =   5775
      _ExtentX        =   10181
      _ExtentY        =   6583
      _Version        =   393216
      Tabs            =   4
      TabsPerRow      =   2
      TabHeight       =   706
      BackColor       =   15133902
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Piping"
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "fraPiping"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "cmdPipingEdit"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "Filter"
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "fraFilter"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Generic"
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "cmdSuPo"
      Tab(2).Control(1)=   "fraSuPoModel"
      Tab(2).ControlCount=   2
      TabCaption(3)   =   "Air Leakage"
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "FraLeak"
      Tab(3).ControlCount=   1
      Begin VB.CommandButton cmdSuPo 
         Caption         =   "Edit Selected Model"
         Height          =   1095
         Left            =   -71160
         TabIndex        =   34
         Top             =   1680
         Width           =   1455
      End
      Begin VB.Frame fraFilter 
         Caption         =   "Filter Flow Data"
         Height          =   1695
         Left            =   -74400
         TabIndex        =   23
         Top             =   1320
         Width           =   3975
         Begin VB.CommandButton cmdFilterFailure 
            Caption         =   "Failure"
            Enabled         =   0   'False
            Height          =   615
            Left            =   2160
            TabIndex        =   31
            ToolTipText     =   "The release of radionuclides at filter failure is not active at this time"
            Top             =   600
            Width           =   1455
         End
         Begin VB.CommandButton cmdFilterEdit 
            Caption         =   "Efficiency"
            Height          =   615
            Left            =   360
            TabIndex        =   24
            Top             =   600
            Width           =   1455
         End
      End
      Begin VB.Frame FraLeak 
         Caption         =   "Air Leakage Rates"
         Height          =   1695
         Left            =   -73920
         TabIndex        =   21
         Top             =   1320
         Width           =   3015
         Begin VB.CommandButton cmdLeakEdit 
            Caption         =   "Edit Rates.."
            Height          =   615
            Left            =   720
            TabIndex        =   22
            Top             =   600
            Width           =   1575
         End
      End
      Begin VB.Frame fraSuPoModel 
         Caption         =   "Model Selection"
         Height          =   2055
         Left            =   -74640
         TabIndex        =   17
         Top             =   1200
         Width           =   3135
         Begin VB.OptionButton optAerosol 
            Caption         =   "Aerosols (non-Iodine) plus all Iodine forms"
            Height          =   495
            Index           =   1
            Left            =   240
            TabIndex        =   36
            Top             =   1200
            Width           =   2655
         End
         Begin VB.OptionButton optAerosol 
            Caption         =   "&Aerosols (all forms) plus Elemental and Organic"
            Height          =   495
            Index           =   0
            Left            =   240
            TabIndex        =   35
            Top             =   480
            Value           =   -1  'True
            Width           =   2655
         End
      End
      Begin VB.CommandButton cmdPipingEdit 
         Caption         =   "Edit &Pipe Coefficients.."
         Height          =   735
         Left            =   2880
         TabIndex        =   16
         Top             =   1800
         Width           =   1935
      End
      Begin VB.Frame fraPiping 
         Caption         =   "Model Selection"
         Height          =   2295
         Left            =   360
         TabIndex        =   13
         Top             =   960
         Width           =   2055
         Begin VB.OptionButton optPipingModel 
            Caption         =   "&User-Specified Removal Coefficients"
            Height          =   855
            Index           =   0
            Left            =   240
            TabIndex        =   15
            Top             =   360
            Width           =   1695
         End
         Begin VB.OptionButton optPipingModel 
            Caption         =   "&Piping Deposition Model"
            Height          =   650
            Index           =   1
            Left            =   240
            TabIndex        =   14
            Top             =   1440
            Width           =   1455
         End
      End
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   372
      Left            =   0
      TabIndex        =   12
      Top             =   6588
      Width           =   9264
      _ExtentX        =   16341
      _ExtentY        =   656
      Style           =   1
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame fraTransferMech 
      BackColor       =   &H00E6ECCE&
      Caption         =   "Transfer Mechanism"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Left            =   240
      TabIndex        =   4
      ToolTipText     =   "Determines the method of transport and decontamination between comaprtments"
      Top             =   1800
      Width           =   2655
      Begin VB.OptionButton optMech 
         BackColor       =   &H00E6ECCE&
         Caption         =   "Piping"
         Enabled         =   0   'False
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   27
         Top             =   360
         Width           =   975
      End
      Begin VB.OptionButton optMech 
         BackColor       =   &H00E6ECCE&
         Caption         =   "Generic"
         Height          =   375
         Index           =   2
         Left            =   240
         TabIndex        =   26
         Top             =   1080
         Width           =   2055
      End
      Begin VB.OptionButton optMech 
         BackColor       =   &H00E6ECCE&
         Caption         =   "Air leakage"
         Height          =   375
         Index           =   3
         Left            =   240
         TabIndex        =   25
         Top             =   1440
         Width           =   1935
      End
      Begin VB.OptionButton optMech 
         BackColor       =   &H00E6ECCE&
         Caption         =   "Filter"
         Height          =   375
         Index           =   1
         Left            =   240
         TabIndex        =   20
         Top             =   720
         Width           =   1095
      End
   End
   Begin VB.HScrollBar hsbCurrent 
      Height          =   255
      Left            =   5640
      Max             =   40
      Min             =   1
      TabIndex        =   9
      Top             =   593
      Value           =   1
      Width           =   1215
   End
   Begin VB.TextBox txtPathName 
      Height          =   375
      Left            =   2280
      TabIndex        =   0
      Top             =   1080
      Width           =   3255
   End
   Begin VB.ComboBox cboTo 
      Height          =   360
      Left            =   2280
      Style           =   2  'Dropdown List
      TabIndex        =   3
      ToolTipText     =   "Control the start and finish of a pathway from a drop down selection of all the compartments previously input"
      Top             =   600
      Width           =   2175
   End
   Begin VB.ComboBox cboFrom 
      Height          =   360
      Left            =   2280
      Style           =   2  'Dropdown List
      TabIndex        =   1
      ToolTipText     =   "Control the start and finish of a pathway from a drop down selection of all the compartments previously input"
      Top             =   120
      Width           =   2175
   End
   Begin VB.Label lblPathway 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Next"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   2
      Left            =   6960
      TabIndex        =   11
      Top             =   600
      Width           =   480
   End
   Begin VB.Label lblPathway 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Previous"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   5
      Left            =   4680
      TabIndex        =   10
      Top             =   600
      Width           =   930
   End
   Begin VB.Label lblPathway 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Pathway Name:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   4
      Left            =   480
      TabIndex        =   8
      Top             =   1140
      Width           =   1620
   End
   Begin VB.Label lblCurrent 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "No Pathways Yet."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4560
      TabIndex        =   7
      Top             =   120
      Width           =   2610
   End
   Begin VB.Label lblPathway 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "To Compartment:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   345
      TabIndex        =   6
      Top             =   660
      Width           =   1785
   End
   Begin VB.Label lblPathway 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "From Compartment:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   135
      TabIndex        =   2
      Top             =   180
      Width           =   2025
   End
End
Attribute VB_Name = "frmPathway"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const AER = 0
Const ELI = 1
Const ORI = 2
Const EDGE = 3960

'Default values for 1 timestep
Const DefaultFlow = 0
Const DefaultPiping = 1
Const DefaultFilter = 0
Const DefaultSuPool = 1
Const DefaultLeakage = 0

Dim DataModify As Boolean
Dim IgnoreModify As Boolean
Private DataOwnerType As String
Private ThisPathway As Integer
Private IodineForm As Integer
Private TheFormEdit As Boolean
Private TheEditType As String
Private IgnoreScroll As Boolean

Private Sub cboFrom_Click()
  If IgnoreModify Or cboFrom.ListIndex < 0 Then Exit Sub
  
  'User sets From compartment to Unused
  If UCase(cboFrom.Text) Like "*UNUSED" Then
    txtPathName = "" 'This flags delete - JCK
  ElseIf UCase(txtPathName.Text) Like "*UNUSED*" Then
    'When a Pathway is first selected, the txtPathName text says "Unused"
    'Replace with compartment number and name
    txtPathName = Mid(cboFrom.Text, InStr(cboFrom.Text, " ")) + " to "
    DisableInvalidOptions
    DataModify = True
  End If
End Sub

Private Sub DisableInvalidOptions()
Dim EnableState As Boolean

  'If 'From Environment' is selected, gray out invalid selections
  EnableState = Not (UCase(cboFrom.List(cboFrom.ListIndex)) Like "*ENVIRONMENT*")
  With optMech
    .Item(0).Enabled = EnableState
    If EnableState = False Then
        'JCK
        .Item(1).Value = True
    End If
    .Item(2).Enabled = EnableState
    .Item(3).Enabled = EnableState
  End With

End Sub

Private Sub cboTo_Click()

  If IgnoreModify Or cboTo.ListIndex < 0 Then Exit Sub
  
  If UCase(cboTo.Text) Like "*UNUSED" Then
    txtPathName = "" 'This flags delete - JCK
  ElseIf UCase(txtPathName.Text) Like "* TO " Then
    'Add second compartment
    txtPathName = txtPathName + Mid(cboTo.Text, InStr(cboTo.Text, " ") + 1)
    DataModify = True
  End If
End Sub

Private Sub cmdFilterFailure_Click()
   Load frmFilterFailure
   frmFilterFailure.FilterType = "Pathway"
   frmFilterFailure.Show vbModal
End Sub

Private Sub Form_Resize()
  If WindowState = vbNormal Then
    Left = frmRadtrad.Left + EDGE
    Top = frmRadtrad.Top + 1000
    AdjustToScreen Me
  End If
End Sub

Private Sub optAerosol_Click(Index As Integer)
    DataModify = True
End Sub

Private Sub optMech_Click(Index As Integer)
Dim i As Integer

 If Not IgnoreModify Then DataModify = True
 
 For i = 0 To 3
   sstPathway.TabEnabled(i) = optMech(i).Value
   If sstPathway.TabEnabled(i) Then
     sstPathway.Tab = i ' bring tab to front
    ' If i = Index Then optActive(0) = True  'Assume new checkmark means active;
   End If
 Next i

 ' Belcourt says when clicking the piping model, automatically
 ' select the user defined coefficients in the piping tab control
 ' Piping model is index 0
 If Index = 0 Then
    ' Belcourt says if neither user defined or brockmann-bixler
    ' is selected, then push the user defined button
    If optPipingModel.Item(0).Value = False And optPipingModel.Item(1).Value = False Then
        optPipingModel.Item(0).Value = True
    End If
 End If

End Sub

Public Sub Reset()
    cmdCancel_Click
End Sub

Private Sub cmdCancel_Click()
Dim i

 IgnoreModify = True
 InitControls
 loadCompartmentMenu cboFrom
 loadCompartmentMenu cboTo
 With PathwayArr(CurrentIndex)
   cboTo.ListIndex = .ToComp - 1
   For i = 0 To 3
     optMech(i).Value = .TransferMechanism(i + 1)
   Next i
   cboFrom.ListIndex = .FromComp - 1
 End With
 IgnoreModify = False
 DataModify = False
 
End Sub

Private Sub cmdExit_Click() 'OK
  IgnoreModify = False
  Unload Me
End Sub

Private Sub cmdFilterEdit_Click()
Dim frmTPFilter As New frmData ' automatic data form

  Me.DataOwner = "dfTPFilter"
   With frmTPFilter
    .Show vbModeless, Me
    .EnableFilterFailure
   End With
' Set frmTPFilter = Nothing
End Sub

Private Sub cmdLeakEdit_Click()
Dim frmTPLeak As New frmData ' automatic data form

  Me.DataOwner = "dfTPLeak"
  frmTPLeak.Show vbModeless, Me
'  Set frmTPLeak = Nothing
End Sub

Private Sub cmdPipingEdit_Click()
Dim frmTPiping As New frmData ' automatic data form
  
    If optPipingModel(0) Then ' user defined removal coefficients
       Me.DataOwner = "dfTPiping"
       frmTPiping.Show , Me
    Else
      Load frmBrockBixler
      With frmBrockBixler
        .Show
      End With
    End If

End Sub

Private Sub cmdSuPo_Click()
      
    Me.DataOwner = "dfTPSupo"
    With frmGeneric
        .BackColor = GetBackColor("Pathway")
        .Show vbModeless, Me
    End With
End Sub

Private Sub Form_Load()
  
  SetTags
  IgnoreModify = True
  loadCompartmentMenu cboFrom
  loadCompartmentMenu cboTo
  hsbCurrent.Value = frmRadtrad.cboPathway.ListIndex + 1 ' See InitControls here
  IgnoreModify = False
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
    
    If txtPathName = "" Then 'JCK - Delete flag changed 3/2006
      If DeletePathway(CurrentIndex, True) = 0 Then
        'User cancelled delete
        cmdCancel_Click
        cancel = 1
      End If
    Else
      If DataModify And Not IgnoreModify Then
        cancel = EditData
        If cancel = 0 Then frmRadtrad.SaveState True
      End If
    End If
    
    If cancel = 0 Then frmRadtrad.cboPathway.Enabled = True
    
End Sub

Private Sub hsbCurrent_Change()
'JCK 6/2006 -----------------
  If IgnoreScroll Then Exit Sub
  
  If Me.CurrentIndex > 0 And Not IgnoreModify Then
    If txtPathName = "" Then
        If DeletePathway(Me.CurrentIndex, True) Then
          IgnoreScroll = True
          IgnoreModify = True
          With frmRadtrad
            If hsbCurrent < CurrentIndex Then
                .cboPathway.ListIndex = hsbCurrent - 1
                Me.CurrentIndex = hsbCurrent 'Triggers InitControls(), which resets IgnoreModify
            Else
                .cboPathway.ListIndex = CurrentIndex - 1
                hsbCurrent = CurrentIndex
                InitControls 'Resets IgnoreModify
            End If
            IgnoreScroll = False
          End With
          Exit Sub
        End If
    End If
  End If
  '-----------------------------
  
  Me.CurrentIndex = hsbCurrent.Value
  With frmRadtrad
    .ComboUpdate = False
    .cboPathway.ListIndex = CurrentIndex - 1
    .ComboUpdate = True
  End With
End Sub

Private Sub hsbCurrent_Scroll()
  hsbCurrent_Change
End Sub

Private Sub lblPathway_Click(Index As Integer)
    Select Case Index
    Case 5: ' previous pathway
      If CurrentIndex = 1 Then Exit Sub
      If hsbCurrent.Value = CurrentIndex - 1 Then
        hsbCurrent_Change
      Else
        hsbCurrent.Value = CurrentIndex - 1
      End If
    Case 2: ' next pathway
      If CurrentIndex = MaxPathways Then Exit Sub
      If hsbCurrent.Value = CurrentIndex + 1 Then
        hsbCurrent_Change
      Else
        hsbCurrent.Value = CurrentIndex + 1
      End If
  End Select
End Sub

Private Sub optOutput_Click(Index As Integer)
    DataModify = True
End Sub

Private Sub optPipingModel_Click(Index As Integer)

  'PathwayArr(CurrentIndex).TM0Piping.AModelNum = Index + 1 ' Changed - JCK
    
    Select Case Index
        Case 0
            PathwayArr(CurrentIndex).TM0Piping.AModelNum = 1
        Case 1
            If PathwayArr(CurrentIndex).TM0Piping.AModelNum < 2 Then
                'May be 2 or 3
                PathwayArr(CurrentIndex).TM0Piping.AModelNum = 2
            End If
    End Select
    DataModify = True
End Sub

Private Sub txtPathName_Change()
  If UCase(txtPathName) <> "UNUSED" Then 'JCK
    DataModify = True
  End If
  'If txtPathName <> "Unused" Then optActive(0).value = True
End Sub

Public Property Get DataOwner() As String
  DataOwner = DataOwnerType
End Property

Public Property Let DataOwner(ByVal vNewValue As String)
  DataOwnerType = vNewValue
End Property

Public Property Get CurrentIndex() As Integer
  CurrentIndex = ThisPathway
End Property

Public Property Let CurrentIndex(ByVal vNewValue As Integer)
   Dim cancel As Integer
   
   cancel = 0
   If DataModify And Not IgnoreModify Then
        cancel = EditData
        If cancel = 0 Then frmRadtrad.SaveState True
    End If
   If cancel = 0 Then
     ThisPathway = vNewValue
     InitControls
   End If
End Property

Public Property Get Iodine() As Integer
  Iodine = IodineForm
End Property

Public Property Let Iodine(ByVal vNewValue As Integer)
  IodineForm = vNewValue
End Property

Public Sub SaveData()
  Dim i, m
  ' save control values in user-defined types
  
  With PathwayArr(CurrentIndex)
    .FromComp = cboFrom.ListIndex + 1
    .ToComp = cboTo.ListIndex + 1
    If .Name = "Unused" Then
        'New pathway -- add to XQ map
        AddPathXQ CurrentIndex
    End If
    .Name = txtPathName
    .Active = True
    
    For i = 0 To 3
      If optOutput(i) Then
        .PrintDetail = i
      End If
      
      .TransferMechanism(i + 1) = optMech(i).Value
      If optMech(i).Value = True Then
        Select Case i
          Case 0
              With .TM0Piping
                If .Count = 0 Then
                  .AModelNum = 1
                  .Count = 1
                   ReDim .times(1 To 1) As Single, _
                    .FlowRates(1 To 1) As Single, _
                    .AerosolDF(1 To 1) As Single, _
                    .ElemIDF(1 To 1) As Single, _
                    .OrgIDF(1 To 1) As Single
          
                  .FlowRates(1) = DefaultFlow
                  .AerosolDF(1) = DefaultPiping
                  .ElemIDF(1) = DefaultPiping
                  .OrgIDF(1) = DefaultPiping
                
                End If
              End With
          Case 1
              With .TM1Filter
                If .Count = 0 Then
                  .Count = 1
                  ReDim .times(1 To 1) As Single, .FlowRates(1 To 1) As Single, _
                            .AerH(1 To 1) As Single, .ElemIH(1 To 1) As Single, _
                              .OrgIH(1 To 1) As Single
                              
                  .FlowRates(1) = DefaultFlow
                  .AerH(1) = DefaultFilter
                  .ElemIH(1) = DefaultFilter
                  .OrgIH(1) = DefaultFilter
                End If
              End With
          Case 2
            With .TM2Supo
              If .Count = 0 Then
                .Count = 1
                ReDim .times(1 To 1) As Single, .AerosolDF(1 To 1) As Single, _
                        .FlowRatesAER(1 To 1) As Single, .ElemIDF(1 To 1) As Single, _
                          .OrgIDF(1 To 1) As Single, .FlowRatesELM(1 To 1) As Single, _
                            .FlowRatesORG(1 To 1) As Single 'JCK
                             
                '.FlowRates(1) = DefaultFlow
                .FlowRatesAER(1) = DefaultFlow
                .AerosolDF(1) = DefaultSuPool
                .FlowRatesELM(1) = DefaultFlow
                .ElemIDF(1) = DefaultSuPool
                .FlowRatesORG(1) = DefaultFlow
                .OrgIDF(1) = DefaultSuPool
              End If
              .Mode = IIf(optAerosol(0), 0, 1)
            End With
          Case 3
            With .TM3Leak
              If .Count = 0 Then
                .Count = 1
                ReDim .times(1 To 1) As Single, _
                        .LeakageRates(1 To 1) As Single
                .LeakageRates(1) = DefaultLeakage
              End If
            End With
        End Select
      End If
    Next
  End With
  
  ' update the main combo box
   With frmRadtrad.cboPathway
    .Enabled = True
    .RemoveItem CurrentIndex - 1
    .AddItem Str(CurrentIndex) + Space(1) + PathwayArr(CurrentIndex).Name, _
           CurrentIndex - 1
    frmRadtrad.ComboUpdate = False ' changing listindex triggers cbo_click
    .ListIndex = CurrentIndex - 1
    frmRadtrad.ComboUpdate = True
    .Enabled = False
  End With
  
  With PathwayArr(CurrentIndex).TM0Piping
    Select Case True
      Case optPipingModel(0)
       .AModelNum = 1 ' user defined coefficients
      Case optPipingModel(1)
       .AModelNum = 2 ' brockmann-bixler
    End Select
  End With
End Sub

Public Sub InitControls() ' set controls to current pathway
  Dim i As Integer
  Dim m
  ' assign user-defined type values to the controls
  ' This is done when current index of PathwayArr changes.
   Dim AControl As Control
  On Error GoTo errorhandler
  For Each AControl In Controls
  If TypeOf AControl Is TextBox Then AControl.Text = ""
    If TypeOf AControl Is TextBox Or TypeOf AControl Is ComboBox Then
      AControl.BackColor = vbWhite
      AControl.ForeColor = vbBlack
    End If
  Next
  
  IgnoreModify = True ' dont trigger cbo click
  
' Belcourt moved the piping model selection above the transfer
' mechanism selection.  This so we can handle the piping model
' selection and know whether a model has been picked (value = true)
' or if both piping models are unselected.  We want to pick the
' user defined model if the user hasn't already made a selection.

' initialize the data on the tab form
  With PathwayArr(CurrentIndex).TM0Piping
    Select Case .AModelNum
      Case 0:
        optPipingModel(0) = False
        optPipingModel(1) = False
      Case 1:
        optPipingModel(0) = True ' User
      Case 2, 3:
        optPipingModel(1) = True ' brockmann
    End Select
  End With
    
  With PathwayArr(CurrentIndex)
    txtPathName = .Name
    'cboFrom.ListIndex = .FromComp - 1
    cboTo.ListIndex = .ToComp - 1
    'optActive(0) = .Active ' Doesn't do anything
     
     For i = 0 To 3
       optMech(i).Value = .TransferMechanism(i + 1)
     Next i
     cboFrom.ListIndex = .FromComp - 1
     DisableInvalidOptions

    ' Belcourt initializes transfer mechanism if nothing is selected
    If optMech.Item(0).Value = False And optMech.Item(1).Value = False And optMech.Item(2).Value = False And optMech.Item(3).Value = False Then
      optMech.Item(3).Value = True
    End If
    optOutput(.PrintDetail) = True
  End With
  
  With PathwayArr(CurrentIndex).TM2Supo
    'cmdSuPo.Enabled = False
    'For m = AER To ORI Removed for 3.10 JCK 11/2005
    '  Select Case .Models(m + 1)
    '    Case True:
    '       'chksupo(m).Value = 1
    '       cmdSuPo.Enabled = True
    '       Exit For 'Added
    '    'Case False:
    '    '   chksupo(m).Value = 0
    '  End Select
    'Next m
    optAerosol(.Mode) = True
  End With
   
  lblCurrent = "This is Pathway " + Format(CurrentIndex) + Space(1)
  DataModify = False
  IgnoreModify = False

  Exit Sub
errorhandler:
Dim Msg As String
If Err.Number <> 0 Then
    Msg = "Pathway initControls: Error # " & Str(Err.Number) & " was generated by " _
            & Err.Source & Chr(13) & Err.Description
    MsgBox Msg, vbOKOnly + vbExclamation, "Error"
End If
End Sub

Private Sub txtPathName_GotFocus()
  SetSelect txtPathName
End Sub

Public Property Get PassFormEdit() As Boolean
  PassFormEdit = TheFormEdit
End Property

Public Property Let PassFormEdit(ByVal vNewValue As Boolean)
  
  TheFormEdit = vNewValue
  If Not TheFormEdit Then ' we failed an edit
     ShowErrorMessage EditType, "Pathway " + PathwayArr(CurrentIndex).Name
  End If

End Property

Public Property Get EditType() As String
   EditType = TheEditType
End Property

Public Property Let EditType(ByVal vNewValue As String)
  TheEditType = vNewValue
  PassFormEdit = DoFormEdit(Me, TheEditType)
End Property

Public Sub SetTags()
  txtPathName.Tag = "name"
      cboFrom.Tag = "fill"
       cboTo.Tag = "fill"
End Sub

Public Function EditData() As Integer
Dim cancel As Integer
Dim i%

    cancel = 0
    For i = 0 To 3
        If optMech(i) = True Then Exit For
    Next
    
    If i = 4 Then
        MsgBox "You must select a Transfer Mechanism", vbExclamation, _
                    "Pathway Data Incomplete"
        cancel = 1
    Else
        EditType = "Named"
        If PassFormEdit Then
             EditType = "Filled"
             If PassFormEdit Then
                 SaveData
                 frmRadtrad.SaveState True
             Else
                cancel = 1 ' failed fill edit;  re-edit when OK pressed
             End If
        Else
             cancel = 1
        End If
    End If
    EditData = cancel
End Function

