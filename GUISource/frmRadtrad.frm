VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmRadtrad 
   AutoRedraw      =   -1  'True
   Caption         =   "Radtrad 3.10"
   ClientHeight    =   8190
   ClientLeft      =   60
   ClientTop       =   675
   ClientWidth     =   3855
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
   ScaleHeight     =   8190
   ScaleWidth      =   3855
   Begin ComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   741
      ButtonWidth     =   635
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "ImageList"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   3
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "open"
            Object.ToolTipText     =   "Open Inputs"
            Object.Tag             =   ""
            ImageKey        =   "open"
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "save"
            Object.ToolTipText     =   "Save Inputs"
            Object.Tag             =   ""
            ImageKey        =   "save"
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "output"
            Object.ToolTipText     =   "Read or Print Output"
            Object.Tag             =   ""
            ImageKey        =   "output"
         EndProperty
      EndProperty
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Left            =   3360
         Top             =   0
      End
   End
   Begin VB.Frame fraCaseTitle 
      Caption         =   "Case Title"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   240
      TabIndex        =   15
      ToolTipText     =   "Title that appears at the top of each page of output < 80 characters"
      Top             =   600
      Width           =   3375
      Begin VB.TextBox txtCaseTitle 
         Height          =   375
         Left            =   240
         TabIndex        =   16
         ToolTipText     =   "Title that appears at the top of each page of output < 80 characters"
         Top             =   360
         Width           =   2895
      End
   End
   Begin VB.Frame fraST 
      Caption         =   "Source Term && Dose"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   240
      TabIndex        =   11
      Top             =   4680
      Width           =   3375
      Begin VB.CommandButton cmdDCF 
         Caption         =   "DCF"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1680
         TabIndex        =   14
         Top             =   420
         Width           =   615
      End
      Begin VB.CommandButton cmdSTEdit 
         Caption         =   "Source Term"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   13
         Top             =   420
         Width           =   1215
      End
      Begin VB.CommandButton cmdXQ 
         Caption         =   "X/Q"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         TabIndex        =   12
         Top             =   420
         Width           =   615
      End
   End
   Begin VB.Frame fraCompartment 
      Caption         =   "Compartments"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   240
      TabIndex        =   5
      Top             =   1800
      Width           =   3375
      Begin VB.ComboBox cboCompartment 
         Height          =   360
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   480
         Width           =   2895
      End
   End
   Begin MSComDlg.CommonDialog cdlSave 
      Left            =   3360
      Top             =   4080
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cdlOpen 
      Left            =   3360
      Top             =   3600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame fraRun 
      Caption         =   "Radtrad Calculation"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   240
      TabIndex        =   7
      Top             =   6000
      Width           =   3375
      Begin VB.CommandButton cmdCalculate 
         Caption         =   "Read or Print Output"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   2
         Left            =   2220
         TabIndex        =   8
         Top             =   360
         Width           =   960
      End
      Begin VB.CommandButton cmdCalculate 
         Caption         =   "Calculate"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   1
         Left            =   1260
         TabIndex        =   3
         Top             =   360
         Width           =   960
      End
      Begin VB.CommandButton cmdCalculate 
         Caption         =   "Control Options.."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   0
         Left            =   180
         TabIndex        =   2
         Top             =   360
         Width           =   1080
      End
   End
   Begin VB.Frame fraPathway 
      Caption         =   "Transfer Pathways"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   240
      TabIndex        =   6
      Top             =   3240
      Width           =   3375
      Begin VB.ComboBox cboPathway 
         Height          =   360
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   480
         Width           =   2895
      End
   End
   Begin ComctlLib.StatusBar StatusBarOutput 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   7815
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   661
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ComctlLib.StatusBar StatusBarPlant 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   9
      Top             =   7440
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   661
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ComctlLib.ImageList ImageList 
      Left            =   3240
      Top             =   4800
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   3
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmRadtrad.frx":0000
            Key             =   "open"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmRadtrad.frx":005E
            Key             =   "save"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmRadtrad.frx":00BC
            Key             =   "output"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileNewInput 
         Caption         =   "&New Radtrad input file"
      End
      Begin VB.Menu mnuFileOpenInput 
         Caption         =   "&Open Radtrad input"
      End
      Begin VB.Menu mnuFileSaveInput 
         Caption         =   "&Save Radtrad input"
      End
      Begin VB.Menu mnufs3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSaveAs 
         Caption         =   "&Save As Radtrad input"
      End
      Begin VB.Menu mnuFileRestore 
         Caption         =   "&Restore modified input"
      End
      Begin VB.Menu mnufs1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileReadOutput 
         Caption         =   "&Read or print Radtrad output"
      End
      Begin VB.Menu mnufs2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuBasicTraining 
         Caption         =   "Basic &Training"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "About &Radtrad"
      End
   End
End
Attribute VB_Name = "frmRadtrad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const EDGE = 3960
Const MINHT = 8500
Const IFORMAT = "   0"
Const XFORMAT = "  0"
Const ModelUsed = "   1"
Const PlaceHolder = "   0"
Public SavePath As String
Private ComboStatus As Boolean
Private frmBar As frmProgress
Private frmTxtOutput As frmTxtEdit
Private CaseTitleModified As Boolean
Private SaveStateDisabled As Boolean
Private PrevFilename As String
Private BackupFilename As String

Private Declare Sub DLL_RADTRAD Lib "radtrad.dll" Alias "DLL_RADTRADA" _
  (ByVal ThePlantFile As String, ByVal plantfilelen As Long, _
   ByVal TheScenarioFile As String, ByVal scenariofilelen As Long, _
   ByVal TheOutputFile As String, ByVal outputfilelen As Long, _
   ByVal Errormessage As String, ByVal errormessagelen As Long)
   
Public Function IsSaveEnabled() As Boolean
    IsSaveEnabled = mnuFileSaveInput.Enabled And (txtCaseTitle <> "")
End Function

Public Sub SaveState(NewState As Boolean)
    If Not mnuFileSaveInput.Visible Then
        mnuFileSaveInput.Visible = True
        mnuFileSaveAs.Visible = True
    End If
    
    'Set state on the save button and file->menu tag
    mnuFileSaveInput.Enabled = NewState
    Toolbar1.Buttons(2).Enabled = NewState
    SaveStateDisabled = Not NewState
    mnuFileSaveAs.Visible = Not NewState
    If mnuFileRestore.Visible = mnuFileSaveAs.Visible Then
        mnufs3.Visible = Not NewState
    End If
    
    'Set the inverse state on the calculate button
    CalculateState (Not NewState)
End Sub

Public Sub CalculateState(NewState As Boolean)
    'Set the inverse state on the calculate button
    cmdCalculate.Item(1).Enabled = NewState
End Sub

Public Sub ReadOutput()
  
  Set frmTxtOutput = New frmTxtEdit
  Load frmTxtOutput
  With frmTxtOutput
    .Tag = Trim(CalcOptions.OutputFile)
    .Width = 11000 'approximate width of radtrad output in Courier 9
    .Height = 9000
    .Left = 1000
    .Top = 1000
    .Show
  End With
  
End Sub

Public Property Let CaseTitle(Title As String)

    txtCaseTitle = Title
    CaseTitleModified = False

End Property

Private Sub cmdCalculate_Click(Index As Integer)
  Select Case Index
   Case 0
     frmCalcOptions.Show
     
   Case 1
   ' nif, rft, dcf, st comp of type 3, at least 1 comp
     If CheckMinData Then Calculate ' call radtrad

   Case 2
     ReadOutput
  End Select
End Sub

Private Sub cmdDCF_Click()
    frmDoseConversion.Show
End Sub

Private Sub cmdSTEdit_Click()
  frmSourceTerm.Show
End Sub

Private Sub cmdXQ_Click()
    'frmOffsite.Show , Me
    frmXQ.Show , Me
End Sub

Private Sub Form_Activate()
Dim Item As Form
Dim DialogOpen As Boolean

    'Let's not enable the Save menu if any dialogs are open
    'But first check to see if it was supposed to be disabled anyway
    If Not SaveStateDisabled Then
      For Each Item In Forms
        If Item.Name <> "frmRadtrad" And Item.Name <> "frmProgress" Then
          mnuFileSaveInput.Enabled = False
          CalculateState True
          DialogOpen = True
          Exit For
        End If
      Next
            
      'If it's been disabled and they closed the dialog, enable it
      If (Not DialogOpen) And txtCaseTitle <> "" Then
        SaveState True
      End If
    End If
End Sub

Private Sub Form_Load()
Dim Buffer As String
Dim Reply As VbMsgBoxResult
Dim i As Integer

' Belcourt adds timer to disable the software after 6/31/2001
'If (Year(Date$) > 2007) Then
    'Software has expired
'    MsgBox ("Software has expired, contact T. Heames at ALION ITS to obtain the current version.")
'    End
'ElseIf (Year(Date$) = 2006) Then
'    If (Month(Date$) > 10) Then
'        MsgBox ("Software has expired, contact T. Heames at ALION ITS to obtain the current version.")
'        End
'    End If
'End If

' Belcourt wants the full path name to the current directory
' stored here.
Set FSO = New FileSystemObject
StartupPath = LCase(App.Path + "\")
Appl.DefaultPath = App.Path
Appl.VersionStamp = "Radtrad 3.10 01/05/2006"
'FileVersion301 = False ' assume the worst
FileMode = 0
    
 LoadStatusBar

 InitCompartmentsPathwaysDLs
 SetComboBoxes

' used as the file filter for all common dialog open and saves
 Tag = "Nuclide inventory files(*.nif)|*.nif|Release fractions and timing(*.RFT)|*.RFT|Dose Conversion(*.inp)|*.inp|Plant-scenario files(*.psf)|*.psf|All files(*.*)|*.*|"
 txtCaseTitle.BackColor = vbButtonFace
 CaseNameWidth = 1935 'frmCompartment.txtName.Width -- this loaded frmCompartment, causing a problem
 mnuFileNewInput.Visible = False 'Set to visible after first file is loaded
 mnuFileRestore.Visible = False 'Set to visible after any file is saved
 mnufs3.Visible = False
 mnuFileSaveInput.Visible = False
 mnuFileSaveAs.Visible = False

 If Not FSO.FolderExists(StartupPath & "Defaults") Then
    '5/2006 JCK - Check alternate Defaults location (up one directory)
    Buffer = Left(StartupPath, Len(StartupPath) - 1)
    i = InStrRev(Buffer, "\")
    Buffer = Left(StartupPath, i)
    If FSO.FolderExists(Buffer & "Defaults") Then
        StartupPath = Buffer
    Else
        Reply = MsgBox(StartupPath & "\Defaults is missing" & vbCrLf _
                    & "Standard NIF & RFT files won't be found", _
                    vbOKCancel Or vbInformation, "No Defaults Directory")
        If Reply = vbCancel Then End
    End If
 End If
End Sub

Private Sub cboCompartment_Click()
  If ComboUpdate Then
    cboCompartment.Enabled = False
    frmCompartment.Show
  End If
End Sub

'Private Sub cboDoseLocation_Click()
'  If ComboUpdate Then
'     cboDoseLocation.Enabled = False
'     frmXQ.Show
'  End If
'End Sub

Private Sub cboPathway_Click()
  If ComboUpdate Then
    cboPathway.Enabled = False
    frmPathway.Show
   End If
End Sub

Private Sub Form_LostFocus()
    If CaseTitleModified Then
        Appl.CaseTitle = Trim(txtCaseTitle)
        CaseTitleModified = False
    End If
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
Dim Response

  If EmergencyExit(UnloadMode) Then
    Close ' close all files
    
    UnloadSetNothings True ' unload all other forms
    Unload Me
    End
  End If
  
  If IsSaveEnabled() Then
    Response = MsgBox("Save Radtrad input files now?", vbYesNoCancel + vbQuestion, "Save work?")
    If Response = vbCancel Then
      cancel = 1
      Exit Sub
    End If
    If Response = vbYes Then SaveInputs
  End If
  
  Close ' close all files
  UnloadSetNothings True ' unload all other forms
  Unload Me ' unload this form
  End ' stop program
End Sub

Private Sub Form_Resize()
 If frmRadtrad.WindowState = vbMinimized Then Exit Sub
 If Width < EDGE Then Width = EDGE
 If Height < MINHT Then Height = MINHT
End Sub

'Private Sub Form_Resize()
'Dim X, Y    ' Declare variables.
'    If WindowState = vbMinimized Then
'        Icon = LoadPicture()  ' Load a blank icon.
'        Do While WindowState = vbMinimized
'      ' While form is minimized,
'            DrawWidth = 10    ' set size of dot.
'            ' Choose random color for dot.
'            ForeColor = QBColor(Int(Rnd * 15))
'            ' Set random location on icon.
'            X = Width * Rnd
'            Y = Height * Rnd
'
'            PSet (X, Y) ' Draw dot on icon.
'            DoEvents    ' Allow other events.
'        Loop
'    End If
'
'End Sub

Private Sub Form_Unload(cancel As Integer)
    
    Set FSO = Nothing
 
' UnloadSetNothings True
 
End Sub

Private Sub mnuAbout_Click()
  frmAbout.Show
End Sub

Private Sub mnuBasicTraining_Click()
'  OLE1.DoVerb
'  Dim frmHelp As New frmTxtEdit
'  Dim dirPath
'
'    dirPath = Trim(App.Path)
'    If Right(dirPath, 1) <> "\" Then
'      dirPath = dirPath + "\Radtrad301Help.rtf"
'    Else
'      dirPath = dirPath + "Radtrad301Help.rtf"
'    End If
'  frmTxtEdit.Tag = dirPath
'  frmHelp.Show
'
End Sub

Private Sub mnuExit_Click()
 Unload Me
 End
End Sub

Public Sub LoadStatusBar()

    With StatusBarPlant.Panels
        .Item(1).MinWidth = 100
        .Item(1).Text = Trim(CalcOptions.PlantFile)
        .Item(1).Key = "Plant"
        .Item(1).AutoSize = sbrSpring
   End With

     With StatusBarOutput.Panels
        .Item(1).MinWidth = 100
        .Item(1).Text = Trim(CalcOptions.OutputFile)
        .Item(1).Key = "Output"
        .Item(1).AutoSize = sbrSpring
   End With
End Sub
    
Public Sub UnloadSetNothings(All As Boolean)

 Unload frmSourceTerm
 Unload frmBrockBixler
 Unload frmHenry
 Unload frmCalcOptions
 Unload frmData
 Unload frmPowersDep
 Unload frmPowersPool
 Unload frmPowersSpray
 Unload frmTxtEdit
 
 Set frmBrockBixler = Nothing
 Set frmCalcOptions = Nothing
 Set frmData = Nothing
 Set frmHenry = Nothing
 Set frmPowersDep = Nothing
 Set frmPowersPool = Nothing
 Set frmPowersSpray = Nothing
 Set frmSourceTerm = Nothing
 Set frmSplash = Nothing
 Set frmTxtEdit = Nothing
 If All = True Then
    Unload frmCompartment
    Unload frmPathway
    Unload frmBR
    Set frmCompartment = Nothing
    Set frmBR = Nothing
    Set frmPathway = Nothing
 End If
End Sub

Public Property Get ComboUpdate() As Boolean
  ComboUpdate = ComboStatus
End Property

Public Property Let ComboUpdate(ByVal vNewValue As Boolean)
  ComboStatus = vNewValue
End Property

Private Sub mnuFileNewInput_Click()
Dim result As VbMsgBoxResult

  If IsSaveEnabled() Then
    result = MsgBox("Current file has been modified" & vbCrLf _
                        & "Do you want to save it?", vbYesNo Or vbQuestion, "Save Changes?")
    If result = vbYes Then
        mnuFileSaveInput_Click
    End If
  End If
  
  CloseOpenForms
  txtCaseTitle = ""
  InitCompartmentsPathwaysDLs
  
  LoadStatusBar
  SetComboBoxes
  
  If BackupFilename <> "" Then
    QueryBackup
  End If
  
  ResetBackupFile
  
End Sub

Private Sub ResetBackupFile()
    If BackupFilename <> "" Then
        With FSO
            If .FileExists(BackupFilename) Then
                .DeleteFile BackupFilename
            End If
        End With
        BackupFilename = ""
    End If
    
    mnuFileRestore.Visible = False
    mnufs3.Visible = mnuFileSaveAs.Visible
End Sub

Private Sub CloseOpenForms()
Dim Item As Form
Dim Update As Boolean

    'Close any open dialogs - JCK
    'For Open or New file, and Calculate
    For Each Item In Forms
        If Item.Name <> "frmRadtrad" Then
            Unload Item
            Update = True
        End If
    Next
    
    If Update Then DoEvents
End Sub

Private Sub mnuFileOpenInput_Click()
Dim s As String
Dim Ext As String
Dim Item As Form
Dim result As VbMsgBoxResult

  If IsSaveEnabled() Then
      result = MsgBox("Current file has been modified" & vbCrLf _
                        & "Do you want to save it?", vbYesNo Or vbQuestion, "Save Changes?")
      If result = vbYes Then
        mnuFileSaveInput_Click
      End If
  End If
  
  CloseOpenForms
  s = OpenFileName
  
  If s <> "openfileerror" And Len(s) > 0 Then
    Ext = UCase(Right(s, 3))
    If Ext = "PSF" Then
        OpenPsfFile s
    
        If BackupFilename <> "" Then
            QueryBackup
        End If
    Else
        MsgBox "Only Radtrad files ending in '.psf' are valid for this application", _
                vbExclamation, "File Open Error"
    End If
  End If
End Sub

Private Sub OpenPsfFile(Filename As String)
Dim fMissing As Boolean
Dim fNoNIF As Boolean
Dim fNoRFT As Boolean
Dim FileMessage As String
Dim FileType As String
Dim i As Integer

On Error GoTo OpenError

    CloseOpenForms
    ResetBackupFile
    
    'Belcourt added to clear input prior to loading a new deck
    InitCompartmentsPathwaysDLs
    LoadStatusBar
    SetComboBoxes
    
    For i = DCF To TotalSourceFiles
      SourceTerm.MissingFile(i) = False
    Next
    
    CalcOptions.PlantFile = Filename
    DeriveFileNames
    ReadInputs
    
    txtCaseTitle.BackColor = vbWindowBackground
    fraCaseTitle.Caption = "Case Title"
    CaseTitleModified = False
    
    'Always cancel immediately after reading file
    fMissing = False
    'Look for minimum file requirements and files not found
    For i = DCF To TotalSourceFiles
      With SourceTerm
        Select Case i
          Case DCF, RFT, NIF
              Select Case i
                Case DCF
                  FileType = "DCF"
                Case RFT
                  FileType = "RFT"
                Case NIF
                  FileType = "NIF"
              End Select
              
              If Trim(.Files(i)) = "" Then
                If i = RFT Then
                  fNoRFT = True
                Else
                  FileMessage = "No " & FileType & " file specified"
                  MsgBox FileMessage, vbExclamation, "Required File Missing"
              End If
              ElseIf .MissingFile(i) Then
                FileMessage = "Can't find " & .Files(i)
                MsgBox FileMessage, vbExclamation, FileType & "File Missing"
              End If
              Select Case i
                Case DCF
                  cmdDCF.BackColor = RedButton
                Case RFT, NIF
                  cmdSTEdit.BackColor = RedButton
              End Select
          Case Else
              If .Files(i) <> "" And .MissingFile(i) Then
                  fMissing = True
              End If
        End Select
      End With
    Next
    
    If fNoRFT Then
      fNoNIF = True
      '1 RFT file is required unless the file being loaded
      'is version 3.10 and all NIF files are type 2
      If FileMode = 2 Then
        For i = NIF To TotalSourceFiles
          With SourceTerm
            If .Files(i) <> "" Then
              fNoNIF = False
              If ReadNifFile(.Files(i)) <> 2 Then
                Exit For
              End If
            End If
          End With
        Next
        If i > TotalSourceFiles And Not fNoNIF Then
          'Passed the test -- all NIF filles were blank or type 2
          fNoRFT = False
        End If
      End If
      If fNoRFT Then
        MsgBox "No RFT file specified", vbExclamation, "Required File Missing"
      End If
    End If
    
    mnuFileNewInput.Visible = True
    
    If fMissing Then
      BrowseMissingFiles
    End If
    
    CaseTitleModified = False
    txtCaseTitle.BackColor = vbButtonFace
    SaveState False
    Exit Sub
    
OpenError:
    MsgBox Err.Description, vbExclamation, "OpenPsfFile()"
End Sub

Private Sub BrowseMissingFiles()
    frmMissingFiles.Show
End Sub

Private Sub Calculate()
Dim s As String
Dim Response
Dim Saved As Boolean
Dim Ext As String
Dim Handle As Long
Dim Parse() As String
Dim i As Integer

On Error GoTo errorhandler
'On Error Resume Next
  
    Close ' close all files. This s/b redundant.
    
    'Close any open dialogs. Unload() will save any changed data
    CloseOpenForms
    With CalcOptions
        If (Trim(.PlantFile) = "") Or SaveBeforeCalculate Then  'Blank file name or Defaults substituted
            If SavePath <> "" And .PlantFile <> "" Then
                Parse = Split(.PlantFile, "\")
                If UCase(Parse(UBound(Parse) - 1)) = "ACCEPT" Then
                    If UBound(Parse) > 1 Then
                        SavePath = ""
                        For i = 0 To UBound(Parse) - 2
                            SavePath = SavePath & Parse(i) & "\"
                        Next
                        Parse = Split(.PlantFile, "\")
                        .PlantFile = SavePath & Parse(UBound(Parse)) & Space(256 - Len(.PlantFile))
                        SavePath = Left(SavePath, Len(SavePath) - 1)
                    End If
                End If
            End If
            s = SaveFileName
            If s <> "savefileerror" And Len(s) > 0 Then
                Ext = UCase(Right(s, 3))
                If Ext = "PSF" Then
                  If Trim(.PlantFile) <> s Then
                    .OutputFile = ""
                  End If
                  .PlantFile = s
                  DeriveFileNames
                  PutPlant
                  'FileVersion301 = True
                  FileMode = 2 'JCK
                  SaveBeforeCalculate = False 'JCK
                Else
                  MsgBox "Filename extension must be PSF", , "Illegal Filename"
                  Exit Sub
                End If
            Else
                Exit Sub
            End If
        Else
            DeriveFileNames
        End If
        
        'If Not FileVersion301 Then
        If FileMode = 0 Then 'JCK
           Screen.ActiveForm.Refresh
        End If
        
        Set frmBar = New frmProgress
        frmBar.Show
        SetPBar frmBar, 20

        .Errormessage = "Calling Radtrad"
        
        SetPBar frmBar, 10
        
        Call DLL_RADTRAD(.PlantFile, Len(.PlantFile), .ScenarioFile, Len(.ScenarioFile), _
                            .OutputFile, Len(.OutputFile), .Errormessage, Len(.Errormessage))
        
        Screen.MousePointer = vbDefault
        
        If InStr(.Errormessage, "Click") = 0 Then ' error
          'MsgBox "Error code is :" & Str(Err.LastDllError) & " " & .Errormessage
          MsgBox Trim(.Errormessage), vbExclamation, "Calculation Error"
          'Output file displays longer error message
        End If
        SetPBar frmBar, 10
        ReadOutput ' show new output file
    End With
    
    frmBar.ProgressBar1.Value = frmBar.ProgressBar1.Max
    frmBar.Refresh
    
    With Timer1
        .Interval = 500 '1/2 second delay
        .Enabled = True
    End With

    With CalcOptions
        'Reset for next run
        '.PlantFile = Space(256)    'Moved to New, Open and SaveAs
        '.ScenarioFile = Space(256) 'Also moved  "   "        "
        '.OutputFile = Space(256) Changed 8/2006 - JCK
        .Errormessage = Space(256)
    End With

    ResetBackupFile
    
Cleanup:
    With FSO
        If .FileExists(SavePath & "fort.10") Then
            .DeleteFile SavePath & "fort.10"
        End If
        If .FileExists(SavePath & "fort.11") Then
            .DeleteFile SavePath & "fort.11"
        End If
        If .FileExists(SavePath & "fort.12") Then
            .DeleteFile SavePath & "fort.12"
        End If
    End With
    Exit Sub
  
errorhandler:
  Screen.MousePointer = vbDefault
'  Debug.Print "Calculate", Err.Number, Err.Description
  'If Err.Number = 0 Then
  '  MsgBox "Calculation was cancelled, probably due to file format." + vbCrLf + _
  '       "Save in current format and try again.", vbOKOnly + vbInformation, "Error"
  'Else
    'MsgBox "Error " + Str(Err.Number) + Space(2) + Trim(Err.Description), vbOKOnly + vbExclamation, "Error"
  'End If
  MsgBox Err.Description, vbExclamation, "DLL Error"
  
  If Not frmBar Is Nothing Then
    Unload frmBar
    Set frmBar = Nothing
  End If
  Resume Cleanup
End Sub

Private Sub QueryBackup()
Dim Reply As VbMsgBoxResult

On Error Resume Next 'Pretty harmless if it fails
    With FSO
        If .FileExists(BackupFilename) Then
            Reply = MsgBox("Backup file " & BackupFilename & vbCrLf _
                    & "was created when previous file was first saved" & vbCrLf _
                    & "Do you want to keep the backup file?", vbQuestion Or vbYesNo _
                        Or vbDefaultButton2, "File Backup")
                                    
            If Reply = vbNo Then
                .DeleteFile BackupFilename
            End If
            
            'Mark as processed so it won't get deleted later if Yes, in ResetBackupFile()
            BackupFilename = ""
        End If
    End With
End Sub

Private Sub mnuFileRestore_Click()
Dim Response As VbMsgBoxResult

    Response = MsgBox("Abandon current version of " & CalcOptions.PlantFile & vbCrLf _
                        & "and return to the version last opened?", vbQuestion Or _
                            vbYesNo Or vbDefaultButton2, "Restore Modified File")
    
    If Response = vbYes Then
        With FSO
            If .FileExists(BackupFilename) Then
                .DeleteFile CalcOptions.PlantFile
                Name BackupFilename As CalcOptions.PlantFile
                ResetBackupFile
            End If
        End With
        OpenPsfFile CalcOptions.PlantFile
    End If
End Sub

Private Sub mnuFileSaveAs_Click()
Dim s As String
Dim Ext As String

On Error GoTo FileError

    If ValidateFiles Then
        With cdlSave
          .DialogTitle = "Save As"
          .CancelError = True
          .Flags = cdlOFNOverwritePrompt + cdlOFNNoReadOnlyReturn + cdlOFNHideReadOnly
    
          If SavePath = "" Then
            .InitDir = App.Path
          Else
            .InitDir = SavePath
          End If
          
          .filter = "Plant-scenario files (*.psf)|*.psf"
          .ShowSave
          s = .Filename
        End With
        
        If Len(s) > 0 Then
            Ext = UCase(Right(s, 3))
            If Ext = "PSF" Then
              CalcOptions.PlantFile = s
              CalcOptions.OutputFile = ""
              DeriveFileNames
              PutPlant
              'FileVersion301 = True
              FileMode = 2 'JCK
              SaveBeforeCalculate = False 'JCK 1/2006
              If BackupFilename <> "" Then
                QueryBackup
              End If
              ResetBackupFile
            End If
        
            'Trigger new output filename
            With CalcOptions
              If .OutputFile <> "" Then
                  PrevFilename = .PlantFile
              End If
              .OutputFile = Space(256)
            End With
            
            If StartupPath <> LCase(App.Path) & "\" Then
                'Alternate defaults location in use - JCK 5/2006
                If Not FSO.FolderExists(StartupPath & "Defaults") Then
                    'Reset to original
                    StartupPath = LCase(App.Path) & "\"
                End If
            End If
            SavePath = CurDir()

            fraCaseTitle.Caption = "Case Title"
            SaveState False
        End If
    End If
    Exit Sub
        
FileError:
    With Err
        If .Number <> CancelSelected Then
            MsgBox .Description, vbExclamation, "File Error"
        End If
    End With
End Sub

Private Sub Timer1_Timer()
    Timer1.Enabled = False
    frmBar.Hide
    Set frmBar = Nothing
End Sub

Private Sub mnuFileReadOutput_Click()
  ReadOutput
End Sub

Private Sub mnuFileSaveInput_Click()

  If ValidateFiles Then
    'Trigger new output filename
    With CalcOptions
      If .OutputFile <> "" Then
          PrevFilename = .PlantFile
      End If
      '.OutputFile = Space(256) Changed 8/2006 - JCK
    End With
    
    If SaveInputs Then
        SaveBeforeCalculate = False 'JCK 1/2006
        fraCaseTitle.Caption = "Case Title"
        SaveState False
        If BackupFilename <> "" Then
          QueryBackup
        End If
        ResetBackupFile
    End If
  End If
End Sub

Private Function ValidateFiles() As Boolean
Dim FileIndex As Integer
Dim result As Boolean
Dim Msg As String

  FileIndex = DCF
  result = True
  With SourceTerm
      Do
          If .Files(FileIndex) = "" Then
              'Must have a minimum of 1 of each
              Select Case FileIndex
                  Case DCF
                      Msg = "Dose Conversion"
                  Case RFT
                      Msg = "Release Fraction"
                  Case NIF
                      Msg = "Nuclide Inventory"
                  Case Else
                      Msg = ""
              End Select
              If Msg <> "" Then
                  MsgBox "No " & Msg & " file specified", vbExclamation, "Missing File"
                  result = False
              End If
          Else
              .Files(FileIndex) = Trim(.Files(FileIndex))
              If Not FSO.FileExists(.Files(FileIndex)) Then
                  MsgBox "Can't find " & .Files(FileIndex), vbExclamation, "Missing File"
                  result = False
              End If
          End If
          FileIndex = FileIndex + 1
      Loop Until FileIndex = TotalSourceFiles + 1 'Last file is TotalSourceFiles
  End With
  
  'Verify X/Q matrix has no missing entries
  If PathwayNoXQ(False) Then
      result = False
  End If
  
  ValidateFiles = result
End Function

Private Sub mnuFillData_Click()
  ComboUpdate = False
  TestData ' in module1, define 3 comps, 2 pathways, 3 dose locations
  SetComboBoxes
End Sub

Public Sub SetComboBoxes()
 
 loadCompartmentMenu cboCompartment
 loadPathwayMenu cboPathway
 'loadDoseLocationMenu cboDoseLocation
 ComboUpdate = False
 cboCompartment.ListIndex = 0
 cboPathway.ListIndex = 0
 'cboDoseLocation.ListIndex = 0
 ComboUpdate = True
 
End Sub

Private Sub toolbar1_ButtonClick(ByVal Button As Button)
    
    Select Case Button.Key
    Case "open"           ' Open PSF file.
       mnuFileOpenInput_Click
    Case "save"
        mnuFileSaveInput_Click
    Case "output"
        ReadOutput
    End Select
End Sub

Public Function SaveInputs() As Boolean
Dim NoExtName As String
Dim s, Ext
   
On Error GoTo SaveError

   s = ""
   Close ' close all files
    s = SaveFileName
    If s <> "savefileerror" And Len(s) > 0 Then
        Ext = UCase(Right(s, 3))
        If Ext = "PSF" Then
          If CalcOptions.PlantFile <> "" Then
            With FSO
              If .FileExists(CalcOptions.PlantFile) Then
                NoExtName = Trim(CalcOptions.PlantFile)
                NoExtName = Left(NoExtName, Len(NoExtName) - 3)
                If Not .FileExists(NoExtName & "rbk") Then
                  BackupFilename = NoExtName & "rbk"
                  .CopyFile CalcOptions.PlantFile, BackupFilename
                  mnuFileRestore.Visible = True
                  mnufs3.Visible = True
                End If
              End If
            End With
          End If
          
          CalcOptions.PlantFile = s
          DeriveFileNames
          PutPlant
          'FileVersion301 = True
          FileMode = 2 'JCK
          SaveInputs = True
        Else
          SaveInputs = False
        End If
    Else
      SaveInputs = False
    End If
    Exit Function
    
SaveError: 'JCK
    MsgBox "Error #" & Err.Number & " saving " & s _
            & vbCrLf & Err.Description, vbExclamation, "Save Error"
    SaveInputs = False
End Function

Private Function PathwayNoXQ(Calc As Boolean)
Dim Reply As VbMsgBoxResult
Dim i As Integer, j As Integer
    
    If XQIndexRows = 0 And XQIndexCols = 0 Then
        If CreateXQTable() Then
            'Save is allowed even if check fails, calculation is not
            If Calc Then
                'Message is supplied in CheckMinData(), the caller
                PathwayNoXQ = True
            Else
                Reply = MsgBox("Pathways connected to the environment must have X/Q tables assigned" & vbCrLf _
                            & "Save anyway?", vbInformation Or vbYesNo Or vbDefaultButton2, "File Incomplete")
                PathwayNoXQ = (Reply = vbNo)
            End If
        End If
        Exit Function
    Else
        For i = 1 To XQIndexRows
            For j = 1 To XQIndexCols
                If PathXQMap(i, j) = 0 Then
                    'Save is allowed even if check fails, calculation is not
                    If Calc Then
                        'Message is supplied in CheckMinData(), the caller
                        PathwayNoXQ = True
                    Else
                        Reply = MsgBox("Not all pathways connected to the environment have X/Q tables assigned" & vbCrLf _
                                    & "Save anyway?", vbInformation Or vbYesNo Or vbDefaultButton2, "File Incomplete")
                        PathwayNoXQ = (Reply = vbNo)
                    End If
                    Exit Function
                End If
            Next
        Next
    End If
    PathwayNoXQ = False
End Function

Public Sub DeriveFileNames()
Dim suffix
Dim s As String

On Error GoTo DeriveError
    
    suffix = 0
    s = ""
    
    With CalcOptions
        .ScenarioFile = .PlantFile
        If .OutputFile = Space(Len(.OutputFile)) Then
            s = Left(.PlantFile, InStr(.PlantFile, ".") - 1) + ".o" + Format(suffix)
            While Dir(s) <> ""
              suffix = suffix + 1
              s = Left(.PlantFile, InStr(.PlantFile, ".") - 1) + ".o" + Format(suffix)
            Wend
            .OutputFile = s
        ElseIf StdOutputFormat(.OutputFile) Then 'File extension is '.o1', etc.
            s = Left(.OutputFile, InStr(.OutputFile, ".") - 1) + ".o" + Format(suffix)
            While Dir(s) <> ""
              suffix = suffix + 1
              s = Left(.OutputFile, InStr(.OutputFile, ".") - 1) + ".o" + Format(suffix)
            Wend
            .OutputFile = s
        End If
        
        If s = "" Then
            'The automatically generated output name has been changed by user
            s = .OutputFile
            While Dir(s) <> ""
              suffix = suffix + 1
              s = Left(.OutputFile, InStr(.OutputFile, ".") - 1) + "-" + Format(suffix) + "." _
                            + Right(.OutputFile, Len(.OutputFile) - InStr(.OutputFile, "."))
            Wend
            .OutputFile = s
        End If
        .OutputOfRecord = .OutputFile
    End With
    
    LoadStatusBar
    Exit Sub
    
DeriveError:
    MsgBox Err.Description, vbInformation, "DeriveFilenames()"
End Sub

'Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'    If Button = 2 Then
'        PopupMenu mnuRightClick
'    End If
'End Sub

Private Function GetRftIndex(nNIF As Integer) As Integer
Dim i As Integer
Dim X As SourceTermEntry

    For i = 1 To UBound(SourceTerm.SourceTermTable)
        With SourceTerm.SourceTermTable(i)
            If .NifIndex = nNIF - 1 Then
                GetRftIndex = .RftIndex + 1
                Exit Function
            End If
        End With
    Next
    MsgBox "Can't find RFT for " & SourceTerm.Files(NIF + nNIF), vbExclamation, "Save Error"
End Function

Public Sub PutValue(filenum, Value, Optional formatstr, Optional heading)
   If Not IsMissing(heading) Then Print #filenum, heading
   
   If IsMissing(formatstr) Then
      Print #filenum, Space(3) & Trim(Value)
   ElseIf formatstr = SCINOTA Then
      Print #filenum, FileFormat(Value, SCINOTA)
   Else
      Print #filenum, ZeroFormat(Value, formatstr)
   End If
End Sub

Private Function FileFormat(Data, formatstr As String) As String
    FileFormat = Space(3) & ZeroFormat(Data, formatstr)
End Function

Private Function NifFileType(FileIndex As Integer)
'Find file in Source Term table, get associated NIF type
Dim i As Integer

    With SourceTerm
        For i = 1 To UBound(.SourceTermTable)
            If .SourceTermTable(i).NifIndex + NIF = FileIndex Then
                NifFileType = .SourceTermTable(i).NifType
                Exit Function
            End If
        Next
    End With
    MsgBox "Can't find NIF type", vbExclamation, "PutPlant()"
End Function

Public Sub PutPlant()
Dim filenum As Integer, tm
Dim Response As String
Dim FileType As Integer
Dim i As Integer, j As Integer

  'On Error Resume Next 'JCK - This overrode new handler in SaveInputs()
  
  If Len(Trim(CalcOptions.PlantFile)) = 0 Then Exit Sub
  
  filenum = FreeFile
   Open Trim(CalcOptions.PlantFile) For Output As #filenum
    PutValue filenum, Space(1) + Trim(Appl.VersionStamp)
'   PutValue filenum, Space(1) + Trim(Appl.VersionStamp) + Space(1) _
'        + "Input Modified: " + Format(Date) + Space(1) + Format(Time)
   
   Appl.CaseTitle = txtCaseTitle
   PutValue filenum, Space(1) + Trim(Appl.CaseTitle)
      
   'For File Mode 2 we allow multiple .rft and .nif files
   'Values: DCF = 1, RFT = 2, NIF = 4
   'There's always 1 .dcf file, SourceTerm.Files(1). Slots 2 & 3 are for .rft files,
   'so the .nif files are SourceTerm.Files(4), (5), & (6), starting with FirstNIF
   With SourceTerm
     Print #filenum, " Dose Conversion Factor File:"
     PutValue filenum, Space(1) + Trim(.Files(DCF))

     j = 0
     'Count RFT files
     For i = 0 To LastRFTFile - RFT 'JCK
        If .Files(RFT + i) <> "" Then
            j = j + 1
        End If
     Next

     PutCount j, filenum, " Release Fraction & Timing Files:"
     For i = 0 To j - 1
        PutValue filenum, Space(1) + Trim(.Files(RFT + i))
     Next
      
     j = 0
     For i = 0 To TotalSourceFiles - NIF 'JCK
        If .Files(NIF + i) <> "" Then
            j = j + 1
        End If
     Next
    
     PutCount j, filenum, " Nuclide Inventory Files:"
    
     For i = 0 To j - 1
        FileType = NifFileType(NIF + i)
        PutValue filenum, FileType & Space(1) & Trim(.Files(NIF + i))
     Next
      
     PutValue filenum, .PlantPowerMwts, SCINOTA, " Plant Power Level:"
   End With
   
   Appl.CompartmentCount = frmCompartment.CountCompartments
   
   PutCount Appl.CompartmentCount, filenum, " Number of Compartments:"
   
   For j = 1 To MaxCompartments
     With CompartmentArr(j)
       If .Type <> 0 Then ' write used compartments only
            PutValue filenum, Space(1) + Trim(.Name), , _
               " Compartment" + Str(.Number) + ":"
            PutValue filenum, .Type, IFORMAT
            PutValue filenum, .Volume, SCINOTA
            PutValue filenum, .Features(1), IFORMAT
            PutValue filenum, PlaceHolder 'for unused sump feature
            For i = 2 To 4
              PutValue filenum, .Features(i), IFORMAT
            Next i
       Else ' mark any of this compartment's pathways inactive
          For i = 1 To MaxPathways
            With PathwayArr(i)
              If .FromComp = j Then .Active = False
              If .ToComp = j Then .Active = False
            End With
          Next i
       End If
     End With
   Next j
   
' count the active pathways and number them consecutively
   With Appl
     .PathwayCount = 0
     For j = 1 To MaxPathways
       If PathwayArr(j).Active Then
         .PathwayCount = .PathwayCount + 1
         PathwayArr(j).Number = .PathwayCount
       End If
     Next j
     PutCount .PathwayCount, filenum, " Number of Pathways:"
   End With
   
   For j = 1 To MaxPathways
     With PathwayArr(j)
       If .Active Then
         PutValue filenum, Space(1) + Trim(.Name), , _
            " Pathway" + Str(.Number) + ":"
         PutValue filenum, CompartmentArr(.FromComp).Number, IFORMAT
         PutValue filenum, CompartmentArr(.ToComp).Number, IFORMAT
         tm = 0
         For i = 1 To 4
           If .TransferMechanism(i) Then
              If i = 3 Then
                If .TM2Supo.Mode = 1 Then
                    'Optional 3.10 mode, for non-iodine aerosols
                    tm = 6
                    'File requires all data, this will actually be ignored
                    .TM2Supo.Models(3) = True
                Else
                    'legacy mode
                    tm = 3
                End If
            Else
                tm = i
              End If
              Exit For
           End If
         Next i
         PutValue filenum, tm, IFORMAT
       End If
     End With
   Next j
   
   PutValue filenum, " End of Plant Model"
'   Close #filenum
   PutScenario filenum
End Sub

Public Sub PutScenario(filenum As Integer)
Const ModelUsed = "   1"
Const fwf = "   0.0000E+00" ' fresh water fraction
Dim Response, Decay, daughter, ntype3, s
Dim Env As Integer, CRComp As Integer, CrTable As Integer
Dim i As Integer, j As Integer, Index As Integer
Dim nNIF As Integer, nRFT As Integer
'Dim Noble As Boolean - No longer used in 3.10 JCK 11/2005

   'PutValue filenum, Space(1) + Trim(Appl.ScenarioTitle), , " Scenario Description Name:"
   'PutValue filenum, Space(1) + Trim(Appl.PlantFile), , " Plant Model Filename:"
   Decay = 0
   daughter = 0

   With SourceTerm
        Select Case .DecayDaughter
          Case 1
            Decay = 1
          Case 2
            Decay = 1
            daughter = 1
        End Select

' Always write in current format
        For i = 1 To MaxSourceTerm
            If .SourceTermTable(i).CompartmentNumber = 0 Then
                Exit For
            End If
        Next
        
        j = i - 1
        PutCount j, filenum, " Source Term Input:"
        
        For i = 1 To j
            With .SourceTermTable(i)
                'NIF & RFT index is 0-based internally, 1-based in the file
                nNIF = .NifIndex + 1
                nRFT = .RftIndex + 1
                s = Space(3) & .CompartmentNumber & Space(2) & nNIF & Space(2) _
                        & nRFT & Space(2) & .Fraction
                PutValue filenum, s
            End With
        Next
        
        '---------------------------------------
        'RFT and DCF files used to be saved here
        '---------------------------------------

        PutValue filenum, .StartTime, SCINOTA
        If CalcOptions.EndTime = 0 Then
            CalcOptions.EndTime = 720#
        End If
        s = FileFormat(.DelayTime, SCINOTA) & FileFormat(CalcOptions.EndTime, SCINOTA)
        PutValue filenum, s
        PutValue filenum, daughter, IFORMAT
        
        Index = .DcfType + 1
        For i = 1 To j
          With .SourceTermTable(i)
            s = Space(3) & Index & FileFormat(.IFX(0), SCINOTA) & _
                FileFormat(.IFX(1), SCINOTA) & FileFormat(.IFX(2), SCINOTA)
            PutValue filenum, s
          End With
        Next
    End With
        
    PutValue filenum, PlaceHolder, , " Overlying Pool:" 'this decay value not used

'   overlying pool
    If SourceTerm.Opool > 0 Then
    With CompartmentArr(SourceTerm.Opool).F3OPool
      PutValue filenum, .WaterVolume, SCINOTA
      PutValue filenum, .AModelNum, IFORMAT
      Select Case .AModelNum
         Case 1
            PutCount .Count, filenum
            For i = 1 To .Count
              s = FileFormat(.times(i), SCINOTA) + _
                   FileFormat(.AerosolDecon(i), SCINOTA)
              PutValue filenum, s
            Next i
         Case 2 'powers
            With .Powers
                PutValue filenum, .Percentile, SCINOTA
                PutCount .Count, filenum
                For i = 1 To .Count
                  s = FileFormat(.times(i), SCINOTA) + _
                     FileFormat(.PoolDepth(i), SCINOTA) + _
                     FileFormat(.PoolTemp(i), SCINOTA)
                  PutValue filenum, s
                Next i
            End With
      End Select
      
'      ' elemental I
      If DataRose(.ElemDecon, .Count, "wr comp elem op" + Str(j)) Then
         PutValue filenum, ModelUsed
         PutCount .Count, filenum
'         PutValue filenum, .Count, IFORMAT
         For i = 1 To .Count
           s = FileFormat(.times(i), SCINOTA) + _
                FileFormat(.ElemDecon(i), SCINOTA)
           PutValue filenum, s
         Next i
      Else
         PutValue filenum, PlaceHolder ' no elem op
      End If
'      ' organic I
      If DataRose(.OrgDecon, .Count, "wr comp org op" + Str(j)) Then
         PutValue filenum, ModelUsed
'         PutValue filenum, .Count, IFORMAT
          PutCount .Count, filenum
         For i = 1 To .Count
           s = FileFormat(.times(i), SCINOTA) + _
               FileFormat(.OrgDecon(i), SCINOTA)
           PutValue filenum, s
         Next i
      Else
         PutValue filenum, PlaceHolder ' no organic op
      End If
      PutValue filenum, PlaceHolder  ' op volatilization - model doesn't exist
    End With
   Else 'no overlying pool compartment
    PutValue filenum, 0#, SCINOTA
    PutValue filenum, PlaceHolder ' no aero op
    PutValue filenum, PlaceHolder ' no elem op
    PutValue filenum, PlaceHolder ' no organic op
    PutValue filenum, PlaceHolder  ' op volatilization - model doesn't exist
   End If

'  ' compartment feature sprays
  
   PutCount Appl.CompartmentCount, filenum, " Compartments:"
   
   For j = 1 To MaxCompartments
     With CompartmentArr(j)
       If .Type <> 0 Then ' if compartment is used
         
           PutValue filenum, .PrintDetail, IFORMAT, " Compartment " + Format(.Number) + ":"
           If SourceTerm.DecayDaughter > 0 Then
             .Decay = 1
           Else
             .Decay = 0
           End If
           PutValue filenum, .Decay, IFORMAT
           
           If .Features(1) = 1 Then             'spray
             With .F0Sprays
                If .AModelNum > 0 Then
                   PutValue filenum, .AModelNum, IFORMAT
                   PutValue filenum, fwf
                   Select Case .AModelNum
                     Case 1  ' user defined
                       If DataRose(.AerosolRemoval, .Count, "comp spray aero" + Str(j)) Then
                         PutCount .Count, filenum
                         For i = 1 To .Count
                           s = FileFormat(.times(i), SCINOTA) + _
                                FileFormat(.AerosolRemoval(i), SCINOTA)
                           PutValue filenum, s
                         Next i
                       Else
                         PutValue filenum, PlaceHolder ' no spray aerosol data rows
                       End If
    
                     Case 2 ' powers model
                        With .Powers
                          PutValue filenum, .FracSpray, SCINOTA
                          PutValue filenum, .Percentile, SCINOTA
                          PutCount .Count, filenum
                          For i = 1 To .Count
                             s = FileFormat(.times(i), SCINOTA) + _
                                FileFormat(.Flux(i), SCINOTA) + _
                                FileFormat(.Height(i), SCINOTA)
                             PutValue filenum, s
                          Next i
                        End With
                   End Select
              Else
                PutValue filenum, PlaceHolder ' no spray aerosol
              End If ' end aerosol
'
'       'sprays elemental I
             PutValue filenum, ModelUsed
             PutValue filenum, fwf
             If DataRose(.ElemRemoval, .Count, "comp spray elem" + Str(j)) Then
               PutCount .Count, filenum
               For i = 1 To .Count
                   s = FileFormat(.times(i), SCINOTA) + _
                       FileFormat(.ElemRemoval(i), SCINOTA)
                   PutValue filenum, s
               Next i
             Else
               PutValue filenum, PlaceHolder ' zero count for no data rows
             End If
    '
    '      'sprays organic I
           PutValue filenum, ModelUsed
           PutValue filenum, fwf
           If DataRose(.OrgRemoval, .Count, "comp spray org" + Str(j)) Then
'              PutValue filenum, .Count, IFORMAT
              PutCount .Count, filenum
              For i = 1 To .Count
                  s = FileFormat(.times(i), SCINOTA) + _
                      FileFormat(.OrgRemoval(i), SCINOTA)
                  PutValue filenum, s
              Next i
           Else
             PutValue filenum, PlaceHolder ' no spray org data rows
           End If
           
           If .ElementalDF = 0 Then
            .ElementalDF = 1000000#
           End If
           
           Select Case .AModelNum 'JCK
            Case 1 'User
                If .AerosolDF = 0 Then
                    .AerosolDF = 1000000#
                End If
                If .LambdaAerosol = 0 Then
                    .LambdaAerosol = 1000000#
                End If
                s = FileFormat(.AerosolDF, SCINOTA) + FileFormat(.LambdaAerosol, SCINOTA) _
                                        + FileFormat(.ElementalDF, SCINOTA)
                PutValue filenum, s
            Case 2 'Powers
                s = FileFormat(.ElementalDF, SCINOTA)
                PutValue filenum, s
            End Select
         End With ' end f0sprays
        Else
            PutValue filenum, PlaceHolder ' no spray aerosol
            PutValue filenum, PlaceHolder ' no spray elem
            PutValue filenum, PlaceHolder ' no spray org
        End If ' end feature(0)
        PutValue filenum, PlaceHolder ' sump not used

 ' recirc filters
    
    If .Features(2) = 1 Then
        PutValue filenum, ModelUsed
        With .F1ReFilters
           'PutValue filenum, .ForcedFlow, SCINOTA
'           PutValue filenum, .Count, IFORMAT
            PutCount .Count, filenum
          For i = 1 To .Count
             s = FileFormat(.times(i), SCINOTA) + _
                  FileFormat(.FlowRates(i), SCINOTA) + _
                  FileFormat(.AeroEffic(i), SCINOTA) + _
                  FileFormat(.ElemIEffic(i), SCINOTA) + _
                  FileFormat(.OrgIEffic(i), SCINOTA)
             PutValue filenum, s
          Next i
          
          'Filter failure is always written
          PutCount .FailEnable, filenum
          s = FileFormat(.FailureData(1), SCINOTA) + FileFormat(.FailureData(2), SCINOTA) + _
                  FileFormat(.FailureData(3), SCINOTA) + FileFormat(.FailureData(4), SCINOTA) + _
                  FileFormat(.FailureData(5), SCINOTA)
          PutValue filenum, s
          PutValue filenum, .StopTime, SCINOTA
        End With
    Else
      PutValue filenum, PlaceHolder ' recirc filters not used
    End If
'
' ' natural deposition, aerosol
      
      If .Features(3) = 1 Then
        With .F2Deposition
          If .AModelNum > 0 Then
            PutValue filenum, .AModelNum, IFORMAT
            Select Case .AModelNum
              Case 1                     'user defined
                 If DataRose(.AerosolRemoval, .Count, "comp dep aero " + Str(j)) Then
'                    PutValue filenum, .Count, IFORMAT
                   PutCount .Count, filenum
                    For i = 1 To .Count
                      s = FileFormat(.times(i), SCINOTA) + _
                        FileFormat(.AerosolRemoval(i), SCINOTA)
                      PutValue filenum, s
                    Next i
                 Else
                    PutValue filenum, PlaceHolder ' no data rose for
                 End If
             
              Case 2                   'henry
                  With .Henry
'                    PutValue filenum, .Count, IFORMAT
                    PutCount .Count, filenum
                    For i = 1 To .Count
                      s = FileFormat(.times(i), SCINOTA) + _
                                FileFormat(.FallHeight(i), SCINOTA) + _
                                FileFormat(.ParticleDensity(i), SCINOTA)
                      PutValue filenum, s
                    Next i
                  End With
    
              Case 3                   'powers dep
                  With .Powers
                    If .ReactorAccidentType = 0 Then
                        'Default value, 0 is illegal
                        .ReactorAccidentType = 1
                        .Percentile = 10
                    End If
                    PutValue filenum, .ReactorAccidentType, IFORMAT
                    PutValue filenum, .Percentile, SCINOTA
                  End With
            End Select
        Else
            PutValue filenum, PlaceHolder 'no aerosol dep model
        End If ' end aerosol
        
       ' deposition - elemental
          
         
         If DataRose(.ElemRemoval, .Count, "comp dep elem" + Str(j)) Then
             PutValue filenum, ModelUsed
'             PutValue filenum, .Count, IFORMAT
              PutCount .Count, filenum
             For i = 1 To .Count
               s = FileFormat(.times(i), SCINOTA) + _
                    FileFormat(.ElemRemoval(i), SCINOTA)
               PutValue filenum, s
             Next i
             
        Else
          PutValue filenum, PlaceHolder  ' no elemental data rose for deposition
        End If
       End With 'f2dep
     Else
        PutValue filenum, PlaceHolder ' no dep aerosol
        PutValue filenum, PlaceHolder ' no dep elem
     End If ' if dep feature used
            
       
     End If ' if used compartment
    End With ' with compartment array
   Next j ' next compartment
   

   PutCount Appl.PathwayCount, filenum, " Pathways:"


  For j = 1 To MaxPathways
    With PathwayArr(j)
      If .Active Then
        PutValue filenum, .PrintDetail, IFORMAT, _
           " Pathway " + Format(.Number) + ":"
        PutValue filenum, PlaceHolder ' decay, not used
        
      ' determine and write one transfer mechanism per pathway
        Select Case True
          Case .TransferMechanism(1) ' piping
            With .TM0Piping
              PutValue filenum, .AModelNum, IFORMAT
              Select Case .AModelNum
                Case 1  'user defined
                   PutCount .Count, filenum
                   For i = 1 To .Count
                     s = FileFormat(.times(i), SCINOTA) + _
                       FileFormat(.AerosolDF(i), SCINOTA) + _
                       FileFormat(.FlowRates(i), SCINOTA)
                     PutValue filenum, s
                   Next i

                Case 2, 3 ' brockmann-bixler
                   With .BrockmannA
                      s = FileFormat(.TotalSurfaceArea, SCINOTA) _
                                    & FileFormat(.Volume, SCINOTA) _
                                    & FileFormat(.BendAngle, "  0.000") _
                                    & FileFormat(.WallTemp, "  0.000") _
                                    & FileFormat(.Pressure, "  0.000") _
                                    & FileFormat(.SettlingVelocity, SCINOTA)
                      PutValue filenum, s
                      
                      PutCount .Count, filenum
                      For i = 1 To .Count
                        s = FileFormat(.times(i), SCINOTA) + _
                             FileFormat(.FlowRates(i), SCINOTA)
                        PutValue filenum, s
                      Next i
                   End With ' end brockmann model
                   
                   If .EModelNum = 1 Then
                      Index = i - 1 'Recover count
                      ReDim .ElemIDF(1 To Index)
                      ReDim .OrgIDF(1 To Index)
                      ReDim .times(1 To Index)
                      
                      For i = 1 To Index
                        .times(i) = .BrockmannA.times(i)
                        .ElemIDF(i) = 1
                        .OrgIDF(i) = 1
                      Next
                      
                      'Special case for No Vapor Deposition
                      PutElementalData filenum, j
                      PutOrganicData filenum, j
                   End If
              End Select ' end which aerosol model
              
              Select Case .AModelNum
                Case 1
                 PutElementalData filenum, j
                Case 2, 3 'brockmann-bixler
                  'Data already written for Vapor Deposition = None
                  If .EModelNum <> 1 Then
                    PutValue filenum, .EModelNum, IFORMAT
                    If .EModelNum = 3 Then
                        PutValue filenum, .BrockmannA.ElementalVelocity 'JCK - 9/2006
                    End If
                  End If
                Case Else
                  PutValue filenum, PlaceHolder ' no piping elemental
              End Select ' end elemental
              
              Select Case .AModelNum
                Case 1
                    PutOrganicData filenum, j
                Case 2, 3 'brockmann-bixler
                  If .EModelNum <> 1 Then
                    'Data already written for Vapor Deposition = None
                    PutValue filenum, .OModelNum, IFORMAT
                    If .EModelNum = 3 Then
                        PutValue filenum, .BrockmannA.OrganicVelocity 'JCK 9/2006
                    End If
                  End If
                Case Else
                  PutValue filenum, PlaceHolder ' no piping organic
              End Select ' end organic
            End With ' end piping
            PutValue filenum, PlaceHolder ' no filter
            PutValue filenum, PlaceHolder ' no generic aerosol
            PutValue filenum, PlaceHolder ' no generic elem
            PutValue filenum, PlaceHolder ' no generic organic
            PutValue filenum, PlaceHolder ' no generic volatilization
            PutValue filenum, PlaceHolder ' no air leak
            PutValue filenum, PlaceHolder ' no waterleak
            
          Case .TransferMechanism(2) ' filter
            PutValue filenum, PlaceHolder ' no piping aerosol
            PutValue filenum, PlaceHolder ' no piping elem
            PutValue filenum, PlaceHolder ' no piping organic
            PutValue filenum, ModelUsed ' filter
            With .TM1Filter
'              PutValue filenum, .Count, IFORMAT
               PutCount .Count, filenum
              For i = 1 To .Count
                s = FileFormat(.times(i), SCINOTA) + _
                    FileFormat(.FlowRates(i), SCINOTA) + _
                    FileFormat(.AerH(i), SCINOTA) + _
                    FileFormat(.ElemIH(i), SCINOTA) + _
                    FileFormat(.OrgIH(i), SCINOTA)
                PutValue filenum, s
              Next i
              PutCount .FailEnable, filenum
              s = FileFormat(.FailureData(1), SCINOTA) + FileFormat(.FailureData(2), SCINOTA) + _
                  FileFormat(.FailureData(3), SCINOTA) + FileFormat(.FailureData(4), SCINOTA) + _
                  FileFormat(.FailureData(5), SCINOTA)
              PutValue filenum, s
              PutValue filenum, .StopTime, SCINOTA
            End With
            PutValue filenum, PlaceHolder ' no generic aerosol
            PutValue filenum, PlaceHolder ' no generic elem
            PutValue filenum, PlaceHolder ' no generic organic
            PutValue filenum, PlaceHolder ' no generic volatilization
            PutValue filenum, PlaceHolder ' no air leak
            PutValue filenum, PlaceHolder ' no waterleak
            
          Case .TransferMechanism(3) 'Generic
            PutValue filenum, PlaceHolder ' no piping aerosol
            PutValue filenum, PlaceHolder ' no piping elem
            PutValue filenum, PlaceHolder ' no piping organic
            PutValue filenum, PlaceHolder ' no filter
            With .TM2Supo
' Belcourt commented out the next two lines to fix a problem
' with iodines in the suppression pool.

'               If DataRose(.AerosolDF, .Count) Then
                'If .Models(1) Then
                '    Noble = True
                'For 3.10, all models are always used JCK 11/2005
                    PutValue filenum, ModelUsed
                    PutValue filenum, PlaceHolder ' initial_volume, not used
'                    PutValue filenum, .Count, IFORMAT 'aerosol
                    PutCount .Count, filenum
                    For i = 1 To .Count
                      s = FileFormat(.times(i), SCINOTA) + _
                          FileFormat(.AerosolDF(i), SCINOTA) + _
                          FileFormat(.FlowRatesAER(i), SCINOTA) 'JCK
                          'fileformat(.FlowRates(i), SCINOTA)
                      PutValue filenum, s
                    Next i
                'Else
                '    PutValue filenum, PlaceHolder ' no generic aerosol
                'End If
                
'               If DataRose(.ElemIDF, .Count) Then
                'If .Models(2) Then
                '    Noble = True
                'For 3.10, all models are always used JCK 11/2005
                    PutValue filenum, ModelUsed
                    PutValue filenum, PlaceHolder ' initial_volume, not used
'                    PutValue filenum, .Count, IFORMAT 'elemental
                    PutCount .Count, filenum
                    For i = 1 To .Count
                      s = FileFormat(.times(i), SCINOTA) + _
                          FileFormat(.ElemIDF(i), SCINOTA) + _
                          FileFormat(.FlowRatesELM(i), SCINOTA) 'JCK
                          'fileformat(.FlowRates(i), SCINOTA)
                      PutValue filenum, s
                    Next i
                'Else
                '    PutValue filenum, PlaceHolder ' no generic elem
                'End If
                
'               If DataRose(.OrgIDF, .Count) Then
                'If .Models(3) Then
                '    Noble = True
                'For 3.10, all models are always used JCK 11/2005
                    PutValue filenum, ModelUsed
                    PutValue filenum, PlaceHolder ' initial_volume, not used
'                    PutValue filenum, .Count, IFORMAT 'organic
                    PutCount .Count, filenum
                    For i = 1 To .Count
                      s = FileFormat(.times(i), SCINOTA) + _
                          FileFormat(.OrgIDF(i), SCINOTA) + _
                          FileFormat(.FlowRatesORG(i), SCINOTA) 'JCK
                          'fileformat(.FlowRates(i), SCINOTA)
                      PutValue filenum, s
                    Next i
                'Else
                  'PutValue filenum, PlaceHolder ' no generic org
                'End If
                
                'If Noble Then
                    PutCount .Count, filenum
                    For i = 1 To .Count
                      s = FileFormat(.times(i), SCINOTA) + _
                          FileFormat(.FlowRatesNOB(i), SCINOTA)
                      PutValue filenum, s
                    Next i
                'Else
                '  PutValue filenum, PlaceHolder ' no generic Noble Gas
                'End If
            End With
            PutValue filenum, PlaceHolder ' no generic volatilization
            PutValue filenum, PlaceHolder ' no air leak
            PutValue filenum, PlaceHolder ' no waterleak
            
          Case .TransferMechanism(4) ' air leak - done
            PutValue filenum, PlaceHolder ' no piping aerosol
            PutValue filenum, PlaceHolder ' no piping elem
            PutValue filenum, PlaceHolder ' no piping organic
            PutValue filenum, PlaceHolder ' no filter
            PutValue filenum, PlaceHolder ' no generic aerosol
            PutValue filenum, PlaceHolder ' no generic elem
            PutValue filenum, PlaceHolder ' no generic organic
            PutValue filenum, PlaceHolder ' no generic volatilization
            
            With .TM3Leak
              If DataRose(.LeakageRates, .Count) Then
                PutValue filenum, ModelUsed
'                PutValue filenum, .Count, IFORMAT
                PutCount .Count, filenum
                For i = 1 To .Count
                    s = FileFormat(.times(i), SCINOTA) + _
                        FileFormat(.LeakageRates(i), SCINOTA)
                    PutValue filenum, s
                Next i
              Else
                PutValue filenum, PlaceHolder 'no nonzero values for leakage
              End If
            End With
            PutValue filenum, PlaceHolder ' no waterleak
                    End Select ' end which transfer mechanism
      End If ' if active pathway
    End With 'with pathway array
  Next j 'next pathway
  
  Dim effvol As dldatarecord
    
  'Determine Environment compartment number
  Env = VerifyEnvironment()
  Index = 0
  i = 0
  
  'Prepare dose locations -- elements 1 & 2 always begin as EAB & LPZ
  'Element 3 can be blank, unused
    For j = 1 To MaxDoses
      With DoseLocationArr(j)
        If Not UCase(.Name) Like "*UNUSED*" Then
          If j < 4 Then
            .CompartmentNumber = Env
            'Save offsite count for X/Q numbering
            Index = Index + 1
          End If
          i = i + 1
          .Number = i
        End If
      End With
    Next
    
    PutCount i, filenum, " Dose Locations:"

  For j = 1 To MaxDoses
    With DoseLocationArr(j)
     If Not UCase(.Name) Like "*UNUSED*" Then
      PutValue filenum, Space(1) + Trim(.Name), , " Location " + Format(.Number) + ":"
      If .Name <> "" Then
        PutValue filenum, CompartmentArr(.CompartmentNumber).Number, IFORMAT
      Else
        PutValue filenum, PlaceHolder
      End If
      
      'With .dlXQ -- X/Q tables are separate in the new 3.10 format JCK
      '  'If DoseLocationArr(j).ControlRoom Then ' save effective volume x/q
      '  '   effvol = DoseLocationArr(j).dlXQ
      '  '   PutValue filenum, PlaceHolder
      '  'Else
      '      PutValue filenum, .Model, IFORMAT
      '      If .Model = 1 Then
      '        PutCount .Count, filenum
      '        For i = 1 To .Count
      '           s = fileformat(.times(i), SCINOTA) + _
      '             fileformat(.Data(i), SCINOTA)
      '           PutValue filenum, s
      '        Next i
      '      End If
      '  'End If
      'End With 'end dlxq

      With .dlBR
        PutValue filenum, .Model, IFORMAT
        If .Model = 1 Then
'          PutValue filenum, .Count, IFORMAT
          PutCount .Count, filenum
          For i = 1 To .Count
             s = FileFormat(.times(i), SCINOTA) + _
                   FileFormat(.Data(i), SCINOTA)
              PutValue filenum, s
          Next i
        End If
      End With 'end dlbr
      
      'If .ControlRoom Then
        With .dlOccupy
          PutValue filenum, .Model, IFORMAT
          If .Model = 1 Then
'            PutValue filenum, .Count, IFORMAT
            PutCount .Count, filenum
            For i = 1 To .Count
                s = FileFormat(.times(i), SCINOTA) + _
                     FileFormat(.Data(i), SCINOTA)
                PutValue filenum, s
            Next i
          End If
        End With 'end dloccupy
      'Else
      '  PutValue filenum, PlaceHolder 'no occupancy data
      'End If 'control room
     End If ' end if used
    End With ' end dl array
  Next j 'next dose location

    'X/Q numbering
    j = 0
    For i = 1 To MaxPathXQ + 1 ' If #3 is blank there's room for an extra onsite table
      With PathXQArr(i)
        If .Name = "" Then
          .Number = 0
        Else
            If j < Index Then
                'Offsite tables
                j = j + 1
                'X/Q sequence number
                .Number = j
            Else
                'Skip #3 extra X/Q array element if empty
                If Not (Index = 2 And i = 3) Then
                    'See if onsite table is referenced - JCK 5/2006
                    'Replace entry with current sequence number if necessary
                    If CheckXQMap(.Number) Then
                        j = j + 1
                        
                        If j < .Number Then
                            ReplaceXQMap .Number, j
                        End If
                        'New X/Q sequence number
                        .Number = j
                    Else
                        'If not, remove it
                        .Name = ""
                        .Number = 0
                    End If
                End If
            End If
        End If
      End With
    Next
    
    PutCount j, filenum, " X/Q Tables:"
    Appl.PathDependentXQcount = j
    
    For i = 1 To MaxPathXQ + 1
      With PathXQArr(i)
        If .Name <> "" Then
          PutValue filenum, Space(1) & .Name
          With .dlXQ
              PutCount .Count, filenum
              For j = 1 To .Count
                 s = FileFormat(.times(j), SCINOTA) + _
                   FileFormat(.Data(j), SCINOTA)
                 PutValue filenum, s
              Next j
          End With
        End If
      End With
    Next
    
    If Appl.PathDependentXQcount > 0 Then
     'Find paths with inflow from environment
     'Env was determined above in Dose Locations
     s = Space(3) & XQIndexCols & InflowPaths(Env)
     PutValue filenum, s, , " Inflow Pathways:"
     
     'Find paths which exhaust to the environment
     s = Space(3) & XQIndexRows & ExhaustPaths(Env)
     PutValue filenum, s, , " Exhaust Pathways:"
     
     If XQIndexRows > 0 And XQIndexCols > 0 Then
         Print #filenum, " X/Q table ID for Exhaust-Inflow paths:"
         For i = 1 To XQIndexRows
           s = Space(3)
           For j = 1 To XQIndexCols
             Index = PathXQMap(i, j)
             s = s & Index & " "
           Next
           PutValue filenum, s
         Next
     End If
    End If
  
' effective volume -- no longer used - JCK
'  With effvol
'    PutValue filenum, .Model, IFORMAT, " Effective Volume Location:"
'    If .Model = 1 Then
''        PutValue filenum, .Count, IFORMAT
'        PutCount .Count, filenum
'        For i = 1 To .Count
'            s = fileformat(.times(i), SCINOTA) + _
'               fileformat(.Data(i), SCINOTA)
'            PutValue filenum, s
'        Next i
'    End If
'  End With
  
  With CalcOptions
'   PutValue filenum, .SupplementalTimes.Count, IFORMAT, " Simulation Parameters:"
   PutCount .SupplementalTimes.Count, filenum, " Simulation Parameters:"
   For i = 1 To .SupplementalTimes.Count
       s = FileFormat(.SupplementalTimes.CalTimes(i), SCINOTA) + _
          FileFormat(.SupplementalTimes.CalTimeSteps(i), SCINOTA)
       PutValue filenum, s
   Next i
  
   PutValue filenum, Space(1) + Trim(.OutputFile), , " Output Filename:"
   PutValue filenum, .OutputOptions(EDITRESULTS), IFORMAT
   PutValue filenum, .OutputOptions(SHOWEVENT), IFORMAT
   PutValue filenum, .OutputOptions(SHOWSTEP), IFORMAT
   PutValue filenum, .OutputOptions(SHOWMODEL), IFORMAT
   PutValue filenum, .OutputOptions(SHOWCi), IFORMAT
  End With
  PutValue filenum, " End of Scenario File"
  Close #filenum
End Sub

Private Function CheckXQMap(Index As Integer) As Boolean
'See if an X/Q table occurs in the matrix
Dim i As Integer, j As Integer
    
    For i = 1 To XQIndexRows
        For j = 1 To XQIndexCols
            If PathXQMap(i, j) = Index Then
                CheckXQMap = True
                Exit Function
            End If
        Next
    Next
    CheckXQMap = False
End Function

Private Sub ReplaceXQMap(Find As Integer, Replace As Integer)
'Replace X/Q index in the matrix
Dim i As Integer, j As Integer
    
    For i = 1 To XQIndexRows
        For j = 1 To XQIndexCols
            If PathXQMap(i, j) = Find Then
               PathXQMap(i, j) = Replace
            End If
        Next
    Next
End Sub

Private Sub PutElementalData(file As Integer, Index As Integer)
Dim i As Integer
Dim s As String
    With PathwayArr(Index).TM0Piping
        Call DataRose(.ElemIDF, .Count, "pw elem piping" + Str(Index))
        Call DataRose(.FlowRates, .Count, "pw elem flowrate" + Str(Index))
         
         PutValue file, ModelUsed  'elemental I for piping
         PutCount .Count, file
         For i = 1 To .Count
            s = FileFormat(.times(i), SCINOTA) & _
                FileFormat(.ElemIDF(i), SCINOTA) & _
                FileFormat(.FlowRates(i), SCINOTA)
            PutValue file, s
         Next i
    End With
End Sub

Private Sub PutOrganicData(file As Integer, Index As Integer)
Dim i As Integer
Dim s As String
    
    With PathwayArr(Index).TM0Piping
        Call DataRose(.OrgIDF, .Count, "pw org piping" + Str(Index))
        Call DataRose(.FlowRates, .Count, "pw org flowrate" + Str(Index))
        PutValue file, ModelUsed 'organic I for piping
        PutCount .Count, file
        For i = 1 To .Count
          s = FileFormat(.times(i), SCINOTA) & _
             FileFormat(.OrgIDF(i), SCINOTA) & _
             FileFormat(.FlowRates(i), SCINOTA)
          PutValue file, s
        Next i
    End With
End Sub

Public Function DataRose(val As Variant, nval As Integer, Optional id) As Boolean
  Dim i, tot
  
On Error GoTo ArrayCheck 'JCK

  i = 0
  If Not IsArray(val) Then
    DataRose = False
    Exit Function
  End If
 
  If nval = 0 Then
    DataRose = False
    Exit Function
  End If

  If LBound(val) <> 1 Then
     DataRose = False
     Exit Function
  End If
  
  nval = UBound(val)
  
  tot = 0#
  For i = 1 To nval
    tot = tot + val(i)
  Next i

  If nval > 1 And tot = 0# Then
    DataRose = False
  Else
    DataRose = True
  End If
  Exit Function
  
ArrayCheck:
'An array may not be initialized if there's no input data
'in its data category. Under these conditions the LBound()
'check will fail, which is OK. The function will return False
'and no data will be written on output. - JCK
  With Err
    i = .Number
    If i = 9 Then
      'Subscript Out Of Range Error
      DataRose = False
      Exit Function
    Else
      .Raise i, , .Description
    End If
  End With
  
End Function

Public Function SaveFileName() As String

 On Error GoTo errorhandler
'  On Error Resume Next
    Close 'Close all files
    With cdlSave
      
      .DialogTitle = "Save"
      .CancelError = True
      .Flags = cdlOFNOverwritePrompt + cdlOFNNoReadOnlyReturn + cdlOFNHideReadOnly
      
      If CalcOptions.PlantFile = Space(Len(CalcOptions.PlantFile)) Then
        .Filename = PrevFilename
      Else
        .Filename = Trim(CalcOptions.PlantFile)
      End If

      If SavePath = "" Then
        .InitDir = App.Path
      Else
        .InitDir = SavePath
      End If

      .filter = "Plant-scenario files (*.psf)|*.psf|"
      .FilterIndex = 1
      .ShowSave
    End With
    
    SavePath = CurDir()
    SaveFileName = cdlSave.Filename
      
  Exit Function
errorhandler:

  SaveFileName = "savefileerror"
  If Err.Number = cdlCancel Then Exit Function
'  Debug.Print "save file name: ", Err.Number, Err.Description, Trim(CalcOptions.PlantFile)
End Function

Public Function OpenFileName() As String
Dim BaseName As String

On Error GoTo errorhandler
  
    Close 'close all files
  
    With cdlOpen
      If SavePath = "" Then
        .InitDir = App.Path
      Else
        .InitDir = SavePath
      End If
      
      .CancelError = True
      .Flags = cdlOFNFileMustExist + cdlOFNPathMustExist + cdlOFNHideReadOnly
      .Filename = Trim(CalcOptions.PlantFile)
      .filter = "Plant-scenario files (*.psf)|*.psf|"
      .FilterIndex = 1
      .ShowOpen
    End With
    
    If StartupPath <> LCase(App.Path) & "\" Then
        'Alternate defaults location in use JCK - 5/2006
        If Not FSO.FolderExists(StartupPath & "Defaults") Then
            'Reset to original
            StartupPath = LCase(App.Path) & "\"
        End If
    End If
    SavePath = CurDir()
    PrevFilename = cdlOpen.Filename
    OpenFileName = cdlOpen.Filename
  Exit Function
  
errorhandler:
  OpenFileName = "openfileerror"
End Function

Public Sub PutCount(ct, filenum, Optional hdg)
    Select Case IsMissing(hdg)
     Case True
        If ct < 10 Then
            PutValue filenum, ct, IFORMAT
'            Debug.Print "1ct "; ct
        Else
            PutValue filenum, ct, XFORMAT
'            Debug.Print "10ct "; ct
        End If

     Case False
        If ct < 10 Then
            PutValue filenum, ct, IFORMAT, hdg
        Else
            PutValue filenum, ct, XFORMAT, hdg
        End If
   End Select
End Sub

Public Function CheckMinData() As Boolean
  Dim Msg, i, j
  Dim ftype(DCF To TotalSourceFiles)
  
  CheckMinData = True
  ftype(DCF) = "Dose Conversion Factors"
  ftype(RFT) = "Release Fractions and Timing"
  ftype(NIF) = "Nuclide Inventory"
  
  With SourceTerm
   For i = 1 To 3  'Three categories of files in the array
     Select Case i 'We'll check #1, first RFT and first NIF
        Case 1, RFT
            j = i
        Case 3
            j = NIF
     End Select
     
     If Len(.Files(j)) = 0 Then
        If j = 2 And .SourceTermTable(1).NifType <> 2 Then
          Msg = "Missing " + ftype(i) + " filename. Specify in Source Term dialog."
          GoTo FailMinData
        End If
     End If
   Next i
  End With
  
  Appl.CompartmentCount = frmCompartment.CountCompartments
  If Appl.CompartmentCount = 0 Then
    Msg = "No Compartments are defined."
    GoTo FailMinData
  End If
  
  i = NotConnected() 'JCK
  If i > 0 Then
    Msg = "No pathway connects to " & CompartmentArr(i).Name
    GoTo FailMinData
  End If
  
  If NumDoseLocations = 0 Then 'JCK
    Msg = "At least 1 Dose Location must be specified"
    GoTo FailMinData
  End If
  
  For i = 1 To NumDoseLocations
    If DoseLocationArr(i).ControlRoom Then
      If PathXQArr(i).dlXQ.Model <> 1 Then
        Msg = DoseLocationArr(i).Name & " has no X/Q values & vbcrlf" _
                & "Select X/Q, then Onsite to update X/Q table"
        Exit For
      End If
    End If
  Next
  
  If i < NumDoseLocations Then GoTo FailMinData
  
  If PathwayNoXQ(True) Then
    Msg = "Not all pathways connected to the environment have X/Q tables assigned"
    GoTo FailMinData
  End If
  
  If VerifyEnvironment > 0 Then 'JCK
      Exit Function
  Else
      Msg = "No Environment compartment"
  End If
  
FailMinData:
  MsgBox Msg, vbOKOnly + vbInformation, "Minimum Data Check"
  CheckMinData = False
End Function

Function NotConnected() As Integer
'Verify that every comparment has at least 1 pathway connecting to it
Dim i%, j%

    For i = 1 To MaxCompartments 'JCK
        If CompartmentArr(i).Number > 0 Then
            For j = 1 To MaxPathways
                With PathwayArr(j)
                    If CompartmentArr(i).Number = .FromComp Or _
                            CompartmentArr(i).Number = .ToComp Then
                        Exit For
                    End If
                End With
            Next
            
            If j > MaxPathways Then
                NotConnected = CompartmentArr(i).Number 'JCK 5/2006
                Exit Function
            End If
        End If
    Next
    
    NotConnected = 0
End Function

Function NumDoseLocations() As Boolean
Dim i%, j%

    j = 0
    For i = 1 To MaxDoses 'JCK
        With DoseLocationArr(i)
            If Not .Name Like "*UNUSED*" And .CompartmentNumber > 0 Then
                j = j + 1
            End If
        End With
    Next
    NumDoseLocations = j
End Function

Private Sub txtCaseTitle_Change()
    CaseTitleModified = True
End Sub

Private Sub txtCaseTitle_LostFocus()
    If CaseTitleModified Then
        Appl.CaseTitle = Trim(txtCaseTitle)
        CaseTitleModified = False
    End If
End Sub
