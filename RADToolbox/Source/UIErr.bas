Attribute VB_Name = "modReportUIError"
'------------------------------------------------------------------------
' File:         UIErr.BAS   modReportUIError
'
' Written by:   GF Athey
' Updated:      14-September-1998
'
' Description:
'
'------------------------------------------------------------------------
Option Explicit
Private Const MODULE_NAME As String = "modReportUIError"

Public Sub Display_UI_Error()
 
   Const PROCEDURE_NAME As String = "Display_UI_Error"
   On Error GoTo Error_Handler
   
   Load frmReport_UI_Probs
   frmReport_UI_Probs.Show vbModal
   Set frmReport_UI_Probs = Nothing
   End
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub
