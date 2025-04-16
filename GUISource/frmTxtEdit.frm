VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "Richtx32.ocx"
Begin VB.Form frmTxtEdit 
   AutoRedraw      =   -1  'True
   BackColor       =   &H8000000B&
   Caption         =   "TextEdit"
   ClientHeight    =   5388
   ClientLeft      =   132
   ClientTop       =   816
   ClientWidth     =   8628
   LinkTopic       =   "Form1"
   ScaleHeight     =   5388
   ScaleWidth      =   8628
   StartUpPosition =   3  'Windows Default
   Begin ComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   396
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   8628
      _ExtentX        =   15219
      _ExtentY        =   699
      ButtonWidth     =   635
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   327682
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2160
      Top             =   1320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      PrinterDefault  =   0   'False
   End
   Begin VB.Frame Frame1 
      Height          =   4935
      Left            =   3120
      TabIndex        =   4
      Top             =   120
      Width           =   3255
      Begin VB.FileListBox File1 
         Height          =   264
         Left            =   240
         TabIndex        =   3
         TabStop         =   0   'False
         ToolTipText     =   "DblClick a file name to open in text window."
         Top             =   1680
         Width           =   780
      End
      Begin VB.DirListBox Dir1 
         Height          =   540
         Left            =   240
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   840
         Width           =   735
      End
      Begin VB.DriveListBox Drive1 
         Height          =   315
         Left            =   240
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   360
         Width           =   735
      End
   End
   Begin RichTextLib.RichTextBox rchContent 
      Height          =   735
      Left            =   240
      TabIndex        =   0
      Top             =   1080
      Width           =   1575
      _ExtentX        =   2773
      _ExtentY        =   1291
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   3
      DisableNoScroll =   -1  'True
      TextRTF         =   $"frmTxtEdit.frx":0000
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   240
      Top             =   2160
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   12
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":0080
            Key             =   "copy"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":00DE
            Key             =   "cut"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":013C
            Key             =   "delete"
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":019A
            Key             =   "open"
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":01F8
            Key             =   "paste"
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":0256
            Key             =   "preview"
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":02B4
            Key             =   "print"
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":0312
            Key             =   "redo"
         EndProperty
         BeginProperty ListImage9 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":0370
            Key             =   "save"
         EndProperty
         BeginProperty ListImage10 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":03CE
            Key             =   "sum"
         EndProperty
         BeginProperty ListImage11 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":042C
            Key             =   "undo"
         EndProperty
         BeginProperty ListImage12 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmTxtEdit.frx":048A
            Key             =   "w"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileNew 
         Caption         =   "&New.."
         Shortcut        =   ^N
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open.."
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuFileClose 
         Caption         =   "&Close"
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSave 
         Caption         =   "&Save"
         Enabled         =   0   'False
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuFileSaveAs 
         Caption         =   "Save &As.."
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFilePrint 
         Caption         =   "&Print"
      End
      Begin VB.Menu mnuFilePrinter 
         Caption         =   "Prin&ter Setup.."
         Visible         =   0   'False
      End
      Begin VB.Menu mnus2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
         Shortcut        =   ^Q
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuEditUndo 
         Caption         =   "&Undo"
         Enabled         =   0   'False
         Shortcut        =   ^U
      End
      Begin VB.Menu mnuEditRedo 
         Caption         =   "&Redo"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuEditDelimit 
         Caption         =   "&Delimit Sel with.."
         Enabled         =   0   'False
         Begin VB.Menu mnuEditSelectionComma 
            Caption         =   "&Commas"
         End
         Begin VB.Menu mnuEditSelectionTab 
            Caption         =   "&Tabs"
         End
      End
      Begin VB.Menu mnuSepD 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditRemove 
         Caption         =   "&Remove Delimiter.."
         Enabled         =   0   'False
         Begin VB.Menu mnuEditSelectionRemComma 
            Caption         =   "&Commas"
         End
         Begin VB.Menu mnuEditSelectionRemTab 
            Caption         =   "&Tabs"
         End
      End
      Begin VB.Menu mnuSepT 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditCut 
         Caption         =   "&Cut"
         Enabled         =   0   'False
         Shortcut        =   ^X
      End
      Begin VB.Menu mnuEditCopy 
         Caption         =   "&Copy "
         Enabled         =   0   'False
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuEditPaste 
         Caption         =   "&Paste "
         Enabled         =   0   'False
         Shortcut        =   ^V
      End
      Begin VB.Menu mnuSepDel 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditDelete 
         Caption         =   "&Delete Sel "
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuSep4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditSelectAll 
         Caption         =   "&Select All"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu mnuFormat 
      Caption         =   "&Format"
      Begin VB.Menu mnuFormatFonts 
         Caption         =   "&Fonts"
      End
   End
End
Attribute VB_Name = "frmTxtEdit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const MaxUndos As Integer = 50
Private TheFileName As String
Dim FrameIsMoving As Boolean
Dim HorizontalMove As Boolean   ' resize width of frame
Dim VerticalMoveDir As Boolean  ' resize heights of dir and file boxes
Dim VerticalMoveFile As Boolean ' resize height of file box
Dim UndoInProgress As Boolean
Dim Target As TextBox
Private Type UndoRecord
  PrevText As String
  SelStart As Long
  SelLength As Long
End Type
Dim Undo(1 To MaxUndos) As UndoRecord
Dim CurrentUndoNum As Integer
Dim Loading As Boolean

Private Sub Dir1_Change()
  File1.Path = Dir1.Path
End Sub

Private Sub Dir1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Frame1.MousePointer = vbDefault
End Sub

Private Sub Drive1_Change()
 Dir1.Path = Drive1.Drive
End Sub

Private Sub File1_DblClick()
 ' select a file, load into rich text box
  On Error Resume Next
  With File1
    If Right(.Path, 1) <> "\" Then
      Filename = .Path + "\" + .Filename
    Else
      Filename = .Path + .Filename
    End If
  End With
  
  InitUndo
  LoadAFile
  
'  rchContent.SetFocus
  mnuEditSelectAll.Enabled = True
  mnuFileSave.Enabled = True
  mnuFileClose.Enabled = True
End Sub

Private Sub File1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 Frame1.MousePointer = vbDefault
End Sub

Private Sub Form_Activate()
Dim s As String
Dim i As Integer

    s = Me.Tag
    With CommonDialog1
      .Filename = s
      .filter = frmRadtrad.Tag
      .Flags = &H280806
      i = InStrRev(s, "\")
      If i > 0 Then
        .InitDir = Left(s, i - 1)
      End If
      Select Case UCase(Right(Tag, 4))
        Case ".NIF"
          .FilterIndex = 1
        Case ".RFT"
          .FilterIndex = 2
        Case ".INP"
          .FilterIndex = 3
      End Select
  
    If s = "" Then
        .InitDir = Appl.DefaultPath
         Dir1.Path = .InitDir
         i = InStrRev(Tag, ".")
         File1.Pattern = "*.o*"
         rchContent.SetFocus
       Exit Sub
    Else
      ' Belcourt trims the filename prior to parsing
      s = Trim(s)
      Filename = s
      If Dir(ParseFilePath(s), vbDirectory) <> "" Then
         .InitDir = ParseFilePath(s)
         Dir1.Path = .InitDir
      End If
      
      Loading = True
      mnuFileOpen_Click
      Loading = False

      i = InStrRev(Tag, ".")
      If Mid(Tag, i + 1, 1) = "o" Then
        File1.Pattern = "*.o*"
        rchContent.SetFocus
        For i = 1 To 10
           SendKeys "^{End}", True
        Next
      End If
    End If
  End With
End Sub

Private Sub Form_Load()
 
 CreateToolbar
 InitUndo
 
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
 Unload Me
End Sub

Private Sub Form_Resize()
 If WindowState = vbMinimized Then Exit Sub
 If ScaleHeight = 0 Then
   Exit Sub
 End If
 If ScaleWidth < 7500 Then
   Frame1.Width = ScaleWidth / 3
 Else
   Frame1.Width = 2500
 End If
 Frame1.Height = ScaleHeight - Toolbar1.Height
 With rchContent
  .Width = ScaleWidth - Frame1.Width - 100
  .Height = Frame1.Height
  .Left = 100
  .Top = Toolbar1.Height
   Frame1.Left = .Left + .Width + 100
  Frame1.Top = .Top
 End With
 ResizeFrameControls
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  
  If Button = vbRightButton Then
    ' refresh frame1 controls
     Drive1.Refresh
     Dir1.Refresh
     File1.Refresh
  ElseIf vbLeftButton And X < 200 And Y > 100 Then
    ' resize width of frame1
     FrameIsMoving = True
     HorizontalMove = True
  ElseIf vbLeftButton And X > 200 And Y > Dir1.Top + Dir1.Height And _
          Y <= File1.Top Then
    ' resize height of dir1 and height and top of file1
     FrameIsMoving = True
     VerticalMoveDir = True
  ElseIf vbLeftButton And X > 200 And Y > File1.Top + File1.Height And _
          Y <= File1.Top + File1.Height + 200 Then
    ' resize height of file1
     FrameIsMoving = True
     VerticalMoveFile = True
  End If
  
End Sub

Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  
  If FrameIsMoving Then
    Exit Sub
  End If
  
  With Frame1
'  Else
'  If IsIn(Frame1, 0, 150, X, Y) Then
'    Frame1.MouseIcon = Frame1.DragIcon
'    Frame1.MousePointer = 99
  If X < 200 And Y > 100 Then
    .MousePointer = vbSizeWE
  ElseIf (X > 200 And Y > Dir1.Top + Dir1.Height And _
          Y <= File1.Top) Then
     .MousePointer = vbSizeNS
  ElseIf (X > 200 And Y > File1.Top + File1.Height And _
          Y <= File1.Top + File1.Height + 200) Then
     .MousePointer = vbSizeNS
  Else
   .MousePointer = vbDefault
  End If
  End With
End Sub

Private Sub Frame1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  ' release of left MB at new position for frame1.left.
  ' This X is relative to the frame, not to the form.
  If FrameIsMoving And Button = vbLeftButton Then
    Select Case True
     Case HorizontalMove:
        Frame1.Left = Frame1.Left + X
        Frame1.Width = ScaleWidth - Frame1.Left
        rchContent.Width = ScaleWidth - Frame1.Width
        ResizeFrameControls
    
     Case VerticalMoveDir:
       Dim totheight
       
       totheight = Dir1.Height + File1.Height + 200
       Dir1.Height = Y - Dir1.Top
       File1.Top = Dir1.Top + Dir1.Height + 200
       File1.Height = totheight - Dir1.Height - 200
       
     Case VerticalMoveFile:
       File1.Height = Y - File1.Top
   
    End Select
    
    FrameIsMoving = False
    HorizontalMove = False
    VerticalMoveDir = False
    VerticalMoveFile = False
    Frame1.MousePointer = vbDefault
  End If
End Sub


Private Sub mnuEditRedo_Click()
   Dim Response
 ' restore most recent undo record
   UndoInProgress = True ' leave undo array alone
   If CurrentUndoNum < MaxUndos Then
    CurrentUndoNum = CurrentUndoNum + 1
   End If
'   MsgBox Str(CurrentUndoNum) + Undo(CurrentUndoNum).PrevText
   If Undo(CurrentUndoNum).PrevText = "" Then
       Exit Sub
   End If
  With rchContent
   .Text = Undo(CurrentUndoNum).PrevText
   .SelStart = Undo(CurrentUndoNum).SelStart
   .SelLength = Undo(CurrentUndoNum).SelLength
  End With
  
  UndoInProgress = False
End Sub

Private Sub mnuEditSelectAll_Click()
  With rchContent
    .SelStart = 0
    .SelLength = Len(.Text)
  End With
End Sub

Private Sub mnuEditDelete_Click()
  AppActivate Me.Caption
  SendKeys "{DELETE}"
  
End Sub

Private Sub mnuEditSelectionComma_Click()
' replace spaces with commas
  With rchContent
     .SelText = DelimitString(.SelText, " ", ",")
    If CurrentUndoNum > 1 Then
      .SelStart = Undo(CurrentUndoNum - 1).SelStart
      .SelLength = Undo(CurrentUndoNum - 1).SelLength
    End If
  End With
End Sub

Private Sub mnuEditSelectionRemComma_Click()
' replace commas with spaces
With rchContent
  .SelText = DelimitString(.SelText, ",", " ")
End With
End Sub

Private Sub mnuEditSelectionRemTab_Click()
' replace tabs with spaces
 With rchContent
 .SelText = DelimitString(.SelText, vbTab, " ")
 End With
End Sub

Private Sub mnuEditSelectionTab_Click()
' replace spaces with tabs
  With rchContent
      .SelText = DelimitString(.SelText, " ", vbTab)
  If CurrentUndoNum > 1 Then
    .SelStart = Undo(CurrentUndoNum - 1).SelStart
    .SelLength = Undo(CurrentUndoNum - 1).SelLength
  End If
  End With
End Sub

Private Sub mnuEditUndo_Click()
   Dim Response
   
   UndoInProgress = True
   If CurrentUndoNum > 1 Then
    CurrentUndoNum = CurrentUndoNum - 1
  End If
'   MsgBox Str(CurrentUndoNum) + Undo(CurrentUndoNum).PrevText
  If Undo(CurrentUndoNum).PrevText = "" Then
    Exit Sub
  End If
  With rchContent
   .Text = Undo(CurrentUndoNum).PrevText
   .SelStart = Undo(CurrentUndoNum).SelStart
   .SelLength = Undo(CurrentUndoNum).SelLength
   .HideSelection = False
  End With
  
  UndoInProgress = False
  mnuEditRedo.Enabled = True
End Sub

Private Sub mnuExit_Click()
 Unload Me
End Sub

Private Sub mnuFileClose_Click()
 rchContent.Text = ""
 Filename = ""
End Sub

Private Sub mnuFileNew_Click()
'  mnuFileSaveAs_Click
  With rchContent
    If Len(.Text) > 0 Then
      mnuFileSaveAs_Click
    End If
    .SetFocus
    .Text = ""
  End With
  
  With CommonDialog1
    If Right(.InitDir, 1) <> "\" Then
      Filename = .InitDir + "\Unnamed.txt"
    Else
      Filename = .InitDir + "Unnamed.txt"
    End If
  End With
'  MsgBox FileName
  InitUndo
End Sub

Private Sub mnuFileOpen_Click()
 If Not Loading Or Len(Filename) = 0 Then 'no specific file to load yet
    Filename = getFile
    If Filename = "getFileError" Then
      Filename = ""
      Exit Sub
    End If
 End If
  
  InitUndo
  If Dir(Filename) <> "" Then
    LoadAFile
    mnuEditSelectAll.Enabled = True
    mnuFileClose.Enabled = True
  End If
 
End Sub

Private Sub mnuFilePrint_Click()
Dim res
   On Error GoTo errorhandler
   
   CommonDialog1.Flags = cdlPDReturnDC Or cdlPDNoPageNums
    If rchContent.SelLength = 0 Then
        CommonDialog1.Flags = CommonDialog1.Flags Or cdlPDAllPages
    Else
        CommonDialog1.Flags = CommonDialog1.Flags Or cdlPDSelection
    End If
    CommonDialog1.ShowPrinter
    Printer.Print ""
    rchContent.SelPrint CommonDialog1.hDC

    'rchContent.SelPrint Printer.hDC
  
   Exit Sub
errorhandler:
  MsgBox "Print Error: " + Str(Err.Number) + " - " + Err.Description
  Exit Sub
End Sub

Private Sub mnuFilePrinter_Click()
  
   With CommonDialog1
     .Flags = cdlPDPrintSetup
     .CancelError = False
     .ShowPrinter
     Printer.Copies = .Copies
   End With

End Sub

Private Sub mnuFileSave_Click()
 On Error Resume Next
 If Filename = "" Then
   mnuFileSaveAs_Click
   Exit Sub
 End If
 With rchContent
 If .Text <> "" Then
   SaveAFile
'   .SaveFile Filename, rtfText
 End If
 End With
End Sub

Private Sub mnuFileSaveAs_Click()
   On Error GoTo errorhandler
   
   With CommonDialog1
     .CancelError = True
     .Filename = Filename
     .Flags = cdlOFNOverwritePrompt + cdlOFNHideReadOnly
     .ShowSave
     .InitDir = Left(.Filename, InStr(.Filename, .FileTitle) - 1)
     Dir1.Path = .InitDir
     Filename = .Filename
   End With
   
   SaveAFile
'   rchContent.SaveFile Filename, rtfText
   Drive1.Refresh
   Dir1.Refresh
   File1.Refresh
   mnuFileSave.Enabled = True
   mnuFileClose.Enabled = True
   mnuEditSelectAll.Enabled = True

   Target.Text = Filename
   Exit Sub
errorhandler:
   Exit Sub
End Sub

Private Sub mnuFormatFonts_Click()
   ' Set Cancel to True
    With CommonDialog1
      .CancelError = True
      On Error GoTo ErrHandler
    ' Set the Flags property
      .Flags = cdlCFScreenFonts
    ' Display the Font dialog box
      .FontName = rchContent.Font.Name
      .ShowFont
    End With
    With rchContent.Font
      .Name = CommonDialog1.FontName
      .Size = CommonDialog1.FontSize
      .Bold = CommonDialog1.FontBold
      .Italic = CommonDialog1.FontItalic
'      .Font.Underline = CommonDialog1.FontUnderline
'      .Font.Strikethru = CommonDialog1.FontStrikethru
    End With
    Exit Sub
ErrHandler:
    ' User pressed the Cancel button
    Exit Sub

End Sub

Private Sub rchContent_Change()

 If Not UndoInProgress Then
  UpdateUndo rchContent.Text
 End If
 mnuFileSave.Enabled = True
End Sub

Private Sub rchContent_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   If Button = vbRightButton Then
      PopupMenu mnuEdit
'   ElseIf rchContent.SelLength > 0 And Button = vbLeftButton Then
'      rchContent.Drag 1
   End If
End Sub

Private Sub rchContent_SelChange()
Dim Choice As VbMsgBoxResult

On Error GoTo SelectionErr
  
  With rchContent
    If .SelLength > 0 Then
        Undo(CurrentUndoNum).SelLength = .SelLength
        Undo(CurrentUndoNum).SelStart = .SelStart
        
NoUndo: mnuEditDelimit.Enabled = True
        mnuEditRemove.Enabled = True
        mnuEditCopy.Enabled = True
        mnuEditCut.Enabled = True
        mnuEditDelete.Enabled = True
    Else
        mnuEditDelimit.Enabled = False
        mnuEditRemove.Enabled = False
        mnuEditCopy.Enabled = False
        mnuEditCut.Enabled = False
        mnuEditDelete.Enabled = False
    End If
  End With
  Exit Sub
  
SelectionErr:
    Choice = MsgBox("Selection is too long for Undo" & _
            vbCrLf & "Select anyway, with Undo feature disabled?", _
                vbQuestion Or vbYesNo, "Error Marking Text")
            
    If Choice = vbYes Then
        Resume NoUndo
    Else
        rchContent.SelLength = 0
    End If
End Sub

Public Function DelimitString(intext As String, Target, delim) As String
  Dim s, wantStr As String
  Dim news As String
  Dim wantndx
  
  s = intext
  news = ""
  wantndx = 1
  While wantndx > 0
    ' when space is the target character,
    ' instr - return position of next space. "Hello World" returns 6.
    ' if no space found, instr returns 0
    wantndx = InStr(1, s, Target)
    ' if we have a target character..
    If wantndx > 0 Then
    ' copy the characters before the space to news and add delimiter
      news = news + Left(s, wantndx - 1) + delim
    ' set s to unread characters: if len was 10 and we read 2, set to
    '  8 rightmost characters. Use ltrim to ignore multiple spaces.
      s = LTrim(Right(s, Len(s) - wantndx))
'      MsgBox "s = " + s + vbCrLf + "news = " + news
    End If
  Wend
' While ends after the last space found. Copy the rest of s to news
  news = news + s
  ' if we changed s, save an undo record
  DelimitString = news
End Function

Public Function IsIn(ctrl As Control, leftop, margin, X, Y) As Boolean
  Dim minx, miny, maxx, maxy
  minx = Left
  maxx = Left + margin
  miny = ctrl.Top + margin
  maxy = ctrl.Height - margin

  If X >= minx And X <= maxx And Y >= miny And Y <= maxy Then
    IsIn = True
  Else
    IsIn = False
  End If
End Function

Public Function IsBetween(ctrl As Control, Top, margin, X, Y) As Boolean
  Dim minx, miny, maxx, maxy
  miny = Top
  maxy = Top + margin
  minx = ctrl.Left + margin
  maxx = ctrl.Width - margin

  If X >= minx And X <= maxx And Y >= miny And Y <= maxy Then
    IsBetween = True
  Else
    IsBetween = False
  End If
End Function

Public Sub ResizeFrameControls()
 With Drive1
    .Width = Frame1.Width - 300
    .Left = 200
    .Top = 200
    
    Dir1.Width = .Width
    Dir1.Left = .Left
    Dir1.Top = .Top + .Height + 100
    Dir1.Height = Frame1.Height / 2 - 600
    File1.Width = .Width
    File1.Top = Dir1.Top + Dir1.Height + 200
    File1.Height = Dir1.Height + 100
    File1.Left = .Left
End With
End Sub

Private Sub mnuEditCopy_Click()

' if no text selected, assume error and exit
'This avoids losing current contents of clipboard
'unnecessarily.
If rchContent.SelText = "" Then
  Exit Sub
End If

' Clear the clipboard
Clipboard.Clear
'Transfer to clipboard the currently selected text
Clipboard.SetText rchContent.SelText
mnuEditPaste.Enabled = True
End Sub

Private Sub mnuEditCut_Click()

If rchContent.SelText = "" Then
  Exit Sub
End If

' Clear the clipboard
Clipboard.Clear
' Transfer selected text
Clipboard.SetText rchContent.SelText
' enable paste
mnuEditPaste.Enabled = True
' now cut
rchContent.SelText = ""
End Sub

Private Sub mnuEditPaste_Click()
 rchContent.SelText = Clipboard.GetText()
End Sub

Public Sub UpdateUndo(Text)
  ' dont save empties
    If Text = "" Then
      mnuEditUndo.Enabled = False
      Exit Sub
    End If
    
  ' text is saved just after it is modified and after incrementing
  ' or resetting CurrentUndoNum, which is decremented before each undo
  '  is performed.
  ' selstart and sellength are also modified in selchange, without
  ' updating the currentundonum
    mnuEditUndo.Enabled = True
    If CurrentUndoNum = 1 Or CurrentUndoNum < MaxUndos Then
      CurrentUndoNum = CurrentUndoNum + 1
    ElseIf CurrentUndoNum >= MaxUndos Then
      CurrentUndoNum = 1
    End If
    Undo(CurrentUndoNum).PrevText = Text
    Undo(CurrentUndoNum).SelStart = rchContent.SelStart
    Undo(CurrentUndoNum).SelLength = rchContent.SelLength
End Sub

Public Sub CreateToolbar()
    ' Create object variable for the ImageList.
    Dim imgX As ListImage
 
     ' Create object variable for the Toolbar.
    Dim btnX As Button

    ' Add button objects to Buttons collection using
     ' the
    ' Add method. After creating each button, set both
    ' Description and ToolTipText properties.
    Toolbar1.Buttons.Add , , , tbrSeparator
    Set btnX = Toolbar1.Buttons.Add(, "open", , tbrDefault, "open")
    btnX.ToolTipText = "Open"
    btnX.Description = btnX.ToolTipText
    Set btnX = Toolbar1.Buttons.Add(, "save", , tbrDefault, "save")
    btnX.ToolTipText = "Save As"

   ' buttons for cut copy paste
    Toolbar1.Buttons.Add , , , tbrSeparator
    Set btnX = Toolbar1.Buttons.Add(, "cut", , tbrDefault, "cut")
    btnX.ToolTipText = "Cut to Clipboard"
    btnX.Description = btnX.ToolTipText
    Set btnX = Toolbar1.Buttons.Add(, "copy", , tbrDefault, "copy")
    btnX.ToolTipText = "Copy to Clipboard"
    btnX.Description = btnX.ToolTipText
    Set btnX = Toolbar1.Buttons.Add(, "paste", , tbrDefault, "paste")
    btnX.ToolTipText = "Paste from Clipboard"
    btnX.Description = btnX.ToolTipText
    Set btnX = Toolbar1.Buttons.Add(, "print", , tbrDefault, "print")
    btnX.ToolTipText = "Print"
    btnX.Description = btnX.ToolTipText
    btnX.Enabled = True
    Set btnX = Toolbar1.Buttons.Add(, , , tbrSeparator)
 
    ' The next button has the Placeholder style. A
     ' ComboBox control will be placed on top of this
     ' button.
  
       ' buttons for undo redo delete
    Toolbar1.Buttons.Add , , , tbrSeparator
    Set btnX = Toolbar1.Buttons.Add(, "undo", , tbrDefault, "undo")
    btnX.ToolTipText = "Undo last edit"
    btnX.Description = btnX.ToolTipText
    Set btnX = Toolbar1.Buttons.Add(, "redo", , tbrDefault, "redo")
    btnX.ToolTipText = "Redo last undo"
    btnX.Description = btnX.ToolTipText
    Set btnX = Toolbar1.Buttons.Add(, "delete", , tbrDefault, "delete")
    btnX.ToolTipText = "Delete Sel"
    btnX.Description = btnX.ToolTipText
End Sub

Private Sub toolbar1_ButtonClick(ByVal Button As Button)
    ' Use the Key property with the SelectCase statement to specify
    ' an action.
    Select Case Button.Key
    Case Is = "open"           ' Open file.
       mnuFileOpen_Click
        
    Case Is = "save"           ' Save As file.
        mnuFileSaveAs_Click
        
    Case Is = "cut"            ' cut text
        mnuEditCut_Click
        
    Case Is = "copy"           ' copy text
        mnuEditCopy_Click
        
    Case Is = "paste"          ' paste text
        mnuEditPaste_Click
    Case Is = "print"
        mnuFilePrint_Click
    Case Is = "undo"
        mnuEditUndo_Click
    Case Is = "redo"
        mnuEditRedo_Click
'    Case Is = "excel"
'        mnuToolsExcel_Click
'    Case Is = "word"
'        mnuToolsWord_Click
    Case Is = "delete"
        mnuEditDelete_Click
    End Select
End Sub

Public Sub InitUndo()
  Dim i
  
  For i = 1 To MaxUndos
    Undo(i).SelLength = 0
    Undo(i).SelStart = 0
    Undo(i).PrevText = ""
  Next i
  CurrentUndoNum = 1
  mnuEditRedo.Enabled = False
End Sub

Public Function getFile() As String
  ' returns full path to load into rtf box
  On Error GoTo ErrHandler
'  Text (*.txt)|*.txt|Pictures (*.bmp;*.ico)|*.bmp;*.ico
 
  With CommonDialog1
    .CancelError = True
    .FilterIndex = 6
    .Flags = cdlOFNPathMustExist + cdlOFNFileMustExist + cdlOFNHideReadOnly
  ' display the open-file dialog
    .ShowOpen
  ' return the file name selected, if any
    getFile = .Filename
    .InitDir = Left(.Filename, InStr(.Filename, .FileTitle) - 1)
    Dir1.Path = .InitDir
  End With
  Exit Function
ErrHandler:
    getFile = "getFileError"
    Exit Function
End Function

Public Property Get Filename() As String
  Filename = TheFileName
End Property

Public Property Let Filename(ByVal vNewValue As String)

  
  TheFileName = vNewValue
'  Caption = vNewValue
 
End Property

Public Function ParseFilePath(fp) As Variant
  Dim nfp, i
 
  nfp = ""
  i = InStr(fp, "\")
'  MsgBox "1 " + nfp + "|" + fp + "|" + Str(i)

 While i > 0
   nfp = nfp + Left(fp, i)
   fp = Mid(fp, i + 1)
   i = InStr(fp, "\")
'   MsgBox "2 " + nfp + "|" + fp + "|" + Str(i)
 Wend
' MsgBox "3 " + nfp + "|" + fp + "|" + Str(i)
 ParseFilePath = nfp
End Function

Public Sub LoadAFile()

    If UCase(Right(Filename, 3)) = "RTF" Then
        rchContent.LoadFile Filename, rtfRTF
    Else
        rchContent.LoadFile Filename, rtfText
    End If
    
    Caption = Filename
    mnuFileSave.Enabled = False
End Sub

Public Sub SaveAFile()

    If UCase(Right(Filename, 3)) = "RTF" Then
        rchContent.SaveFile Filename, rtfRTF
    Else
        rchContent.SaveFile Filename, rtfText
        With frmSourceTerm
            If .Visible Then
                .Tag = Filename
            Else
                'If this dialog was not opened from the Source Term dialog
                'It will be loaded now -- unload it until needed
                Unload frmSourceTerm
            End If
        End With
    End If
End Sub

