Attribute VB_Name = "modPublicData"
'------------------------------------------------------------------------
' File:         PublicData.BAS   modPublicData
' Description:  Defines all the Public variables
'
'------------------------------------------------------------------------

Option Explicit
Public xGrid As New XArrayDB
Public Xapprox As New XArrayDB
Public XRBE As New XArrayDB
Public XTimes As New XArrayDB
Public XConstants As New XArrayDB
Public XFactors As New XArrayDB
Public XLinks As New XArrayDB, gnNumLinks As Integer, gnFirstLink As Integer
Public gd_CopyArray(40, 2) As Variant
Public gNoLines As Boolean
Public gsICRP89Type As String
Public isSupp As Boolean
Public g_UserCheck As Boolean
Public b_UserDefinedMat As Boolean

Public gs_MyWhere As String
Public gs_MyWhereArray(20) As String
Public gn_NucCount As Integer
Public gs_NucNames(40, 40) As String
Public gn_DauCount(40) As Integer
Public gn_Parent As Integer
Public gd_Activity(40, 40)
Public gs_myTable
Public gs_NucSelected As String
Public gs_EleSelected As String
Public gs_MatSelected As String
Public gs_DecayNucSelected As String
Public gs_AtomType As String
Public gs_myDataBase As String
Public gs_DecayDataSource
Public gd_BetaSpectrum(150) As Double
Public gd_BetaEnd As Single
Public gs_Columns As String
Public gs_ColSelected As Integer
Public gEleType(6) As String, gEleUnit(6) As String
Public gPhoType(8) As String, gPhoUnit(8) As String
Public gAlpType(5) As String, gAlpUnit(5) As String
Public gPhoFldUnit(18, 2) As String, gNeuFldUnit(15, 2) As String
Public gbPlotit As Boolean
Public gs_EleForm As String
Public gs_FieldForm As String
Public gb_AllDone As Boolean
Public gn_Cutoff As Integer
Public gs_LinkSelected As String
Public gbAir_isLoaded As Boolean
Public gbGnd_isLoaded As Boolean
Public gs_EarlyLET As String * 1
Public gs_UseRBE As String * 1
Public gs_AbsorberType As String
Public gb_IsDoseCalc
Public gs_UserMaterialName As String
Public g_UserMaterial As New XArrayDB
Public g_NumUserEles As Integer

Public g_KermaNucCount As Integer
Public g_NKermaNuc(17, 2) As String
Public gAirKermaNuc As String

Public gs_EqnPath As String
Public gs_FormulaFiles As New XArrayDB
Public gs_References As New XArrayDB
Public gs_TextPath As String
Public gs_TextFiles As New XArrayDB

Public gsExcel As Excel.Application
Public gn_ExcelStartColumn As Integer

' Error handling variables
' ---------------------------------------------------------
Type STD3_Error
   Number As Integer
   Severity As Integer
   Description As String
   Module As String
   Procedure As String
End Type

Public gud_PrgErr As STD3_Error

Public gs_PrintDeviceSelected As String
Public gs_PrintDeviceOrientation As String
Public gs_PrintDevicePaperBin As String

' Control flags for forms
' ---------------------------------------------------------
Public gb_OCXDLL_Version_OK As Boolean
Public gb_DebugMode As Boolean
Public gb_OCXCheck As Boolean

Public gl_ScreenHeight As Long
Public gl_ScreenLeft As Long
Public gl_ScreenTop As Long
Public gl_ScreenWidth As Long
Public gb_ButtonPressed As Boolean

Public gsRisk_Unit_Int
Public gsRisk_Unit_Ext
Public gsRisk_Unit_Gnd
Public gsRisk_Path
Public gdRisk_Factor_Int
Public gdRisk_Factor_Ext
Public gdRisk_Factor_Gnd
Public gsE_Dose_Prefix As String
Public gsE_Dose_Unit As String
Public gsE_Act_Prefix As String
Public gsE_Act_Unit As String
Public gsDose_Prefix As String
Public gsDose_Unit As String
Public gsAct_Prefix As String
Public gsAct_Unit As String
Public gsTime As String
Public gsVol As String
Public gs_Area As String
Public gsSAct_Prefix As String
Public gsSAct_Unit As String
Public gsMass_Prefix As String
Public gsMass_Unit As String
Public gsArea_Prefix As String
Public gsArea_Unit As String
Public gsEnergy_Prefix As String
Public gsEnergy_Unit As String
Public gsField_Unit As String
Public gsChangeExtUnits As String
Public gsKerma_Unit As String
Public gKermUnit As String
Public gs_Early_Unit As String
Public gsDoseCalc_Prefix As String
Public gsDoseCalc_Unit As String
Public gsActCalc_Prefix As String
Public gsActCalc_Unit As String
Public gsAreaCalc_Prefix As String
Public gsAreaCalc_Unit As String

Public gb_SetUnits_Result As Boolean
Public gs_Air_Units As String
Public gs_Inh_Units As String
Public gs_Gnd_Units As String
Public gd_InhFactor As Double
Public gd_ExtFactor As Double
Public gs_SA_Units As String
Public gd_SAFactor As Double
Public gs_Range_Units As String
Public gd_EnergyFactor As Double
Public gd_PhotonFactor As Double
Public gs_Energy_Units As String
Public gs_Photon_Units As String
Public gd_FieldFactor As Double
Public gd_MassFactor As Double
Public gs_Mass_Units As String
Public gd_KermaFactor As Double
Public gd_EarlyFactor As Double
Public gs_Activity_Unit As String
Public gs_GndActivity_Unit As String
Public gs_AirActivity_Unit As String
Public gs_Dose_Unit As String
Public gd_DoseFactor As Double
Public gd_ActFactor As Double
Public gd_ActGndFactor As Double
Public gd_ActAirFactor As Double
Public gd_BioassayFactor As Double

Public gd_EGrid(150) As Double
Public nThisTab As Integer
' --------------------------------------
' Nuclide database display control
'   used with frmNuclideDisplayOptions (STD3-016)

Public gn_NumNucDataFields As Integer
Public gb_NucFieldSelected() As Boolean
Public gb_NucFieldDefault() As Boolean
Public gs_NucFieldNames() As String
Public gn_NucFieldIndex() As Integer

' --------------------------------------
' Calculation control

Public gs_Calc_ErrorFlag As String * 1
Public gb_CalcAbort As Boolean
Public gs_FMDose_NuclideList_FileName As String
   
Public gdt_CalcRun_Date As Date
Public gdt_CalcRun_Time As Date

'-------------------------------------
' Stored paths to databases and queries

Public wsNuc As Workspace
Public dbNuc As Database
Public rsNuc As Recordset
   
' -------------------------------------------------
' Define variables to hold paths and filenames

Public gs_EXEPath As String
Public gs_UserPath As String
Public gs_DataPath As String
Public gs_HelpPath As String
Public gs_TempPath

Public gs_FMDose_RunSpec_FileName As String
Public gs_FMDose_Error_FileName As String
Public gs_FMDose_CST_FileName As String
Public gs_FMDose_MV_FileName As String

Declare Sub Interp_Photon Lib "ChainDll.dll" (ByVal Main_Path As String)

'--------------------------------------------------------------------------------
' Define variables for decay chain viewing

Public gsNucStr As String
Public gs_DrawChain_Error_FileName As String
Public gView_File_Name As String * 120
Public SWidth As Double, SHgt As Double, X_Org As Double, Y_Org As Double

Declare Sub Write_Chain Lib "ChainDll.dll" (ByVal ID As String, _
  ByVal nuke As String, ByVal Main_Path As String, ByVal Error As String, _
  ByVal SAUnits As String, ByVal SAU_Disp As String)

Declare Sub Write_Chain_Activity Lib "ChainDll.dll" (ByVal ID As String, _
  ByVal nuke As String, ByVal Main_Path As String, ByVal Error As String, _
  ByVal DecTime As String, ByVal DecUnits As String)

Declare Sub Write_Summary Lib "ChainDll.dll" (ByVal ID As String, _
  ByVal nuke As String, ByVal Main_Path As String, ByVal Error As String, _
  ByVal SAUnits As String, ByVal SAU_Disp As String)

Declare Sub Draw_Chain Lib "ChainDll.dll" (ByVal ID As String, _
  ByVal nuke As String, ByVal Main_Path As String, ByVal Error As String)

Declare Function GSClearView Lib "GSWDLL32.DLL" (ByVal nMode&) As Long
Declare Function GSGetRTextHt Lib "GSWDLL32.DLL" (ByVal nCset&, ByVal nMode&, ByVal szString$) As Double
Declare Function GSLineAbs Lib "GSWDLL32.DLL" (ByVal fxA#, ByVal fya#, ByVal fxB#, ByVal fyB#, ByVal nMode&, ByVal nStyle&, ByVal nClr&) As Long
Declare Function GSLineRel Lib "GSWDLL32.DLL" (ByVal fxr#, ByVal fya#, ByVal nMode&, ByVal nStyle&, ByVal nClr&) As Long
Declare Function GSRText Lib "GSWDLL32.DLL" (ByVal fxOrg#, ByVal fyOrg#, ByVal nCset&, ByVal nTMode&, ByVal nClr&, ByVal szString$) As Long
Declare Function GSOpenPrn Lib "GSWDLL32.DLL" (ByVal szDevice$, ByVal szFile$, ByVal nMode&) As Long
Declare Function GSPrnOut Lib "GSWDLL32.DLL" (ByVal nView&, ByVal nNCopies&, ByVal nMode&) As Long
Declare Function GSClosePrn Lib "GSWDLL32.DLL" () As Long
Declare Function GSGetRTextWid Lib "GSWDLL32.DLL" (ByVal nCset&, ByVal nMode&, ByVal szString$) As Double
Declare Function GSGetSXExt Lib "GSWDLL32.DLL" () As Double
Declare Function GSGetSYExt Lib "GSWDLL32.DLL" () As Double
Declare Function GSOpenWin Lib "GSWDLL32.DLL" (ByVal fxOrg#, ByVal fyOrg#, ByVal fWid#, ByVal fHt#, ByVal fyExt#, ByVal nStyle&, ByVal nMode&, ByVal szTitle$) As Long
Declare Function GSCloseWin Lib "GSWDLL32.DLL" (ByVal nWin&) As Long
Declare Function GSOpenServer Lib "GSWDLL32.DLL" (ByVal szKey$, ByVal szHost$) As Long
Declare Function GSCloseServer Lib "GSWDLL32.DLL" () As Long
Declare Function GSOpenChildWin Lib "GSWDLL32.DLL" (ByVal hWndParent&, ByVal fxOrg#, ByVal fyOrg#, ByVal fWid#, ByVal fHt#, ByVal fyExt#, ByVal nStyle&, ByVal nMode&, ByVal szTitle$) As Long
Declare Function GSSetBG Lib "GSWDLL32.DLL" (ByVal nClr&) As Long
Declare Function GSVText Lib "GSWDLL32.DLL" (ByVal fxOrg#, ByVal fyOrg#, ByVal fWid#, ByVal fHt#, ByVal fAng#, ByVal nCset&, ByVal nMode&, ByVal nClr&, ByVal szString$) As Long

Public Const HH_DISPLAY_TOPIC As Long = 0
Public Const HH_HELP_CONTEXT As Long = &HF
Public Const HH_DISPLAY_TOC = 1
Public Const HH_DISPLAY_INDEX = 2
Declare Function HTMLHelp Lib "HHCtrl.ocx" Alias "HtmlHelpA" (ByVal hWndCaller As Long, _
  ByVal pszFile As String, ByVal uCommand As Long, dwData As Any) As Long

