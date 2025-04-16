VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmHenry 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Data Form"
   ClientHeight    =   6510
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5790
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6510
   ScaleWidth      =   5790
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   2040
      TabIndex        =   47
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   720
      TabIndex        =   46
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   2
      Left            =   3360
      TabIndex        =   45
      Top             =   2640
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   0
      Left            =   2040
      TabIndex        =   44
      Top             =   1920
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   2040
      TabIndex        =   43
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   2040
      TabIndex        =   42
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   2040
      TabIndex        =   41
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   2040
      TabIndex        =   40
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   2040
      TabIndex        =   39
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   2040
      TabIndex        =   38
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   2040
      TabIndex        =   37
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtCol1 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   2040
      TabIndex        =   36
      Top             =   5160
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   3360
      TabIndex        =   35
      Top             =   5160
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   3360
      TabIndex        =   34
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   3360
      TabIndex        =   33
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   3360
      TabIndex        =   32
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   3360
      TabIndex        =   31
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   3360
      TabIndex        =   30
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   3360
      TabIndex        =   7
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   3360
      TabIndex        =   5
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtCol2 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   0
      Left            =   3360
      TabIndex        =   3
      Top             =   1920
      Width           =   1315
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4080
      TabIndex        =   28
      ToolTipText     =   "Save data and close"
      Top             =   600
      Width           =   1575
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Reset"
      Height          =   375
      Left            =   4080
      TabIndex        =   27
      ToolTipText     =   "Restore original data"
      Top             =   120
      Width           =   1575
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   9
      Left            =   720
      TabIndex        =   14
      Top             =   5160
      Width           =   1315
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   13
      Top             =   6135
      Width           =   5790
      _ExtentX        =   10213
      _ExtentY        =   661
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
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   8
      Left            =   720
      TabIndex        =   12
      Top             =   4800
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   7
      Left            =   720
      TabIndex        =   11
      Top             =   4440
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   6
      Left            =   720
      TabIndex        =   10
      Top             =   4080
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   5
      Left            =   720
      TabIndex        =   9
      Top             =   3720
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   4
      Left            =   720
      TabIndex        =   8
      Top             =   3360
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   3
      Left            =   720
      TabIndex        =   6
      Top             =   3000
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Height          =   375
      Index           =   1
      Left            =   720
      TabIndex        =   4
      Top             =   2280
      Width           =   1315
   End
   Begin VB.TextBox txtTime 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   375
      Index           =   0
      Left            =   720
      TabIndex        =   2
      Top             =   1920
      Width           =   1315
   End
   Begin VB.Label lblPaste 
      Alignment       =   2  'Center
      Caption         =   "Paste"
      Height          =   255
      Left            =   2400
      TabIndex        =   48
      ToolTipText     =   "Used to copy data from spreadsheets"
      Top             =   5640
      Width           =   615
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      Caption         =   "Particle Density (g/cm^3)"
      Height          =   480
      Index           =   1
      Left            =   3360
      TabIndex        =   29
      Top             =   1320
      Width           =   1605
   End
   Begin VB.Label lblHeading 
      Alignment       =   2  'Center
      Caption         =   "Fall Height (ft)"
      Height          =   480
      Index           =   0
      Left            =   2160
      TabIndex        =   26
      Top             =   1320
      Width           =   1050
   End
   Begin VB.Label lblRow 
      Alignment       =   2  'Center
      Caption         =   "Time (h)"
      Height          =   255
      Index           =   10
      Left            =   840
      TabIndex        =   25
      Top             =   1560
      Width           =   975
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   8
      Left            =   360
      TabIndex        =   24
      Top             =   4860
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   7
      Left            =   360
      TabIndex        =   23
      Top             =   4500
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   9
      Left            =   240
      TabIndex        =   22
      Top             =   5220
      Width           =   255
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   6
      Left            =   360
      TabIndex        =   21
      Top             =   4140
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   5
      Left            =   360
      TabIndex        =   20
      Top             =   3780
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   4
      Left            =   360
      TabIndex        =   19
      Top             =   3420
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   3
      Left            =   360
      TabIndex        =   18
      Top             =   3060
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   2
      Left            =   360
      TabIndex        =   17
      Top             =   2700
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   360
      TabIndex        =   16
      Top             =   2340
      Width           =   135
   End
   Begin VB.Label lblRow 
      AutoSize        =   -1  'True
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   360
      TabIndex        =   15
      Top             =   1980
      Width           =   135
   End
   Begin VB.Shape Shape1 
      Height          =   4935
      Left            =   120
      Top             =   1080
      Width           =   5535
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      Caption         =   "subtitle"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblData 
      AutoSize        =   -1  'True
      Caption         =   "title"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   405
   End
End
Attribute VB_Name = "frmHenry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const maxcols = 5
Const sTooltip = "CsI has a theoretical density of 4.51 gm/cc. In the presence of water" _
            & " it could form a chain agglomerate thus yielding a density closer to 1.0"
Dim Ntvals As Integer
Dim CurrentIndex As Integer
Private TheFormEdit As Boolean ' pass or fail the edits
Private TheEditType As String  ' which edit to do
Private DataModify As Boolean

Private Sub cmdCancel_Click()
 InitControls
End Sub

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub Form_Activate()
    SetControlColor Me
    CheckClipboard
End Sub

Private Sub Form_Load()
 SetTabIndex

  CurrentIndex = frmCompartment.CurrentIndex
  InitControls
  
End Sub

Public Sub SetTabIndex()
  Dim i, j, maxcols
  ' set tab order and mark for numeric edit
  maxcols = 3
  j = txtTime(0).TabIndex '5
  For i = 0 To MaxDimen - 1
    txtTime(i).TabIndex = j
    txtTime(i).Tag = "time"
    txtCol1(i).TabIndex = j + 1
    txtCol1(i).Tag = "num"
    txtCol2(i).TabIndex = j + 2
    txtCol2(i).Tag = "num"
    j = j + maxcols
  Next i
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CheckClipboard
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
    cancel = EditData
End Sub

Private Sub lblPaste_Click()
    PasteToTable
End Sub

Private Sub txtCol1_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol1_GotFocus(Index As Integer)
 SetSelect txtCol1(Index)
End Sub

Private Sub txtCol1_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtCol1(Index - 1).SetFocus
            Else
                txtCol1(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtCol1(Index + 1).SetFocus
            Else
                txtCol1(0).SetFocus
            End If
        Case vbKeyRight
            txtCol2(Index).SetFocus
        Case vbKeyLeft
            txtTime(Index).SetFocus
    End Select
End Sub

Private Sub txtCol2_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtCol2_GotFocus(Index As Integer)
 SetSelect txtCol2(Index)
End Sub

Public Sub SaveData(ntime)
Dim j
On Error GoTo errorhandler
      
    If DataModify Then
      With CompartmentArr(CurrentIndex).F2Deposition.Henry
       ReDim .times(1 To ntime) As Single, _
             .FallHeight(1 To ntime) As Single, _
             .ParticleDensity(1 To ntime) As Single

        For j = 1 To ntime
           .times(j) = CSng(txtTime(j - 1))
           .FallHeight(j) = CSng(txtCol1(j - 1))
           .ParticleDensity(j) = CSng(txtCol2(j - 1))
        Next j
        .Count = ntime
      End With
    End If
    Exit Sub

errorhandler:
Dim Msg As String
If Err.Number <> 0 Then
    Msg = "Error # " & Str(Err.Number) & " was generated by " _
            & Err.Source & Chr(13) & Err.Description
    MsgBox Msg, vbOKOnly + vbExclamation, "Error"
End If
End Sub

Public Sub InitControls()
 
    Dim i
    Dim AControl As Control
    
   For Each AControl In Controls
     If TypeOf AControl Is TextBox Then AControl.Text = ""
    If TypeOf AControl Is TextBox Or TypeOf AControl Is ComboBox Then
      AControl.BackColor = vbWhite
      AControl.ForeColor = vbBlack
    End If
  Next
 
  lblData(0) = "Compartment " + Format(CurrentIndex) + ": " + _
              CompartmentArr(CurrentIndex).Name
  Caption = "Compartment Features: Natural Deposition"
  lblData(1) = "Henry Aerosol Deposition Model"
   ' Belcourt added to always initialize
   txtTime(0) = SourceTerm.DelayTime
 
     With CompartmentArr(CurrentIndex).F2Deposition.Henry
           'ReDim Preserve .times(1 To MaxDimen) As Single, _
                         '.FallHeight(1 To MaxDimen) As Single, _
                         '.ParticleDensity(1 To MaxDimen) As Single
       For i = 1 To MaxDimen
         If i > UBound(.times) Then
            txtTime(i - 1) = Format(0, TIMEFORM)
            txtCol1(i - 1) = Format(0, SCIZERO)
            txtCol2(i - 1) = Format(0, SCIZERO)
         Else
           txtTime(i - 1) = Format(.times(i), TIMEFORM)
           txtCol1(i - 1) = ZeroFormat(.FallHeight(i), FloatFormat)
           txtCol2(i - 1) = ZeroFormat(.ParticleDensity(i), FloatFormat)
         End If
       Next i
     End With
     
    SetTooltips
    DataModify = False
End Sub

Private Sub SetTooltips()
Dim i As Integer

    
    lblHeading(1).ToolTipText = sTooltip
    
    For i = 0 To 9
        txtCol2(i).ToolTipText = sTooltip
    Next

End Sub

Private Sub CheckClipboard()
'See if data on the clipboard looks like Excel data - JCK 11/2005
Dim ValidData As Boolean
Dim i As Integer

    ValidData = CheckClipboardData
    If ValidData <> lblPaste.Enabled Then
        lblPaste.Enabled = ValidData
    End If
OK:
End Sub

Private Sub PasteToTable()
'JCK 11/2005
Dim PasteData() As String
Dim Buffer As String
Dim nError As Single
Dim i As Integer, j As Integer

On Error GoTo PastingError

    j = 0
    nError = -1
    Buffer = Clipboard.GetText
    
    Do
        i = InStr(Buffer, vbCrLf)
        PasteData = Split(Left(Buffer, i - 1), vbTab)
        i = i + 1
        Buffer = Right(Buffer, Len(Buffer) - i)

        If j = 0 Then
            If val(txtTime(j).Text) <> val(PasteData(0)) Then
                nError = val(txtTime(j).Text)
            End If
        Else
            txtTime(j).Text = PasteData(0)
        End If
        txtCol1(j).Text = PasteData(1)
        txtCol2(j).Text = PasteData(2)
        j = j + 1
    Loop Until Buffer = ""
    
    If nError >= 0 Then
        PasteError nError, Me
    End If
    txtCol1(0).SetFocus
    Exit Sub
    
PastingError:
    Beep
End Sub

Private Sub txtCol2_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtCol2(Index - 1).SetFocus
            Else
                txtCol2(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtCol2(Index + 1).SetFocus
            Else
                txtCol2(0).SetFocus
            End If
        Case vbKeyLeft
            txtCol1(Index).SetFocus
    End Select
End Sub

Private Sub txtTime_Change(Index As Integer)
    DataModify = True
End Sub

Private Sub txtTime_GotFocus(Index As Integer)
  SetSelect txtTime(Index)
End Sub

Public Property Get PassFormEdit() As Boolean
  PassFormEdit = TheFormEdit
End Property

Public Property Let PassFormEdit(ByVal vNewValue As Boolean)
  TheFormEdit = vNewValue
  If Not TheFormEdit Then
    ShowErrorMessage EditType, lblData(0)
  End If
End Property

Public Property Get EditType() As String
   EditType = TheEditType
End Property

Public Property Let EditType(ByVal vNewValue As String)
  TheEditType = vNewValue
  PassFormEdit = DoFormEdit(Me, TheEditType)
End Property

Public Function EditData() As Integer
   Dim cancel As Integer

   cancel = 0
   EditType = "Numeric"
    If PassFormEdit Then
'        EditType = "Nonzero"
'        If PassFormEdit Then
            EditType = "Times"
            If PassFormEdit Then
                Ntvals = CInt(Me.Tag) 'number of time values just stored by times edit
                Me.Tag = ""
                SaveData Ntvals
                frmRadtrad.SaveState True
            Else
               cancel = 1 ' failed time edit;  re-edit when OK pressed
            End If
'        Else
'          cancel = 1 ' decon factors failed > 0 edit
'        End If
    Else
      cancel = 1 ' failed numeric edit
    End If
    EditData = cancel
End Function

Private Sub txtTime_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
On Error Resume Next

     Select Case KeyCode
        Case vbKeyUp
            If Index > 0 Then
                txtTime(Index - 1).SetFocus
            Else
                txtTime(9).SetFocus
            End If
        Case vbKeyDown
            If Index < 9 Then
                txtTime(Index + 1).SetFocus
            Else
                txtTime(0).SetFocus
            End If
        Case vbKeyRight
            txtCol1(Index).SetFocus
    End Select
End Sub
