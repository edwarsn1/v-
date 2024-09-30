Attribute VB_Name = "modMain"
'------------------------------------------------------------------------
' File:         Main.BAS   modMain
'
' Written by:   GF Athey, AL Sjoreen
' Updated:      21-January-1999
'
' Description:  The main program of the Rad_Toolbox model user interface.
'
'------------------------------------------------------------------------
Option Explicit

' Reg Key Security Options...
Const READ_CONTROL = &H20000
Const KEY_QUERY_VALUE = &H1
Const KEY_SET_VALUE = &H2
Const KEY_CREATE_SUB_KEY = &H4
Const KEY_ENUMERATE_SUB_KEYS = &H8
Const KEY_NOTIFY = &H10
Const KEY_CREATE_LINK = &H20
Const KEY_ALL_ACCESS = KEY_QUERY_VALUE + KEY_SET_VALUE + _
                       KEY_CREATE_SUB_KEY + KEY_ENUMERATE_SUB_KEYS + _
                       KEY_NOTIFY + KEY_CREATE_LINK + READ_CONTROL
                     
' Reg Key ROOT Types...
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' Unicode nul terminated string
Const REG_DWORD = 4                      ' 32-bit number

Const gREGKEYSYSINFOLOC = "SOFTWARE\Microsoft\Shared Tools Location"
Const gREGVALSYSINFOLOC = "MSINFO"
Const gREGKEYSYSINFO = "SOFTWARE\Microsoft\Shared Tools\MSINFO"
Const gREGVALSYSINFO = "PATH"

Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long

Private Const MODULE_NAME As String = "modMain"
Dim sUndefined As String
Dim sDate As String
Dim sTime As String

Public Sub PositionForm(frm As Form)
' --------------------------------------------------------------
' Called by each form as it is loaded to position appropriately
' Accounts for the working area available on the screen
' --------------------------------------------------------------

   Const PROCEDURE_NAME As String = "PositionForm"
   On Error GoTo Error_Handler
   
   frm.Move gl_ScreenLeft + (gl_ScreenWidth - frm.Width) \ 2, _
      gl_ScreenTop + (gl_ScreenHeight - frm.Height) \ 2
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
      
End Sub

Sub Main()
 
   Const PROCEDURE_NAME As String = "Main"
   Dim nIndex As Integer
   Dim nResponse As Integer, i As Integer
   Dim fPauseTime As Single
   Dim fStart As Single
   Dim sMsgTxt As String, sTemp As String
   Dim sCommandLineArg As String, sDBFileName As String
   
   On Error GoTo Error_Handler
   
   gl_ScreenHeight = frmAboutApp.SysInfo.WorkAreaHeight
   gl_ScreenLeft = frmAboutApp.SysInfo.WorkAreaLeft
   gl_ScreenTop = frmAboutApp.SysInfo.WorkAreaTop
   gl_ScreenWidth = frmAboutApp.SysInfo.WorkAreaWidth
   Unload frmAboutApp
   Set frmAboutApp = Nothing
   
   If App.PrevInstance = True Then
      MsgBox "You already have a copy of Rad_Toolbox running.", vbInformation + vbOKOnly
      End
   End If
   
   Init_Paths
   Set_InitialValues
   Rad_Toolbox.lblExtUnits = gs_Air_Units
   Rad_Toolbox.lblICRP38Units = gs_Inh_Units
   Rad_Toolbox.lblICRP68Units = gs_Inh_Units
   Rad_Toolbox.lblICRP72InhUnits = gs_Inh_Units
   Rad_Toolbox.lblICRP72IngUnits = gs_Inh_Units
   Rad_Toolbox.lblEarlyUnits = gs_Early_Unit
   Rad_Toolbox.lblElectronUnits = gs_Range_Units
   Rad_Toolbox.lblAlphaUnits = gs_Range_Units
   Rad_Toolbox.lblPhotonUnits = gs_Photon_Units
   Rad_Toolbox.lblAlphaEUnits = gs_Energy_Units
   Rad_Toolbox.lblElectronEUnits = gs_Energy_Units
   Rad_Toolbox.lblKermaUnit = gsKerma_Unit
   
   sDBFileName = gs_DataPath & "FGR12.mdb"
   Set wsNuc = CreateWorkspace("Rad_Toolbox", "Admin", "", dbUseJet)
   Set dbNuc = wsNuc.OpenDatabase(sDBFileName)
   Set rsNuc = dbNuc.OpenRecordset("Air Submersion")
   gb_AllDone = False
   
   
   
   Rad_Toolbox.Show
   Set Rad_Toolbox = Nothing
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
 
End Sub

Sub Init_Nuclide_Database_Display()
   
   Const PROCEDURE_NAME As String = "Init_Nuclide_Database_Display"
   Dim nIndex As Integer
   Dim sName As String
   Dim sDBFileName As String
 
   On Error GoTo Error_Handler
   sDBFileName = gs_DataPath & "FGR12.mdb"
   Set wsNuc = CreateWorkspace("Rad_Toolbox", "Admin", "", dbUseJet)
   Set dbNuc = wsNuc.OpenDatabase(sDBFileName)
   Set rsNuc = dbNuc.OpenRecordset("Air Submersion")
 
' Manually set the fields to make up the default view of the
' nuclide database.
 
   gn_NumNucDataFields = rsNuc.Fields.Count
   ReDim gb_NucFieldSelected(1 To gn_NumNucDataFields)
   ReDim gb_NucFieldDefault(1 To gn_NumNucDataFields)
   ReDim gs_NucFieldNames(1 To gn_NumNucDataFields)
   ReDim gn_NucFieldIndex(1 To gn_NumNucDataFields)
 
   For nIndex = 1 To rsNuc.Fields.Count
      gb_NucFieldDefault(nIndex) = False
   Next nIndex
 
' this section has specific fields hardwired in
' should improve the way it is done
 
   gb_NucFieldDefault(8) = True
   gb_NucFieldDefault(27) = True
   gb_NucFieldDefault(28) = True
   gb_NucFieldDefault(29) = True
   gb_NucFieldDefault(39) = True
  
' loop thru all the fields getting the names; start with item 1
' instead of 0 to skip nuclide name - it must always be displayed
 
   For nIndex = 1 To rsNuc.Fields.Count - 1
      gs_NucFieldNames(nIndex) = rsNuc.Fields(nIndex).Name
      gn_NucFieldIndex(nIndex) = nIndex
      gb_NucFieldSelected(nIndex) = gb_NucFieldDefault(nIndex)
   Next nIndex
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Private Sub Set_InitialValues()
 
   Const PROCEDURE_NAME As String = "Set_InitialValues"
   Dim nIndex As Integer, i As Integer, j As Integer, n As Integer
   Dim FN As String, sStrE As String, sStrP As String, sStrR As String
   Dim sDum1 As String, sDum2 As String, dDum As Double
 
   On Error GoTo Error_Handler
     
   isSupp = False
   b_UserDefinedMat = False
   gs_Air_Units = " Sv  /  Bq s m^-3"
   gs_Inh_Units = " Sv  / Bq"
   gs_Gnd_Units = " Sv  /  Bq s m^-2"
   gs_Early_Unit = " Gy  / Bq"
   gsChangeExtUnits = "Air"
   gs_SA_Units = " Bq / kg"
   gs_Mass_Units = " g "
   gs_Photon_Units = "cm^2 /  g"
   gs_Range_Units = " g / cm^2"
   gs_Energy_Units = "MeV cm^2 /  g"
   gsField_Unit = "pSv  cm^2"
   gsKerma_Unit = " Gy  cm^2"
   gs_Activity_Unit = " Bq"
   gs_AirActivity_Unit = " Bq /  m^3"
   gs_GndActivity_Unit = " Bq /  m^2"
   gb_IsDoseCalc = False
   gs_Dose_Unit = " Sv"
   gsRisk_Unit_Int = "/ Bq"
   gsRisk_Unit_Ext = " m^3 / Bq s"
   gsRisk_Unit_Gnd = " m^2 / Bq s"
   
   gbAir_isLoaded = False
   gbGnd_isLoaded = False
   gd_SAFactor = 1#
   gd_MassFactor = 1
   gd_InhFactor = 1
   gd_ExtFactor = 1
   gd_EnergyFactor = 1
   gd_PhotonFactor = 1
   gd_FieldFactor = 1
   gd_KermaFactor = 1
   gd_EarlyFactor = 1
   gd_DoseFactor = 1
   gd_ActFactor = 1
   gd_ActGndFactor = 1
   gd_ActAirFactor = 1
   gdRisk_Factor_Int = 1
   gdRisk_Factor_Ext = 1
   gdRisk_Factor_Gnd = 1
   
   FN = gs_DataPath & "egrid.dat"
   Open FN For Input As #10
   Input #10, FN
   For i = 1 To 150
     Input #10, gd_EGrid(i)
   Next i
   Close #10
   
   Call NoBlanks(gs_Energy_Units, sStrE)
   Call NoBlanks(gs_Range_Units, sStrR)
   Call NoBlanks(gs_Photon_Units, sStrP)
   gbPlotit = True
   gEleType(0) = "Kinetic Energy"
   gEleType(1) = "Stopping Power - Collision"
   gEleType(2) = "Stopping Power - Radiative"
   gEleType(3) = "Stopping Power - Total"
   gEleType(4) = "CSDA Range"
   gEleType(5) = "Radiation Yield"
   gEleType(6) = "Density Effect Delta"
   gEleUnit(0) = "MeV"
   gEleUnit(1) = sStrE
   gEleUnit(2) = sStrE
   gEleUnit(3) = sStrE
   gEleUnit(4) = sStrR
   gEleUnit(5) = ""
   gEleUnit(6) = ""
   
   gPhoType(0) = "Photon Energy"
   gPhoType(1) = "Scattering - Coherent"
   gPhoType(2) = "Scattering - Incoherent"
   gPhoType(3) = "Photo-Electric Absorption"
   gPhoType(4) = "Pair Production in Nuclear Field"
   gPhoType(5) = "Pair Production in Electron Field"
   gPhoType(6) = "Total Attenuation with Coherent Scattering"
   gPhoType(7) = "Total Attenuation without Coherent Scattering"
   gPhoType(8) = "Mass Energy-Absorption"
   gPhoUnit(0) = "MeV"
   For i = 1 To 8
    gPhoUnit(i) = sStrP
   Next i
   
   gAlpType(0) = "Alpha Energy"
   gAlpType(1) = "Electronic Stopping Power"
   gAlpType(2) = "Nuclear Stopping Power"
   gAlpType(3) = "Total Stopping Power"
   gAlpType(4) = "CSDA Range"
   gAlpUnit(0) = "MeV"
   gAlpUnit(1) = sStrE
   gAlpUnit(2) = sStrE
   gAlpUnit(3) = sStrE
   gAlpUnit(4) = sStrR
   
   gPhoFldUnit(0, 1) = "MeV"
   gPhoFldUnit(1, 1) = " Sv  / Gy "
   gPhoFldUnit(2, 1) = " Sv  / Gy "
   gPhoFldUnit(3, 1) = "pGy  cm^2"
   gPhoFldUnit(4, 1) = " Sv  / Gy "
   gPhoFldUnit(5, 1) = " Sv  / Gy "
   gPhoFldUnit(0, 2) = "MeV"
   For i = 1 To 16
     gPhoFldUnit(i, 2) = " Gy /  Gy "
   Next i
   gPhoFldUnit(17, 2) = " Sv  /  Gy "
   
   gNeuFldUnit(0, 1) = "MeV"
   gNeuFldUnit(1, 1) = "pSv  cm^2"
   gNeuFldUnit(2, 1) = "pSv  cm^2"
   gNeuFldUnit(0, 2) = "MeV"
   For i = 1 To 13
     gNeuFldUnit(i, 2) = "pGy  cm^2"
   Next i
   gNeuFldUnit(14, 2) = "pSv  cm^2"
   
   XTimes.ReDim 1, 10, 0, 0
   XTimes(1, 0) = 1#
   For i = 2 To 10
     XTimes(i, 0) = 0#
   Next i
   XRBE.ReDim 1, 4, 0, 1
   XRBE(1, 0) = "Small intestine"
   XRBE(2, 0) = "Red marrow"
   XRBE(3, 0) = "Lung"
   XRBE(4, 0) = "AI lung region"
   XRBE(1, 1) = 1#
   XRBE(2, 1) = 1#
   XRBE(3, 1) = 1#
   XRBE(4, 1) = 1#

   FN = gs_DataPath & "misc.dat"
   Open FN For Input As #10
' web links
   Input #10, FN
   Input #10, n, j
   XLinks.ReDim 0, n, 0, 1
   For i = 0 To n - 1
     Input #10, sDum1, sDum2
     XLinks(i, 0) = sDum1
     XLinks(i, 1) = sDum2
   Next i
   gnNumLinks = n
   gnFirstLink = j - 1
' constants
   Input #10, FN
   Input #10, n, j
   XConstants.ReDim 0, n, 0, 2
   For i = 0 To n - 1
     Input #10, sDum1, dDum, sDum2
     XConstants(i, 0) = sDum1
     XConstants(i, 1) = dDum
     XConstants(i, 2) = sDum2
   Next i
' conversion factors
   Input #10, FN
   Input #10, n, j
   XFactors.ReDim 0, n, 0, 1
   For i = 0 To n - 1
     Input #10, sDum1, dDum
     XFactors(i, 0) = sDum1
     XFactors(i, 1) = dDum
   Next i
   Close #10
   
' conversions for neutron kerma
   g_KermaNucCount = 17
   g_NKermaNuc(0, 1) = "Al"
   g_NKermaNuc(0, 2) = "Al-27"
   g_NKermaNuc(1, 1) = "B"
   g_NKermaNuc(1, 2) = "B-9"
   g_NKermaNuc(2, 1) = "Be"
   g_NKermaNuc(3, 2) = "Be-9"
   g_NKermaNuc(3, 1) = "Co"
   g_NKermaNuc(4, 2) = "Co-59"
   g_NKermaNuc(4, 1) = "F"
   g_NKermaNuc(5, 2) = "F-19"
   g_NKermaNuc(6, 1) = "He"
   g_NKermaNuc(6, 2) = "He-4"
   g_NKermaNuc(7, 1) = "H"
   g_NKermaNuc(7, 2) = "H-1"
   g_NKermaNuc(8, 1) = "Li"
   g_NKermaNuc(8, 2) = "Li-7"
   g_NKermaNuc(9, 1) = "Mn"
   g_NKermaNuc(9, 2) = "Mn-55"
   g_NKermaNuc(10, 1) = "N"
   g_NKermaNuc(10, 2) = "N-14"
   g_NKermaNuc(11, 1) = "Na"
   g_NKermaNuc(11, 2) = "Na-23"
   g_NKermaNuc(12, 1) = "O"
   g_NKermaNuc(12, 2) = "O-16"
   g_NKermaNuc(13, 1) = "P"
   g_NKermaNuc(13, 2) = "P-31"
   g_NKermaNuc(14, 1) = "S"
   g_NKermaNuc(14, 2) = "S-32"
   g_NKermaNuc(15, 1) = "Ti"
   g_NKermaNuc(15, 2) = "Ti-57"
   g_NKermaNuc(16, 1) = "V"
   g_NKermaNuc(16, 2) = "V-51"
   
   
   Exit Sub
   
Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
 
End Sub

Private Sub Init_Paths()
   Const PROCEDURE_NAME As String = "Init_Paths"
   On Error GoTo Error_Handler
   
   gs_EXEPath = App.Path
   If (Right$(gs_EXEPath, 1) <> "\") Then
      gs_EXEPath = gs_EXEPath & "\"
   End If
 
   gs_DataPath = gs_EXEPath & "data\"
   gs_UserPath = gs_EXEPath & "Results\"
   gs_HelpPath = gs_EXEPath & "Help\"
   gs_TempPath = gs_EXEPath & "temp\"
   gs_EqnPath = gs_EXEPath & "equations\"
   gs_TextPath = gs_EXEPath & "textDisplays\"
   On Error Resume Next
   MkDir gs_TempPath
   MkDir gs_UserPath
   On Error GoTo Error_Handler
   gs_DrawChain_Error_FileName = "drawchan.err"
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Public Sub NoBlanks(inpStr As String, outStr As String)
   Const PROCEDURE_NAME As String = "NoBlanks"
   Dim i As Integer, sl As Integer, sCh As String * 1
   On Error GoTo Error_Handler

   sl = Len(Trim(inpStr)) + 1
   outStr = ""
   For i = 1 To sl
     sCh = Mid(inpStr, i, 1)
     If (sCh <> " ") Then
       outStr = outStr & sCh
       If sCh = "V" Then
         outStr = outStr & " "
       End If
     End If
   Next i
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub
