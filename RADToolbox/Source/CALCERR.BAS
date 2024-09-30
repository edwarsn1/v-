Attribute VB_Name = "modReportCalcError"
'------------------------------------------------------------------------
' File:         CALCERR.BAS   modReportCalcError
'
' Written by:   GF Athey
' Updated:      14-September-1998
'
' Description:  Reports errors returned from the calculation
'               program drawchain
'
'------------------------------------------------------------------------
Option Explicit
Private Const MODULE_NAME As String = "modReportCalcError"

Dim sErrorLine() As String

Public Sub ReportCalcError(sModel As String, sErrorFile As String)
 
   Const PROCEDURE_NAME As String = "ReportCalcError"
   
   Dim nFN As Integer
   Dim nErrorCount As Integer
   Dim sErrorStr As String
   Dim sMsgStr As String
 
   On Error GoTo Error_Handler
   nFN = FreeFile
   nErrorCount = 0
   Open sErrorFile For Input As #nFN
   Do While Not EOF(nFN)
      Line Input #nFN, sErrorStr
      nErrorCount = nErrorCount + 1
      ReDim Preserve sErrorLine(nErrorCount)
      sErrorLine(nErrorCount) = sErrorStr
   Loop
   Close #nFN
 
   Load frmReport_UI_Probs
   frmReport_UI_Probs.txtErrorNumber = nErrorCount
   frmReport_UI_Probs.txtErrorModuleName = sModel
   sMsgStr = "A problem has occurred in the decay chain viewing portion of the "
   sMsgStr = sMsgStr & "program. For some reason the calculations cannot be completed."
   sMsgStr = sMsgStr & "Details on the problem and a possible remedy are shown below."
   frmReport_UI_Probs.txtErrorDescription = sMsgStr
   frmReport_UI_Probs.txtErrorProcedureName = sErrorLine(nErrorCount)
   frmReport_UI_Probs.Show vbModal
   Set frmReport_UI_Probs = Nothing
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Sub UpdateErrorReport(sModel As String, nErrorNum As Integer)
 
   Const PROCEDURE_NAME As String = "UpdateErrorReport"
   Dim nErrorCount As Integer
   Dim nFN As Integer
   Dim sErrorCode As String * 1
   Dim sFortranErrNum As String * 4
   Dim sErrorDesc As String * 80
   Dim sProblemFile As String * 80
   Dim sErrorStr As String
   Dim sMsgStr As String
   Dim ctlForm As Form
 
   On Error GoTo Error_Handler
   Set ctlForm = frmReport_UI_Probs
 
   sErrorCode = Mid$(sErrorLine(nErrorNum), 1, 1)
   sFortranErrNum = Mid$(sErrorLine(nErrorNum), 3, 4)
   sErrorDesc = Mid$(sErrorLine(nErrorNum), 8, 80)
   sProblemFile = Mid$(sErrorLine(nErrorNum), 88, 80)
 
   ctlForm.lblProbTechText = "The following information was returned from the " _
      & "calculation module. It may be of use to technical support staff if you should contact " _
      & "them for help with this problem."
   ctlForm.lblErrorCode = sErrorCode
   ctlForm.lblErrorNum = sFortranErrNum
   ctlForm.lblErrorDesc = sErrorDesc
   ctlForm.lblErrorFile = sProblemFile
 
   Select Case sErrorCode
      Case "D"
 
      sMsgStr = "There is a problem with one of the data files needed by the calculation "
      sMsgStr = sMsgStr & "program. The program returned the following message: " & sErrorDesc
      sMsgStr = sMsgStr & "The problem file is reported as: " & sProblemFile
      ctlForm.lblProbWhatText = sMsgStr
 
      sMsgStr = "Try reinstalling the program. That should restore the data file to usable "
      sMsgStr = sMsgStr & "condition. If the problem persists, there may be some other problem "
      sMsgStr = sMsgStr & "with the computers storage device."
      ctlForm.lblProbRemedyText = sMsgStr
 
      Case "T"
 
      sMsgStr = "There is a problem with one of the temporary files used by the calculation "
      sMsgStr = sMsgStr & "program. The program returned the following message: " & sErrorDesc
      sMsgStr = sMsgStr & "The problem file is reported as: " & sProblemFile
      ctlForm.lblProbWhatText = sMsgStr
 
      sMsgStr = "Try rerunning the RASCAL program. This may recreate the temporary file and allow "
      sMsgStr = sMsgStr & "the calculations to complete. If the problem persists, there may be some "
      sMsgStr = sMsgStr & "other problem with the computers storage device."
      ctlForm.lblProbRemedyText = sMsgStr
 
      Case "W"
 
      sMsgStr = "There is a problem writing information to the computer hard disk. The disk "
      sMsgStr = sMsgStr & "may be full or have more severe problems."
      ctlForm.lblProbWhatText = sMsgStr
 
      sMsgStr = "Exit RASCAL and try freeing up some disk space by deleting or moving files. "
      sMsgStr = sMsgStr & "The additional storage space is needed on the disk drive where "
      sMsgStr = sMsgStr & "RASCAL is installed."
      ctlForm.lblProbRemedyText = sMsgStr
 
      Case "V"
 
      sMsgStr = "Invalid or missing data has been detected by the calculation program. This "
      sMsgStr = sMsgStr & "indicates that an internal RASCAL file has been corrupted."
      ctlForm.lblProbWhatText = sMsgStr
 
      sMsgStr = "Exit and restart the RASCAL program. This should recreate the data files "
      sMsgStr = sMsgStr & "needed for the calculations. If the problem persists, contact your "
      sMsgStr = sMsgStr & "technical support staff."
      ctlForm.lblProbRemedyText = sMsgStr
 
      Case "C"
 
      sMsgStr = "A general failure has occurred in the calculation program. This generally  "
      sMsgStr = sMsgStr & "results from a programming problem."
      ctlForm.lblProbWhatText = sMsgStr
 
      sMsgStr = "Report the problem to your RASCAL technical support staff."
      ctlForm.lblProbRemedyText = sMsgStr
 
      End Select
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub


