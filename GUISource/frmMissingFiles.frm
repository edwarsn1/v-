VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMissingFiles 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Missing Files"
   ClientHeight    =   4425
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4425
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.Frame fraBrowse 
      Caption         =   "Click filename below to browse for correct path"
      Height          =   2655
      Left            =   360
      TabIndex        =   2
      Top             =   720
      Width           =   5295
      Begin VB.ListBox lstFiles 
         Height          =   1425
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   4815
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "Browse"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2040
         TabIndex        =   3
         Top             =   2040
         Width           =   1215
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   120
      Top             =   3720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdDone 
      Caption         =   "Done"
      Height          =   375
      Left            =   2400
      TabIndex        =   0
      Top             =   3720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "The files shown below were not found in the location shown"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   5775
   End
End
Attribute VB_Name = "frmMissingFiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private PrevFolder As String

Private Sub cmdDone_Click()
    Unload Me
End Sub

Private Sub Form_Load()
Dim CurrentSize As Single
Dim NewSize As Single
Dim Diff As Single
Dim i As Integer

    CurrentSize = lstFiles.Width
    
    With SourceTerm
        For i = DCF To TotalSourceFiles
            If .MissingFile(i) Then
                'Keep the window wide enough for all the text
                NewSize = TextWidth(Trim(SourceTerm.Files(i)) & "w")
                If NewSize > CurrentSize Then
                    Diff = NewSize - CurrentSize
                    CurrentSize = NewSize
                    Me.Width = Me.Width + Diff
                    fraBrowse.Width = fraBrowse.Width + Diff
                    lstFiles.Width = lstFiles.Width + Diff
                    Label1.Width = Label1.Width + Diff
                    cmdBrowse.Left = fraBrowse.Width / 2 - cmdBrowse.Width / 2
                    cmdDone.Left = Me.ScaleWidth / 2 - cmdDone.Width / 2
                End If
                With lstFiles
                    .AddItem Trim(SourceTerm.Files(i))
                    .ItemData(.NewIndex) = i
                End With
            End If
        Next
    End With
End Sub

Private Sub lstFiles_Click()
    cmdBrowse.Enabled = True
End Sub

Private Sub cmdBrowse_Click()
Dim FilePath As String
Dim Ext As String
Dim Scratch As String
Dim Response As VbMsgBoxResult
Dim i As Integer

    With lstFiles
      If .ListIndex >= 0 Then
        Scratch = .List(.ListIndex)
    
        i = InStrRev(Scratch, ".")
        If i > 0 Then
            Ext = Right(Scratch, Len(Scratch) - i)
        Else
            Ext = ""
        End If
            
        If PrevFolder = "" Then
            FilePath = BrowseFile(Ext, StartupPath)
        Else
            FilePath = BrowseFile(Ext, PrevFolder)
        End If
            
        If FilePath <> "" Then
            Response = MsgBox("Replace " & .List(.ListIndex) & vbCrLf _
                                & "with" & vbCrLf _
                                & FilePath & "?", vbYesNo, "Changing " _
                                & UCase(Ext) & "File")
            If Response = vbYes Then
                SourceTerm.Files(.ItemData(.ListIndex)) = LCase(FilePath)
                .RemoveItem .ListIndex
                If lstFiles.ListCount = 0 Then
                    cmdDone.SetFocus
                End If
                frmRadtrad.SaveState True
            End If
        End If
      End If
    End With

End Sub

Private Function BrowseFile(Ext As String, Startfolder) As String
Dim Extension As String
Dim i As Integer

On Error GoTo errorhandler
 
  With CommonDialog
    .InitDir = Startfolder
  
    .CancelError = True
  
    Select Case LCase(Ext)
      Case "nif"
        .filter = "Nuclide inventory files(*.nif)|*.nif|Release fractions and timing(*.rft)|*.rft|Dose conversion files(*.inp)|*.inp"
      Case "rft"
        .filter = "Release fractions and timing(*.rft)|*.rft|Nuclide inventory files(*.nif)|*.nif|Dose conversion files(*.inp)|*.inp"
      Case "dcf"
        .filter = "Dose conversion files(*.inp)|*.inp|Nuclide inventory files(*.nif)|*.nif|Release fractions and timing(*.rft)|*.rft"
      Case Else
        .filter = ""
    End Select
  
  .Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
  .Filename = ""
  .ShowOpen
  BrowseFile = .Filename
  
  i = InStrRev(BrowseFile, "\")
  If i > 2 Then
    PrevFolder = Left(BrowseFile, i - 1)
  End If
 End With
 Exit Function
 
errorhandler:
If Err.Number = CancelSelected Then
    BrowseFile = ""
ElseIf Err.Number <> 0 Then
    MsgBox Err.Description, vbExclamation, "BrowseFile()"
End If
End Function
