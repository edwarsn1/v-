Attribute VB_Name = "Module1"
Option Explicit
'Global FileVersion301 As Boolean
Private Const Version301 = "3/22/1999"
Global VersionNumber As String
Global FileMode As Integer 'JCK
Global Const CancelSelected = 32755
Global Const MaxDimen = 10 ' max for data entry tables
Global Const MaxCompartments = 20
Global Const MaxPathways = 40
Global Const MaxPathXQ = 10
Global Const MaxDoses = 10
Global Const MaxSourceTerm = 10
'----------- Array index of first file of each type ----
Global Const DCF = 1
Global Const RFT = 2
Global Const NIF = 7 'Was 4 -- JCK 9/2006
Global Const LastRFTFile = 6 'Was 3
'----------- Total number of array entries ---------
'----------- Currently 1 DCF, 5 RFT & 5 DCF --------
Global Const TotalSourceFiles = 11 'Was 6
Global Const SCIZERO As String = "0.00E+00"
Global Const SCINOTA As String = "0.0000000E+00" 'For Format() JCK
Global Const TIMEFORM As String = "0.0000"
Global Const FloatFormat = "0.00000000" 'JCK
Global Const SHOWEVENT = 1
Global Const SHOWSTEP = 2
Global Const SHOWMODEL = 3
Global Const SHOWCi = 4
Global Const EDITRESULTS = 5
'Global Const SHOWPLANT = 4
'Global Const SHOWSCENARIO = 5
Global Const RedButton = &H8080F
Global SaveBeforeCalculate As Boolean
Global CaseNameWidth As Single
Private Const Skipheading = 1 'JCK
Private Const COMMENT_CHARACTER = "&" 'JCK

Const AER = 1
Const ELM = 2
Const ORG = 3
Const NOB = 4

Public Const TheScreen = 0
Public Const TheForm = 1
    
' radtrad calculation: dll is installed as  $winsyspath
Public Declare Sub keybd_event Lib "user32" _
   (ByVal bVk As Byte, ByVal bScan As Byte, _
    ByVal dwFlags As Long, _
    ByVal dwExtraInfo As Long)

' Belcourt added the dependency for the FileSystemObject
Global StartupPath As String
Global FSO As FileSystemObject
Global PrevBrowsePath As String 'For source term dialog JCK 7/2006
'--end block--'

' application
Type applrecord
  PlantTitle As String
  ScenarioTitle As String
  VersionStamp As String
  CodeRevisionStamp As String
  DefaultPath As String
  CaseTitle As String
  CompartmentCount As Integer
  PathwayCount As Integer
  DoseLocationCount As Integer
  PathDependentXQcount As Integer
  PlantFile As String ' read at beg. of scenario file
  'ControlRoomIndex As Integer ' use to edit for only one control room
  EnvironmentIndex As Integer ' use to edit for only one environment
End Type
Global Appl As applrecord

'For the source term file array - JCK
Dim NifUnits(0 To 2) As Integer
Type SourceTermEntry
  CompartmentNumber As Integer
  Fraction As Single
  NifIndex As Integer
  NifType As Integer
  RftIndex As Integer
  IFX(0 To 2) As Single  '0=Organic fraction; 1=Elem fx; 2 = Organic fx
End Type

' Source term
Type sourcetermrecord
'  CompartmentNum As Integer ' when single source term compartment, this is filled
  Opool As Integer 'which compartment has overlying pool; rarely if ever used
  'FileChoice(DCF To NIF) As Integer
  FileChoice As Integer 'Now only DCF uses this to select files
  DcfType As Integer 'Stores TID/1465 button
  'Files(DCF to NIF) As String
  Files(1 To TotalSourceFiles) As String 'Now we have 1 .dcf, up to 5 .rft and up to 5 .nif files
  MissingFile(1 To TotalSourceFiles) As Boolean
  PathChanged(1 To TotalSourceFiles) As Boolean
  PlantPowerMwts As Single
  DelayTime As Single
  StartTime As Single
  DecayDaughter As Integer ' 0=nodecay; 1=nodaughter 2=decay and daughter products
  'Multiple IFX fractions moved to SourceTermEntry for 3.10
  'IFX(0 To 2) As Single  '0=Organic fraction; 1=Elem fx; 2 = Organic fx
  SourceTermTable() As SourceTermEntry
End Type
Global SourceTerm As sourcetermrecord
'
Type HeadingRecord ' for initializing user-specified data entry form
  CurrentIndex As Integer
  Caption As String
  Title As String
  Subtitle As String
  ColHeadings(0 To 3) As Variant
  times(1 To MaxDimen) As Variant
  Values(1 To 7, 1 To MaxDimen) As Variant ' max 4 data columns by max 10 rows: each column contain
                            ' a separate array. The rows correspond to Times
  AerosolDF As Single
  LambdaAerosolDF As Single
  ElementalDF As Single
  Showselect As Boolean
End Type
'========================================
'
Type powerssprayrecord 'p. 34
  Count As Integer
  times() As Single
  Flux() As Single
  Height() As Single
  FracSpray As Single
  Percentile As Single
End Type

Type powerspoolrecord ' p.48
  Count As Integer
  times() As Single
  PoolDepth() As Single
  PoolTemp() As Single
  Percentile As Single '10, 50, 90
End Type

Type powersdeprecord 'containment only p.42
  ReactorAccidentType As Integer '1 = PWR DBA 2=PWRSA 3=BWRDBA 4=BWRSA 5=APWRDBA?
  Percentile As Single ' 10, 50, 90
End Type

Type henrydeprecord 'p. 41
 Count As Integer
 times() As Single
 FallHeight() As Single
 ParticleDensity() As Single
End Type

' details of compartment features
Type spraysrecord
  AModelNum As Integer '0=user 1=powers 2=none
  Count As Integer
  RowCount(1 To 3) As Integer
  times() As Single
  AerosolRemoval() As Single
  ElemRemoval() As Single
  OrgRemoval() As Single
  Powers As powerssprayrecord
  AerosolDF As Single
  LambdaAerosol  As Single
  ElementalDF As Single
End Type

Type refilrecord 'Compartment Feature 1, Recirculating filters
 'ForcedFlow As Single
 Count As Integer
 times() As Single
 FlowRates() As Single
 AeroEffic() As Single
 ElemIEffic() As Single
 OrgIEffic() As Single
 'Column5() As Single
 FailEnable As Integer
 FailureData(1 To 5) As Single
 StopTime As Single
End Type

Type depositionrecord 'Compartment Feature 2, Natural Deposition
 AModelNum As Integer ' aerosol model: 1=User 2=Henry 3=Powers
 Count As Integer
 RowCount(1 To 2) As Integer
 times() As Single
 AerosolRemoval() As Single
 ElemRemoval() As Single
 Henry As henrydeprecord
 Powers As powersdeprecord
End Type

Type overlyingpoolrecord 'Compartment Feature 3, Overlying Pool
 AModelNum As Integer ' 0=user defined 1= powers (p.48) 2=none
 WaterVolume As Single
 Count As Integer
 RowCount(1 To 3) As Integer
 times() As Single
 AerosolDecon() As Single ' user defined
 ElemDecon() As Single ' ud
 OrgDecon() As Single 'ud
 Powers As powerspoolrecord ' alternate to user defined coefficients
End Type


' bring above together into compartment record
Type compartmentrecord
  Name As String
  Number As Integer
  PrintDetail As Integer
  Type As Integer '0=Unused 1=CR 2=Env 3=Other
  Volume As Single
  Features(1 To 4) As Integer
  SourceTerm As Boolean 'format 3.00 true = ST compartment
  SourceTermOP As Boolean ' format 3.01 true = OP compartment
  SourceTermFraction As Single
  Decay As Integer ' same number (0 or 1) propagated to each compartment
  F0Sprays As spraysrecord
  F1ReFilters As refilrecord
  F2Deposition As depositionrecord
  F3OPool As overlyingpoolrecord
End Type
Global CompartmentArr(1 To MaxCompartments) As compartmentrecord
'=========== end compartments, begin transfer pathways =========

' transfer mechanisms data for Pathway records
Type brockmannppgrecord ' for piping  p. 54
  FlowModel As Integer '1-Homogenous, 2-Slug, 3-Homog, Vapor Deposition, 4-Slug, Vapor
  WallTemp As Single
  Pressure As Single
  Volume As Single
  TotalSurfaceArea As Single
  UpwardSurfaceArea As Single
  Length As Single
  Diameter As Single
  BendAngle As Single
  VaporModel As Integer '0-None, 1-Bixler Elemental, 2-Fixed
  SettlingVelocity As Single
  ElementalVelocity As Single
  OrganicVelocity As Single
  Count As Integer
  times() As Single
  FlowRates() As Single
End Type

Type tm0pipingrecord 'TM0, Piping
  AModelNum As Integer '1=User 2= Brockmann-Bixler
  EModelNum As Integer
  OModelNum As Integer
  Count As Integer
  RowCount(1 To 3) As Integer
  times() As Single
  FlowRates() As Single
  AerosolDF() As Single
  ElemIDF() As Single
  OrgIDF() As Single
  BrockmannA As brockmannppgrecord
End Type

Type tm1filterrecord 'TM1, filter efficiencies
  Count As Integer
  times() As Single
  FlowRates() As Single
  AerH() As Single
  ElemIH() As Single
  OrgIH() As Single
  FailEnable As Integer
  FailureData(1 To 5) As Single
  StopTime As Single
End Type

Type tm2suporecord 'TM2, Suppression Pool
  Count As Integer ' number of rows after user modification;0=no data, or n=largest array of A,E,O
  RowCount(1 To 4) As Integer 'number of data rows read in
  times() As Single
  Models(1 To 3) As Boolean ' 0= Aerosols 1=Elem I 2 = Organic I; multiple choice
  AerosolDF() As Single
  ElemIDF() As Single
  OrgIDF() As Single
  FlowRatesAER() As Single 'Same as ver 3.2 Flow Rates
  FlowRatesELM() As Single 'Added for ver 3.3 - JCK
  FlowRatesORG() As Single 'Added for ver 3.3 - JCK
  FlowRatesNOB() As Single 'Added for ver 3.10 - JCK
  'New mode uses same arrays for different data:
  'Non-iodine aerosols and 2 iodine fractions
  Mode As Integer '11/2005 JCK
End Type

Type tm3leakrecord
  Count As Integer
  times() As Single
  LeakageRates() As Single
End Type

' the actual pathways
Type pathwayrecord
  FromComp As Integer
  ToComp As Integer
  Name As String
  Number As Integer
  PrintDetail As Integer
  Active As Boolean
  TransferMechanism(1 To 4) As Boolean
  TM0Piping As tm0pipingrecord
  TM1Filter As tm1filterrecord
  TM2Supo As tm2suporecord
  TM3Leak As tm3leakrecord
End Type

Global PathwayArr(1 To MaxPathways) As pathwayrecord
'========= end of pathways, beginning of dose locations =========
Type dldatarecord
  Model As Integer '0 = not used; 1 = used
  Count As Integer 'number of data rows to read
  times() As Single
  Data() As Single
End Type

Type doselocationrecord
  Name As String
  Number As Integer
  CompartmentNumber As Integer
  ControlRoom As Boolean
'  dlXQ As dldatarecord
  dlBR As dldatarecord
  dlOccupy As dldatarecord
End Type
Global DoseLocationArr(1 To MaxDoses) As doselocationrecord

'========= New path-dependent X/Q tables ========== JCK
Type PathXQrecord
    Name As String
    Number As Integer
    dlXQ As dldatarecord
End Type

'First 3 X/Q's are reserved for EAB, LPZ and and optional 3rd Offsite X/Q table, starts empty
'(MaxPathXQ + 1) allows storing full count if #3 is blank
Global PathXQArr(1 To MaxPathXQ + 1) As PathXQrecord
Global XQIndexRows As Integer
Global XQIndexCols As Integer
Global PathXQMap() As Integer
'==================================================

' at end of scenario file
Type supplementimesrecord
  Count As Integer
  CalTimes() As Single
  CalTimeSteps() As Single
End Type

Type calculationrecord
  OutputOptions(1 To 5) As Integer
  PlantFile As String * 256
  ScenarioFile As String * 256
  OutputFile As String * 256
  Errormessage As String * 256
  OutputOfRecord As String
  SupplementalTimes As supplementimesrecord
  EndTime As Single
End Type
Global CalcOptions As calculationrecord

Sub InitCompartmentsPathwaysDLs()
Dim i, j
  
  With CalcOptions
     .Errormessage = Space(256)
     .OutputOfRecord = ""
     .OutputFile = Space(256)
     .PlantFile = Space(256)
     .ScenarioFile = Space(256)
  
     For i = 1 To 5
        .OutputOptions(i) = 1
     Next i
     .OutputOptions(2) = 0
     .OutputOptions(3) = 0
     
     With .SupplementalTimes
        .Count = 0
        ReDim .CalTimes(1 To MaxDimen) As Single, _
                    .CalTimeSteps(1 To MaxDimen) As Single
     End With
  End With

  With SourceTerm
    .Opool = 0
    .FileChoice = 0
    .DelayTime = 0
    .StartTime = 0
    .PlantPowerMwts = 0#
    .DecayDaughter = 1
    
    For i = DCF To TotalSourceFiles
        .Files(i) = ""
        .MissingFile(i) = False
        .PathChanged(i) = False
    Next
    SaveBeforeCalculate = False
      
    For i = 0 To 2
        NifUnits(i) = 0
        '.IFX(i) = 0 - JCK 11/2005
    Next
        
    ReDim .SourceTermTable(1 To MaxSourceTerm)
    For i = 1 To MaxSourceTerm
        .SourceTermTable(i).CompartmentNumber = 0
        .SourceTermTable(i).Fraction = CSng(0)
        .SourceTermTable(i).NifIndex = 0
        .SourceTermTable(i).NifType = 0
        .SourceTermTable(i).RftIndex = 0
        For j = 0 To 2
            .SourceTermTable(i).IFX(j) = CSng(0) 'JCK 11/2005
        Next
    Next
  End With
  
  For i = 1 To MaxCompartments
    With CompartmentArr(i)
      .Type = 0
      .Name = "Unused"
      .Number = 0
      .SourceTermOP = False
      .SourceTerm = False
      .Volume = 0#
      .Decay = 0
      .PrintDetail = 0
      .SourceTermFraction = 0#
      For j = 1 To 4
        .Features(j) = 0
      Next j
      With .F0Sprays
        .AModelNum = 0
        .Count = 0
        .RowCount(1) = 0
        .RowCount(2) = 0
        .RowCount(3) = 0
        With .Powers
          .Count = 0
          .Percentile = 0#
          .FracSpray = 0#
          ReDim .Height(1 To MaxDimen) As Single, _
            .times(1 To MaxDimen) As Single, _
            .Flux(1 To MaxDimen) As Single
        End With
        ReDim .AerosolRemoval(1 To MaxDimen) As Single, _
              .ElemRemoval(1 To MaxDimen) As Single, _
              .OrgRemoval(1 To MaxDimen) As Single, _
              .times(1 To MaxDimen) As Single
      End With
      With .F1ReFilters
        .Count = 0
        '.ForcedFlow = 0#
        ReDim .FlowRates(1 To MaxDimen) As Single, _
              .AeroEffic(1 To MaxDimen) As Single, _
              .ElemIEffic(1 To MaxDimen) As Single, _
              .OrgIEffic(1 To MaxDimen) As Single, _
              .times(1 To MaxDimen) As Single
        .FailEnable = 0
        For j = 1 To 5
          .FailureData(j) = 0
        Next
        .StopTime = 0
      End With
      With .F2Deposition
        With .Henry
          .Count = 0
          ReDim .times(1 To MaxDimen) As Single, _
                .FallHeight(1 To MaxDimen) As Single, _
                .ParticleDensity(1 To MaxDimen) As Single
        End With
        .AModelNum = 0
        .RowCount(1) = 0
        .RowCount(2) = 0
        With .Powers
          .Percentile = 0#
          .ReactorAccidentType = 0
        End With
        ReDim .AerosolRemoval(1 To MaxDimen) As Single, _
              .ElemRemoval(1 To MaxDimen) As Single, _
              .times(1 To MaxDimen) As Single
      End With

      With .F3OPool
        .AModelNum = 0
        .Count = 0
        .RowCount(1) = 0
        .RowCount(2) = 0
        .RowCount(3) = 0
        .WaterVolume = 0#
        ReDim .AerosolDecon(1 To MaxDimen) As Single, _
              .ElemDecon(1 To MaxDimen) As Single, _
              .OrgDecon(1 To MaxDimen) As Single, _
              .times(1 To MaxDimen) As Single
        For j = 1 To MaxDimen
          .AerosolDecon(j) = 1#
          .ElemDecon(j) = 1#
          .OrgDecon(j) = 1#
        Next j
        With .Powers
          .Count = 0
          .Percentile = 0#
          ReDim .PoolDepth(1 To MaxDimen) As Single, _
                .PoolTemp(1 To MaxDimen) As Single, _
                .times(1 To MaxDimen) As Single
          For j = 1 To MaxDimen
            .PoolTemp(j) = 36#
          Next j
        End With
      End With
    End With
  Next i
  
  For i = 1 To MaxPathways
    With PathwayArr(i)
      .FromComp = 0
      .ToComp = 0
      .Name = "Unused"
      .Number = 0
      .Active = False
      With .TM0Piping
' Belcourt changed count initializer from MaxDimen to zero.
' This was causing problems when initializing the delay time
' in the TMOPiping structure.
        .Count = 0
        .AModelNum = 0
        .RowCount(1) = 0
        .RowCount(2) = 0
        .RowCount(3) = 0
        ReDim .times(1 To MaxDimen) As Single, _
              .AerosolDF(1 To MaxDimen) As Single, _
              .ElemIDF(1 To MaxDimen) As Single, _
              .OrgIDF(1 To MaxDimen) As Single, _
              .FlowRates(1 To MaxDimen) As Single
        For j = 1 To MaxDimen
          .AerosolDF(j) = 1#
          .ElemIDF(j) = 1#
          .OrgIDF(j) = 1#
        Next j
        With .BrockmannA
          .Count = 0
          ReDim .FlowRates(1 To MaxDimen) As Single, _
                .times(1 To MaxDimen) As Single
          .Volume = 0#
          .BendAngle = 0
          .Diameter = 0
          .FlowModel = 0
          .Length = 0
          .Pressure = 0
          .TotalSurfaceArea = 0
          .UpwardSurfaceArea = 0
          .VaporModel = 0
          .Volume = 0
          .WallTemp = 0
          .SettlingVelocity = 0
          .ElementalVelocity = 0
          .OrganicVelocity = 0
        End With
      End With
      With .TM1Filter
        .Count = 0
        ReDim .AerH(1 To MaxDimen) As Single, _
              .ElemIH(1 To MaxDimen) As Single, _
              .OrgIH(1 To MaxDimen) As Single, _
              .FlowRates(1 To MaxDimen) As Single, _
              .times(1 To MaxDimen) As Single
        .FailEnable = 0
        For j = 1 To 5
            .FailureData(j) = 0
        Next
        .StopTime = 0
      End With
      With .TM2Supo
         .Count = 0
         .Mode = 0
         .Models(1) = False
         .Models(2) = False
         .Models(3) = False
         ReDim .AerosolDF(1 To MaxDimen) As Single, _
               .ElemIDF(1 To MaxDimen) As Single, _
               .OrgIDF(1 To MaxDimen) As Single, _
               .times(1 To MaxDimen) As Single
         ReDim .FlowRatesAER(1 To MaxDimen) As Single, _
            .FlowRatesELM(1 To MaxDimen) As Single, _
            .FlowRatesORG(1 To MaxDimen) As Single, _
            .FlowRatesNOB(1 To MaxDimen) As Single

         For j = 1 To MaxDimen
          .AerosolDF(j) = 1#
          .ElemIDF(j) = 1#
          .OrgIDF(j) = 1#
        Next j
      End With
      With .TM3Leak
        .Count = 0
        ReDim .LeakageRates(1 To MaxDimen) As Single, _
              .times(1 To MaxDimen) As Single
      End With
    End With
  Next i

  For i = 1 To MaxDoses
    With DoseLocationArr(i)
      .ControlRoom = False
      .CompartmentNumber = 0
      .Number = 0
      .Name = "Unused"
      
      With .dlBR
        .Count = 0
        .Model = 0
        ReDim .times(1 To MaxDimen) As Single, _
              .Data(1 To MaxDimen) As Single
      
        If i < 4 Then
            .Model = 1
            .Count = 3
            .times(1) = 0
            .Data(1) = 0.00035
            .times(2) = 8
            .Data(2) = 0.00018
            .times(3) = 24
            .Data(3) = 0.00023
        End If
      End With
     
      'Moved to X/Q tables for 3.10 - JCK
      'With .dlXQ
      '  .Count = 0
      '  .Model = 0
      '  ReDim .times(1 To MaxDimen) As Single, _
      '        .Data(1 To MaxDimen) As Single
      'End With

      With .dlOccupy
        .Count = 0
        .Model = 0
        ReDim .times(1 To MaxDimen) As Single, _
              .Data(1 To MaxDimen) As Single
      End With
    End With
  Next i
  
  Appl.DoseLocationCount = 2
  'Default is 2 dose locations, EAB & LPZ
  
   For i = 1 To MaxPathXQ + 1 'JCK - allows 10 tables when #3 is blank
    With PathXQArr(i)
        .Name = ""
        With .dlXQ
          .Count = 0
          .Model = 0
          ReDim .times(1 To MaxDimen) As Single, _
                    .Data(1 To MaxDimen) As Single
        End With
    End With
  Next

  
 'Add default names
  DoseLocationArr(1).Name = "Exclusion Area Boundary"
  PathXQArr(1).Name = "Exclusion Area Boundary"
  DoseLocationArr(2).Name = "Low Population Zone"
  PathXQArr(2).Name = "Low Population Zone"
  
  XQIndexRows = 0
  XQIndexCols = 0
  ReDim PathXQMap(1, 1) As Integer

  With Appl
    .CompartmentCount = 0
    .PathwayCount = 0
    .PathDependentXQcount = 0
    '.ControlRoomIndex = 0
    .EnvironmentIndex = 0
    .CaseTitle = ""
    .PlantFile = Space(256)
    .PlantTitle = ""
    .ScenarioTitle = ""
  End With
End Sub

Sub SetSelect(TB As TextBox)
 With TB
    .SelStart = 0
    .SelLength = Len(.Text)
  End With
End Sub

Sub loadCompartmentMenu(cbo As ComboBox)
  Dim i
  With cbo
    .Clear
    For i = 1 To MaxCompartments
        cbo.AddItem Format(i) + Space(1) + CompartmentArr(i).Name
    Next
  End With
End Sub

Sub loadPathwayMenu(cbo As ComboBox)
  Dim i
  
  With cbo
    .Clear
    For i = 1 To MaxPathways
      With PathwayArr(i)
      'Debug.Print .Name
        cbo.AddItem Format(i) + Space(1) + .Name
      End With
    Next
  End With
End Sub

Sub loadDoseLocationMenu(cbo As ComboBox)
  Dim i
  With cbo
    .Clear
    For i = 1 To MaxDoses
      .AddItem Format(i) + Space(1) + DoseLocationArr(i).Name, i - 1
    Next i
  End With
End Sub

'Function GetNIFFile(Index As Integer) As String
 
' Select Case Index:
'   Case 0:
'     GetNIFFile = StartupPath + "Defaults\pwr_def.nif"
'   Case 1:
'     GetNIFFile = StartupPath + "Defaults\bwr_def.nif"
'   Case 2:
'     GetNIFFile = StartupPath + "Defaults\tid_def.nif"
' End Select
'End Function

'Function GetRFTFile(Index As Integer) As String
' Select Case Index:
'   Case 0:
'     GetRFTFile = StartupPath + "Defaults\pwr_dba.rft"
'   Case 1:
'     GetRFTFile = StartupPath + "Defaults\bwr_dba.rft"
'   Case 2:
'     GetRFTFile = StartupPath + "Defaults\pwr_def.rft"
'   Case 3:
'     GetRFTFile = StartupPath + "Defaults\bwr_def.rft"
'   Case 4:
'     GetRFTFile = StartupPath + "Defaults\tid_def.rft"
'   End Select
'End Function

Function GetDCFFile(Index As Integer) As String
  Select Case Index:
   Case 0:
     GetDCFFile = StartupPath + "Defaults\tid14.inp"
   Case 1:
     GetDCFFile = StartupPath + "Defaults\fgr11&12.inp"
   Case 2:
     GetDCFFile = StartupPath + "Defaults\icrp60.inp"
 End Select
End Function

Public Function ReadNifFile(FilePath As String) As Integer
Dim NifFile As TextStream
Dim Buffer As String
Dim result As Integer
Dim i As Integer

On Error GoTo NoFile

    result = 0
    Set NifFile = FSO.OpenTextFile(FilePath)
    
    With NifFile
        Buffer = .ReadLine
        result = 1
        If InStr(Left(Buffer, 15), "3.10") > 0 Then
            For i = 1 To 5
                Buffer = .ReadLine
            Next
            'Line 6 contains file type
            If Len(Trim(Buffer)) = 1 Then
                result = val(Trim(Buffer))
            End If
        End If
    End With
    
NoFile:
    ReadNifFile = result
End Function

Function DoFormEdit(Frm As Form, EditType As String) As Boolean
' edit group of controls for textbox numeric contents
   
Dim AControl As Control
Dim times(1 To MaxDimen) As Single
Dim res, asum
    
    asum = 0#
' Terry Heames says the user can never edit the first time
' field, i.e. we can safely assume that the first time value
' is always the source term delay hours
'    times(1) = 0#
    times(1) = SourceTerm.DelayTime
    DoFormEdit = True
    For Each AControl In Frm.Controls
'    Debug.Print AControl.Name
        If TypeOf AControl Is TextBox Then
          If AControl.Visible And AControl.Enabled Then
            Select Case Trim(EditType)
              Case "Fractions"
                If AControl.Tag = "sum" Then asum = asum + CSng(AControl.Text)
                   
              Case "Named"
                If Not FlagNamed(AControl) Then DoFormEdit = False
                
              Case "Numeric"
                If Not FlagNumeric(AControl) Then DoFormEdit = False
                
              Case "FileExists"
                If Not FlagExists(AControl) Then DoFormEdit = False
                
              Case "Filled"
                If Not FlagFilled(AControl) Then DoFormEdit = False

              Case "Times"
                If AControl.Tag = "time" Then
                  If AControl.Index > 19 Then
                    times(AControl.Index - 19) = CSng(AControl.Text)
                  ElseIf AControl.Index > 9 Then
                    times(AControl.Index - 9) = CSng(AControl.Text)
                  Else
                    times(AControl.Index + 1) = CSng(AControl.Text)
                  End If
                  DoFormEdit = False ' building array; have not passed edit yet
                End If
                
              Case "Nonzero"
                If Not FlagPositive(AControl) Then DoFormEdit = False
                
            End Select
          End If
 
        End If
    Next AControl
    If EditType = "Filled" Then
      For Each AControl In Frm.Controls
        If TypeOf AControl Is ComboBox Then
            If Not FlagFilled(AControl) Then
                DoFormEdit = False
            End If
        End If
      Next AControl

    ElseIf EditType = "Times" Then ' store ntvals in form's tag
          DoFormEdit = FlagTimes(times, res)
          Frm.Tag = ""
          If DoFormEdit Then Frm.Tag = res
    ElseIf EditType = "Fractions" Then
      If asum > 1.000001 Or asum < 0.999999 Then DoFormEdit = False
    End If
End Function

Function FlagNumeric(TB As TextBox) As Boolean
  Dim tg
 ' edit one text box for numeric contents
On Error GoTo NumericError

  With TB
    If .Tag = "num" Or .Tag = "nonnum" Or .Tag = "time" Or _
       .Tag = "nzero" Or .Tag = "zero" Or .Tag = "sum" Or _
       .Tag = "decon" Then
         If Not IsNumeric(Trim(.Text)) Then ' failed
            MsgBox .Tag + Space(1) + .Name + " nonumeric"
           If .ForeColor = vbRed Then .ForeColor = vbBlack
           If .BackColor = vbRed Then .BackColor = vbWhite
           Select Case Len(Trim(.Text))
             Case 0
              .Text = 0#
             Case Else
             .ForeColor = vbRed
           End Select
           FlagNumeric = False
           .Tag = "nonnum"
         ElseIf CSng(.Text) >= 0 Then ' passed numeric edit
           
           If .Name Like "*Volume*" Then
             .Tag = "nzero" ' set for nonzero edit
           ElseIf .Name Like "*Time*" Then
             .Tag = "time"  ' set for time edit
           End If
           
           If .ForeColor = vbRed Then .ForeColor = vbBlack
           If .BackColor = vbRed Then .BackColor = vbWhite
           FlagNumeric = True
         ElseIf CSng(.Text) < 0 Then 'failed
           .Tag = "nonnum"
           FlagNumeric = False
           If .ForeColor = vbRed Then .ForeColor = vbBlack
           If .BackColor = vbRed Then .BackColor = vbWhite
           Select Case Len(Trim(.Text))
             Case 0
             .BackColor = vbRed
             Case Else
             .ForeColor = vbRed
           End Select
         End If
    Else
      FlagNumeric = True
    End If
    If .Name = "txtIFX" Then .Tag = "sum"
  End With
  Exit Function
  
NumericError:
    MsgBox Err.Description, vbExclamation, "FlagNumeric()"
    FlagNumeric = False
End Function

Function FlagPositive(TB As TextBox) As Boolean
  
 ' edit one text box for numeric contents
 
  With TB
    
    If .Tag = "nzero" Or .Tag = "zero" Or .Tag = "decon" Then
'         MsgBox .Name + .text
         If CSng(Trim(.Text)) > 0.0000000000001 Then
           FlagPositive = True
           .Tag = "nzero"
           .ForeColor = vbBlack
         Else
           .Tag = "zero"
           .ForeColor = vbBlue
           FlagPositive = False
         End If
    Else
      FlagPositive = True
    End If
  End With
End Function

Function FlagFilled(Box As Control) As Boolean
  
 ' edit one text or combo box for mandatory contents, e.g. compartment name
  
  With Box
    If .Tag = "fill" Or .Tag = "notfilled" Then
'         MsgBox .Name + .text
         If Len(Trim(.Text)) = 0 Then
           FlagFilled = False
           .Tag = "notfilled"
           .BackColor = vbYellow
         Else
           .Tag = "fill"
           .BackColor = vbWhite
           FlagFilled = True
         End If
    Else
      FlagFilled = True
    End If
  End With
End Function
' bookmark
Public Function FlagTimes(times As Variant, res) As Boolean
   Dim i
   Dim ntime
   
   FlagTimes = True
   ntime = 0
   For i = 2 To MaxDimen
'     Debug.Print " time " + Str(i) + Str(Times(i))
     If times(i) = 0# Then
'       Debug.Print "times(i) in flagtimes ", i, times(i)
        ntime = i - 1 ' minimum ntime = 1
        Exit For
     ElseIf times(i) <= times(i - 1) Then
         FlagTimes = False
     End If
   Next i
   If times(MaxDimen) > 0 Then ' all times are filled
     ntime = MaxDimen
   End If
   res = ntime
End Function

Public Function ShowErrorMessage(EditType As String, BoxTitle As String) As Variant
    Dim Response
    Dim Click
    
    Click = "Fix now, or click Reset to discard these changes."
    Select Case EditType
      Case "Fractions"
            Response = MsgBox("The iodine fractions do not sum to 1." + _
            vbCrLf + Click, vbOKOnly + vbExclamation, BoxTitle + ": Fractions")
      
      Case "Times"
            Response = MsgBox("The time values are not in ascending order." + _
            vbCrLf + Click, vbOKOnly + vbExclamation, BoxTitle + ": Times")
            
      Case "Named"
           Response = MsgBox("Name field marked in Blue is not valid." + _
           vbCrLf + Click, vbOKOnly + vbExclamation, BoxTitle + ": Name")
           
      Case "Numeric"
          Response = MsgBox("Fields marked in Red must be numeric, .ge. zero." + _
            vbCrLf + Click, vbOKOnly + vbExclamation, BoxTitle + ": Numeric")
            
      Case "FileExists"
          Response = MsgBox("Filenames marked in Red do not exist." + _
            vbCrLf + Click, vbOKOnly + vbExclamation, BoxTitle + ": File must exist")
            
      Case "Filled"
          Response = MsgBox("Fields marked in Yellow are mandatory." + _
            vbCrLf + Click, vbOKOnly + vbExclamation, BoxTitle + ": Must fill")
 ' value > 0 is covered with numeric edit
      Case "Nonzero"
          Response = MsgBox("Fields marked in Blue require a value > 0." + _
                     vbCrLf + Click, vbOKOnly + vbExclamation, BoxTitle + ": Nonzero")
    End Select
    ShowErrorMessage = Response
End Function

Public Sub TestData()
 ' test compartments
   With CompartmentArr(1)
     .Type = 3
     .Name = "Containment"
     .Volume = 1000000
     .PrintDetail = 0
     .Decay = 0
     .SourceTerm = True
     .SourceTermFraction = 1#
   End With
'   SourceTerm.CompartmentNum = 1
   With CompartmentArr(2)
      .Type = 2
      .Name = "Environment"
      .Volume = 0#
   End With
   With CompartmentArr(3)
      .Type = 1
      .Name = "Control Room"
      .Volume = 20000
   End With
   ' test pathways
   With PathwayArr(1)
     .Name = "Contain to Envmt"
     .Active = True
     .FromComp = 1 'containment
     .ToComp = 2 'environment
     .TransferMechanism(4) = True
  End With
  With PathwayArr(2)
     .Name = "Envmt to Control Room"
     .Active = True
     .FromComp = 2 'environment
     .ToComp = 3 'control room
     .TransferMechanism(1) = True
  End With
  ' test dose locations
    With DoseLocationArr(1)
      .Name = "EAB"
      .ControlRoom = False
      .CompartmentNumber = 2
      
     'With .dlXQ
     '  .Model = 1
     '  .Count = 2
     '  ReDim .times(1 To .Count) As Single, _
     '        .Data(1 To .Count) As Single
     '   .times(2) = 720#
     ' End With
     
      With .dlBR
        .Model = 1
        .Count = 2
        ReDim .times(1 To .Count) As Single, _
             .Data(1 To .Count) As Single
         .times(2) = 720#
      End With
    End With
    
    With DoseLocationArr(2)
      .Name = "LPZ"
      .CompartmentNumber = 1
      .ControlRoom = False
    
      'With .dlXQ
      ' .Model = 1
      ' .Count = 2
      ' ReDim .times(1 To .Count) As Single, _
      '       .Data(1 To .Count) As Single
      '  .times(2) = 720#
      'End With
      With .dlBR
        .Model = 1
        .Count = 2
        ReDim .times(1 To .Count) As Single, _
             .Data(1 To .Count) As Single
         .times(2) = 720#
      End With
    End With
    With DoseLocationArr(3)
      .Name = "ControlRoom"
      .CompartmentNumber = 3
      .ControlRoom = True
      'With .dlXQ
      ' .Model = 1
      ' .Count = 2
      ' ReDim .times(1 To .Count) As Single, _
      '       .Data(1 To .Count) As Single
      '  .times(2) = 720#
      'End With
      With .dlBR
        .Model = 1
        .Count = 2
        ReDim .times(1 To .Count) As Single, _
             .Data(1 To .Count) As Single
         .times(2) = 720#
      End With
      With .dlOccupy
         .Model = 1
         .Count = 2
         ReDim .times(1 To .Count) As Single, _
             .Data(1 To .Count) As Single
          .times(2) = 720#
      End With
    End With
    With Appl
     .PlantTitle = "test plant"
     .ScenarioTitle = "test scenario"
     
    End With
End Sub

Public Function FlagExists(TB As TextBox) As Boolean

On Error GoTo FailEdit

    With TB
      If .Tag = "exist" Or .Tag = "nexist" Then
         If Len(Trim(.Text)) = 0 Then
           .BackColor = vbRed
           GoTo FailEdit
' Belcourt needs to fix the directory handling to parse
' out pop the directory path.
         ElseIf Dir(Trim(.Text)) <> "" Then
'           MsgBox "Flagexists: " + Dir(Trim(.text))
           FlagExists = True
           .Tag = "exist"
           .ForeColor = vbBlack
         Else
           .ForeColor = vbRed
           GoTo FailEdit
         End If
    Else
      FlagExists = True
    End If
  End With
  Exit Function

FailEdit:
  With TB
      .Tag = "nexist"
    
    'With frmSourceTerm.sstFiles
    ' Select Case TB.Name
    '   Case "txtNIF"
    '   .Tab = 0
    '   Case "txtRFT"
    '   .Tab = 1
    '   Case "txtDCF"
    '   .Tab = 2
    ' End Select
    'End With
    FlagExists = False
  End With
End Function

Public Function FlagNamed(TB As TextBox) As Boolean
  With TB
     If .Tag = "name" Or .Tag = "noname" Then
       If UCase(Trim(.Text)) Like "*UNUSED*" Then
            FlagNamed = False
            .Tag = "noname"
            .ForeColor = vbBlue
       ElseIf Len(Trim(.Text)) = 0 Then
             FlagNamed = False
            .Tag = "noname"
            .BackColor = vbYellow
       Else
         .Tag = "name"
         FlagNamed = True ' valid compartment name
       End If
     Else
       FlagNamed = True ' some other control
     End If
  End With

End Function

Function Min(a, b)
  Min = b
  If a < b Then Min = a
End Function

Function Max(a, b)
  Max = b
  If a > b Then Max = a
End Function

Sub ReadInputs()
' read external plant and scenario files into Module1 global data.
' rebuild the main-menu comboboxes to reflect input
Dim PlantFile ' use these to avoid passing global variables
Dim ScenarioFile
    
On Error Resume Next
    
    With CalcOptions
        If Dir(Trim(.PlantFile)) <> "" Then
          PlantFile = Trim(.PlantFile)
'          debug.print "plant " + Dir(PlantFile)
          ReadPlantInput PlantFile

        Else
          MsgBox PlantFile, vbOKOnly + vbExclamation, "File not found"
          Exit Sub
        End If
'        If Dir(Trim(.ScenarioFile)) <> "" Then
'          ScenarioFile = Trim(.ScenarioFile)
''          debug.Print "scenario " + Dir(Trim(.ScenarioFile))
'          ReadScenarioInput ScenarioFile
'        Else
'          MsgBox ScenarioFile, vbOKOnly + vbexclamation, "File not found"
'          Exit Sub
'        End If
    End With
    frmRadtrad.SetComboBoxes ' update the main menu
  
End Sub

Private Function VersionDate(FileVersion As String)
Dim Parse() As String

    Parse = Split(FileVersion, " ")
    VersionNumber = Parse(UBound(Parse) - 1)
    VersionDate = Parse(UBound(Parse))
End Function

Sub ReadPlantInput(fname)
Dim filenum, i, j, Skipheading, tm
Dim FileVersion
Dim DefaultFound As Boolean
Dim Parse() As String
Dim Index As Long
Dim Buffer As String
Dim FilePath As String

'On Error Resume Next
  
  If Len(fname) = 0 Or Dir(fname) = "" Then Exit Sub ' no file
  
  Skipheading = 1
  filenum = FreeFile
  DefaultFound = False
  
  Open fname For Input As #filenum

   FileVersion = NextValue(filenum) ' first line is version stamp
    'Debug.Print Trim(FileVersion), Trim(Appl.VersionStamp)
    
    If InStr(FileVersion, "3.10") > 0 Then
      'New version 3.10 file format
      'FileVersion301 = True
      FileMode = 2 'JCK
      frmRadtrad.fraCaseTitle.Caption = "Case Title"
    Else
        Buffer = FileVersion
        If DateDiff("d", Version301, VersionDate(Buffer)) < 0 Then
            'Files written before version 3.01 are handled differently
            FileMode = 0
        Else
            FileMode = 1
        End If

        Buffer = frmRadtrad.fraCaseTitle.Caption
        frmRadtrad.fraCaseTitle.Caption = VersionNumber & " " & Buffer
'       ' Belcourt added for backward compatibility
'       If (Trim(FileVersion) = "Radtrad 3.01 3/22/1999") Then
'          FileVersion301 = True
'       ' Heames added for backward compatibility
'       ElseIf (Trim(FileVersion) = "Radtrad 3.02 1/5/2000") Then
'          FileVersion301 = True
'       ElseIf (Trim(FileVersion) = "Radtrad 3.03 2/19/2001") Then
'          FileVersion301 = True
'       ElseIf (Trim(FileVersion)) = "Radtrad 3.03 4/15/2001" Then
'          FileVersion301 = True
'       Else
'          FileVersion301 = False
'       End If
   End If
   
   Appl.CaseTitle = NextValue(filenum)
   'Debug.Print "case title ", Appl.CaseTitle
   frmRadtrad.CaseTitle = Appl.CaseTitle
   
   'For File Mode 2 we allow multiple .rft and .nif files
   'Values: DCF = 1, RFT = 2, NIF = 7
   'There's always 1 .dcf file, SourceTerm.Files(1). Elements 2 to 6 are for .rft files,
   'and the .nif files are SourceTerm.Files(7) to Sourceterm.files(11).

   With SourceTerm
     If FileMode = 2 Then
        'Never more than 1 of these, even in File Mode 2
        .Files(DCF) = NextValue(filenum, Skipheading)
        .Files(DCF) = Trim(LCase$(.Files(DCF)))
        
        'RFT file count
        j = NextValue(filenum, Skipheading)
        For i = 0 To j - 1
           Buffer = NextValue(filenum)
           .Files(RFT + i) = Trim(LCase$(Buffer))
        Next
        
        'NIF file count
        j = NextValue(filenum, Skipheading)
     Else
        j = 1
        'This will be overwritten (skip heading)
        Buffer = NextValue(filenum)
     End If
      
     For i = 0 To j - 1 'JCK
        'NIF files
        Buffer = Trim(NextValue(filenum))
        If FileMode = 2 Then
            'NIF file type is supplied with each NIF file
            'but we don't store it here -- it's in the Source Term Table in ReadScenario()
            'so we store them temporarily in the NifUnits array
            Parse = Split(Buffer)
            '1-digit NIF type comes first
            NifUnits(i) = Parse(0)
            'Balance of the string is NIF filename
            Buffer = Trim(Right(Buffer, Len(Buffer) - 1))
        End If
        .Files(NIF + i) = LCase$(Buffer)
     Next
        
     .PlantPowerMwts = NextValue(filenum, Skipheading)
   End With
   
   ' compartments
   Appl.CompartmentCount = NextValue(filenum, Skipheading)
   For i = 1 To Appl.CompartmentCount
     With CompartmentArr(i)
       .Name = NextValue(filenum, Skipheading)
       .Type = NextValue(filenum)
       .Number = i 'JCK 5/2006
       Select Case .Type
         'Case 1
         ' Appl.ControlRoomIndex = i
         Case 2
           Appl.EnvironmentIndex = i
       End Select
       
       .Volume = NextValue(filenum)
       .Features(1) = NextValue(filenum)
           ' this dumstr is sumps, not used. Write placeholder 0
       .Features(2) = NextValue(filenum, Skipheading)
       .Features(3) = NextValue(filenum)
       .Features(4) = NextValue(filenum)
       If .Features(4) = 1 Then
         .SourceTermOP = True 'identify OP compmt
         SourceTerm.Opool = i 'need this to read/write file and in frmCompartment
       End If
     End With
   Next i
   ' pathways
   Appl.PathwayCount = NextValue(filenum, Skipheading)
   For i = 1 To Appl.PathwayCount
      With PathwayArr(i)
        .Name = NextValue(filenum, Skipheading)
        .FromComp = NextValue(filenum)
        .ToComp = NextValue(filenum)
        .Active = True
        tm = NextValue(filenum)
        For j = 1 To 4 ' set all tm's to false
          .TransferMechanism(j) = False
        Next j
        ' set tm of value just read to true
        If tm = 6 Then
            'Added type 6 for non-Iodine aerosols
            .TM2Supo.Mode = 1
            tm = 3
        Else
            .TM2Supo.Mode = 0
        End If
        .TransferMechanism(tm) = True
      End With
   Next i
   Buffer = NextValue(filenum) ' "End of plant model file" line

'   Debug.Print ext, Len(ext)
'   If ext = "PSF" Then
     ReadScenarioInput filenum
'   ElseIf ext = "PMF" Then
'     Close #filenum
'   End If
End Sub

Sub ReadScenarioInput(filenum)
'Data is now read in 2 ways, to allow comment cards in the .psf file
'Multiple values in a line are input with GetData(), replacing Input# with multiple arguments
'Single values are input with NextValue(), which has a mode argument for skipping title lines
'Variable multiple X/Q index values get special handling, see "X/Q array" comment
Dim Emodel, Omodel, NotUsed, stfrac, Opool
Dim Decay, daughter, sourcetermcomp, PlaceHolder, refil
Dim i As Integer, j As Integer, FileIndex As Integer, RftIndex As Integer
Dim DcfIndex As Integer, CRXQ As Integer, nNIF As Integer
Dim sData As String, Buffer As String
Dim Atm As Single, temp As Single
Dim ForcedFlow As Single
Dim NewIndex(1 To MaxPathXQ + 1) As Integer
Dim Env As Integer
Dim Name As String
Dim Compartment As Integer
Dim DoseIndex As Integer
Dim XQindex As Integer
Dim XQTable As Integer
Dim OffsiteCount As Integer
Dim PathwayDetail As Boolean 'For 3.03 decks JCK 1/2006
Dim XQFlag As Boolean

On Error GoTo ScenarioError

'  Open fname For Input As #filenum
   'Appl.ScenarioTitle = NextValue(filenum, skipheading)
   'Appl.PlantFile = NextValue(filenum, skipheading) ' not used

    If FileMode < 2 Then
      NotUsed = NextValue(filenum, Skipheading) 'Scenario title
      NotUsed = NextValue(filenum, Skipheading) 'Plant File name
      PathwayDetail = False
    End If
   
   With SourceTerm
     'If Not FileVersion301 Then
     If FileMode = 0 Then
'    pre301, read number of the one ST compartment
        sourcetermcomp = NextValue(filenum, Skipheading)
        If sourcetermcomp > 0 Then
'          .CompartmentNum = sourcetermcomp
          CompartmentArr(sourcetermcomp).SourceTerm = True
          CompartmentArr(sourcetermcomp).SourceTermFraction = 1#
          With SourceTerm.SourceTermTable(1)
            .CompartmentNumber = sourcetermcomp
            .Fraction = 1#
            .NifIndex = 1
            .NifType = 1
            .RftIndex = 0
            NifUnits(0) = 1
          End With
        End If
     Else
        '301: read number of compartments and their st fractions
        sourcetermcomp = NextValue(filenum, Skipheading)
        If sourcetermcomp > 0 Then
            For i = 1 To sourcetermcomp
                If FileMode < 2 Then
                    GetData filenum, j, stfrac
                    nNIF = 1
                    RftIndex = 1
                    NifUnits(0) = 1
                Else
                    GetData filenum, j, nNIF, RftIndex, stfrac
                End If
                
               CompartmentArr(j).SourceTermFraction = stfrac
               If stfrac > 0 Then
                 CompartmentArr(j).SourceTerm = True
               End If
               
               With SourceTerm.SourceTermTable(i)
                 .CompartmentNumber = j
                 .Fraction = stfrac
                 .NifIndex = nNIF - 1
                 .RftIndex = RftIndex - 1
                 .NifType = NifUnits(.NifIndex)
               End With
            Next i
        End If
     End If
     
     If FileMode < 2 Then
        'Moved to the beginning of ReadPlantInput() in 3.10
        .Files(DCF) = NextValue(filenum) 'Never more than 1 of these, even in File Mode 2
        .Files(DCF) = LCase$(.Files(DCF))
     End If
     
    ' Check the DCF and set the initial state
    .FileChoice = DcfFileIndex(.Files(DCF))
     
     If FileMode < 2 Then
        'Old format, 1 RFT file only
        .Files(RFT) = NextValue(filenum)
        .Files(RFT) = Trim(LCase$(.Files(RFT)))
     End If
     
     FileIndex = DCF
     Do
        If .Files(FileIndex) = "" Then
            'Must have a minimum of 1 of each
            Select Case FileIndex
                Case DCF, RFT, NIF
                    .MissingFile(FileIndex) = True
                Case Else
                    .MissingFile(FileIndex) = False
            End Select
        Else
          .Files(FileIndex) = Trim(.Files(FileIndex))
          'First see if the file exists on the specified path
          'It may not exist, if it's from another user's computer
          If FSO.FileExists(.Files(FileIndex)) Then
            If frmRadtrad.IsSaveEnabled() Then
                frmRadtrad.SaveState True
            End If
          Else
            'Belcourt strips off path prior to defaults if it exists
            'and then prefixs the full startup path to the filename
            j = InStr(.Files(FileIndex), "defaults")
            If (j > 0) Then
                'Look for it in our own Defaults directory
                'Check if path is the same as the one we want to prepend
                Buffer = Left$(.Files(FileIndex), j - 1)
                If (Buffer <> StartupPath) Then
                    Buffer = StartupPath + Right$(.Files(FileIndex), Len(.Files(FileIndex)) - j + 1)
                    If FSO.FileExists(Buffer) Then
                        'Replace file path
                        .Files(FileIndex) = Buffer
                        .PathChanged(i) = True
                        'Flag for Calculate()
                        SaveBeforeCalculate = True
                        'If frmRadtrad.IsSaveEnabled() Then
                        '    frmRadtrad.SaveState False
                        'End If
                    End If
                End If
            End If
            
          ' Check if file exists, disable save if file doesn't exist
          .MissingFile(FileIndex) = Not FSO.FileExists(.Files(FileIndex))
          If .MissingFile(FileIndex) Then
              'frmRadtrad.SaveState False '- OK, let 'em save it
              frmRadtrad.CalculateState False
          End If
        End If
      End If
      FileIndex = FileIndex + 1
     Loop While FileIndex <= TotalSourceFiles
     
     If FileMode < 2 Then
       'Earlier versions
       .DelayTime = NextValue(filenum)
       .StartTime = .DelayTime 'JCK 11/2005
       CalcOptions.EndTime = 720
     Else
       .StartTime = NextValue(filenum)
       GetData filenum, .DelayTime, CalcOptions.EndTime
     End If
     
     daughter = NextValue(filenum)
     
     If FileMode < 2 Then
        With .SourceTermTable(1) 'JCK 11/2005
            GetData filenum, .IFX(0), .IFX(1), .IFX(2), NotUsed
            'Legacy file -- determine TID/1465 from Iodine fraction
            If .IFX(0) = 0.05 Then
                SourceTerm.DcfType = 0 'TID
            ElseIf .IFX(0) = 0.95 Then
                SourceTerm.DcfType = 1 '1465
            Else
                SourceTerm.DcfType = 2 'User-defined
            End If
        End With
        For i = 2 To sourcetermcomp
            .SourceTermTable(i).IFX(0) = .SourceTermTable(1).IFX(0)
            .SourceTermTable(i).IFX(1) = .SourceTermTable(1).IFX(1)
            .SourceTermTable(i).IFX(2) = .SourceTermTable(1).IFX(2)
        Next
     Else
        'Version 3.10 has multiple IFX, in sourcetermrecord
        For i = 1 To sourcetermcomp
            With .SourceTermTable(i)
                GetData filenum, DcfIndex, .IFX(0), .IFX(1), .IFX(2)
            End With
        Next
        'We actually use the last one to set the type
        .DcfType = DcfIndex - 1
     End If
    End With
         
    ' overlying pool
    Decay = NextValue(filenum, Skipheading)
'     Debug.Print "DD", .DecayDaughter, .Files(0), .Files(1), .Files(2)
    If SourceTerm.Opool = 0 Then
       Opool = 1 'dummy opool for zero values
    Else
       Opool = SourceTerm.Opool
    End If
    
    With CompartmentArr(Opool).F3OPool
      .WaterVolume = NextValue(filenum)
      .AModelNum = NextValue(filenum)
      Select Case .AModelNum
   
        Case 1
            .RowCount(AER) = NextValue(filenum)
            If .RowCount(AER) > 0 Then
                ReDim .times(1 To .RowCount(AER)) As Single, _
                  .AerosolDecon(1 To .RowCount(AER)) As Single
                For i = 1 To .RowCount(AER)
                  GetData filenum, .times(i), .AerosolDecon(i)

                Next i
            End If
        Case 2 'powers
             With .Powers
                .Percentile = NextValue(filenum)
                .Count = NextValue(filenum)
                If .Count > 0 Then
                    ReDim .times(1 To .Count) As Single, _
                        .PoolDepth(1 To .Count) As Single, _
                        .PoolTemp(1 To .Count) As Single
                    For i = 1 To .Count
                      GetData filenum, .times(i), .PoolDepth(i), _
                                      .PoolTemp(i)
                    Next i
                End If
            End With
      End Select
      
      ' elemental I
      Emodel = NextValue(filenum) ' elemental model
      If Emodel = 1 Then ' read elemental I times and df's
         .RowCount(ELM) = NextValue(filenum)
         If .RowCount(ELM) > 0 Then
            ReDim .times(1 To .RowCount(ELM)) As Single, _
                 .ElemDecon(1 To .RowCount(ELM)) As Single
            For i = 1 To .RowCount(ELM)
              GetData filenum, .times(i), .ElemDecon(i)
            Next i
         End If
      End If
      ' organic I
      Omodel = NextValue(filenum) ' organic
      If Omodel = 1 Then
        .RowCount(ORG) = NextValue(filenum)
        If .RowCount(ORG) > 0 Then
            ReDim .times(1 To .RowCount(ORG)) As Single, _
                  .OrgDecon(1 To .RowCount(ORG)) As Single
            For i = 1 To .RowCount(ORG)
               GetData filenum, .times(i), .OrgDecon(i)
            Next i
        End If
      End If
      .Count = Most(.RowCount, 3)
'      Debug.Print "count ", .Count, .RowCount(1), .RowCount(2), .RowCount(3)
      
      PlaceHolder = NextValue(filenum) ' placeholder for op volatilization - model doesn't exist
    End With

  ' compartments
  Dim fwf 'fresh-water fraction - not used
  Appl.CompartmentCount = NextValue(filenum, Skipheading)
'  Debug.Print "comp count ", Appl.CompartmentCount

  For j = 1 To Appl.CompartmentCount
    With CompartmentArr(j)
      .PrintDetail = NextValue(filenum, Skipheading)
      .Decay = NextValue(filenum)
      
      If FileMode < 2 Then
        'Version 3.03 had only 2 options, so convert
        If .PrintDetail = 1 Then .PrintDetail = 2
        If .PrintDetail > 0 Then
            'If any compartment has PrintDetail > 0 then all pathways
            'with PrintDetail = 0 get PrintDetail = 2 (ver 3.03) JCK 1/2006
            PathwayDetail = True
        End If
      End If
     
      With .F0Sprays
      ' sprays aerosol models
        .AModelNum = NextValue(filenum)
'        Debug.Print "amodel"; .AModelNum
        If .AModelNum > 0 Then
          fwf = NextValue(filenum)
       
          Select Case .AModelNum
            Case 1  ' user defined
  
                .RowCount(AER) = NextValue(filenum)
'                Debug.Print "rowcount "; .RowCount(AER)
                If .RowCount(AER) > 0 Then
                    ReDim .times(1 To .RowCount(AER)) As Single, _
                        .AerosolRemoval(1 To .RowCount(AER)) As Single
                    For i = 1 To .RowCount(AER)
                      GetData filenum, .times(i), .AerosolRemoval(i)
'                      Debug.Print .times(i), .AerosolRemoval(i)
                    Next i
                End If
              
            Case 2 ' powers model
              With .Powers
                .FracSpray = NextValue(filenum)
                .Percentile = NextValue(filenum)
                .Count = NextValue(filenum)
                If .Count > 0 Then
                    ReDim .times(1 To .Count) As Single, _
                    .Flux(1 To .Count) As Single, _
                    .Height(1 To .Count) As Single
                    For i = 1 To .Count
                      GetData filenum, .times(i), .Flux(i), .Height(i)
'                      Debug.Print .times(i), .Flux(i), .Height(i)
                    Next i
                End If
             End With
         End Select
       End If
       
       'sprays elemental I
         Emodel = NextValue(filenum)
         If Emodel = 1 Then
           fwf = NextValue(filenum)
           .RowCount(ELM) = NextValue(filenum)
'           Debug.Print "read elem spray ", .Count, " Comp", j
           If .RowCount(ELM) > 0 Then
                ReDim .times(1 To .RowCount(ELM)) As Single, _
                  .ElemRemoval(1 To .RowCount(ELM)) As Single
                For i = 1 To .RowCount(ELM)
                  GetData filenum, .times(i), .ElemRemoval(i)
'                  Debug.Print .times(i), .ElemRemoval(i)
                Next i
           End If
         End If
         
      'sprays organic I 'testing if check for zero count is needed - bookmark
         Omodel = NextValue(filenum)
         If Omodel = 1 Then
           fwf = NextValue(filenum)
           .RowCount(ORG) = NextValue(filenum)
           If .RowCount(ORG) > 0 Then
'           Debug.Print "read sprays organic " + Str(.Count) + Space(1) + Str(j)
                ReDim .times(1 To .RowCount(ORG)) As Single, _
                  .OrgRemoval(1 To .RowCount(ORG)) As Single
                For i = 1 To .RowCount(ORG)
                  GetData filenum, .times(i), .OrgRemoval(i)
'                  Debug.Print .times(i), .OrgRemoval(i)
                Next i
            Else
                ' Belcourt needs to redimension organic sprays to .count
                .Count = Most(.RowCount, 3)
                ReDim .OrgRemoval(1 To .Count) As Single
                For i = 1 To .Count
                    .OrgRemoval(i) = 0
                Next i
           End If
         End If
         .Count = Most(.RowCount, 3) ' spray count
        If FileMode = 2 Then
            Select Case .AModelNum
                Case 1
                    GetData filenum, .AerosolDF, .LambdaAerosol, .ElementalDF
                Case 2
                    .ElementalDF = NextValue(filenum)
            End Select
        End If
      End With
      
      PlaceHolder = NextValue(filenum) 'sump
 ' recirc filters
      refil = NextValue(filenum)
      If refil = 1 Then
        With .F1ReFilters
            If FileMode < 2 Then
                ForcedFlow = NextValue(filenum) 'From  3.03
            End If
          .Count = NextValue(filenum)
          If .Count > 0 Then
            ReDim .times(1 To .Count) As Single, _
                .FlowRates(1 To .Count) As Single, _
                .AeroEffic(1 To .Count) As Single, _
                .ElemIEffic(1 To .Count) As Single, _
                .OrgIEffic(1 To .Count) As Single
            For i = 1 To .Count
              If FileMode = 2 Then 'Added FlowRates for 3.10 - JCK
                 GetData filenum, .times(i), .FlowRates(i), .AeroEffic(i), .ElemIEffic(i), .OrgIEffic(i)
              Else
                 GetData filenum, .times(i), .AeroEffic(i), .ElemIEffic(i), .OrgIEffic(i)
                 .FlowRates(i) = ForcedFlow
              End If
            Next i
            
            'Filter failure data
            If FileMode = 2 Then
                .FailEnable = NextValue(filenum)
                GetData filenum, .FailureData(1), .FailureData(2), .FailureData(3), .FailureData(4), .FailureData(5)
                .StopTime = NextValue(filenum)
            End If
          End If
        End With
      End If
      
 ' natural deposition
      With .F2Deposition
        .AModelNum = NextValue(filenum)  'aerosol
        Select Case .AModelNum
          Case 1
              .RowCount(AER) = NextValue(filenum)
              If .RowCount(AER) > 0 Then
                  ReDim .times(1 To .RowCount(AER)) As Single, _
                  .AerosolRemoval(1 To .RowCount(AER)) As Single
                  If .RowCount(AER) > 0 Then
                     For i = 1 To .RowCount(AER)
                      GetData filenum, .times(i), .AerosolRemoval(i)
'                      Debug.Print "DEPAER", i, .RowCount(AER), .times(i), .AerosolRemoval(i)
                    Next i
                  End If
              End If
          Case 2                   'henry
              With .Henry
                .Count = NextValue(filenum)
                If .Count > 0 Then
                    ReDim .times(1 To .Count) As Single, _
                     .FallHeight(1 To .Count) As Single, _
                     .ParticleDensity(1 To .Count) As Single
                    For i = 1 To .Count
                      GetData filenum, .times(i), .FallHeight(i), .ParticleDensity(i)
    '                  Debug.Print .Times(i), .FallHeight(i), .ParticleDensity(i)
                    Next i
                End If
              End With
          Case 3                   'powers dep
            
            .Powers.ReactorAccidentType = NextValue(filenum)
            .Powers.Percentile = NextValue(filenum)
            
        End Select
        
        Emodel = NextValue(filenum) ' elemental i
        If Emodel = 1 Then
          .RowCount(ELM) = NextValue(filenum)
          If .RowCount(ELM) > 0 Then
              ReDim .times(1 To .RowCount(ELM)) As Single, _
                  .ElemRemoval(1 To .RowCount(ELM)) As Single
              For i = 1 To .RowCount(ELM)
                 GetData filenum, .times(i), .ElemRemoval(i)
              Next i
          Else
              ' Belcourt hooking zero count input and redimensioning
'              .Count = Most(.RowCount, 2)
'              ReDim .times(1, .Count) As Single, .ElemRemoval(1 To .Count) As Single
'              For i = 1 To .Count
'                  .times(i) = 0
'                  .ElemRemoval(i) = 0
'              Next i
          End If
        End If
        .Count = Most(.RowCount, 2)
        
      End With 'f2deposition
    End With ' end compartment array
  Next j ' end compartments
  
  SourceTerm.DecayDaughter = CompartmentArr(1).Decay + daughter
  Dim piping, filter, supool, airleak, waterleak
  Appl.PathwayCount = NextValue(filenum, Skipheading)
'  Debug.Print "pcount ", Appl.PathwayCount
  
  For j = 1 To Appl.PathwayCount
    With PathwayArr(j)
      .PrintDetail = NextValue(filenum, Skipheading)
      If FileMode < 2 And PathwayDetail Then
        If .PrintDetail = 0 Then
            .PrintDetail = 2
        End If
      End If
      Decay = NextValue(filenum) 'Not used
      
      ' piping transfer mechanism
      .TM0Piping.AModelNum = NextValue(filenum)
      If .TM0Piping.AModelNum > 0 Then            'aerosol
        Select Case .TM0Piping.AModelNum
          Case 1 'user defined df's
            With .TM0Piping
                .RowCount(AER) = NextValue(filenum)
                If .RowCount(AER) > 0 Then
                    ReDim .times(1 To .RowCount(AER)) As Single, _
                      .AerosolDF(1 To .RowCount(AER)) As Single, _
                      .FlowRates(1 To .RowCount(AER)) As Single
                    For i = 1 To .RowCount(AER)
                      GetData filenum, .times(i), .AerosolDF(i), .FlowRates(i)
'                      Debug.Print "Piping", .times(i), .AerosolDF(i), .FlowRates(i)
                    Next i
                End If
            End With
        Case 2, 3 'Brockmann-Bixler model -- 2 = Slug flow, 3 = Homogeneous flow
            With .TM0Piping.BrockmannA
                If FileMode = 2 Then
                    GetData filenum, .TotalSurfaceArea, .Volume, .BendAngle, _
                                        .WallTemp, .Pressure, .SettlingVelocity
                    .Count = NextValue(filenum)
                Else
                    .Count = NextValue(filenum)
                    If .Count > 0 Then
                        GetData filenum, .TotalSurfaceArea, .Volume, .BendAngle
                    End If
                End If
                    
                If .Count > 0 Then
                    ReDim .times(1 To .Count) As Single, _
                                .FlowRates(1 To .Count) As Single
                    For i = 1 To .Count
                      If FileMode = 2 Then
                        GetData filenum, .times(i), .FlowRates(i)
                      Else
                        GetData filenum, .times(i), .FlowRates(i), Atm, temp
                        If i = 1 Then
                          .Pressure = Atm * 14.7
                          .WallTemp = temp
                        End If
                      End If
                    Next i
                End If
            End With
        End Select
      End If
      
      piping = NextValue(filenum)
'      Debug.Print "piping ele", piping
      If piping = 1 Then           'elemental I df's
        With .TM0Piping
          .RowCount(ELM) = NextValue(filenum)
          If .RowCount(ELM) > 0 Then
            ReDim .times(1 To .RowCount(ELM)) As Single, _
                    .ElemIDF(1 To .RowCount(ELM)) As Single, _
                    .FlowRates(1 To .RowCount(ELM)) As Single
            For i = 1 To .RowCount(ELM)
                GetData filenum, .times(i), .ElemIDF(i), .FlowRates(i)
'                Debug.Print .times(i), .ElemIDF(i), .FlowRates(i)
            Next i
            Select Case .AModelNum
                Case 2, 3
                    .EModelNum = 1
            End Select
          End If
        End With
      Else
        .TM0Piping.EModelNum = piping
        If piping = 3 Then
            .TM0Piping.BrockmannA.ElementalVelocity = NextValue(filenum)
        End If
      End If
      
      piping = NextValue(filenum)
'      Debug.Print "piping org", piping
      If piping = 1 Then 'organic I df's
        With .TM0Piping
          .RowCount(ORG) = NextValue(filenum)
          If .RowCount(ORG) > 0 Then
            ReDim .times(1 To .RowCount(ORG)) As Single, _
                    .OrgIDF(1 To .RowCount(ORG)) As Single, _
                    .FlowRates(1 To .RowCount(ORG)) As Single
            For i = 1 To .RowCount(ORG)
                GetData filenum, .times(i), .OrgIDF(i), .FlowRates(i)
'                Debug.Print .times(i), .OrgIDF(i), .FlowRates(i)
            Next i
          End If
          .Count = Most(.RowCount, 3)
        End With
      Else
        .TM0Piping.OModelNum = piping
        If piping = 3 Then
            .TM0Piping.BrockmannA.OrganicVelocity = NextValue(filenum)
        End If
      End If
      
      ' filter transfer mechanism
      filter = NextValue(filenum)
'      Debug.Print "filter ", filter
      If filter = 1 Then
        With .TM1Filter
          .Count = NextValue(filenum)
          If .Count > 0 Then
            ReDim .times(1 To .Count) As Single, _
            .FlowRates(1 To .Count) As Single, _
            .AerH(1 To .Count) As Single, _
            .ElemIH(1 To .Count) As Single, _
            .OrgIH(1 To .Count) As Single
            For i = 1 To .Count
              GetData filenum, .times(i), .FlowRates(i), .AerH(i), .ElemIH(i), .OrgIH(i)
'              Debug.Print .times(i), .FlowRates(i), .AerH(i), .ElemIH(i), .OrgIH(i)
            Next
            If FileMode = 2 Then
                .FailEnable = NextValue(filenum)
                GetData filenum, .FailureData(1), .FailureData(2), .FailureData(3), .FailureData(4), .FailureData(5)
                .StopTime = NextValue(filenum)
            End If
          End If
        End With
        
      End If
      
      ' suppression pool transfer mechanism
      'Now shown as Generic
      supool = NextValue(filenum)
'      Debug.Print "supool", supool
      If supool = 1 Then             ' aerosol
        PlaceHolder = NextValue(filenum) ' volume; no test cases for this model
        With .TM2Supo
          .RowCount(AER) = NextValue(filenum)
          If .RowCount(AER) > 0 Then
            ReDim .times(1 To .RowCount(AER)) As Single, _
            .AerosolDF(1 To .RowCount(AER)) As Single, _
            .FlowRatesAER(1 To .RowCount(AER)) As Single 'JCK
            .Models(AER) = True
            For i = 1 To .RowCount(AER)
              GetData filenum, .times(i), .AerosolDF(i), .FlowRatesAER(i) 'JCK
            Next i
          End If
        End With
      Else
        .TM2Supo.Models(AER) = False
      End If
      supool = NextValue(filenum)
      If supool = 1 Then             ' elemental
        PlaceHolder = NextValue(filenum) ' initial_volume, not used
        With .TM2Supo
            .RowCount(ELM) = NextValue(filenum)
            If .RowCount(ELM) > 0 Then
                ReDim .times(1 To .RowCount(ELM)) As Single, _
                .ElemIDF(1 To .RowCount(ELM)) As Single, _
                .FlowRatesELM(1 To .RowCount(ELM)) As Single 'JCK
                .Models(ELM) = True
                For i = 1 To .RowCount(ELM)
                    GetData filenum, .times(i), .ElemIDF(i), .FlowRatesELM(i) 'JCK
                Next i
            End If
        End With
      Else
        .TM2Supo.Models(ELM) = False
      End If
      
      supool = NextValue(filenum)
      If supool = 1 Then             ' organic
        PlaceHolder = NextValue(filenum)
        With .TM2Supo
          .RowCount(ORG) = NextValue(filenum)
          If .RowCount(ORG) > 0 Then
            ReDim .times(1 To .RowCount(ORG)) As Single, _
            .OrgIDF(1 To .RowCount(ORG)) As Single, _
            .FlowRatesORG(1 To .RowCount(ORG)) As Single 'JCK
            If .Mode = 1 Then
              .Models(ORG) = False
            Else
              .Models(ORG) = True
            End If
            For i = 1 To .RowCount(ORG)
              GetData filenum, .times(i), .OrgIDF(i), .FlowRatesORG(i)
            Next i
          Else
            ' Belcourt hooks zero count on input and redimensions
            .Count = Most(.RowCount, 3)
            ReDim .OrgIDF(1 To .Count) As Single, _
                .FlowRatesORG(1 To .Count) As Single
            For i = 1 To .Count
              .OrgIDF(i) = 1
              .FlowRatesORG(i) = 0
            Next i
          End If
          .Count = Most(.RowCount, 3)
        End With
      Else
        .TM2Supo.Models(ORG) = False
      End If
      
      With .TM2Supo 'Added Noble Gas flow rates below - JCK
          If FileMode = 2 Then
            If .Models(AER) Or .Models(ELM) Or .Models(ORG) Then
              .RowCount(NOB) = NextValue(filenum)
              ReDim .FlowRatesNOB(1 To .RowCount(NOB)) As Single
              For i = 1 To .RowCount(NOB)
                GetData filenum, .times(i), .FlowRatesNOB(i)
              Next i
            End If
          ElseIf .RowCount(ORG) > 0 Then
            'Legacy files use Organic flow rates, if present, for Noble Gas
            ReDim .FlowRatesNOB(1 To .RowCount(ORG)) As Single
            For i = 1 To .RowCount(ORG)
              .FlowRatesNOB(i) = .FlowRatesORG(i)
            Next i
          End If
      End With
          
      PlaceHolder = NextValue(filenum) ' supo volatilization is not used
      
      ' air leakage (convection) model
      airleak = NextValue(filenum)
'      Debug.Print "airleak ", airleak
      If airleak = 1 Then
        With .TM3Leak
          .Count = NextValue(filenum)
          If .Count > 0 Then
            ReDim .times(1 To .Count) As Single, _
            .LeakageRates(1 To .Count) As Single
            For i = 1 To .Count
              GetData filenum, .times(i), .LeakageRates(i)
            Next i
          End If
        End With
      End If
    End With
    waterleak = NextValue(filenum) 'model not used
  Next j ' end pathways

  ' dose locations
  
  Appl.DoseLocationCount = NextValue(filenum, Skipheading)
  Env = VerifyEnvironment()
  OffsiteCount = 0
  
  For j = 1 To Appl.DoseLocationCount
    Name = Trim(NextValue(filenum, Skipheading))
    Compartment = NextValue(filenum)
    
    If Compartment > 0 Then
      With Appl
        If Compartment = Env Then
            sData = OffsiteName(Name)
            Select Case sData
                Case "EAB"
                    DoseIndex = 1
                Case "LPZ"
                    DoseIndex = 2
                Case Else
                    If OffsiteCount < 3 Then
                        DoseIndex = OffsiteCount + 1
                    Else
                        MsgBox "Too many dose locations in Environment", vbCritical, "ReadScenarioInput()"
                        Exit Sub
                    End If
             End Select
             OffsiteCount = OffsiteCount + 1
        Else 'Onsite X/Q
            If .DoseLocationCount < 4 Then
                'If not in the environment, must be #4 or higher
                'Not equal to actual count if #3 and/or #2 are empty, and 3 is usually empty
                DoseIndex = 4
                .DoseLocationCount = 4
            Else
                'Find an empty array element
                DoseIndex = FreeXQ
            End If
            PathXQArr(DoseIndex).Number = j
        End If
      End With
          
      'Store new index value under old index
      NewIndex(j) = DoseIndex
    
      With DoseLocationArr(DoseIndex)
        .Name = Name
        .CompartmentNumber = Compartment
        
        If CompartmentArr(.CompartmentNumber).Type = 1 Then
           .ControlRoom = True
        Else
           .ControlRoom = False
        End If

        If FileMode < 2 Then 'Reading legacy file
            'X/Q tables get moved in the new architecture
            i = NextValue(filenum)

            'This is the dlXQ.Model flag
            If i = 1 Or .ControlRoom Then
                PathXQArr(DoseIndex).dlXQ.Model = 1
    
                PathXQArr(DoseIndex).Name = .Name
                If .ControlRoom Then
                  'This will get the CRvol table later
                  PathXQArr(DoseIndex).dlXQ.Model = 2 'Special flag value, reset below
                Else
                  With PathXQArr(DoseIndex).dlXQ
                    .Count = NextValue(filenum)
                    ReDim .times(1 To .Count) As Single, _
                          .Data(1 To .Count) As Single
                    For i = 1 To .Count
                      GetData filenum, .times(i), .Data(i)
                    Next i
                  End With
                End If
            End If
        End If
        
        .dlBR.Model = NextValue(filenum) 'breathing rates
        If .dlBR.Model = 1 Then
          With .dlBR
            .Count = NextValue(filenum)
           ReDim .times(1 To .Count) As Single, _
                  .Data(1 To .Count) As Single
            For i = 1 To .Count
               GetData filenum, .times(i), .Data(i)
            Next i
          End With
        End If
        
        .dlOccupy.Model = NextValue(filenum)
        If .dlOccupy.Model = 1 Then
          With .dlOccupy
             .Count = NextValue(filenum)
             ReDim .times(1 To .Count) As Single, _
                  .Data(1 To .Count) As Single
             For i = 1 To .Count
                GetData filenum, .times(i), .Data(i)
             Next i
          End With
        End If
      End With
    End If
  Next j ' end dose locations
  
  If Appl.DoseLocationCount < DoseIndex Then
    Appl.DoseLocationCount = DoseIndex
  End If
  
  Dim CRvol As dldatarecord 'Control Room effective volume, for legacy files.
  
  If FileMode = 2 Then
    Appl.PathDependentXQcount = NextValue(filenum, Skipheading)
    If Appl.PathDependentXQcount > 0 Then
        For j = 1 To Appl.PathDependentXQcount
            If NewIndex(j) > 0 Then
              'Follow any changes in Dose Location numbers
              XQindex = NewIndex(j)
            ElseIf j = 3 And DoseLocationArr(3).Name = "Unused" Then
              XQindex = 4 'JCK 7/2006
            Else                    'JCK
              XQindex = XQindex + 1 '3/2006
            End If
            With PathXQArr(XQindex)
              .Name = Trim(NextValue(filenum))
              .Number = j
              With .dlXQ
                .Count = NextValue(filenum)
                If .Count > 0 Then
                  .Model = 1
                  ReDim .times(1 To .Count) As Single, _
                      .Data(1 To .Count) As Single
                  For i = 1 To .Count
                    GetData filenum, .times(i), .Data(i)
                  Next i
                End If
              End With
            End With
        Next

        sData = NextValue(filenum, Skipheading)
        XQIndexCols = Left(Trim(sData), 1)
        
        sData = NextValue(filenum, Skipheading)
        XQIndexRows = Left(Trim(sData), 1)
    
        If XQIndexCols > 0 And XQIndexRows > 0 Then
            ReDim PathXQMap(1 To XQIndexRows, 1 To XQIndexCols)
            XQFlag = False 'JCK 7/2006
            
            'Read Table ID header, throw it away
            sData = NextValue(filenum)

            'Build X/Q array, watching for comment cards
            For i = 1 To XQIndexRows
                For j = 1 To XQIndexCols
                    'Special treatment for possible comment card
                    Input #filenum, NotUsed
                    While Not IsNumeric(NotUsed)
                        Input #filenum, NotUsed
                    Wend
                    
                    XQTable = NotUsed
                    PathXQMap(i, j) = XQTable
                    If XQTable = 0 Then
                        XQFlag = True
                    End If
                Next
            Next
        Else
            CreateXQTable
            'XQFlag = True
        End If
        
        If XQFlag Then 'JCK 8/2006
            MsgBox "All pathways in Onsite X/Q must have a X/Q table reference", _
                        vbInformation, "Please update Onsite X/Q"
        End If

    End If
  Else 'Legacy file
    With CRvol
      .Model = NextValue(filenum, Skipheading)
      If .Model = 1 Then
      ' read one set of effective volume chi/qs
         .Count = NextValue(filenum)
         If .Count > 0 Then
           ReDim .times(1 To .Count) As Single, _
                .Data(1 To .Count) As Single
           For i = 1 To .Count
             GetData filenum, .times(i), .Data(i)
           Next i
         End If
       End If
    End With
    
    'Add sequence numbers to X/Q array
    j = 0
    For i = 1 To MaxPathXQ + 1
        With PathXQArr(i)
            If .Name <> "" Then
                j = j + 1
                .Number = j
            End If
        End With
    Next
    Appl.PathDependentXQcount = j
     ' Apply to each dose location that is in CR
     'For j = 1 To Appl.DoseLocationCount
       'If DoseLocationArr(j).ControlRoom Then
       '  DoseLocationArr(j).dlXQ = CRvol
       'End If

    CRXQ = 0
    For j = 4 To MaxPathXQ + 1
      With PathXQArr(j)
        If .dlXQ.Model = 2 Then
            'Converting legacy file
            .dlXQ = CRvol
            .dlXQ.Model = 1 'Normal value
            If CRXQ = 0 Then
                'Save first CR only
                CRXQ = .Number
            End If
        End If
      End With
    Next j
    
    'Construct the X/Q table for legacy file
    PopulateLegacyXQTable CRXQ
  End If
  
  ' simulation parameters
  With CalcOptions
    With .SupplementalTimes
      .Count = NextValue(filenum, Skipheading)
      If .Count > 0 Then
        ReDim .CalTimes(1 To .Count) As Single, _
                    .CalTimeSteps(1 To .Count) As Single
        For i = 1 To .Count
          GetData filenum, .CalTimes(i), .CalTimeSteps(i)
        Next i
      End If
    End With
    
    .OutputOfRecord = NextValue(filenum, Skipheading)
    If FSO.FileExists(.OutputOfRecord) Then
        .OutputFile = .OutputOfRecord
    End If
    If FileMode = 2 Then
        'Current options:
        .OutputOptions(EDITRESULTS) = NextValue(filenum)
        .OutputOptions(SHOWEVENT) = NextValue(filenum)
        .OutputOptions(SHOWSTEP) = NextValue(filenum)
        .OutputOptions(SHOWMODEL) = NextValue(filenum)
        .OutputOptions(SHOWCi) = NextValue(filenum)
    Else 'Previous
        i = NextValue(filenum)
        j = NextValue(filenum)
        .OutputOptions(EDITRESULTS) = IIf(i + j > 0, 1, 0)
        .OutputOptions(SHOWEVENT) = NextValue(filenum)
        .OutputOptions(SHOWMODEL) = NextValue(filenum)
        .OutputOptions(SHOWSTEP) = NextValue(filenum)
        .OutputOptions(SHOWCi) = 0
    End If
  End With
   
  Close #filenum
  Exit Sub
  
ScenarioError:
  MsgBox Err.Description, vbExclamation, "ReadScenarioInput()"
  Exit Sub
  'For debugging -- put a breakpoint at Msgbox() above, drag arrow to Resume Next
  Resume Next
End Sub

Private Property Get FreeXQ() As Integer
Dim i As Integer

    For i = 4 To MaxPathXQ + 1
        'Find the next open element
        If PathXQArr(i).Number = 0 Then Exit For
    Next
    FreeXQ = i
End Property

Public Function CreateXQTable() As Boolean
'False if no pathways connect to environment
Dim Env As Integer
Dim RowItems As Integer
Dim ColumnItems As Integer
Dim i As Integer

    CreateXQTable = False
    Env = VerifyEnvironment()
    
    If Env > 0 Then
        RowItems = 0
        'Find pathways that exhaust to Environment compartment
        For i = 1 To MaxPathways
            If PathwayArr(i).ToComp = Env Then
                'Path exhausts to Environment
                RowItems = RowItems + 1
            End If
        Next
            
        'Find pathways that intake from Environment
        ColumnItems = 0
        For i = 1 To MaxPathways
            If PathwayArr(i).FromComp = Env Then
                ColumnItems = ColumnItems + 1
            End If
        Next
    
        If RowItems > 0 And ColumnItems > 0 Then
            'Create blank table
            ReDim PathXQMap(RowItems, ColumnItems)
            CreateXQTable = True
        End If
    End If
End Function

Public Sub PopulateLegacyXQTable(CrTable As Integer)
Dim i As Integer, j As Integer
Dim Env As Integer, CR As Integer
Dim sData As String
Dim ParseIn() As String
Dim ParseEx() As String

  Env = 0
  Env = VerifyEnvironment()
  
  If Env > 0 Then
    'Find first control room
    For i = 1 To MaxDoses
      With DoseLocationArr(i)
        If Not UCase(.Name) Like "*UNUSED*" Then
          If .ControlRoom Then
            CR = .CompartmentNumber
            Exit For
          End If
        End If
      End With
    Next

    'Find paths with inflow from environment
    sData = InflowPaths(Env)
    ParseIn = Split(Trim(sData))
    
    'Find paths which exhaust to the environment
    sData = ExhaustPaths(Env)
    ParseEx = Split(Trim(sData))
    
    XQIndexRows = UBound(ParseEx) + 1
    XQIndexCols = UBound(ParseIn) + 1
    
    If XQIndexRows > 0 And XQIndexCols > 0 Then
      ReDim PathXQMap(1 To XQIndexRows, 1 To XQIndexCols)
    End If
    
Dim PathNumber As Integer 'Construct values for 3.10 X/Q table 7/2006 JCK
    For i = 1 To XQIndexRows
      For j = 1 To XQIndexCols
        'If PathwayArr(val(ParseEx(i - 1)).FromComp <> CR Then
        'Changed 7/2006 JCK -----------------------------------
        PathNumber = val(ParseEx(i - 1))
        If PathNumber > 0 Then
            If PathwayArr(val(PathNumber)).FromComp = CR Then
              PathXQMap(i, j) = -1 'New format has -1 for control room
            Else 'End changed 7/2006 ------------------------------
              PathXQMap(i, j) = CrTable
            End If
        End If
      Next
    Next
  End If
End Sub

Private Sub GetData(FileHandle, Arg1, Arg2, Optional Arg3, _
                            Optional Arg4, Optional Arg5, Optional Arg6)
'Currently inputs a single line with up to 6 data items
'Skips comment lines starting with COMMENT_CHARACTER
Dim Buffer As String
Dim Parse() As String
Dim Count As Integer
Dim i As Integer, j As Integer

On Error GoTo KeepData

    Do
        Line Input #FileHandle, Buffer
        Debug.Print Buffer
    Loop While Left(Buffer, 1) = COMMENT_CHARACTER
    
    'Leading spaces have already been removed
    Parse = Split(Buffer)
       
    If IsMissing(Arg3) Then
         Count = 2
    ElseIf IsMissing(Arg4) Then
        Count = 3
    ElseIf IsMissing(Arg5) Then
        Count = 4
    ElseIf IsMissing(Arg6) Then
        Count = 5
    Else
        Count = 6
    End If
    
    j = -1
    For i = 1 To Count
        While Parse(i + j) = ""
            j = j + 1
        Wend
        If (i + j) <> (i - 1) Then
            Parse(i - 1) = Parse(i + j)
        End If
    Next
    
Keep:
On Error GoTo ExitMultiple

    Arg1 = Parse(0)
    Arg2 = Parse(1)
    
    For i = 3 To Count
        Select Case i
            Case 3
                Arg3 = Parse(2)
            Case 4
                Arg4 = Parse(3)
            Case 5
                Arg5 = Parse(4)
            Case 6
                Arg6 = Parse(5)
        End Select
    Next
    Exit Sub
    
KeepData:
    'Probably Parse() array didn't have enough data items
    'Save what we can
    Resume Keep

ExitMultiple:
    MsgBox Err.Description, vbExclamation, "GetData()"
    Exit Sub
    Resume Next
End Sub

Function NextValue(filenum, Optional Mode)
Dim dumstr, Value

   If Not IsMissing(Mode) Then
        Do
           Line Input #filenum, dumstr
           Debug.Print dumstr
        Loop While Left(dumstr, 1) = COMMENT_CHARACTER
   End If
   
   Do
     Line Input #filenum, Value
     Debug.Print Value
   Loop While Left(Value, 1) = COMMENT_CHARACTER
   
   NextValue = Trim(Value)
End Function

Public Function CheckDefaultTable(Index As Integer) As String

Dim Buffer As String

    With DoseLocationArr(Index)
        'Make sure entry is in use...
        If .CompartmentNumber > 0 Then
            If CompartmentArr(.CompartmentNumber).Type = 2 Then 'Environment
                Buffer = OffsiteName(.Name)
            Else
                Buffer = ""
            End If
        Else
            Buffer = ""
        End If
    End With
    
    CheckDefaultTable = Buffer
End Function

Private Function OffsiteName(Name As String) As String
'Determine EAB and LPZ X/Q tables when loading a legacy file
Const EABName = "EXCLU"
Const LPZName = "LOW P"
Dim Buffer As String

    Buffer = Trim(UCase(Name))
    If UCase(Buffer) = "EAB" Or UCase(Left(Buffer, 5)) = EABName Then
        Buffer = "EAB"
    ElseIf UCase(Buffer) = "LPZ" Or UCase(Left(Buffer, 5)) = LPZName Then
        Buffer = "LPZ"
    Else
        Buffer = "ENV"
    End If
    OffsiteName = Buffer
End Function

Public Function DcfFileIndex(Filename As String) As Integer
Dim testname As String
Dim i As Integer

    testname = LCase(Filename)
     i = InStr(testname, "tid14.inp")
     If (i > 0) Then
        DcfFileIndex = 0
     Else
       i = InStr(testname, "fgr11&12.inp")
       If (i > 0) Then
            DcfFileIndex = 1
        Else
            i = InStr(testname, "icrp60.inp")
            If (i > 0) Then
                DcfFileIndex = 2
            Else
                DcfFileIndex = 3  ' User defined
            End If
        End If
     End If

End Function

Function Most(arr, n)
  Dim i, m
  m = arr(1)
  For i = 2 To n
    If m < arr(i) Then m = arr(i)
  Next i
'  Debug.Print "most", m
  Most = m
End Function

Public Sub SetPBar(fbar, val)
 With fbar.ProgressBar1
   .Value = Min(.Value + val, .Max)
 End With
 fbar.Refresh
End Sub

Public Function EmergencyExit(UnloadMode) As Boolean
  Select Case UnloadMode
    Case vbFormControlMenu
      EmergencyExit = False
    Case vbFormCode
      EmergencyExit = False
    Case vbAppWindows
      EmergencyExit = True
    Case vbAppTaskManager
      EmergencyExit = True
    Case vbFormMDIForm
      EmergencyExit = True
  End Select
End Function

Public Sub ToClipboard()
  Clipboard.Clear
  keybd_event vbKeySnapshot, CByte(1), 0&, 0&
End Sub

Public Function DeletePathway(Index As Integer, Msg As Boolean) As Integer
Dim Response As VbMsgBoxResult
Dim i As Integer, j As Integer

On Error GoTo DeletePathError

    'JCK
    If Msg Then
        Response = MsgBox("Delete This Pathway?", _
                vbQuestion Or vbYesNo, "Delete Pathway")
    Else
        Response = vbYes
    End If
    
    If Response = vbYes Then
        'First delete Onsite X/Q table reference, if any
        DeletePathXQ Index
        
        With PathwayArr(Index)
          .Name = "Unused"
          .Active = False
          .ToComp = 0
          .FromComp = 0
        End With
        
        'Condense array after deletion -- JCK 5/2006
        For i = 1 To MaxPathways - 1
            If i >= Index Then
                CopyPathway i
            End If
        Next
        
        'Adjust pathway references
        j = 0
        For i = 1 To MaxPathways
            With PathwayArr(i)
                If .Name <> "Unused" Then
                    j = j + 1
                    .Number = j
                End If
            End With
        Next
        
        With PathwayArr(MaxPathways) 'Clear last element
            .Active = False
            .Name = ""
            .Number = 0
            .FromComp = 0
            .ToComp = 0
            .PrintDetail = 0
            For i = 1 To 4
                .TransferMechanism(i) = False
            Next
        End With
        
        With frmRadtrad
            .ComboUpdate = False
            loadPathwayMenu .cboPathway
            .Refresh
            .cboPathway.ListIndex = 0
            .ComboUpdate = True
            .SaveState True
        End With
        DeletePathway = Index
    Else
        DeletePathway = 0
    End If
    Exit Function
    
DeletePathError:
    MsgBox Err.Description, vbExclamation, "DeletePathway()"
    DeletePathway = 0

End Function

Private Sub CopyPathway(Index As Integer)
Dim i As Integer

On Error GoTo CopyError

    With PathwayArr(Index)
        'First clear data for all options
        With .TM0Piping
           .Count = 0
           .AModelNum = 0
            ReDim .times(1 To 1) As Single, _
             .FlowRates(1 To 1) As Single, _
             .AerosolDF(1 To 1) As Single, _
             .ElemIDF(1 To 1) As Single, _
             .OrgIDF(1 To 1) As Single
        End With

        With .TM1Filter
            .Count = 0
            ReDim .times(1 To 1) As Single, .FlowRates(1 To 1) As Single, _
                      .AerH(1 To 1) As Single, .ElemIH(1 To 1) As Single, _
                        .OrgIH(1 To 1) As Single
        End With

        With .TM2Supo
            .Count = 0
            ReDim .times(1 To 1) As Single, .AerosolDF(1 To 1) As Single, _
                    .FlowRatesAER(1 To 1) As Single, .ElemIDF(1 To 1) As Single, _
                      .OrgIDF(1 To 1) As Single, .FlowRatesELM(1 To 1) As Single, _
                        .FlowRatesORG(1 To 1) As Single 'JCK
        End With

        With .TM3Leak
            .Count = 0
            ReDim .times(1 To 1) As Single, _
                    .LeakageRates(1 To 1) As Single
        End With
        
        .Active = PathwayArr(Index + 1).Active
        .Name = PathwayArr(Index + 1).Name
        .Number = PathwayArr(Index + 1).Number
        .FromComp = PathwayArr(Index + 1).FromComp
        .ToComp = PathwayArr(Index + 1).ToComp
        .PrintDetail = PathwayArr(Index + 1).PrintDetail
        .TransferMechanism(1) = PathwayArr(Index + 1).TransferMechanism(1)
        If .TransferMechanism(1) Then
            With .TM0Piping
              .AModelNum = PathwayArr(Index + 1).TM0Piping.AModelNum
              .EModelNum = PathwayArr(Index + 1).TM0Piping.EModelNum
              .OModelNum = PathwayArr(Index + 1).TM0Piping.OModelNum
              .RowCount(1) = PathwayArr(Index + 1).TM0Piping.RowCount(1)
              .RowCount(2) = PathwayArr(Index + 1).TM0Piping.RowCount(2)
              .RowCount(3) = PathwayArr(Index + 1).TM0Piping.RowCount(3)
              .Count = PathwayArr(Index + 1).TM0Piping.Count
              ReDim .times(1 To .Count) As Single, _
                .AerosolDF(1 To .Count) As Single, _
                .ElemIDF(1 To .Count) As Single, _
                .OrgIDF(1 To .Count) As Single, _
                .FlowRates(1 To .Count) As Single
        
              Select Case .AModelNum
                Case 1  'user defined
                  For i = 1 To .Count
                        .times(i) = PathwayArr(Index + 1).TM0Piping.times(i)
                        .AerosolDF(i) = PathwayArr(Index + 1).TM0Piping.AerosolDF(i)
                        .ElemIDF(i) = PathwayArr(Index + 1).TM0Piping.ElemIDF(i)
                        .OrgIDF(i) = PathwayArr(Index + 1).TM0Piping.OrgIDF(i)
                        .FlowRates(i) = PathwayArr(Index + 1).TM0Piping.FlowRates(i)
                   Next i
    
                Case 2, 3 ' brockmann-bixler
                   With .BrockmannA
                        ReDim .times(1 To .Count) As Single, _
                            .FlowRates(1 To .Count) As Single
                        .TotalSurfaceArea = PathwayArr(Index + 1).TM0Piping.BrockmannA.TotalSurfaceArea
                        .Volume = PathwayArr(Index + 1).TM0Piping.BrockmannA.Volume
                        .BendAngle = PathwayArr(Index + 1).TM0Piping.BrockmannA.BendAngle
                        .WallTemp = PathwayArr(Index + 1).TM0Piping.BrockmannA.WallTemp
                        .Pressure = PathwayArr(Index + 1).TM0Piping.BrockmannA.Pressure
                        .SettlingVelocity = PathwayArr(Index + 1).TM0Piping.BrockmannA.SettlingVelocity
                        .FlowModel = PathwayArr(Index + 1).TM0Piping.BrockmannA.FlowModel
                        .VaporModel = PathwayArr(Index + 1).TM0Piping.BrockmannA.VaporModel
                        .Diameter = PathwayArr(Index + 1).TM0Piping.BrockmannA.Diameter
                        .ElementalVelocity = PathwayArr(Index + 1).TM0Piping.BrockmannA.ElementalVelocity
                        .OrganicVelocity = PathwayArr(Index + 1).TM0Piping.BrockmannA.OrganicVelocity
                        For i = 1 To .Count
                            .times(i) = PathwayArr(Index + 1).TM0Piping.BrockmannA.times(i)
                            .FlowRates(i) = PathwayArr(Index + 1).TM0Piping.BrockmannA.FlowRates(i)
                        Next i
                   End With ' end brockmann model
                   
                   If .EModelNum = 1 Then
                      For i = 1 To .Count
                          .times(i) = PathwayArr(Index + 1).TM0Piping.times(i)
                          .ElemIDF(i) = PathwayArr(Index + 1).TM0Piping.ElemIDF(i)
                          .OrgIDF(i) = PathwayArr(Index + 1).TM0Piping.OrgIDF(i)
                          .FlowRates(i) = PathwayArr(Index + 1).TM0Piping.FlowRates(i)
                      Next i
                   End If
              End Select ' end which aerosol model
            End With
        End If
        
        .TransferMechanism(2) = PathwayArr(Index + 1).TransferMechanism(2)
        If .TransferMechanism(2) Then
            With .TM1Filter
              .Count = PathwayArr(Index + 1).TM1Filter.Count
              ReDim .times(1 To .Count)
              ReDim .FlowRates(1 To .Count)
              ReDim .AerH(1 To .Count)
              ReDim .ElemIH(1 To .Count)
              ReDim .OrgIH(1 To .Count)
              For i = 1 To .Count
                .times(i) = PathwayArr(Index + 1).TM1Filter.times(i)
                .FlowRates(i) = PathwayArr(Index + 1).TM1Filter.FlowRates(i)
                .AerH(i) = PathwayArr(Index + 1).TM1Filter.AerH(i)
                .ElemIH(i) = PathwayArr(Index + 1).TM1Filter.ElemIH(i)
                .OrgIH(i) = PathwayArr(Index + 1).TM1Filter.OrgIH(i)
              Next i
              .FailEnable = PathwayArr(Index + 1).TM1Filter.FailEnable
              .FailureData(1) = PathwayArr(Index + 1).TM1Filter.FailureData(1)
              .FailureData(2) = PathwayArr(Index + 1).TM1Filter.FailureData(2)
              .FailureData(3) = PathwayArr(Index + 1).TM1Filter.FailureData(3)
              .FailureData(4) = PathwayArr(Index + 1).TM1Filter.FailureData(4)
              .FailureData(5) = PathwayArr(Index + 1).TM1Filter.FailureData(5)
              .StopTime = PathwayArr(Index + 1).TM1Filter.StopTime
            End With
        End If
        
        .TransferMechanism(3) = PathwayArr(Index + 1).TransferMechanism(3)
        If .TransferMechanism(3) Then
            With .TM2Supo
              .Mode = PathwayArr(Index + 1).TM2Supo.Mode
              .Models(1) = PathwayArr(Index + 1).TM2Supo.Models(1)
              .Models(2) = PathwayArr(Index + 1).TM2Supo.Models(2)
              .Models(3) = PathwayArr(Index + 1).TM2Supo.Models(3)
              .RowCount(1) = PathwayArr(Index + 1).TM2Supo.RowCount(1)
              .RowCount(2) = PathwayArr(Index + 1).TM2Supo.RowCount(2)
              .RowCount(3) = PathwayArr(Index + 1).TM2Supo.RowCount(3)
              .RowCount(4) = PathwayArr(Index + 1).TM2Supo.RowCount(4)
              .Mode = PathwayArr(Index + 1).TM2Supo.Mode
              .Count = PathwayArr(Index + 1).TM2Supo.Count
              ReDim .times(1 To .Count)
              ReDim .AerosolDF(1 To .Count)
              ReDim .FlowRatesAER(1 To .Count)
              ReDim .ElemIDF(1 To .Count)
              ReDim .FlowRatesELM(1 To .Count)
              ReDim .OrgIDF(1 To .Count)
              ReDim .FlowRatesORG(1 To .Count)
              ReDim .FlowRatesNOB(1 To .Count)
    
              For i = 1 To .Count
                  .times(i) = PathwayArr(Index + 1).TM2Supo.times(i)
                  .AerosolDF(i) = PathwayArr(Index + 1).TM2Supo.AerosolDF(i)
                  .FlowRatesAER(i) = PathwayArr(Index + 1).TM2Supo.FlowRatesAER(i)
                  .ElemIDF(i) = PathwayArr(Index + 1).TM2Supo.ElemIDF(i)
                  .FlowRatesELM(i) = PathwayArr(Index + 1).TM2Supo.FlowRatesELM(i)
                  .OrgIDF(i) = PathwayArr(Index + 1).TM2Supo.OrgIDF(i)
                  .FlowRatesORG(i) = PathwayArr(Index + 1).TM2Supo.FlowRatesORG(i)
                  .FlowRatesNOB(i) = PathwayArr(Index + 1).TM2Supo.FlowRatesNOB(i)
              Next i
            End With
        End If
        
        .TransferMechanism(4) = PathwayArr(Index + 1).TransferMechanism(4)
        If .TransferMechanism(4) Then
            With .TM3Leak
              .Count = PathwayArr(Index + 1).TM3Leak.Count
              ReDim .times(1 To .Count)
              ReDim .LeakageRates(1 To .Count)
              For i = 1 To .Count
                  .times(i) = PathwayArr(Index + 1).TM3Leak.times(i)
                  .LeakageRates(i) = PathwayArr(Index + 1).TM3Leak.LeakageRates(i)
              Next i
            End With
        End If
    End With 'with pathway array
    Exit Sub
    
CopyError:
    MsgBox Err.Description, vbExclamation, "CopyPathway()"
    Resume Next
End Sub

Public Function DeleteDoseLocation(Index As Integer, Msg As Boolean) As Boolean
Dim NewCount As Integer
Dim Response As VbMsgBoxResult
Dim Data As Integer
Dim i As Integer, j As Integer

On Error GoTo DeleteDoseError
    'JCK
    If Msg Then
      Response = MsgBox("Delete this Dose Location?", _
                  vbQuestion Or vbYesNo, "Delete Dose Location")
    Else
      Response = vbYes
    End If
    
    If Response = vbYes Then
        DoseLocationArr(Index).Name = "Unused"
        NewCount = Appl.DoseLocationCount - 1
        Appl.DoseLocationCount = NewCount

        With DoseLocationArr(Index)
          .ControlRoom = False
          .CompartmentNumber = 0
          .Number = 0
          With .dlBR
            .Count = 0
            .Model = 0
            ReDim .times(1 To MaxDimen) As Single, _
                  .Data(1 To MaxDimen) As Single
          End With
          
          If Index < 4 Then
            With .dlBR
              .Model = 1
              .Count = 3
              .times(1) = 0
              .Data(1) = 0.00035
              .times(2) = 8
              .Data(2) = 0.00018
              .times(3) = 24
              .Data(3) = 0.00023
            End With
          End If
    
          Select Case Index
            Case 1
                .Name = "Exclusion Area Boundary"
            Case 2
                .Name = "Low Population Zone"
            Case Else
                .Name = "Unused"
          End Select
          
          With .dlOccupy
            .Count = 0
            .Model = 0
            ReDim .times(1 To MaxDimen) As Single, _
                  .Data(1 To MaxDimen) As Single
          End With
        End With
        frmRadtrad.SaveState True
        DeleteDoseLocation = True
    Else
      DeleteDoseLocation = False
    End If
    Exit Function
    
DeleteDoseError:
    DeleteDoseLocation = False
    MsgBox Err.Description, vbExclamation, "DeleteDoseLocation()"
End Function

Public Sub DeletePathXQ(DeleteIndex As Integer) '3/2006 JCK
'A pathway will be  deleted. We must find the pathway in the Onsite X/Q matrix
'X/Q tables have no Pathway reference data, and can be applied to multiple pathways
'Thus we rerun the matrix-creation logic to identify the row or column where it occurs
'then delete all entries in that row or column from the PathXQMap array
'The next time the table is displayed the pathway and its X/Q reference will not show up
Dim EnvComp As Integer
Dim Row As Integer, Col As Integer
Dim i As Integer, j As Integer
        
On Error GoTo DeleteXQError

    EnvComp = VerifyEnvironment()
    
    If EnvComp > 0 Then
        'X/Q display must be redone, so close it if it exists
        For i = 0 To Forms.Count - 1
            If Forms(i).Name = "frmXQ" Then
                Unload Forms(i)
                DoEvents
                Exit For
            End If
        Next
        
        'Find pathways that exhaust to Environment compartment
        'These show in row headers of table
        Row = 0
        For i = 1 To MaxPathways
            With PathwayArr(i)
                'See if path exhausts to Environment
                If .ToComp = EnvComp Then
                    Row = Row + 1 'Counting rows in the Onsite X/Q table
                    'Control Room (Type 1) is excluded, not allowed to exhaust to environment
                    If CompartmentArr(.FromComp).Type <> 1 Then
                        If i = DeleteIndex Then
                            Exit For
                        End If
                    End If
                End If
            End With
        Next
        
        If i <= MaxPathways Then
            'If i value has been selected, a row will be deleted
            If XQIndexRows > 0 Then
                For j = Row To XQIndexRows - 1
                    For Col = 1 To XQIndexCols
                        PathXQMap(j, Col) = PathXQMap(j + 1, Col)
                    Next
                Next
                XQIndexRows = XQIndexRows - 1
            End If
        
        Else 'Pathway is in a column, delete that
             Col = 0
            For i = 1 To MaxPathways 'Column headers
                If PathwayArr(i).FromComp = EnvComp Then
                    Col = Col + 1
                    If i = DeleteIndex Then
                        If XQIndexCols > 0 Then
                            For j = Col To XQIndexCols - 1
                                For Row = 1 To XQIndexRows
                                    PathXQMap(Row, j) = PathXQMap(Row, j + 1)
                                Next
                            Next
                            XQIndexCols = XQIndexCols - 1
                        End If
                        Exit For
                    End If
                End If
            Next
        End If
    End If
    Exit Sub
    
DeleteXQError:
    MsgBox Err.Description, vbExclamation, "DeletePathXQ()"
End Sub

Public Sub AddPathXQ(PathIndex As Integer) 'JCK 7/2006
'Rerun the X/Q matrix-creation logic to identify the row or column to be added
'Add an empty row or column to PathXQMap array, to check for X/Q reference
'Existing values must be saved in temporary array for a row change, as
'ReDim Preserve is only allowed for changes in last dimension of an array
Dim temp()
Dim EnvComp As Integer
Dim Row As Integer, Col As Integer
Dim i As Integer, j As Integer
        
On Error GoTo AddXQError

    EnvComp = VerifyEnvironment()
    
    If EnvComp > 0 Then
        'X/Q display must be redone, so close it if it exists
        For i = 0 To Forms.Count - 1
            If Forms(i).Name = "frmXQ" Then
                Unload Forms(i)
                DoEvents
                Exit For
            End If
        Next
        
        'Find pathways that exhaust to Environment compartment
        'These show in row headers of table
        Row = 0
        For i = 1 To MaxPathways
            With PathwayArr(i)
                'See if path exhausts to Environment
                If .ToComp = EnvComp Then
                    Row = Row + 1 'Counting rows in the Onsite X/Q table
                    'Control Room (Type 1) is excluded, not allowed to exhaust to environment
                    If CompartmentArr(.FromComp).Type <> 1 Then
                        If i = PathIndex Then
                            Exit For
                        End If
                    End If
                End If
            End With
        Next
        
        If i <= MaxPathways Then
            If XQIndexCols > 0 Then
                'If i value has been selected, a row will be added
                ReDim temp(XQIndexRows, XQIndexCols)
                'Save existing X/Q table references
                For j = 1 To XQIndexRows
                    For Col = 1 To XQIndexCols
                        temp(j, Col) = PathXQMap(j, Col)
                    Next
                Next
                
                XQIndexRows = XQIndexRows + 1
                ReDim PathXQMap(XQIndexRows, XQIndexCols)
                'Copy rows before insert, from Temp()
                For j = 1 To Row - 1
                    For Col = 1 To XQIndexCols
                        PathXQMap(j, Col) = temp(j, Col)
                    Next
                Next
                
                For Col = 1 To XQIndexCols
                    PathXQMap(Row, Col) = 0
                Next
                
                'Copy the rest after inserted row
                For j = Row + 1 To XQIndexRows
                    For Col = 1 To XQIndexCols
                        PathXQMap(j, Col) = temp(j - 1, Col)
                    Next
                Next
            End If
            
        ElseIf XQIndexRows > 0 Then 'Pathway is in a column
            Col = 0
            For i = 1 To MaxPathways 'Column headers
                If PathwayArr(i).FromComp = EnvComp Then
                    Col = Col + 1
                    If i = PathIndex Then
                        XQIndexCols = XQIndexCols + 1
                        ReDim Preserve PathXQMap(1 To XQIndexRows, 1 To XQIndexCols)
                        For j = XQIndexCols To Col + 1 Step -1
                            For Row = 1 To XQIndexRows
                                PathXQMap(Row, j) = PathXQMap(Row, j - 1)
                            Next
                        Next
                        For Row = 1 To XQIndexRows
                            PathXQMap(Row, Col) = 0
                        Next
                        Exit For
                    End If
                End If
            Next
        End If
    End If
    Exit Sub
    
AddXQError:
    MsgBox Err.Description, vbExclamation, "AddPathXQ()"
End Sub

Public Function VerifyEnvironment() As Integer
'Verify that an Environment compartment is defined
Dim result As Integer
Dim i%

    'JCK
    result = 0
    For i = 1 To MaxCompartments
        With CompartmentArr(i)
             If .Type = 2 Then
                result = i
                Exit For
            End If
        End With
    Next
    
    VerifyEnvironment = result
End Function

Public Function ExhaustPaths(EnvComp As Integer) As String
Dim List As String
Dim i As Integer

    List = " "
    'Find pathways that exhaust to Environment compartment
    For i = 1 To MaxPathways
        If PathwayArr(i).ToComp = EnvComp Then
            'Path exhausts to Environment
            List = List & " " & PathwayArr(i).Number
        End If
    Next
    
    ExhaustPaths = List
End Function

Public Function InflowPaths(EnvComp As Integer) As String
Dim List As String
Dim i As Integer

    List = " "
    For i = 1 To MaxPathways
        If PathwayArr(i).FromComp = EnvComp Then
            'Path comes from environment
            List = List & " " & PathwayArr(i).Number
        End If
    Next
    InflowPaths = List
End Function

Public Sub AdjustToScreen(NewForm As Form)
'Secondary forms are ususally displayed at the right edge of frmRadtrad
'At low resolutions, a large one may go off the right edge of the screen
'Move left, allowing it to overlap frmRadtrad in those cases so entire form is visible
Dim Displaywidth As Single

    With frmRadtrad
        NewForm.Top = .Top
        Displaywidth = .Left + .Width + NewForm.Width
        NewForm.Left = .Left + .Width
        If Displaywidth > Screen.Width Then
            NewForm.Left = Screen.Width - NewForm.Width
        End If
    End With

End Sub

Public Function FileTitle(Filename As String) As String
Dim Parse() As String

    If Filename <> "" Then
        Parse = Split(Filename, "\")
        Parse = Split(Parse(UBound(Parse)), ".")
        FileTitle = Parse(0)
    Else
        FileTitle = ""
    End If
End Function

Public Function StdOutputFormat(OutputName As String) As Boolean
Dim Name As String
Dim s As String
Dim i As Integer
    
    s = "o"
    Name = Trim(OutputName)
    i = InStr(Name, ".")
    
    'Locate first letter of extension
    If (i > 0) And (i < Len(Name)) Then
        If Mid(Name, i + 1, 1) = "o" Then
            If Len(Name) = i + 2 Then '2-character extension
                s = Right(Name, 1)
            ElseIf Len(Name) = i + 3 Then '3-character extension
                s = Right(Name, 2)
            End If
        End If
    End If
    StdOutputFormat = IsNumeric(s)
End Function

Public Function GetBackColor(DialogType As String)
    If DialogType = "Pathway" Then
        GetBackColor = &HE6ECCE
    Else
        GetBackColor = RGB(236, 222, 189)
    End If
End Function

Public Sub SetControlColor(Dialog As Form)
Dim Item As Control
Dim ItemType As String

On Error GoTo ColorError

    For Each Item In Dialog.Controls
        ItemType = TypeName(Item)
        Select Case ItemType
            Case "TextBox", "CommandButton", "StatusBar", "Line"
            Case Else
                Item.BackColor = Dialog.BackColor
        End Select
    Next
    Exit Sub
    
ColorError:
    'Just keep going
    Resume Next
End Sub

Public Sub PasteError(ErrType As Single, Host As Form)
Dim Msg As String
    
    If ErrType = 0 Then
        Msg = "Start time must be zero"
    Else
        Msg = "Delay times must be equal"
    End If
    MsgBox Msg, vbExclamation, "Time(0) Error"
End Sub

Public Function ScientificFormat(Data)
Dim Buffer As String
Dim i As Integer

On Error GoTo SciFormatError

    Buffer = Format(Data, SCINOTA)
    i = InStr(Buffer, "+")
    If i = 0 Then
        i = InStr(Buffer, "-")
    End If
    'Skip sign character
    i = i - 1
    
    Do
        i = i - 1
        If Mid(Buffer, i, 1) = "." Then
            Buffer = Left(Buffer, i) & "00" & Right(Buffer, Len(Buffer) - i)
            Exit Do
        ElseIf Mid(Buffer, i, 1) <> "0" Then
            Exit Do
        End If
        
        Buffer = Left(Buffer, i - 1) & Right(Buffer, Len(Buffer) - i)
    Loop
    
    ScientificFormat = Buffer
    Exit Function
    
SciFormatError:
    MsgBox Err.Description, vbExclamation, "ScientificFormat()"
    Exit Function
End Function

Public Function DecimalFormat(Data)
Dim Buffer As String

On Error GoTo DecimalError

    Buffer = Format(Data, "0.0000000")
    Do
        Select Case Right(Buffer, 1)
            Case "0"
                Buffer = Left(Buffer, Len(Buffer) - 1)
            Case "."
                Buffer = Left(Buffer, Len(Buffer) - 1)
                Exit Do
            Case Else
                Exit Do
        End Select
    Loop
    DecimalFormat = Buffer
    Exit Function
    
DecimalError:
    MsgBox Err.Description, vbExclamation, "DecimalFormat()"
End Function

Public Function ZeroFormat(Data, fmt) As String
'Format numeric values to 7 places, remove trailing zeros
Dim result As String

    Select Case fmt
        Case FloatFormat
            If Data = 0 Then
                result = "0.0000"
            Else
                result = DecimalFormat(Data)
                If Len(Trim(result)) > 10 Then
                    result = ScientificFormat(Data)
                End If
            End If
        Case SCINOTA
            If Data = 0 Then
                result = SCIZERO
            Else
                result = ScientificFormat(Data)
            End If
        Case Else
            result = Format(Data, fmt)
    End Select
    
    ZeroFormat = result
End Function

'Private Function CompFormat(Result As String, Data, fmt) As String
''Display shorter format if result is a very long string
'Dim Comp As String

'    If fmt = SCINOTA Then
'        Comp = DecimalFormat(Data)
'    Else ' FloatFormat
'        Comp = ScientificFormat(Data)
'    End If

'    If Len(Comp) < Len(Result) Then
'        CompFormat = Comp
'    Else
'        CompFormat = Result
'    End If
'End Function

Public Function CheckClipboardData() As Boolean
'If data contains tabs, it could be from Excel - JCK 11/2005
Dim Buffer As String
Dim ValidData As Boolean

On Error GoTo OK

    Buffer = Clipboard.GetText
    If Buffer <> "" Then
        If InStr(Buffer, vbTab) = 0 Then
            Buffer = ""
        End If
    End If
    
    CheckClipboardData = (Len(Buffer) > 0)
OK:
End Function

'Not in use ------------------------------------------------
Public Function DisplayFormat(Data As String)
'Output is formatted for display without further conversion
'Rules:
'1: Use decimal format for 6 places or fewer
'2: Use scientific notation if decimal > 6 places
'3: Use scientific notation if it contains more information than 6 places decimal
Dim Buffer As String
Dim Value As Single

    Value = val(Data)
    Buffer = Format(Value, "0.0000000")
    If Len(Buffer) > 8 Then
        Buffer = Format(Value, SCINOTA)
    ElseIf val(Buffer) <> Value Then
        Buffer = Format(Value, SCINOTA)
    End If
    DisplayFormat = Buffer
End Function
