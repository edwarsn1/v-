VERSION 5.00
Begin VB.Form frmElement 
   Caption         =   "Element Data"
   ClientHeight    =   5340
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8700
   LinkTopic       =   "Form1"
   ScaleHeight     =   5340
   ScaleWidth      =   8700
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtForm 
      Height          =   285
      Left            =   4920
      TabIndex        =   18
      Text            =   "Text1"
      Top             =   1680
      Width           =   1215
   End
   Begin VB.TextBox txtDensity 
      Height          =   285
      Left            =   1560
      TabIndex        =   17
      Top             =   1680
      Width           =   1215
   End
   Begin VB.TextBox txtNotes 
      Height          =   2535
      Left            =   1680
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   14
      Text            =   "frmElement.frx":0000
      Top             =   2160
      Width           =   6735
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   7200
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   2760
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.TextBox txtStabFlag 
      Height          =   285
      Left            =   4920
      TabIndex        =   13
      Text            =   "Text3"
      Top             =   1200
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txtAtWtErr 
      Height          =   285
      Left            =   6120
      TabIndex        =   12
      Text            =   "Text2"
      Top             =   720
      Width           =   1455
   End
   Begin VB.TextBox txtAtWt 
      Height          =   285
      Left            =   6120
      TabIndex        =   11
      Text            =   "Text1"
      Top             =   240
      Width           =   1455
   End
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   1560
      TabIndex        =   10
      Text            =   "Text1"
      Top             =   240
      Width           =   2415
   End
   Begin VB.TextBox txtSymbol 
      Height          =   285
      Left            =   1560
      TabIndex        =   9
      Text            =   "Text1"
      Top             =   720
      Width           =   615
   End
   Begin VB.TextBox txtAtNo 
      Height          =   285
      Left            =   1560
      TabIndex        =   8
      Text            =   "Text1"
      Top             =   1200
      Width           =   615
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   6960
      TabIndex        =   0
      Top             =   4800
      Width           =   1335
   End
   Begin VB.Label Label10 
      Caption         =   "g / cm^3"
      Height          =   255
      Left            =   2880
      TabIndex        =   19
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "Form:"
      Height          =   195
      Left            =   4320
      TabIndex        =   16
      Top             =   1680
      Width           =   390
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "Density:"
      Height          =   195
      Left            =   840
      TabIndex        =   15
      Top             =   1680
      Width           =   570
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Notes:"
      Height          =   195
      Left            =   960
      TabIndex        =   7
      Top             =   2160
      Width           =   465
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Most Stable Isotope:"
      Height          =   195
      Left            =   3240
      TabIndex        =   6
      Top             =   1200
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Error:"
      Height          =   195
      Left            =   5520
      TabIndex        =   5
      Top             =   720
      Width           =   375
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Standard Atomic Weight:"
      Height          =   195
      Left            =   4200
      TabIndex        =   4
      Top             =   240
      Width           =   1770
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Name:"
      Height          =   195
      Left            =   960
      TabIndex        =   3
      Top             =   240
      Width           =   465
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Symbol:"
      Height          =   195
      Left            =   840
      TabIndex        =   2
      Top             =   720
      Width           =   555
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Atomic Number:"
      Height          =   195
      Left            =   360
      TabIndex        =   1
      Top             =   1200
      Width           =   1125
   End
End
Attribute VB_Name = "frmElement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmElement.frm
Option Explicit
Const MODULE_NAME As String = "frmElement"

Private Sub cmdOK_Click()
  Me.Hide
End Sub

Private Sub Form_Load()
  Const PROCEDURE_NAME As String = "cmdForm_Load"
  Dim myQuery As String
  Dim j As Integer, GrdCols As Integer, rsNuc As Recordset
  Dim i As Integer, Factor As Double, UnitsStart As Integer
  Dim C As TrueDBGrid80.Column, txtTemp As Variant
  
 ' On Error GoTo Error_Handler
  PositionForm Me
  
  Data1.DatabaseName = gs_DataPath & gs_myTable & ".mdb"
  myQuery = "SELECT * FROM [Elements] where Symbol = '" _
    & gs_EleSelected & "'"

  Data1.RecordSource = myQuery
  Data1.Refresh
  Caption = "Selected data for " & gs_EleSelected
  
  Set rsNuc = Data1.Recordset
  rsNuc.MoveFirst
  txtAtNo.Text = rsNuc.Fields(0).Value
  txtSymbol.Text = rsNuc.Fields(1).Value
  txtName.Text = rsNuc.Fields(2).Value
  txtAtWt.Text = Str(rsNuc.Fields(3).Value)
  txtAtWtErr.Text = Str(rsNuc.Fields(4).Value)
  txtStabFlag.Text = rsNuc.Fields(5).Value
  txtDensity.Text = rsNuc.Fields(6).Value
  If Not IsNull(rsNuc.Fields(7)) Then
    txtForm.Text = rsNuc.Fields(7)
  Else
    txtForm.Text = ""
  End If
  If Not IsNull(rsNuc.Fields(8)) Then
    txtTemp = rsNuc.Fields(8).Value
    Set rsNuc = Nothing
    Data1.RecordSource = "Select * from Notes"
    Data1.Refresh
    Set rsNuc = Data1.Recordset
    rsNuc.MoveFirst
    txtNotes = ""
    While Not rsNuc.EOF
      If InStr(txtTemp, rsNuc.Fields(0)) Then
        txtNotes = txtNotes & rsNuc.Fields(0) & ": " & rsNuc.Fields(1) _
          & Chr(13) & Chr(10) & Chr(13) & Chr(10)
      End If
      rsNuc.MoveNext
    Wend
  Else
    txtNotes = "None."
  End If
  Set rsNuc = Nothing

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

