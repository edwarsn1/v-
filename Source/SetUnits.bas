Attribute VB_Name = "modSetUnits"
'------------------------------------------------------------------------
' File:         SetUnits.BAS   modSetUnits
'
' Description:  Loads the appropriate form to allow the user to
'               specify the units of a parameter; calculates conversion factors
'
'------------------------------------------------------------------------
Option Explicit
Private Const MODULE_NAME As String = "modSetUnits"

Public Sub Field_Units_Factor(thisForm As Form)
   Const PROCEDURE_NAME As String = "Field_Units_Factor"
   Dim Prefix(9) As Double, Area(1) As Double, Factor As Double
   Dim Dose(2) As Double
 
   On Error GoTo Error_Handler
   Prefix(0) = 0.000000001    ' giga
   Prefix(1) = 0.000001       ' mega
   Prefix(2) = 0.001          ' kilo
   Prefix(3) = 1
   Prefix(4) = 100#           ' centi
   Prefix(5) = 1000#          ' milli
   Prefix(6) = 1000000#       ' micro
   Prefix(7) = 1000000000#    ' nano
   Prefix(8) = 1000000000000# ' pico
   
   Area(0) = 1#
   
   Dose(0) = 1
   Dose(1) = 100
   
   Factor = 1E-16
   Factor = Factor * Prefix(thisForm.optDosePrefix.ListIndex) _
     * Dose(thisForm.optDose.ListIndex)
   gd_FieldFactor = Factor * ((Prefix(thisForm.optAreaPrefix.ListIndex) _
     * Prefix(thisForm.optAreaPrefix.ListIndex)))
   Exit Sub
Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Function fns_Air_Units()
 
   Const PROCEDURE_NAME As String = "fns_AirUnits"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Air_Units
   sSaveUnits = sUnits
 
   Load frmSetAirUnits
   frmSetAirUnits.lblConcUnits = sUnits
   frmSetAirUnits.Show vbModal
 
   sUnits = frmSetAirUnits.lblConcUnits
   frmSetAirUnits.Hide
   Unload frmSetAirUnits
   Set frmSetAirUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Air_Units = sUnits
   Else
      fns_Air_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_AirActivity_Units()
 
   Const PROCEDURE_NAME As String = "fns_AirActivity_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_AirActivity_Unit
   sSaveUnits = sUnits
 
   Load frmSetActUnits
   frmSetActUnits.lblConcUnits = sUnits
   frmSetActUnits.Show vbModal
 
   sUnits = frmSetActUnits.lblConcUnits
   frmSetActUnits.Hide
   Unload frmSetActUnits
   Set frmSetActUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_AirActivity_Units = sUnits
   Else
      fns_AirActivity_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_Ele_Units()
 
   Const PROCEDURE_NAME As String = "fns_Ele_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Energy_Units
   sSaveUnits = sUnits
 
   Load frmSetEleUnits
   frmSetEleUnits.lblCoefUnits = sUnits
   If gs_EleForm = "Photon" Then
     frmSetEleUnits.lblConcUnits = gs_Photon_Units
   Else
     frmSetEleUnits.lblConcUnits = gs_Range_Units
   End If
   frmSetEleUnits.Show vbModal
 
   sUnits = frmSetEleUnits.lblCoefUnits
   Unload frmSetEleUnits
   Set frmSetEleUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Ele_Units = sUnits
   Else
      fns_Ele_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_Gnd_Units()
 
   Const PROCEDURE_NAME As String = "fns_GndUnits"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Gnd_Units
   sSaveUnits = sUnits
 
   Load frmSetGndUnits
   frmSetGndUnits.lblConcUnits = sUnits
   frmSetGndUnits.Show vbModal
 
   sUnits = frmSetGndUnits.lblConcUnits
   Unload frmSetGndUnits
   Set frmSetGndUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Gnd_Units = sUnits
   Else
      fns_Gnd_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_GndActivity_Units()
 
   Const PROCEDURE_NAME As String = "fns_GndActivity_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_GndActivity_Unit
   sSaveUnits = sUnits
 
   Load frmSetActUnits
   frmSetActUnits.lblConcUnits = sUnits
   frmSetActUnits.Show vbModal
 
   sUnits = frmSetActUnits.lblConcUnits
   Unload frmSetActUnits
   Set frmSetActUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_GndActivity_Units = sUnits
   Else
      fns_GndActivity_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_SA_Units()
 
   Const PROCEDURE_NAME As String = "fns_SA_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_SA_Units
   sSaveUnits = sUnits
 
   Load frmSetSAUnits
   frmSetSAUnits.lblConcUnits = sUnits
   frmSetSAUnits.Show vbModal
 
   sUnits = frmSetSAUnits.lblConcUnits
   Unload frmSetSAUnits
   Set frmSetSAUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_SA_Units = sUnits
   Else
      fns_SA_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function
Function fns_Inh_Units()
 
   Const PROCEDURE_NAME As String = "fns_InhUnits"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Inh_Units
   sSaveUnits = sUnits
 
   Load frmSetInhUnits
   frmSetInhUnits.lblConcUnits = sUnits
   frmSetInhUnits.Show vbModal
 
   sUnits = frmSetInhUnits.lblConcUnits
   Unload frmSetInhUnits
   Set frmSetInhUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Inh_Units = sUnits
   Else
      fns_Inh_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_InhActivity_Units()
 
   Const PROCEDURE_NAME As String = "fns_InhActivity_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Activity_Unit
   sSaveUnits = sUnits
 
   Load frmSetActUnits
   frmSetActUnits.lblConcUnits = sUnits
   frmSetActUnits.Show vbModal
 
   sUnits = frmSetActUnits.lblConcUnits
   Unload frmSetActUnits
   Set frmSetActUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_InhActivity_Units = sUnits
   Else
      fns_InhActivity_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_Dose_Units()
 
   Const PROCEDURE_NAME As String = "fns_Dose_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Dose_Unit
   sSaveUnits = sUnits
 
   Load frmSetDoseUnits
   frmSetDoseUnits.lblConcUnits = sUnits
   frmSetDoseUnits.Show vbModal
 
   sUnits = frmSetDoseUnits.lblConcUnits
   Unload frmSetDoseUnits
   Set frmSetDoseUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Dose_Units = sUnits
   Else
      fns_Dose_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fnd_Units_Factor(UnitType As String, thisForm As Form, extForm As Form)
   Const PROCEDURE_NAME As String = "fnd_Units_Factor"
   Dim Prefix(9) As Double, Dose(2) As Double, Activity(2) As Double
   Dim Time(4) As Double, Volume(3) As Double, Area(3) As Double, Factor As Double
   Dim Mass(3) As Double, iEarly As Integer
 
   On Error GoTo Error_Handler
   Prefix(0) = 0.000000000001 ' tera
   Prefix(1) = 0.000000001    ' giga
   Prefix(2) = 0.000001       ' mega
   Prefix(3) = 0.001          ' kilo
   Prefix(4) = 1
   Prefix(5) = 1000#          ' milli
   Prefix(6) = 1000000#       ' micro
   Prefix(7) = 1000000000#    ' nano
   Prefix(8) = 1000000000000# ' pico
   
   Dose(0) = 1
   Dose(1) = 100              ' Sv -> rem
   
   Activity(0) = 1
   Activity(1) = 0.000000000027 ' Bq -> Ci
   
   Time(0) = 1
   Time(1) = 60               ' m -> s
   Time(2) = 3600             ' h -> s
   Time(3) = 31558150         ' y -> s
   
   Volume(0) = 1 / 1000000#   ' cm^3 -> m^3
   Volume(1) = 1
   Volume(2) = 0.02832        ' ft^3 -> m^2
   
   Area(0) = 1 / 10000#       ' cm^3 -> m^2
   Area(1) = 1
   Area(2) = 0.0929           ' ft^3 -> m^3
   
   Mass(0) = 1
   Mass(1) = 453.58           ' lb -> gm
   Mass(2) = 28.349           ' oz -> gm
   
   If UnitType = "SA" Then ' convert Bq/kg to selected units
     Factor = 0.001
     Factor = Factor / Prefix(thisForm.optMassPrefix.ListIndex)
     Factor = Factor / Mass(thisForm.optMass.ListIndex)
     Factor = Factor * Prefix(thisForm.optActPrefix.ListIndex)
     Factor = Factor * Activity(thisForm.optActivity.ListIndex)
   ElseIf UnitType = "Mass" Then ' convert g to selected units
     Factor = 1#
     Factor = Factor * Prefix(thisForm.optMassPrefix.ListIndex)
     Factor = Factor / Mass(thisForm.optMass.ListIndex)
   Else
     Factor = 1#
     Factor = Factor * Prefix(thisForm.optDosePrefix.ListIndex)
     Factor = Factor * Dose(thisForm.optDose.ListIndex)
     Factor = Factor / Prefix(thisForm.optActPrefix.ListIndex)
     Factor = Factor / Activity(thisForm.optActivity.ListIndex)
     If UnitType = "Air" Or UnitType = "Gnd" Then
       If (gbAir_isLoaded And UnitType = "Air") Or _
          (gbGnd_isLoaded And UnitType = "Gnd") Then
         Factor = Factor * Time(extForm.optTime.ListIndex)
         If UnitType = "Air" Then
           Factor = Factor / Volume(extForm.optVol.ListIndex)
         ElseIf UnitType = "Gnd" Then
           Factor = Factor / Area(extForm.optArea.ListIndex)
         End If
       End If
     End If
   End If
   fnd_Units_Factor = Factor
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fnd_ActUnits_Factor(actType As String, thisForm As Form)
   Const PROCEDURE_NAME As String = "fnd_ActUnits_Factor"
   Dim Prefix(9) As Double, Activity(2) As Double, i As Integer
   Dim Volume(3) As Double, Area(3) As Double, Factor As Double
 
   On Error GoTo Error_Handler
   Prefix(0) = 0.000000000001 ' tera
   Prefix(1) = 0.000000001    ' giga
   Prefix(2) = 0.000001       ' mega
   Prefix(3) = 0.001          ' kilo
   Prefix(4) = 1
   Prefix(5) = 1000#          ' milli
   Prefix(6) = 1000000#       ' micro
   Prefix(7) = 1000000000#    ' nano
   Prefix(8) = 1000000000000# ' pico
   
   Activity(0) = 1
   Activity(1) = 0.000000000027 ' Bq -> Ci
   
   Volume(0) = 1
   Volume(1) = 0.02832        ' ft^2 -> m^2
   
   Area(0) = 1
   Area(1) = 0.0929           ' ft^3 -> m^3
   
   Factor = 1#
   i = thisForm.optActPrefix.ListIndex
   Factor = Factor / Prefix(i)
   i = thisForm.optAct.ListIndex
   Factor = Factor / Activity(i)
   i = thisForm.optArea.ListIndex
   If actType = "Air" Then
     Factor = Factor / Volume(i)
     i = thisForm.optAreaPrefix.ListIndex
     Factor = Factor / Prefix(i)
   ElseIf actType = "Gnd" Then
     Factor = Factor / Area(i)
     i = thisForm.optAreaPrefix.ListIndex
     Factor = Factor / Prefix(i)
   End If
   fnd_ActUnits_Factor = Factor
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fnd_DoseUnits_Factor(thisForm As Form)
   Const PROCEDURE_NAME As String = "fnd_DoseUnits_Factor"
   Dim Prefix(9) As Double, Dose(2) As Double, Factor As Double
 
   On Error GoTo Error_Handler
   Prefix(0) = 0.000000000001 ' tera
   Prefix(1) = 0.000000001    ' giga
   Prefix(2) = 0.000001       ' mega
   Prefix(3) = 0.001          ' kilo
   Prefix(4) = 1
   Prefix(5) = 1000#          ' milli
   Prefix(6) = 1000000#       ' micro
   Prefix(7) = 1000000000#    ' nano
   Prefix(8) = 1000000000000# ' pico
   
   Dose(0) = 1
   Dose(1) = 100              ' Sv -> rem
   
   Factor = 1#
   Factor = Factor * Prefix(thisForm.optDosePrefix.ListIndex)
   Factor = Factor * Dose(thisForm.optDose.ListIndex)
   fnd_DoseUnits_Factor = Factor
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function
Public Sub Ele_Units_Factor(thisForm As Form)
   Const PROCEDURE_NAME As String = "Ele_Units_Factor"
   Dim Prefix(9) As Double, Area(3) As Double, Factor As Double
   Dim Mass(3) As Double
 
   On Error GoTo Error_Handler
   Prefix(0) = 0.000000001    ' giga
   Prefix(1) = 0.000001       ' mega
   Prefix(2) = 0.001          ' kilo
   Prefix(3) = 1
   Prefix(4) = 100#           ' centi
   Prefix(5) = 1000#          ' milli
   Prefix(6) = 1000000#       ' micro
   Prefix(7) = 1000000000#    ' nano
   Prefix(8) = 1000000000000# ' pico
   
   Area(0) = 1 / 10000#       ' cm^3 -> m^2
   Area(1) = 1
   Area(2) = 0.0929           ' ft^3 -> m^3
   
   Mass(0) = 1
   Mass(1) = 28.349           ' oz -> gm
   Mass(2) = 453.58           ' lb -> gm
   
   Factor = 0.0001
   Factor = Factor * Prefix(thisForm.optAreaPrefix.ListIndex) _
     * Prefix(thisForm.optAreaPrefix.ListIndex)
'   Factor = Factor / Area(thisForm.optArea.ListIndex)
   gd_PhotonFactor = Factor / Prefix(thisForm.optMassPrefix.ListIndex)
'   Factor = Factor * Mass(thisForm.optMass.ListIndex)
   Factor = 1000000#
   gd_EnergyFactor = Factor * Prefix(thisForm.optEnergyPrefix.ListIndex)
   
   Exit Sub
Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Function fns_Field_Units()
 
   Const PROCEDURE_NAME As String = "fns_Field_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gsField_Unit
   sSaveUnits = sUnits
 
   Load frmSetFieldUnits
   frmSetFieldUnits.lblConcUnits = sUnits
   If gs_FieldForm = "Neutron" Then
     frmSetFieldUnits.lblUnits.Visible = False
   Else
     frmSetFieldUnits.lblUnits.Visible = True
     frmSetFieldUnits.lblUnits = Mid(sUnits, 2, 4) & " / " & Mid(sUnits, 2, 4)
   End If
   frmSetFieldUnits.Show vbModal
 
   sUnits = frmSetFieldUnits.lblConcUnits
   Unload frmSetFieldUnits
   Set frmSetFieldUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Field_Units = sUnits
   Else
      fns_Field_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Function fns_Mass_Units()
 
   Const PROCEDURE_NAME As String = "fns_Mass_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Mass_Units
   sSaveUnits = sUnits
 
   Load frmSetMassUnits
   frmSetMassUnits.lblConcUnits = sUnits
   frmSetMassUnits.Show vbModal
 
   sUnits = frmSetMassUnits.lblConcUnits
   Unload frmSetMassUnits
   Set frmSetMassUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Mass_Units = sUnits
   Else
      fns_Mass_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function
Function fns_Kerma_Units()
 
   Const PROCEDURE_NAME As String = "fns_Kerma_Units"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gsKerma_Unit
   sSaveUnits = sUnits
 
   Load frmSetKermaUnits
   frmSetKermaUnits.lblConcUnits = sUnits
   frmSetKermaUnits.Show vbModal
 
   sUnits = frmSetKermaUnits.lblConcUnits
   Unload frmSetKermaUnits
   Set frmSetKermaUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Kerma_Units = sUnits
   Else
      fns_Kerma_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function

Public Sub Kerma_Units_Factor(thisForm As Form)
   Const PROCEDURE_NAME As String = "Kerma_Units_Factor"
   Dim Prefix(9) As Double, Area(1) As Double, Factor As Double
   Dim Dose(2) As Double
 
   On Error GoTo Error_Handler
   Prefix(0) = 0.000000001    ' giga
   Prefix(1) = 0.000001       ' mega
   Prefix(2) = 0.001          ' kilo
   Prefix(3) = 1
   Prefix(4) = 100#           ' centi
   Prefix(5) = 1000#          ' milli
   Prefix(6) = 1000000#       ' micro
   Prefix(7) = 1000000000#    ' nano
   Prefix(8) = 1000000000000# ' pico
   
   Area(0) = 1#
   
   Dose(0) = 1
   Dose(1) = 100
   
   Factor = 0.0001
   Factor = Factor * Prefix(thisForm.optDosePrefix.ListIndex) _
     * Dose(thisForm.optDose.ListIndex)
   gd_KermaFactor = Factor * (Prefix(thisForm.optAreaPrefix.ListIndex) _
     * Prefix(thisForm.optAreaPrefix.ListIndex))
   Exit Sub
Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Function fns_Early_Units()
 
   Const PROCEDURE_NAME As String = "fns_EarlyUnits"
   Dim sSaveUnits As String
   Dim sUnits As String
 
   On Error GoTo Error_Handler
   sUnits = gs_Early_Unit
   sSaveUnits = sUnits
 
   Load frmSetEarlyUnits
   frmSetEarlyUnits.lblConcUnits = sUnits
   frmSetEarlyUnits.Show vbModal
 
   sUnits = frmSetEarlyUnits.lblConcUnits
   Unload frmSetEarlyUnits
   Set frmSetEarlyUnits = Nothing
 
   If gb_SetUnits_Result Then
      fns_Early_Units = sUnits
   Else
      fns_Early_Units = sSaveUnits
   End If
   Exit Function

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Function
