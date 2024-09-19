VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmBrowser 
   Caption         =   "Rad Toobox - Simple Web Browser "
   ClientHeight    =   6135
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8265
   LinkTopic       =   "Form1"
   ScaleHeight     =   6135
   ScaleWidth      =   8265
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdTest 
      Caption         =   "test"
      Height          =   375
      Left            =   6000
      TabIndex        =   11
      Top             =   240
      Width           =   615
   End
   Begin VB.Frame fraNavigation 
      Caption         =   "Navigation"
      Height          =   1455
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   8175
      Begin VB.CommandButton cmdOK 
         Caption         =   "&Close"
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   1000
      End
      Begin VB.CommandButton cmdStop 
         Caption         =   "&Stop"
         Height          =   375
         Left            =   4440
         TabIndex        =   7
         Top             =   240
         Width           =   1000
      End
      Begin VB.TextBox txtURL 
         Height          =   285
         Left            =   960
         TabIndex        =   6
         Text            =   "http://www.ornl.gov"
         Top             =   720
         Width           =   7095
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   3360
         TabIndex        =   4
         Top             =   240
         Width           =   1000
      End
      Begin VB.CommandButton cmdForward 
         Caption         =   "&Forward"
         Height          =   375
         Left            =   2280
         TabIndex        =   3
         Top             =   240
         Width           =   1000
      End
      Begin VB.CommandButton cmdBack 
         Caption         =   "&Back"
         Height          =   375
         Left            =   1200
         TabIndex        =   2
         Top             =   240
         Width           =   1000
      End
      Begin VB.Label lblStatus 
         AutoSize        =   -1  'True
         Caption         =   "Loading ..."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   840
         TabIndex        =   9
         Top             =   1080
         Width           =   915
      End
      Begin VB.Label lblPrompt 
         AutoSize        =   -1  'True
         Caption         =   "Status: "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000080&
         Height          =   240
         Left            =   120
         TabIndex        =   8
         Top             =   1080
         Width           =   645
      End
      Begin VB.Label lblAddress 
         AutoSize        =   -1  'True
         Caption         =   "Address: "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   120
         TabIndex        =   5
         Top             =   720
         Width           =   855
      End
   End
   Begin SHDocVwCtl.WebBrowser webBrowser 
      Height          =   3375
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   8175
      ExtentX         =   14420
      ExtentY         =   5953
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
End
Attribute VB_Name = "frmBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
  Private Declare Function ShellExecute Lib "shell32.dll" Alias _
      "ShellExecuteA" (ByVal hwnd As Long, ByVal lpszOp As _
      String, ByVal lpszFile As String, ByVal lpszParams As String, _
      ByVal lpszDir As String, ByVal FsShowCmd As Long) As Long
      Private Declare Function GetDesktopWindow Lib "user32" () As Long
        Const SW_SHOWNORMAL = 1

Private Sub cmdBack_Click()
    On Error Resume Next
    webBrowser.GoBack
End Sub

Private Sub cmdForward_Click()
    On Error Resume Next
    webBrowser.GoForward
End Sub

Private Sub cmdHome_Click()
    On Error Resume Next
    webBrowser.GoHome
End Sub

Private Sub cmdOK_Click()
    Me.Hide
End Sub

Private Sub cmdRefresh_Click()
    On Error Resume Next
    webBrowser.Refresh
End Sub

Private Sub cmdStop_Click()
    lblStatus.Caption = "Interrupted"
    webBrowser.Stop
End Sub

Private Sub cmdTest_Click()
      Dim Scr_hDC As Long, sDoc As Long
      Scr_hDC = GetDesktopWindow()
      sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)

End Sub

Private Sub Form_Activate()
    webBrowser.Width = Me.ScaleWidth
    webBrowser.Height = Me.ScaleHeight - webBrowser.Top
    fraNavigation.Width = Me.ScaleWidth
    txtURL.Width = Me.ScaleWidth - txtURL.Left - 500
End Sub

Private Sub Form_Load()
    PositionForm Me
    webBrowser.Navigate gs_LinkSelected
End Sub

Private Sub Form_Unload(Cancel As Integer)
  cmdOK_Click
End Sub

Private Sub txtURL_GotFocus()
    txtURL.SelStart = 0
    txtURL.SelLength = Len(txtURL.Text)
End Sub

Private Sub txtURL_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        KeyAscii = 0
        webBrowser.Navigate txtURL.Text
    End If
End Sub

Private Sub webBrowser_DocumentComplete(ByVal pDisp As Object, URL As Variant)
    txtURL.Text = URL
End Sub

Private Sub webBrowser_DownloadBegin()
    lblStatus.Caption = "Loading ..."
End Sub

Private Sub webBrowser_DownloadComplete()
    lblStatus.Caption = "Loaded"
End Sub
