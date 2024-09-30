VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BC098376-8AFB-11CE-90D3-0000C037528B}#4.1#0"; "csopt32.ocx"
Object = "{77DDF307-D82B-4757-8B3A-106EC9D75D4B}#8.0#0"; "tdbg8.ocx"
Begin VB.Form Rad_Toolbox 
   Caption         =   "   Radiological Toolbox"
   ClientHeight    =   7365
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   9885
   Icon            =   "frmRadTool.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7365
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Data dataRisk 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   960
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6840
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.CommandButton cmdRisk 
      Caption         =   "Risk Coefficients"
      Height          =   450
      Left            =   120
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   10
      ToolTipText     =   "Displays physical constants, convertion factors, formulas, and  related web pages."
      Top             =   5520
      Width           =   2055
   End
   Begin VB.Data dataRiskExt 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   120
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6840
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.Data dataRiskInt 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   360
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6840
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.Data dataGP 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   7200
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.Data dataICRP89 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6840
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.CommandButton cmdDoseCalcs 
      Caption         =   "Dose Calculations"
      Height          =   450
      Left            =   120
      TabIndex        =   9
      ToolTipText     =   " Displays internal and external dose coefficients for the public and workers."
      Top             =   1920
      Width           =   2055
   End
   Begin VB.CommandButton cmdAbsorberMat 
      Caption         =   "Material Data"
      Height          =   450
      Left            =   120
      TabIndex        =   8
      ToolTipText     =   " Displays cross sections, stopping powers, etc for photons, electrons, and alpha particles. "
      Top             =   3720
      Width           =   2055
   End
   Begin VB.Data ddADoses 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6720
      Visible         =   0   'False
      Width           =   1260
   End
   Begin VB.CommandButton cmdEarlyEffects 
      Caption         =   "Early Inhalation"
      Height          =   450
      Left            =   120
      TabIndex        =   7
      ToolTipText     =   " Displays early inhalation dose rates for acute effects."
      Top             =   2520
      Width           =   2055
   End
   Begin VB.CommandButton cmdRadField 
      Caption         =   "Radiation Field Data"
      Height          =   450
      Left            =   120
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   6
      ToolTipText     =   "Displays neutron and photon field data from ICRP 74."
      Top             =   4920
      Width           =   2055
   End
   Begin VB.CommandButton cmdSupplement 
      Caption         =   "Supplemental Data"
      Height          =   450
      Left            =   120
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   5
      ToolTipText     =   "Displays physical constants, convertion factors, formulas, and  related web pages."
      Top             =   6120
      Width           =   2055
   End
   Begin VB.CommandButton cmdBiological 
      Caption         =   "Biological Data"
      Height          =   450
      Left            =   120
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   4
      ToolTipText     =   "Displays organ masses, biokinetic models, composition of tissues, and intake rates."
      Top             =   120
      Width           =   2055
   End
   Begin VB.CommandButton cmdExposure 
      Caption         =   "Public Exposure Data"
      Height          =   450
      Left            =   120
      TabIndex        =   3
      ToolTipText     =   "Displays background concentrations and concentrations in materials."
      Top             =   4320
      Width           =   2055
   End
   Begin VB.Data dataEle 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   360
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6840
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.Data dataJaeri 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Data data72 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   6240
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Data data68Data 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   5880
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.Data Data38Index 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   "icrp38_index.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   5520
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Data DataInh 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   5160
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdDecayData 
      Caption         =   "Decay Data"
      Height          =   450
      Left            =   120
      TabIndex        =   2
      ToolTipText     =   " Displays ICRP 38 and JAERI decay chain data, Energy/Intensity data, and Beta spectra."
      Top             =   720
      Width           =   2055
   End
   Begin MSComDlg.CommonDialog cmnDialog 
      Left            =   1320
      Top             =   4920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdAbsorberEle 
      Caption         =   "Element Data"
      Height          =   450
      Left            =   120
      TabIndex        =   1
      ToolTipText     =   " Displays cross sections, stopping powers, etc for photons, electrons, and alpha particles. "
      Top             =   3120
      Width           =   2055
   End
   Begin VB.CommandButton cmdNuclideData 
      Caption         =   "Dose Coefficients"
      Height          =   450
      Left            =   120
      TabIndex        =   0
      ToolTipText     =   " Displays internal and external dose coefficients for the public and workers."
      Top             =   1320
      Width           =   2055
   End
   Begin VB.Data DataExt 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   "Rad_Toolbox.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Air Submersion"
      Top             =   4800
      Visible         =   0   'False
      Width           =   1140
   End
   Begin TabDlg.SSTab tabNuclide 
      Height          =   6975
      Left            =   2400
      TabIndex        =   11
      Top             =   120
      Width           =   7215
      _ExtentX        =   12726
      _ExtentY        =   12303
      _Version        =   393216
      TabOrientation  =   1
      Tabs            =   24
      TabsPerRow      =   2
      TabHeight       =   529
      TabCaption(0)   =   "Worker Coefficients  (ICRP 30)"
      TabPicture(0)   =   "frmRadTool.frx":030A
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "lblICRP38Units"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "dd38"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "grd38"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "optICRP38"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "cmdRef(0)"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "cmdICRP30Help"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "cmdICRP30Paste"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "chkICRP30Dau"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "cmdDisplay_38"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "cmdUnits_38"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "cmdClear30"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).ControlCount=   11
      TabCaption(1)   =   "Worker Coefficients (ICRP 68)"
      TabPicture(1)   =   "frmRadTool.frx":0326
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "cmdClear68"
      Tab(1).Control(1)=   "cmdUnits_68"
      Tab(1).Control(2)=   "cmdDisplay_68"
      Tab(1).Control(3)=   "cmdHelp68"
      Tab(1).Control(4)=   "chkICRP68Dau"
      Tab(1).Control(5)=   "cmdICRP68Paste"
      Tab(1).Control(6)=   "cmdRef(1)"
      Tab(1).Control(7)=   "optICRP68"
      Tab(1).Control(8)=   "dd68"
      Tab(1).Control(9)=   "grdICRP68"
      Tab(1).Control(10)=   "lblICRP68Units"
      Tab(1).ControlCount=   11
      TabCaption(2)   =   "Public Ingestion Coefficients"
      TabPicture(2)   =   "frmRadTool.frx":0342
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "lblICRP72IngUnits"
      Tab(2).Control(1)=   "dd72Ing"
      Tab(2).Control(2)=   "grd72Ing"
      Tab(2).Control(3)=   "opt72ing"
      Tab(2).Control(4)=   "cmdRef(2)"
      Tab(2).Control(5)=   "cmd72IngPaste"
      Tab(2).Control(6)=   "chk72IngDau"
      Tab(2).Control(7)=   "cmdHelp72Ing"
      Tab(2).Control(8)=   "cmdDisplay_72Ing"
      Tab(2).Control(9)=   "cmdUnits_72Ing"
      Tab(2).Control(10)=   "cmdClearW"
      Tab(2).ControlCount=   11
      TabCaption(3)   =   "Public Inhalation Coefficients"
      TabPicture(3)   =   "frmRadTool.frx":035E
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "cmdClearInh"
      Tab(3).Control(1)=   "cmdUnits_72Inh"
      Tab(3).Control(2)=   "cmdDisplay_72Inh"
      Tab(3).Control(3)=   "cmdHelp72Inh"
      Tab(3).Control(4)=   "chk72InhDau"
      Tab(3).Control(5)=   "cmd72InhPaste"
      Tab(3).Control(6)=   "cmdRef(3)"
      Tab(3).Control(7)=   "opt72Inh"
      Tab(3).Control(8)=   "grd72Inh"
      Tab(3).Control(9)=   "dd72Inh"
      Tab(3).Control(10)=   "lblICRP72InhUnits"
      Tab(3).ControlCount=   11
      TabCaption(4)   =   "Public External Coefficients (FGR 12)"
      TabPicture(4)   =   "frmRadTool.frx":037A
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "cmdClearExt"
      Tab(4).Control(1)=   "cmdUnits_Ext"
      Tab(4).Control(2)=   "cmdDisplay_Ext"
      Tab(4).Control(3)=   "chkExtDau"
      Tab(4).Control(4)=   "cmdExtPaste"
      Tab(4).Control(5)=   "cmdFGR12Help"
      Tab(4).Control(6)=   "cmdRef(4)"
      Tab(4).Control(7)=   "optExternal"
      Tab(4).Control(8)=   "ddExt"
      Tab(4).Control(9)=   "grdExt"
      Tab(4).Control(10)=   "lblExtUnits"
      Tab(4).ControlCount=   11
      TabCaption(5)   =   "ICRP 107 Data"
      TabPicture(5)   =   "frmRadTool.frx":0396
      Tab(5).ControlEnabled=   0   'False
      Tab(5).Control(0)=   "cmdPeriodicTable"
      Tab(5).Control(1)=   "cmdHelpDecay"
      Tab(5).Control(2)=   "cmdDisplay_Decay"
      Tab(5).Control(3)=   "cboDecayNuc"
      Tab(5).Control(4)=   "cmdUnits_ICRP38"
      Tab(5).Control(5)=   "Frame12"
      Tab(5).Control(6)=   "cmdRef(5)"
      Tab(5).Control(7)=   "cmdAKRC"
      Tab(5).Control(8)=   "optICRP38Cutoff"
      Tab(5).Control(9)=   "optDecayType"
      Tab(5).Control(10)=   "Label1"
      Tab(5).Control(11)=   "Label3"
      Tab(5).Control(12)=   "lblICRP38SAUnits"
      Tab(5).Control(13)=   "Label13"
      Tab(5).ControlCount=   14
      TabCaption(6)   =   "Composition"
      TabPicture(6)   =   "frmRadTool.frx":03B2
      Tab(6).ControlEnabled=   0   'False
      Tab(6).Control(0)=   "cmdView"
      Tab(6).Control(1)=   "cmdCompositionHelp"
      Tab(6).Control(2)=   "cmdUnits_Comp"
      Tab(6).Control(3)=   "cmdDisplay_Comp"
      Tab(6).Control(4)=   "cboMaterial"
      Tab(6).Control(5)=   "cmdRef(6)"
      Tab(6).Control(6)=   "optCompSort"
      Tab(6).Control(7)=   "optComp"
      Tab(6).Control(8)=   "Label16"
      Tab(6).ControlCount=   9
      TabCaption(7)   =   "Kerma"
      TabPicture(7)   =   "frmRadTool.frx":03CE
      Tab(7).ControlEnabled=   0   'False
      Tab(7).Control(0)=   "lblKermaUnit"
      Tab(7).Control(1)=   "optKerma"
      Tab(7).Control(2)=   "cmdRef(7)"
      Tab(7).Control(3)=   "cmdDisplay_Kerma"
      Tab(7).Control(4)=   "cmdUnits_Kerma"
      Tab(7).Control(5)=   "cmdKermaHelp"
      Tab(7).ControlCount=   6
      TabCaption(8)   =   "Isotopes"
      TabPicture(8)   =   "frmRadTool.frx":03EA
      Tab(8).ControlEnabled=   0   'False
      Tab(8).Control(0)=   "optMass"
      Tab(8).Control(1)=   "cmdRef(8)"
      Tab(8).Control(2)=   "cboAtom"
      Tab(8).Control(3)=   "cmdDisplay_Atom"
      Tab(8).Control(4)=   "cmdUnits_Atom"
      Tab(8).Control(5)=   "cmdAtomicMass"
      Tab(8).Control(6)=   "cmbPeriodicTableIso"
      Tab(8).ControlCount=   7
      TabCaption(9)   =   "Photon Cross Section"
      TabPicture(9)   =   "frmRadTool.frx":0406
      Tab(9).ControlEnabled=   0   'False
      Tab(9).Control(0)=   "cmdRef(9)"
      Tab(9).Control(1)=   "cboPhotonMat"
      Tab(9).Control(2)=   "lblPhotonUnits"
      Tab(9).Control(3)=   "cboPhoton"
      Tab(9).Control(4)=   "FramePhoton"
      Tab(9).Control(5)=   "cmdDisplay_Photon"
      Tab(9).Control(6)=   "cmdUnits_Photon"
      Tab(9).Control(7)=   "cmdPhotonXsection"
      Tab(9).ControlCount=   8
      TabCaption(10)  =   "Electron Data"
      TabPicture(10)  =   "frmRadTool.frx":0422
      Tab(10).ControlEnabled=   0   'False
      Tab(10).Control(0)=   "cmdElectronHelp"
      Tab(10).Control(1)=   "cmdUnits_Electron"
      Tab(10).Control(2)=   "cmdDisplay_Electron"
      Tab(10).Control(3)=   "FrameElectron"
      Tab(10).Control(4)=   "cboElectron"
      Tab(10).Control(5)=   "lblElectronUnits"
      Tab(10).Control(6)=   "lblElectronEUnits"
      Tab(10).Control(7)=   "cboElectronMat"
      Tab(10).Control(8)=   "cmdRef(10)"
      Tab(10).Control(9)=   "Label8"
      Tab(10).Control(10)=   "Label9"
      Tab(10).ControlCount=   11
      TabCaption(11)  =   "Proton Data"
      TabPicture(11)  =   "frmRadTool.frx":043E
      Tab(11).ControlEnabled=   0   'False
      Tab(11).Control(0)=   "cmdUnits_Proton"
      Tab(11).Control(1)=   "cmdDisplay_Proton"
      Tab(11).Control(2)=   "cboProton"
      Tab(11).Control(3)=   "cmdRef(11)"
      Tab(11).Control(4)=   "optProton"
      Tab(11).ControlCount=   5
      TabCaption(12)  =   "Alpha Data"
      TabPicture(12)  =   "frmRadTool.frx":045A
      Tab(12).ControlEnabled=   0   'False
      Tab(12).Control(0)=   "Label11"
      Tab(12).Control(1)=   "Label10"
      Tab(12).Control(2)=   "cmdRef(12)"
      Tab(12).Control(3)=   "cboAlphaMat"
      Tab(12).Control(4)=   "lblAlphaEUnits"
      Tab(12).Control(5)=   "optAlpha"
      Tab(12).Control(6)=   "lblAlphaUnits"
      Tab(12).Control(7)=   "cboAlpha"
      Tab(12).Control(8)=   "cmdDisplay_Alpha"
      Tab(12).Control(9)=   "cmdUnits_Alpha"
      Tab(12).Control(10)=   "cmdAlphaHelp"
      Tab(12).ControlCount=   11
      TabCaption(13)  =   "Risk Coefficients (FGR 13)"
      TabPicture(13)  =   "frmRadTool.frx":0476
      Tab(13).ControlEnabled=   0   'False
      Tab(13).Control(0)=   "lblRiskUnit"
      Tab(13).Control(1)=   "grdRisk"
      Tab(13).Control(2)=   "ddRisk"
      Tab(13).Control(3)=   "optPath"
      Tab(13).Control(4)=   "cmdUnits_Risk"
      Tab(13).Control(5)=   "cmdDisplay_Risk"
      Tab(13).Control(6)=   "chkDau"
      Tab(13).Control(7)=   "cmdRiskHelp"
      Tab(13).Control(8)=   "cmdRef(13)"
      Tab(13).ControlCount=   9
      TabCaption(14)  =   "Public Exposure Data"
      TabPicture(14)  =   "frmRadTool.frx":0492
      Tab(14).ControlEnabled=   0   'False
      Tab(14).Control(0)=   "cmdRef(14)"
      Tab(14).Control(1)=   "cmdNatBack"
      Tab(14).Control(2)=   "cmdDevices"
      Tab(14).Control(3)=   "cmdMedical"
      Tab(14).Control(4)=   "cmdPrimordial"
      Tab(14).Control(5)=   "cmdMaterials"
      Tab(14).Control(6)=   "cmdBackBody"
      Tab(14).Control(7)=   "cmdCTExam"
      Tab(14).Control(8)=   "cmdRadGraph"
      Tab(14).ControlCount=   9
      TabCaption(15)  =   "Biological Data"
      TabPicture(15)  =   "frmRadTool.frx":04AE
      Tab(15).ControlEnabled=   0   'False
      Tab(15).Control(0)=   "cmdFoodRates"
      Tab(15).Control(1)=   "Frame2"
      Tab(15).Control(2)=   "cmdRef(15)"
      Tab(15).Control(3)=   "Frame11"
      Tab(15).Control(4)=   "Frame10"
      Tab(15).Control(5)=   "Frame9"
      Tab(15).Control(6)=   "Frame4"
      Tab(15).Control(7)=   "Frame3"
      Tab(15).Control(8)=   "Frame1"
      Tab(15).ControlCount=   9
      TabCaption(16)  =   "Supplemental Data"
      TabPicture(16)  =   "frmRadTool.frx":04CA
      Tab(16).ControlEnabled=   0   'False
      Tab(16).Control(0)=   "Frame15"
      Tab(16).Control(1)=   "Frame14"
      Tab(16).Control(2)=   "cmdRef(16)"
      Tab(16).Control(3)=   "cmdNIST"
      Tab(16).Control(4)=   "Frame7"
      Tab(16).Control(5)=   "Frame6"
      Tab(16).Control(6)=   "Frame5"
      Tab(16).Control(7)=   "Frame13"
      Tab(16).ControlCount=   8
      TabCaption(17)  =   "Photon Radiation Field (ICRP 74)"
      TabPicture(17)  =   "frmRadTool.frx":04E6
      Tab(17).ControlEnabled=   0   'False
      Tab(17).Control(0)=   "Label6"
      Tab(17).Control(1)=   "lblPhoton2"
      Tab(17).Control(2)=   "lblPhoton1"
      Tab(17).Control(3)=   "optPhotonField"
      Tab(17).Control(4)=   "cmdRef(17)"
      Tab(17).Control(5)=   "cmdPhotonFieldHelp"
      Tab(17).Control(6)=   "picPhoton"
      Tab(17).Control(7)=   "cmdUnits_PField"
      Tab(17).Control(8)=   "cmdDisplayPhotonField"
      Tab(17).ControlCount=   9
      TabCaption(18)  =   "Neutron Radiation Field (ICRP 74)"
      TabPicture(18)  =   "frmRadTool.frx":0502
      Tab(18).ControlEnabled=   0   'False
      Tab(18).Control(0)=   "lblNeutron"
      Tab(18).Control(1)=   "optNeutronField"
      Tab(18).Control(2)=   "cmdRef(18)"
      Tab(18).Control(3)=   "cmdNeutronFieldHelp"
      Tab(18).Control(4)=   "picNeutron"
      Tab(18).Control(5)=   "cmdUnits_NField"
      Tab(18).Control(6)=   "cmdDisplayNeutronField"
      Tab(18).ControlCount=   7
      TabCaption(19)  =   "Early Inhalation Dose Coeffs"
      TabPicture(19)  =   "frmRadTool.frx":051E
      Tab(19).ControlEnabled=   0   'False
      Tab(19).Control(0)=   "lblEarlyUnits"
      Tab(19).Control(1)=   "Label15"
      Tab(19).Control(2)=   "Label5"
      Tab(19).Control(3)=   "optIntUnits"
      Tab(19).Control(4)=   "optRBE"
      Tab(19).Control(5)=   "grdTimes"
      Tab(19).Control(6)=   "cmdRef(19)"
      Tab(19).Control(7)=   "Frame8"
      Tab(19).Control(8)=   "cmdUnits_Early"
      Tab(19).Control(9)=   "cmdDisplay_Early"
      Tab(19).Control(10)=   "cboEarlyType"
      Tab(19).Control(11)=   "cboEarlyNuc"
      Tab(19).Control(12)=   "cmdHelpEarly"
      Tab(19).ControlCount=   13
      TabCaption(20)  =   "Photon Buildup"
      TabPicture(20)  =   "frmRadTool.frx":053A
      Tab(20).ControlEnabled=   0   'False
      Tab(20).Control(0)=   "optGSDisplayType"
      Tab(20).Control(1)=   "cboGPMaterial"
      Tab(20).Control(2)=   "cmdRef(20)"
      Tab(20).Control(3)=   "Picture1"
      Tab(20).Control(4)=   "cmdDisplayGP"
      Tab(20).Control(5)=   "cboGPElement"
      Tab(20).Control(6)=   "cmdPhotonBUHelp"
      Tab(20).ControlCount=   7
      TabCaption(21)  =   "Neutron Cross Section"
      TabPicture(21)  =   "frmRadTool.frx":0556
      Tab(21).ControlEnabled=   0   'False
      Tab(21).Control(0)=   "Picture2"
      Tab(21).Control(1)=   "cmdRef(21)"
      Tab(21).Control(2)=   "cmdDisplayNX"
      Tab(21).Control(3)=   "cboNX"
      Tab(21).ControlCount=   4
      TabCaption(22)  =   "Ingestion (FGR 13)"
      TabPicture(22)  =   "frmRadTool.frx":0572
      Tab(22).ControlEnabled=   0   'False
      Tab(22).ControlCount=   0
      TabCaption(23)  =   "External (FGR 13)"
      TabPicture(23)  =   "frmRadTool.frx":058E
      Tab(23).ControlEnabled=   0   'False
      Tab(23).ControlCount=   0
      Begin VB.CommandButton cmdView 
         Caption         =   "View PNNL-15870 Compendium on Material Data"
         Height          =   495
         Left            =   -74760
         TabIndex        =   268
         Top             =   1440
         Width           =   3735
      End
      Begin VB.CommandButton cmdRadGraph 
         Caption         =   "DOE Ionizing Radiation Dose Graphic"
         Height          =   375
         Left            =   -74640
         TabIndex        =   267
         Top             =   4320
         Width           =   3495
      End
      Begin VB.CommandButton cmbPeriodicTableIso 
         Caption         =   "Periodic Table"
         Height          =   375
         Left            =   -71040
         TabIndex        =   266
         Top             =   1800
         Width           =   1335
      End
      Begin VB.CommandButton cmdPeriodicTable 
         Caption         =   "Periodic Table"
         Height          =   375
         Left            =   -69840
         TabIndex        =   265
         Top             =   5600
         Width           =   1335
      End
      Begin VB.Frame Frame13 
         Caption         =   "International Nuclear and Radiological Event Scale (INES)"
         Height          =   735
         Left            =   -74640
         TabIndex        =   263
         Top             =   1680
         Width           =   6495
         Begin VB.CommandButton cmdINES 
            Caption         =   "Display"
            Height          =   375
            Left            =   240
            TabIndex        =   264
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.PictureBox Picture2 
         Height          =   3600
         Left            =   -73800
         Picture         =   "frmRadTool.frx":05AA
         ScaleHeight     =   1770
         ScaleMode       =   0  'User
         ScaleWidth      =   1770
         TabIndex        =   262
         Top             =   1920
         Width           =   3600
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   21
         Left            =   -70680
         TabIndex        =   261
         Top             =   1320
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplayNX 
         Caption         =   "Display"
         Height          =   375
         Left            =   -70680
         TabIndex        =   260
         Top             =   720
         Width           =   1335
      End
      Begin VB.ComboBox cboNX 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   259
         Top             =   240
         Width           =   800
      End
      Begin VB.CommandButton cmdClear68 
         Caption         =   "Clear Grid"
         Height          =   375
         Left            =   -70440
         TabIndex        =   258
         Top             =   1680
         Width           =   1335
      End
      Begin VB.CommandButton cmdClear30 
         Caption         =   "Clear Grid"
         Height          =   375
         Left            =   4560
         TabIndex        =   257
         Top             =   1680
         Width           =   1335
      End
      Begin VB.CommandButton cmdClearExt 
         Caption         =   "Clear Grid"
         Height          =   375
         Left            =   -70440
         TabIndex        =   256
         Top             =   2880
         Width           =   1335
      End
      Begin VB.CommandButton cmdClearInh 
         Caption         =   "Clear Grid"
         Height          =   375
         Left            =   -70560
         TabIndex        =   255
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton cmdClearW 
         Caption         =   "Clear Grid"
         Height          =   375
         Left            =   -70440
         TabIndex        =   254
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton cmdHelpDecay 
         Caption         =   "Help"
         Height          =   375
         Left            =   -69840
         TabIndex        =   253
         Top             =   3840
         Width           =   1335
      End
      Begin VB.CommandButton cmdHelpEarly 
         Caption         =   "Help"
         Height          =   375
         Left            =   -71520
         TabIndex        =   252
         Top             =   3360
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   13
         Left            =   -72840
         TabIndex        =   251
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton cmdCompositionHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -70570
         TabIndex        =   250
         Top             =   1320
         Width           =   1335
      End
      Begin VB.CommandButton cmdAtomicMass 
         Caption         =   "Help"
         Height          =   375
         Left            =   -71040
         TabIndex        =   249
         Top             =   840
         Width           =   1335
      End
      Begin VB.CommandButton cmdKermaHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -70800
         TabIndex        =   248
         Top             =   4560
         Width           =   1335
      End
      Begin VB.CommandButton cmdPhotonBUHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -71280
         TabIndex        =   247
         Top             =   1320
         Width           =   1335
      End
      Begin VB.CommandButton cmdAlphaHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -70800
         TabIndex        =   246
         Top             =   3240
         Width           =   1335
      End
      Begin VB.CommandButton cmdElectronHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -70800
         TabIndex        =   245
         Top             =   3240
         Width           =   1335
      End
      Begin VB.CommandButton cmdPhotonXsection 
         Caption         =   "Help"
         Height          =   375
         Left            =   -70800
         TabIndex        =   244
         Top             =   2400
         Width           =   1335
      End
      Begin VB.CommandButton cmdCTExam 
         Caption         =   "Typical Exposures during CT Examinations"
         Height          =   375
         Left            =   -74640
         TabIndex        =   243
         Top             =   3720
         Width           =   3495
      End
      Begin VB.CommandButton cmdRiskHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -72840
         TabIndex        =   242
         Top             =   3480
         Width           =   1335
      End
      Begin VB.CheckBox chkDau 
         Caption         =   "Include daughters?"
         Height          =   375
         Left            =   -72840
         TabIndex        =   240
         Top             =   1920
         Width           =   1815
      End
      Begin VB.CommandButton cmdUnits_38 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   3000
         TabIndex        =   194
         Top             =   1680
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_38 
         Caption         =   "Display"
         Height          =   375
         Left            =   3000
         TabIndex        =   193
         Top             =   2760
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Ext 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -72000
         TabIndex        =   192
         Top             =   2880
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Ext 
         Caption         =   "Display"
         Height          =   375
         Left            =   -72000
         TabIndex        =   191
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_72Ing 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -72000
         TabIndex        =   183
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_72Inh 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -72000
         TabIndex        =   182
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_68 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -72000
         TabIndex        =   181
         Top             =   1680
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_72Ing 
         Caption         =   "Display"
         Height          =   375
         Left            =   -72000
         TabIndex        =   180
         Top             =   3480
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_72Inh 
         Caption         =   "Display"
         Height          =   375
         Left            =   -72000
         TabIndex        =   179
         Top             =   3480
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Decay 
         Caption         =   "Display"
         Height          =   375
         Left            =   -69840
         TabIndex        =   178
         Top             =   3300
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_68 
         Caption         =   "Display"
         Height          =   375
         Left            =   -72000
         TabIndex        =   177
         Top             =   2760
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Comp 
         Caption         =   "Select Units"
         Enabled         =   0   'False
         Height          =   375
         Left            =   -70570
         TabIndex        =   176
         Top             =   2400
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Kerma 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -70800
         TabIndex        =   175
         Top             =   2880
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Atom 
         Caption         =   "Select Units"
         Enabled         =   0   'False
         Height          =   375
         Left            =   -71040
         TabIndex        =   174
         Top             =   2280
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Photon 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -70800
         TabIndex        =   173
         Top             =   720
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Electron 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -70800
         TabIndex        =   172
         Top             =   780
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Proton 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -71040
         TabIndex        =   171
         Top             =   180
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Alpha 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -70800
         TabIndex        =   170
         Top             =   780
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Comp 
         Caption         =   "Display"
         Height          =   375
         Left            =   -70570
         TabIndex        =   169
         Top             =   720
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Kerma 
         Caption         =   "Display"
         Height          =   375
         Left            =   -70800
         TabIndex        =   168
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Atom 
         Caption         =   "Display"
         Height          =   375
         Left            =   -71040
         TabIndex        =   167
         Top             =   360
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Photon 
         Caption         =   "Display"
         Height          =   375
         Left            =   -70800
         TabIndex        =   166
         Top             =   1920
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Electron 
         Caption         =   "Display"
         Height          =   375
         Left            =   -70800
         TabIndex        =   165
         Top             =   2700
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Proton 
         Caption         =   "Display"
         Height          =   375
         Left            =   -71040
         TabIndex        =   164
         Top             =   660
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplay_Alpha 
         Caption         =   "Display"
         Height          =   375
         Left            =   -70800
         TabIndex        =   163
         Top             =   2700
         Width           =   1335
      End
      Begin VB.ComboBox cboDecayNuc 
         Height          =   315
         Left            =   -74280
         TabIndex        =   161
         Text            =   "cboDecayNuc"
         Top             =   120
         Width           =   1125
      End
      Begin VB.CommandButton cmdDisplay_Risk 
         Caption         =   "Display"
         Height          =   375
         Left            =   -72840
         TabIndex        =   160
         Top             =   3000
         Width           =   1335
      End
      Begin VB.CommandButton cmdHelp68 
         Caption         =   "Help"
         Height          =   375
         Left            =   -72000
         TabIndex        =   159
         Top             =   3240
         Width           =   1335
      End
      Begin VB.CommandButton cmdHelp72Ing 
         Caption         =   "Help"
         Height          =   375
         Left            =   -72000
         TabIndex        =   158
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton cmdHelp72Inh 
         Caption         =   "Help"
         Height          =   375
         Left            =   -72000
         TabIndex        =   157
         Top             =   3960
         Width           =   1335
      End
      Begin VB.Frame FrameElectron 
         Caption         =   "Select:"
         Height          =   2535
         Left            =   -74760
         TabIndex        =   150
         Top             =   720
         Width           =   2535
         Begin VB.CheckBox chkElectron 
            Caption         =   "Stopping Power - Collision"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   156
            Top             =   240
            Width           =   2175
         End
         Begin VB.CheckBox chkElectron 
            Caption         =   "Stopping Power - Radiative"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   155
            Top             =   600
            Width           =   2295
         End
         Begin VB.CheckBox chkElectron 
            Caption         =   "Stopping Power - Total"
            Height          =   255
            Index           =   3
            Left            =   120
            TabIndex        =   154
            Top             =   960
            Value           =   1  'Checked
            Width           =   2055
         End
         Begin VB.CheckBox chkElectron 
            Caption         =   "CSDA Range"
            Height          =   255
            Index           =   4
            Left            =   120
            TabIndex        =   153
            Top             =   1320
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkElectron 
            Caption         =   "Radiation Yield"
            Height          =   255
            Index           =   5
            Left            =   120
            TabIndex        =   152
            Top             =   1680
            Width           =   1455
         End
         Begin VB.CheckBox chkElectron 
            Caption         =   "Density Effect Delta"
            Height          =   255
            Index           =   6
            Left            =   120
            TabIndex        =   151
            Top             =   2040
            Width           =   1815
         End
      End
      Begin VB.Frame FramePhoton 
         Caption         =   "Select:"
         Height          =   3615
         Left            =   -74760
         TabIndex        =   141
         Top             =   720
         Width           =   2535
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Total Attenuation with Coherent Scattering"
            Height          =   495
            Index           =   6
            Left            =   120
            TabIndex        =   149
            Top             =   2160
            Value           =   1  'Checked
            Width           =   2055
         End
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Pair Production in an Electron Field"
            Height          =   495
            Index           =   5
            Left            =   120
            TabIndex        =   148
            Top             =   1680
            Width           =   2175
         End
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Pair Production in a Nuclear Field"
            Height          =   495
            Index           =   4
            Left            =   120
            TabIndex        =   147
            Top             =   1200
            Width           =   1815
         End
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Photo-Electric Absorption"
            Height          =   255
            Index           =   3
            Left            =   120
            TabIndex        =   146
            Top             =   960
            Width           =   2175
         End
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Scattering - Incoherent"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   145
            Top             =   600
            Width           =   1935
         End
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Scattering - Coherent"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   144
            Top             =   240
            Width           =   1815
         End
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Total Attenuation without Coherent Scattering"
            Height          =   495
            Index           =   7
            Left            =   120
            TabIndex        =   143
            Top             =   2640
            Value           =   1  'Checked
            Width           =   2175
         End
         Begin VB.CheckBox chkPhoton 
            Caption         =   "Mass Energy-Absorption"
            Height          =   375
            Index           =   8
            Left            =   120
            TabIndex        =   142
            Top             =   3120
            Width           =   2295
         End
      End
      Begin VB.ComboBox cboElectron 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   140
         Top             =   240
         Width           =   800
      End
      Begin VB.ComboBox cboPhoton 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   139
         Top             =   240
         Width           =   800
      End
      Begin VB.ComboBox cboProton 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   138
         Top             =   240
         Width           =   800
      End
      Begin VB.ComboBox cboAlpha 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   137
         Top             =   240
         Width           =   800
      End
      Begin VB.CommandButton cmdUnits_ICRP38 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -69720
         TabIndex        =   136
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Risk 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -72840
         TabIndex        =   135
         Top             =   2520
         Width           =   1335
      End
      Begin VB.ComboBox cboMaterial 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   134
         Top             =   240
         Width           =   5535
      End
      Begin VB.ComboBox cboAtom 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   132
         Top             =   240
         Width           =   885
      End
      Begin VB.TextBox lblAlphaUnits 
         BackColor       =   &H80000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   -70800
         TabIndex        =   131
         Text            =   " g / cm^2"
         Top             =   2100
         Width           =   1455
      End
      Begin VB.TextBox lblElectronUnits 
         BackColor       =   &H80000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   -70800
         TabIndex        =   130
         Text            =   " g / cm^2"
         Top             =   2100
         Width           =   1445
      End
      Begin VB.Frame optAlpha 
         Caption         =   "Select:"
         Height          =   1815
         Left            =   -74760
         TabIndex        =   125
         Top             =   780
         Width           =   2535
         Begin VB.CheckBox chkAlpha 
            Caption         =   "CSDA Range"
            Height          =   255
            Index           =   4
            Left            =   120
            TabIndex        =   129
            Top             =   1320
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkAlpha 
            Caption         =   "Total Stopping Power"
            Height          =   255
            Index           =   3
            Left            =   120
            TabIndex        =   128
            Top             =   960
            Value           =   1  'Checked
            Width           =   2055
         End
         Begin VB.CheckBox chkAlpha 
            Caption         =   "Nuclear Stopping Power"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   127
            Top             =   600
            Width           =   2295
         End
         Begin VB.CheckBox chkAlpha 
            Caption         =   "Electronic Stopping Power"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   126
            Top             =   240
            Width           =   2175
         End
      End
      Begin VB.CommandButton cmdDisplayPhotonField 
         Caption         =   "Display"
         Height          =   375
         Left            =   -74640
         TabIndex        =   124
         Top             =   4080
         Width           =   1335
      End
      Begin VB.CommandButton cmdDisplayNeutronField 
         Caption         =   "Display"
         Height          =   375
         Left            =   -74640
         TabIndex        =   123
         Top             =   3600
         Width           =   1335
      End
      Begin VB.TextBox lblPhotonUnits 
         BackColor       =   &H80000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   -70800
         TabIndex        =   122
         Text            =   " cm^2 / g"
         Top             =   1320
         Width           =   1445
      End
      Begin VB.TextBox lblAlphaEUnits 
         BackColor       =   &H80000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   -70800
         TabIndex        =   121
         Text            =   "MeV cm^2 /  g"
         Top             =   1380
         Width           =   2055
      End
      Begin VB.TextBox lblElectronEUnits 
         BackColor       =   &H80000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   -70800
         TabIndex        =   120
         Text            =   "MeV cm^2 /   g"
         Top             =   1380
         Width           =   2055
      End
      Begin VB.CommandButton cmdUnits_NField 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -74640
         TabIndex        =   119
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_PField 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -74640
         TabIndex        =   118
         Top             =   2520
         Width           =   1335
      End
      Begin VB.ComboBox cboEarlyNuc 
         Height          =   315
         Left            =   -74160
         TabIndex        =   116
         Text            =   "Ac-224"
         Top             =   240
         Width           =   1245
      End
      Begin VB.ComboBox cboEarlyType 
         Height          =   315
         ItemData        =   "frmRadTool.frx":2678
         Left            =   -73440
         List            =   "frmRadTool.frx":267A
         Style           =   2  'Dropdown List
         TabIndex        =   115
         Top             =   720
         Width           =   1000
      End
      Begin VB.CommandButton cmdDisplay_Early 
         Caption         =   "Display"
         Height          =   375
         Left            =   -71520
         TabIndex        =   114
         Top             =   2880
         Width           =   1335
      End
      Begin VB.CommandButton cmdUnits_Early 
         Caption         =   "Select Units"
         Height          =   375
         Left            =   -71520
         TabIndex        =   113
         Top             =   1680
         Width           =   1335
      End
      Begin VB.CommandButton cmdBackBody 
         Caption         =   "Background Radiation in the Body"
         Height          =   375
         Left            =   -74640
         TabIndex        =   112
         Top             =   720
         Width           =   3480
      End
      Begin VB.CommandButton cmdMaterials 
         Caption         =   "Radionuclides in Materials"
         Height          =   375
         Left            =   -74640
         TabIndex        =   111
         Top             =   1320
         Width           =   3495
      End
      Begin VB.CommandButton cmdPrimordial 
         Caption         =   " Primordial Radionuclides"
         Height          =   375
         Left            =   -74640
         TabIndex        =   110
         Top             =   2520
         Width           =   3495
      End
      Begin VB.CommandButton cmdMedical 
         Caption         =   "Typical Exposures during Medical Procedures"
         Height          =   375
         Left            =   -74640
         TabIndex        =   109
         Top             =   3120
         Width           =   3495
      End
      Begin VB.CommandButton cmdDevices 
         Caption         =   "Radionuclides in Devices"
         Height          =   375
         Left            =   -74640
         TabIndex        =   108
         Top             =   1920
         Width           =   3495
      End
      Begin VB.PictureBox picPhoton 
         Height          =   6375
         Left            =   -71040
         Picture         =   "frmRadTool.frx":267C
         ScaleHeight     =   6315
         ScaleWidth      =   2595
         TabIndex        =   102
         Top             =   120
         Width           =   2655
      End
      Begin VB.PictureBox picNeutron 
         Height          =   6375
         Left            =   -71040
         Picture         =   "frmRadTool.frx":5336
         ScaleHeight     =   6315
         ScaleWidth      =   2595
         TabIndex        =   101
         Top             =   120
         Width           =   2655
      End
      Begin VB.CommandButton cmdNatBack 
         Caption         =   "Natural Background Radiation"
         Height          =   375
         Left            =   -74640
         TabIndex        =   100
         Top             =   240
         Width           =   3480
      End
      Begin VB.Frame Frame1 
         Caption         =   "Radiation Health Effects"
         Height          =   735
         Left            =   -74640
         TabIndex        =   97
         Top             =   4320
         Width           =   6615
         Begin VB.ComboBox cboThreshold 
            Height          =   315
            Left            =   1200
            TabIndex        =   99
            Top             =   240
            Width           =   2895
         End
         Begin VB.CommandButton cmdThreshold 
            Caption         =   "Display"
            Height          =   375
            Left            =   120
            TabIndex        =   98
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Composition of Tissues"
         Height          =   735
         Left            =   -74640
         TabIndex        =   94
         Top             =   1800
         Width           =   6615
         Begin VB.ComboBox cboTissue 
            Height          =   315
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   96
            Top             =   240
            Width           =   4455
         End
         Begin VB.CommandButton cmdTissue 
            Caption         =   "Display"
            Height          =   375
            Left            =   120
            TabIndex        =   95
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Organ Masses - ICRP 23/89/72"
         Height          =   735
         Left            =   -74640
         TabIndex        =   90
         Top             =   2640
         Width           =   6615
         Begin VB.CommandButton cmdOrganMassUnits 
            Caption         =   "Select Units"
            Height          =   375
            Left            =   2640
            TabIndex        =   92
            Top             =   240
            Width           =   1215
         End
         Begin VB.CommandButton cmdOrganMasses 
            Caption         =   "Display"
            Height          =   375
            Left            =   120
            TabIndex        =   91
            Top             =   240
            Width           =   975
         End
         Begin VB.Label lblMassUnits 
            BorderStyle     =   1  'Fixed Single
            Caption         =   " g"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   12
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4080
            TabIndex        =   93
            Top             =   240
            Width           =   735
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Web Pages"
         Height          =   855
         Left            =   -74640
         TabIndex        =   87
         Top             =   3360
         Width           =   6495
         Begin VB.CommandButton cmdLinks 
            Caption         =   "Display"
            Height          =   375
            Left            =   240
            TabIndex        =   89
            Top             =   360
            Width           =   975
         End
         Begin VB.ComboBox cboWebLinks 
            Height          =   315
            Left            =   1320
            TabIndex        =   88
            Text            =   "Combo1"
            Top             =   360
            Width           =   4215
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Formulas"
         Height          =   735
         Left            =   -74640
         TabIndex        =   84
         Top             =   2520
         Width           =   6495
         Begin VB.CommandButton cmdFormulas 
            Caption         =   "Display"
            Height          =   375
            Left            =   240
            TabIndex        =   86
            Top             =   240
            Width           =   975
         End
         Begin VB.ComboBox cboFormulas 
            Height          =   315
            Left            =   1320
            TabIndex        =   85
            Text            =   "Combo1"
            Top             =   240
            Width           =   3615
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Units, Constants, Conversion Factors"
         Height          =   1455
         Left            =   -74640
         TabIndex        =   79
         Top             =   120
         Width           =   6495
         Begin VB.CommandButton cmdConversionFactors 
            Caption         =   "Conversion Factors"
            Height          =   375
            Left            =   4440
            TabIndex        =   82
            Top             =   360
            Width           =   1575
         End
         Begin VB.CommandButton cmdSIUnits 
            Caption         =   "SI Units"
            Height          =   375
            Left            =   120
            TabIndex        =   81
            Top             =   360
            Width           =   1575
         End
         Begin VB.CommandButton cmdPhysConstants 
            Caption         =   "Physical Constants"
            Height          =   375
            Left            =   2400
            TabIndex        =   80
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label17 
            Appearance      =   0  'Flat
            BackColor       =   &H80000004&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Conversion factors are from  the 77th edition of the CRC Handbook of Chemistry and Physics, 1996, Chemical Rubber Publishing Co."
            ForeColor       =   &H80000008&
            Height          =   495
            Left            =   120
            TabIndex        =   83
            Top             =   840
            Width           =   5895
         End
      End
      Begin VB.ComboBox cboAlphaMat 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   78
         Top             =   240
         Width           =   5535
      End
      Begin VB.ComboBox cboElectronMat 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   77
         Top             =   240
         Width           =   5535
      End
      Begin VB.ComboBox cboPhotonMat 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   76
         Top             =   240
         Width           =   5535
      End
      Begin VB.Frame Frame8 
         Caption         =   "Organs displayed:"
         Height          =   1335
         Left            =   -71520
         TabIndex        =   74
         Top             =   120
         Width           =   2895
         Begin VB.Label Label18 
            Caption         =   $"frmRadTool.frx":7FF0
            Height          =   855
            Left            =   120
            TabIndex        =   75
            Top             =   360
            Width           =   2535
         End
      End
      Begin VB.Frame Frame9 
         Caption         =   "Biokinetic Models"
         Height          =   735
         Left            =   -74640
         TabIndex        =   71
         Top             =   120
         Width           =   6615
         Begin VB.CommandButton cmdBiokineticBio 
            Caption         =   "Display"
            Height          =   375
            Left            =   120
            TabIndex        =   73
            Top             =   240
            Width           =   975
         End
         Begin VB.ComboBox cboBiokinetic 
            Height          =   315
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   72
            Top             =   240
            Width           =   1455
         End
      End
      Begin VB.CheckBox chkExtDau 
         Caption         =   "Include All Daughters?"
         Height          =   375
         Left            =   -72000
         TabIndex        =   70
         Top             =   2400
         Width           =   2175
      End
      Begin VB.CheckBox chkICRP68Dau 
         Caption         =   "Include daughters with T1/2 > 10 m?"
         Height          =   375
         Left            =   -72000
         TabIndex        =   69
         Top             =   1200
         Width           =   3255
      End
      Begin VB.CheckBox chkICRP30Dau 
         Caption         =   "Include daughters with T1/2 > 10 m?"
         Height          =   375
         Left            =   3000
         TabIndex        =   68
         Top             =   1200
         Width           =   3060
      End
      Begin VB.CheckBox chk72IngDau 
         Caption         =   "Include daughters with T1/2 > 10 m?"
         Height          =   375
         Left            =   -72000
         TabIndex        =   67
         Top             =   2040
         Width           =   3015
      End
      Begin VB.CheckBox chk72InhDau 
         Caption         =   "Include daughters with T1/2 > 10 m?"
         Height          =   375
         Left            =   -72000
         TabIndex        =   66
         Top             =   2040
         Width           =   3135
      End
      Begin VB.CommandButton cmdExtPaste 
         Caption         =   "Paste Decay Results"
         Height          =   375
         Left            =   -72000
         TabIndex        =   65
         Top             =   2400
         Width           =   1930
      End
      Begin VB.CommandButton cmdICRP30Paste 
         Caption         =   "Paste Decay Results"
         Height          =   375
         Left            =   3000
         TabIndex        =   64
         Top             =   1200
         Width           =   1930
      End
      Begin VB.CommandButton cmdICRP68Paste 
         Caption         =   "Paste Decay results"
         Height          =   375
         Left            =   -72000
         TabIndex        =   63
         Top             =   1200
         Width           =   1930
      End
      Begin VB.CommandButton cmd72IngPaste 
         Caption         =   "Paste Decay Results"
         Height          =   375
         Left            =   -72000
         TabIndex        =   62
         Top             =   2040
         Width           =   1930
      End
      Begin VB.CommandButton cmd72InhPaste 
         Caption         =   "Paste Decay Results"
         Height          =   375
         Left            =   -72000
         TabIndex        =   61
         Top             =   2040
         Width           =   1930
      End
      Begin VB.CommandButton cmdNeutronFieldHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -73080
         TabIndex        =   60
         Top             =   3600
         Width           =   1335
      End
      Begin VB.CommandButton cmdPhotonFieldHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   -73080
         TabIndex        =   59
         Top             =   4080
         Width           =   1335
      End
      Begin VB.CommandButton cmdFGR12Help 
         Caption         =   "Help"
         Height          =   375
         Left            =   -72000
         TabIndex        =   58
         Top             =   4440
         Width           =   1335
      End
      Begin VB.CommandButton cmdICRP30Help 
         Caption         =   "Help"
         Height          =   375
         Left            =   3000
         TabIndex        =   57
         Top             =   3240
         Width           =   1335
      End
      Begin VB.Frame Frame10 
         Caption         =   "Bioassay Data"
         Height          =   735
         Left            =   -74640
         TabIndex        =   52
         Top             =   960
         Width           =   6615
         Begin VB.ComboBox cboBioNuc 
            Height          =   315
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   55
            Top             =   240
            Width           =   1095
         End
         Begin VB.CommandButton cmdBioassay 
            Caption         =   "Display"
            Height          =   375
            Left            =   120
            TabIndex        =   54
            Top             =   240
            Width           =   975
         End
         Begin VB.ComboBox cboBioType 
            Height          =   315
            Left            =   3240
            Style           =   2  'Dropdown List
            TabIndex        =   53
            Top             =   240
            Width           =   615
         End
         Begin VB.Label Label20 
            Caption         =   "Type:"
            Height          =   195
            Left            =   2760
            TabIndex        =   56
            Top             =   240
            Width           =   405
         End
      End
      Begin VB.Frame Frame11 
         Caption         =   "ICRP89 Reference Values"
         Height          =   735
         Left            =   -74640
         TabIndex        =   49
         Top             =   3480
         Width           =   6615
         Begin VB.CommandButton cmdICRP89 
            Caption         =   "ICRP 89 Data"
            Height          =   375
            Left            =   120
            TabIndex        =   51
            Top             =   240
            Width           =   1575
         End
         Begin VB.ComboBox cboICRP89 
            Height          =   315
            ItemData        =   "frmRadTool.frx":8099
            Left            =   2040
            List            =   "frmRadTool.frx":809B
            Style           =   2  'Dropdown List
            TabIndex        =   50
            Top             =   240
            Width           =   1815
         End
      End
      Begin VB.ComboBox cboGPElement 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   48
         Top             =   240
         Width           =   800
      End
      Begin VB.CommandButton cmdDisplayGP 
         Caption         =   "Display"
         Height          =   375
         Left            =   -71280
         TabIndex        =   47
         Top             =   720
         Width           =   1335
      End
      Begin VB.CommandButton cmdNIST 
         Caption         =   "Periodic Table (NIST)"
         Enabled         =   0   'False
         Height          =   375
         Left            =   -74640
         TabIndex        =   46
         Top             =   6120
         Visible         =   0   'False
         Width           =   2055
      End
      Begin VB.PictureBox Picture1 
         Height          =   3975
         Left            =   -74520
         Picture         =   "frmRadTool.frx":809D
         ScaleHeight     =   3915
         ScaleWidth      =   5835
         TabIndex        =   45
         Top             =   1800
         Width           =   5895
      End
      Begin VB.Frame Frame12 
         Caption         =   "Decay time for activity calculation"
         Height          =   855
         Left            =   -71400
         TabIndex        =   42
         Top             =   2160
         Width           =   2655
         Begin VB.TextBox txtDecayTime 
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000E+00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   6
            EndProperty
            Height          =   285
            Left            =   240
            TabIndex        =   44
            Text            =   "1.0"
            Top             =   360
            Width           =   975
         End
         Begin VB.ComboBox cboDecayTimeUnits 
            Height          =   315
            ItemData        =   "frmRadTool.frx":FB7E
            Left            =   1440
            List            =   "frmRadTool.frx":FB80
            TabIndex        =   43
            Text            =   "years"
            Top             =   360
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   0
         Left            =   3000
         TabIndex        =   41
         Top             =   3720
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   1
         Left            =   -72000
         TabIndex        =   40
         Top             =   3720
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   2
         Left            =   -72000
         TabIndex        =   39
         Top             =   4440
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   3
         Left            =   -72000
         TabIndex        =   38
         Top             =   4440
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   4
         Left            =   -72000
         TabIndex        =   37
         Top             =   4920
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   5
         Left            =   -69840
         TabIndex        =   36
         Top             =   4380
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   6
         Left            =   -70570
         TabIndex        =   35
         Top             =   1800
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   7
         Left            =   -70800
         TabIndex        =   34
         Top             =   5160
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   8
         Left            =   -71040
         TabIndex        =   33
         Top             =   1320
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   9
         Left            =   -70800
         TabIndex        =   32
         Top             =   2880
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   10
         Left            =   -70800
         TabIndex        =   31
         Top             =   3840
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   11
         Left            =   -71040
         TabIndex        =   30
         Top             =   1140
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   12
         Left            =   -70800
         TabIndex        =   29
         Top             =   3720
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   14
         Left            =   -71040
         TabIndex        =   28
         Top             =   2340
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   15
         Left            =   -69480
         TabIndex        =   27
         Top             =   5400
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   16
         Left            =   -70200
         TabIndex        =   26
         Top             =   6120
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   17
         Left            =   -73080
         TabIndex        =   25
         Top             =   4680
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   18
         Left            =   -73080
         TabIndex        =   24
         Top             =   4080
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   19
         Left            =   -71520
         TabIndex        =   23
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton cmdRef 
         Caption         =   "Refs"
         Height          =   375
         Index           =   20
         Left            =   -69720
         TabIndex        =   22
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Frame Frame14 
         Caption         =   "DOE Dose Ranges"
         Height          =   855
         Left            =   -74640
         TabIndex        =   20
         Top             =   4320
         Width           =   6495
         Begin VB.CommandButton cmdDoseRangeSv 
            Caption         =   "Display"
            Height          =   375
            Left            =   240
            TabIndex        =   21
            Top             =   360
            Width           =   975
         End
      End
      Begin VB.ComboBox cboGPMaterial 
         Height          =   315
         Left            =   -74760
         Style           =   2  'Dropdown List
         TabIndex        =   19
         Top             =   240
         Width           =   5535
      End
      Begin VB.Frame Frame2 
         Caption         =   "Inhalation Rates"
         Enabled         =   0   'False
         Height          =   735
         Left            =   -74640
         TabIndex        =   16
         Top             =   5160
         Visible         =   0   'False
         Width           =   3135
         Begin VB.ComboBox cboInhRates 
            Height          =   315
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   18
            Top             =   240
            Width           =   1695
         End
         Begin VB.CommandButton cmdInhRates 
            Caption         =   "Display"
            Height          =   375
            Left            =   120
            TabIndex        =   17
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdFoodRates 
         Caption         =   "Food Intake Rates"
         Enabled         =   0   'False
         Height          =   375
         Left            =   -74640
         TabIndex        =   15
         Top             =   6120
         Visible         =   0   'False
         Width           =   1575
      End
      Begin VB.Frame Frame15 
         Caption         =   "Transport Package Regulations - 10 CFR 71"
         Height          =   855
         Left            =   -74640
         TabIndex        =   13
         Top             =   5280
         Width           =   6495
         Begin VB.CommandButton cmdA1A2 
            Caption         =   "A1/A2 Table"
            Height          =   375
            Left            =   240
            TabIndex        =   14
            Top             =   360
            Width           =   1575
         End
      End
      Begin VB.CommandButton cmdAKRC 
         Caption         =   "Air-Kerma Rate Constants"
         Height          =   495
         Left            =   -69840
         TabIndex        =   12
         Top             =   4920
         Width           =   1335
      End
      Begin TrueDBGrid80.TDBGrid grdTimes 
         Height          =   2775
         Left            =   -74520
         TabIndex        =   103
         Top             =   1080
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   4895
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Integration Periods"
         Columns(0).DataField=   ""
         Columns(0).NumberFormat=   "General Number"
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1826"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1746"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   2
         FootLines       =   1
         MultipleLines   =   0
         CellTipsWidth   =   0
         MultiSelect     =   0
         DeadAreaBackColor=   13160660
         RowDividerColor =   13160660
         RowSubDividerColor=   13160660
         DirectionAfterEnter=   1
         DirectionAfterTab=   1
         MaxRows         =   250000
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=255,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin CSOptLib.CSOptList optRBE 
         Height          =   2655
         Left            =   -75000
         TabIndex        =   104
         Top             =   2160
         Visible         =   0   'False
         Width           =   2655
         _Version        =   262145
         _ExtentX        =   4683
         _ExtentY        =   4683
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Contents        =   $"frmRadTool.frx":FB82
         Caption         =   "Compute dose or dose equivalent?"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Begin TrueDBGrid80.TDBGrid grdRBE 
            Height          =   1335
            Left            =   240
            TabIndex        =   105
            Top             =   1080
            Width           =   3255
            _ExtentX        =   5741
            _ExtentY        =   2355
            _LayoutType     =   4
            _RowHeight      =   -2147483647
            _WasPersistedAsPixels=   0
            Columns(0)._VlistStyle=   0
            Columns(0)._MaxComboItems=   5
            Columns(0).Caption=   "Organ"
            Columns(0).DataField=   ""
            Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
            Columns(1)._VlistStyle=   0
            Columns(1)._MaxComboItems=   5
            Columns(1).Caption=   "RBE"
            Columns(1).DataField=   ""
            Columns(1).NumberFormat=   "General Number"
            Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
            Columns.Count   =   2
            Splits(0)._UserFlags=   0
            Splits(0).RecordSelectorWidth=   503
            Splits(0).DividerColor=   13160660
            Splits(0).SpringMode=   0   'False
            Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
            Splits(0)._ColumnProps(0)=   "Columns.Count=2"
            Splits(0)._ColumnProps(1)=   "Column(0).Width=3228"
            Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
            Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=3149"
            Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
            Splits(0)._ColumnProps(5)=   "Column(1).Width=1879"
            Splits(0)._ColumnProps(6)=   "Column(1).DividerColor=0"
            Splits(0)._ColumnProps(7)=   "Column(1)._WidthInPix=1799"
            Splits(0)._ColumnProps(8)=   "Column(1).Order=2"
            Splits.Count    =   1
            PrintInfos(0)._StateFlags=   0
            PrintInfos(0).Name=   "piInternal 0"
            PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
            PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
            PrintInfos(0).PageHeaderHeight=   0
            PrintInfos(0).PageFooterHeight=   0
            PrintInfos.Count=   1
            DataMode        =   4
            DefColWidth     =   0
            EditDropDown    =   0   'False
            HeadLines       =   1
            FootLines       =   1
            MultipleLines   =   0
            CellTipsWidth   =   0
            DeadAreaBackColor=   13160660
            RowDividerColor =   13160660
            RowSubDividerColor=   13160660
            DirectionAfterEnter=   1
            DirectionAfterTab=   1
            MaxRows         =   250000
            _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
            _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
            _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
            _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
            _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=252,.bold=0,.fontsize=825,.italic=0"
            _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
            _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
            _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
            _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
            _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
            _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
            _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
            _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
            _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
            _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
            _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
            _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
            _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
            _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
            _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
            _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
            _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
            _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
            _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
            _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
            _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
            _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
            _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
            _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
            _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
            _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
            _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
            _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
            _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
            _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
            _StyleDefs(34)  =   "Splits(0).Columns(1).Style:id=32,.parent=13"
            _StyleDefs(35)  =   "Splits(0).Columns(1).HeadingStyle:id=29,.parent=14"
            _StyleDefs(36)  =   "Splits(0).Columns(1).FooterStyle:id=30,.parent=15"
            _StyleDefs(37)  =   "Splits(0).Columns(1).EditorStyle:id=31,.parent=17"
            _StyleDefs(38)  =   "Named:id=33:Normal"
            _StyleDefs(39)  =   ":id=33,.parent=0"
            _StyleDefs(40)  =   "Named:id=34:Heading"
            _StyleDefs(41)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
            _StyleDefs(42)  =   ":id=34,.wraptext=-1"
            _StyleDefs(43)  =   "Named:id=35:Footing"
            _StyleDefs(44)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
            _StyleDefs(45)  =   "Named:id=36:Selected"
            _StyleDefs(46)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
            _StyleDefs(47)  =   "Named:id=37:Caption"
            _StyleDefs(48)  =   ":id=37,.parent=34,.alignment=2"
            _StyleDefs(49)  =   "Named:id=38:HighlightRow"
            _StyleDefs(50)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
            _StyleDefs(51)  =   "Named:id=39:EvenRow"
            _StyleDefs(52)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
            _StyleDefs(53)  =   "Named:id=40:OddRow"
            _StyleDefs(54)  =   ":id=40,.parent=33"
            _StyleDefs(55)  =   "Named:id=41:RecordSelector"
            _StyleDefs(56)  =   ":id=41,.parent=34"
            _StyleDefs(57)  =   "Named:id=42:FilterBar"
            _StyleDefs(58)  =   ":id=42,.parent=33"
         End
         Begin VB.Label Label12 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000004&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Low LET only; RBE not used"
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   240
            TabIndex        =   106
            Top             =   840
            Visible         =   0   'False
            Width           =   2085
         End
      End
      Begin CSOptLib.CSOptList optIntUnits 
         Height          =   855
         Left            =   -72960
         TabIndex        =   107
         Top             =   1080
         Width           =   855
         _Version        =   262145
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FBA7
         LeftMargin      =   7
         TopMargin       =   13
         ItemGap         =   2
         Caption         =   ""
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optICRP38Cutoff 
         Height          =   1575
         Left            =   -74520
         TabIndex        =   117
         Top             =   2160
         Width           =   2655
         _Version        =   262145
         _ExtentX        =   4683
         _ExtentY        =   2778
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FBB6
         Caption         =   "Select level of E * I data to display"
         ListIndex       =   4
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optCompSort 
         Height          =   1095
         Left            =   -74760
         TabIndex        =   133
         Top             =   2400
         Visible         =   0   'False
         Width           =   2655
         _Version        =   262145
         _ExtentX        =   4683
         _ExtentY        =   1931
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Contents        =   $"frmRadTool.frx":FC16
         Caption         =   "Sort by:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optDecayType 
         Height          =   1815
         Left            =   -72600
         TabIndex        =   162
         Top             =   120
         Width           =   2175
         _Version        =   262145
         _ExtentX        =   3836
         _ExtentY        =   3201
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FC49
         Caption         =   "Select type of data:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList opt72ing 
         Height          =   1815
         Left            =   -72000
         TabIndex        =   184
         Top             =   120
         Width           =   1575
         _Version        =   262145
         _ExtentX        =   2778
         _ExtentY        =   3201
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FCAC
         Caption         =   "Select age:"
         ListIndex       =   5
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optICRP38 
         Height          =   975
         Left            =   3000
         TabIndex        =   185
         Top             =   120
         Width           =   1695
         _Version        =   262145
         _ExtentX        =   2990
         _ExtentY        =   1720
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FCE8
         Caption         =   "Select intake mode:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList opt72Inh 
         Height          =   1815
         Left            =   -72000
         TabIndex        =   186
         Top             =   120
         Width           =   1575
         _Version        =   262145
         _ExtentX        =   2778
         _ExtentY        =   3201
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FD01
         Caption         =   "Select age:"
         ListIndex       =   5
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optICRP68 
         Height          =   975
         Left            =   -72000
         TabIndex        =   187
         Top             =   120
         Width           =   1695
         _Version        =   262145
         _ExtentX        =   2990
         _ExtentY        =   1720
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FD3D
         Caption         =   "Select intake mode:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optExternal 
         Height          =   2175
         Left            =   -72000
         TabIndex        =   188
         Top             =   120
         Width           =   1935
         _Version        =   262145
         _ExtentX        =   3413
         _ExtentY        =   3836
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FD56
         Caption         =   "Select exposure mode:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin TrueDBGrid80.TDBDropDown ddExt 
         Bindings        =   "frmRadTool.frx":FDBB
         Height          =   3885
         Left            =   -74400
         TabIndex        =   189
         Top             =   600
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   6853
         _LayoutType     =   1
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).ExtendRightColumn=   -1  'True
         Splits(0).MarqueeStyle=   3
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
         Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
         Splits(0)._ColumnProps(5)=   "Column(0).Order=1"
         Splits.Count    =   1
         AllowRowSizing  =   0   'False
         Appearance      =   1
         BorderStyle     =   1
         ColumnHeaders   =   0   'False
         DataMode        =   0
         DefColWidth     =   0
         Enabled         =   -1  'True
         HeadLines       =   1
         RowDividerStyle =   2
         LayoutName      =   ""
         LayoutFileName  =   ""
         LayoutURL       =   ""
         EmptyRows       =   0   'False
         ListField       =   "Nuclide"
         DataField       =   ""
         IntegralHeight  =   -1  'True
         FetchRowStyle   =   0   'False
         AlternatingRowStyle=   0   'False
         ColumnFooters   =   0   'False
         FootLines       =   1
         DeadAreaBackColor=   13160660
         ValueTranslate  =   0   'False
         RowDividerColor =   12632256
         RowSubDividerColor=   12632256
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdExt 
         Height          =   3855
         Left            =   -74760
         TabIndex        =   190
         Top             =   120
         Width           =   1700
         _ExtentX        =   2990
         _ExtentY        =   6800
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   ""
         Columns(0).DataWidth=   255
         Columns(0).DropDown=   "ddExt"
         Columns(0).DropDown.vt=   8
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1826"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1746"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         AllowDelete     =   -1  'True
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   1
         FootLines       =   1
         ExposeCellMode  =   1
         MultipleLines   =   0
         EmptyRows       =   -1  'True
         CellTipsWidth   =   0
         DeadAreaBackColor=   13160660
         RowDividerColor =   13160660
         RowSubDividerColor=   13160660
         DirectionAfterEnter=   2
         DirectionAfterTab=   1
         MaxRows         =   250000
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin CSOptLib.CSOptList optKerma 
         Height          =   2655
         Left            =   -74760
         TabIndex        =   195
         Top             =   120
         Width           =   5895
         _Version        =   262145
         _ExtentX        =   10398
         _ExtentY        =   4683
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FDD1
         Spacing         =   80
         Caption         =   "Select:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Begin VB.ComboBox cboKermaMaterial 
            Height          =   315
            Left            =   240
            Style           =   2  'Dropdown List
            TabIndex        =   199
            Top             =   960
            Width           =   5535
         End
         Begin VB.ComboBox cboKermaEle 
            Height          =   315
            Left            =   240
            Style           =   2  'Dropdown List
            TabIndex        =   198
            Top             =   600
            Width           =   800
         End
         Begin VB.ComboBox cboNKermaEle 
            Height          =   315
            Left            =   240
            Style           =   2  'Dropdown List
            TabIndex        =   197
            Top             =   1800
            Width           =   800
         End
         Begin VB.ComboBox cboNKermaMaterial 
            Height          =   315
            Left            =   240
            Style           =   2  'Dropdown List
            TabIndex        =   196
            Top             =   2160
            Width           =   5535
         End
      End
      Begin CSOptLib.CSOptList optComp 
         Height          =   975
         Left            =   -74760
         TabIndex        =   200
         Top             =   2520
         Visible         =   0   'False
         Width           =   1815
         _Version        =   262145
         _ExtentX        =   3201
         _ExtentY        =   1720
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Contents        =   $"frmRadTool.frx":FDE4
         Caption         =   "Select:"
         ListIndex       =   1
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optProton 
         Height          =   975
         Left            =   -74760
         TabIndex        =   201
         Top             =   720
         Width           =   1815
         _Version        =   262145
         _ExtentX        =   3201
         _ExtentY        =   1720
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FE04
         Caption         =   "Select"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optMass 
         Height          =   1095
         Left            =   -73320
         TabIndex        =   202
         Top             =   240
         Width           =   1455
         _Version        =   262145
         _ExtentX        =   2566
         _ExtentY        =   1931
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FE22
         Caption         =   "Select:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin TrueDBGrid80.TDBGrid grd38 
         Height          =   4095
         Left            =   240
         TabIndex        =   203
         Top             =   120
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   7223
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   ""
         Columns(0).DataWidth=   255
         Columns(0).DropDown=   "dd38"
         Columns(0).DropDown.vt=   8
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1826"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1746"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         AllowDelete     =   -1  'True
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   1
         FootLines       =   1
         ExposeCellMode  =   1
         MultipleLines   =   0
         EmptyRows       =   -1  'True
         CellTipsWidth   =   0
         DeadAreaBackColor=   13160660
         RowDividerColor =   13160660
         RowSubDividerColor=   13160660
         DirectionAfterEnter=   2
         DirectionAfterTab=   1
         MaxRows         =   250000
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBDropDown dd38 
         Bindings        =   "frmRadTool.frx":FE3E
         Height          =   3885
         Left            =   1320
         TabIndex        =   204
         Top             =   600
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   6853
         _LayoutType     =   1
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).ExtendRightColumn=   -1  'True
         Splits(0).MarqueeStyle=   3
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
         Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
         Splits(0)._ColumnProps(5)=   "Column(0).Order=1"
         Splits.Count    =   1
         AllowRowSizing  =   0   'False
         Appearance      =   1
         BorderStyle     =   1
         ColumnHeaders   =   0   'False
         DataMode        =   0
         DefColWidth     =   0
         Enabled         =   -1  'True
         HeadLines       =   1
         RowDividerStyle =   2
         LayoutName      =   ""
         LayoutFileName  =   ""
         LayoutURL       =   ""
         EmptyRows       =   0   'False
         ListField       =   "Nuclide"
         DataField       =   ""
         IntegralHeight  =   -1  'True
         FetchRowStyle   =   0   'False
         AlternatingRowStyle=   0   'False
         ColumnFooters   =   0   'False
         FootLines       =   1
         DeadAreaBackColor=   13160660
         ValueTranslate  =   0   'False
         RowDividerColor =   12632256
         RowSubDividerColor=   12632256
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBDropDown dd68 
         Bindings        =   "frmRadTool.frx":FE54
         Height          =   3885
         Left            =   -74400
         TabIndex        =   205
         Top             =   720
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   6853
         _LayoutType     =   1
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).ExtendRightColumn=   -1  'True
         Splits(0).MarqueeStyle=   3
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
         Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
         Splits(0)._ColumnProps(5)=   "Column(0).Order=1"
         Splits.Count    =   1
         AllowRowSizing  =   0   'False
         Appearance      =   1
         BorderStyle     =   1
         ColumnHeaders   =   0   'False
         DataMode        =   0
         DefColWidth     =   0
         Enabled         =   -1  'True
         HeadLines       =   1
         RowDividerStyle =   2
         LayoutName      =   ""
         LayoutFileName  =   ""
         LayoutURL       =   ""
         EmptyRows       =   0   'False
         ListField       =   "Nuclide"
         DataField       =   ""
         IntegralHeight  =   -1  'True
         FetchRowStyle   =   0   'False
         AlternatingRowStyle=   0   'False
         ColumnFooters   =   0   'False
         FootLines       =   1
         DeadAreaBackColor=   13160660
         ValueTranslate  =   0   'False
         RowDividerColor =   12632256
         RowSubDividerColor=   12632256
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdICRP68 
         Height          =   3855
         Left            =   -74760
         TabIndex        =   206
         Top             =   120
         Width           =   1700
         _ExtentX        =   2990
         _ExtentY        =   6800
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   ""
         Columns(0).DataWidth=   255
         Columns(0).DropDown=   "dd68"
         Columns(0).DropDown.vt=   8
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1826"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1746"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         AllowDelete     =   -1  'True
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   1
         FootLines       =   1
         ExposeCellMode  =   1
         MultipleLines   =   0
         EmptyRows       =   -1  'True
         CellTipsWidth   =   0
         DeadAreaBackColor=   13160660
         RowDividerColor =   13160660
         RowSubDividerColor=   13160660
         DirectionAfterEnter=   2
         DirectionAfterTab=   1
         MaxRows         =   250000
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grd72Ing 
         Height          =   3855
         Left            =   -74760
         TabIndex        =   207
         Top             =   120
         Width           =   1700
         _ExtentX        =   2990
         _ExtentY        =   6800
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   ""
         Columns(0).DataWidth=   255
         Columns(0).DropDown=   "dd72Ing"
         Columns(0).DropDown.vt=   8
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1826"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1746"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         AllowDelete     =   -1  'True
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   1
         FootLines       =   1
         ExposeCellMode  =   1
         MultipleLines   =   0
         EmptyRows       =   -1  'True
         CellTipsWidth   =   0
         DeadAreaBackColor=   13160660
         RowDividerColor =   13160660
         RowSubDividerColor=   13160660
         DirectionAfterEnter=   2
         DirectionAfterTab=   1
         MaxRows         =   250000
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grd72Inh 
         Height          =   3855
         Left            =   -74760
         TabIndex        =   208
         Top             =   120
         Width           =   1700
         _ExtentX        =   2990
         _ExtentY        =   6800
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   ""
         Columns(0).DataWidth=   255
         Columns(0).DropDown=   "dd72Inh"
         Columns(0).DropDown.vt=   8
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1826"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1746"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         AllowDelete     =   -1  'True
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   1
         FootLines       =   1
         ExposeCellMode  =   1
         MultipleLines   =   0
         EmptyRows       =   -1  'True
         CellTipsWidth   =   0
         DeadAreaBackColor=   13160660
         RowDividerColor =   13160660
         RowSubDividerColor=   13160660
         DirectionAfterEnter=   2
         DirectionAfterTab=   1
         MaxRows         =   250000
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBDropDown dd72Ing 
         Bindings        =   "frmRadTool.frx":FE6D
         Height          =   3885
         Left            =   -73920
         TabIndex        =   209
         Top             =   1080
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   6853
         _LayoutType     =   1
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).ExtendRightColumn=   -1  'True
         Splits(0).MarqueeStyle=   3
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
         Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
         Splits(0)._ColumnProps(5)=   "Column(0).Order=1"
         Splits.Count    =   1
         AllowRowSizing  =   0   'False
         Appearance      =   1
         BorderStyle     =   1
         ColumnHeaders   =   0   'False
         DataMode        =   0
         DefColWidth     =   0
         Enabled         =   -1  'True
         HeadLines       =   1
         RowDividerStyle =   2
         LayoutName      =   ""
         LayoutFileName  =   ""
         LayoutURL       =   ""
         EmptyRows       =   0   'False
         ListField       =   "Nuclide"
         DataField       =   ""
         IntegralHeight  =   -1  'True
         FetchRowStyle   =   0   'False
         AlternatingRowStyle=   0   'False
         ColumnFooters   =   0   'False
         FootLines       =   1
         DeadAreaBackColor=   13160660
         ValueTranslate  =   0   'False
         RowDividerColor =   12632256
         RowSubDividerColor=   12632256
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBDropDown dd72Inh 
         Bindings        =   "frmRadTool.frx":FE82
         Height          =   3885
         Left            =   -73920
         TabIndex        =   210
         Top             =   1200
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   6853
         _LayoutType     =   1
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).ExtendRightColumn=   -1  'True
         Splits(0).MarqueeStyle=   3
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
         Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
         Splits(0)._ColumnProps(5)=   "Column(0).Order=1"
         Splits.Count    =   1
         AllowRowSizing  =   0   'False
         Appearance      =   1
         BorderStyle     =   1
         ColumnHeaders   =   0   'False
         DataMode        =   0
         DefColWidth     =   0
         Enabled         =   -1  'True
         HeadLines       =   1
         RowDividerStyle =   2
         LayoutName      =   ""
         LayoutFileName  =   ""
         LayoutURL       =   ""
         EmptyRows       =   0   'False
         ListField       =   "Nuclide"
         DataField       =   ""
         IntegralHeight  =   -1  'True
         FetchRowStyle   =   0   'False
         AlternatingRowStyle=   0   'False
         ColumnFooters   =   0   'False
         FootLines       =   1
         DeadAreaBackColor=   13160660
         ValueTranslate  =   0   'False
         RowDividerColor =   12632256
         RowSubDividerColor=   12632256
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin CSOptLib.CSOptList optPhotonField 
         Height          =   2295
         Left            =   -74640
         TabIndex        =   211
         Top             =   120
         Width           =   3015
         _Version        =   262145
         _ExtentX        =   5318
         _ExtentY        =   4048
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FE97
         Spacing         =   17
         ItemGap         =   5
         Caption         =   "Select:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optNeutronField 
         Height          =   2295
         Left            =   -74640
         TabIndex        =   212
         Top             =   120
         Width           =   3015
         _Version        =   262145
         _ExtentX        =   5318
         _ExtentY        =   4048
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":FF64
         Spacing         =   17
         ItemGap         =   5
         Caption         =   "Select:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optGSDisplayType 
         Height          =   735
         Left            =   -74760
         TabIndex        =   213
         Top             =   720
         Width           =   2055
         _Version        =   262145
         _ExtentX        =   3625
         _ExtentY        =   1296
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":10031
         TopMargin       =   15
         Spacing         =   13
         ItemGap         =   3
         Caption         =   "Select:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CSOptLib.CSOptList optPath 
         Height          =   1575
         Left            =   -72840
         TabIndex        =   237
         Top             =   240
         Width           =   1695
         _Version        =   262145
         _ExtentX        =   2990
         _ExtentY        =   2778
         _StockProps     =   77
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Contents        =   $"frmRadTool.frx":1005A
         Caption         =   "Select intake mode:"
         ListIndex       =   0
         BeginProperty ItemFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin TrueDBGrid80.TDBDropDown ddRisk 
         Bindings        =   "frmRadTool.frx":1009D
         Height          =   3885
         Left            =   -74160
         TabIndex        =   238
         Top             =   720
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   6853
         _LayoutType     =   1
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   "Nuclide"
         Columns(0).DataWidth=   255
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).ExtendRightColumn=   -1  'True
         Splits(0).MarqueeStyle=   3
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
         Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
         Splits(0)._ColumnProps(5)=   "Column(0).Order=1"
         Splits.Count    =   1
         AllowRowSizing  =   0   'False
         Appearance      =   1
         BorderStyle     =   1
         ColumnHeaders   =   0   'False
         DataMode        =   0
         DefColWidth     =   0
         Enabled         =   -1  'True
         HeadLines       =   1
         RowDividerStyle =   2
         LayoutName      =   ""
         LayoutFileName  =   ""
         LayoutURL       =   ""
         EmptyRows       =   0   'False
         ListField       =   "Nuclide"
         DataField       =   ""
         IntegralHeight  =   -1  'True
         FetchRowStyle   =   0   'False
         AlternatingRowStyle=   0   'False
         ColumnFooters   =   0   'False
         FootLines       =   1
         DeadAreaBackColor=   13160660
         ValueTranslate  =   0   'False
         RowDividerColor =   12632256
         RowSubDividerColor=   12632256
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin TrueDBGrid80.TDBGrid grdRisk 
         Height          =   3855
         Left            =   -74760
         TabIndex        =   239
         Top             =   120
         Width           =   1620
         _ExtentX        =   2858
         _ExtentY        =   6800
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Nuclide"
         Columns(0).DataField=   ""
         Columns(0).DataWidth=   255
         Columns(0).DropDown=   "ddRisk"
         Columns(0).DropDown.vt=   8
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   1
         Splits(0)._UserFlags=   0
         Splits(0).RecordSelectorWidth=   503
         Splits(0).DividerColor=   13160660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=1"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=1826"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1746"
         Splits(0)._ColumnProps(4)=   "Column(0).Order=1"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   0
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         AllowDelete     =   -1  'True
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   1
         FootLines       =   1
         ExposeCellMode  =   1
         MultipleLines   =   0
         EmptyRows       =   -1  'True
         CellTipsWidth   =   0
         DeadAreaBackColor=   13160660
         RowDividerColor =   13160660
         RowSubDividerColor=   13160660
         DirectionAfterEnter=   2
         DirectionAfterTab=   1
         MaxRows         =   250000
         _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
         _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
         _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
         _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
         _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
         _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33"
         _StyleDefs(7)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(8)   =   "HeadingStyle:id=2,.parent=1,.namedParent=34"
         _StyleDefs(9)   =   "FooterStyle:id=3,.parent=1,.namedParent=35"
         _StyleDefs(10)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(11)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
         _StyleDefs(12)  =   "EditorStyle:id=7,.parent=1"
         _StyleDefs(13)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
         _StyleDefs(14)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
         _StyleDefs(15)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
         _StyleDefs(16)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
         _StyleDefs(17)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
         _StyleDefs(18)  =   "Splits(0).Style:id=13,.parent=1"
         _StyleDefs(19)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
         _StyleDefs(20)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
         _StyleDefs(21)  =   "Splits(0).FooterStyle:id=15,.parent=3"
         _StyleDefs(22)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
         _StyleDefs(23)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
         _StyleDefs(24)  =   "Splits(0).EditorStyle:id=17,.parent=7"
         _StyleDefs(25)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
         _StyleDefs(26)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
         _StyleDefs(27)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
         _StyleDefs(28)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
         _StyleDefs(29)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
         _StyleDefs(30)  =   "Splits(0).Columns(0).Style:id=28,.parent=13"
         _StyleDefs(31)  =   "Splits(0).Columns(0).HeadingStyle:id=25,.parent=14"
         _StyleDefs(32)  =   "Splits(0).Columns(0).FooterStyle:id=26,.parent=15"
         _StyleDefs(33)  =   "Splits(0).Columns(0).EditorStyle:id=27,.parent=17"
         _StyleDefs(34)  =   "Named:id=33:Normal"
         _StyleDefs(35)  =   ":id=33,.parent=0"
         _StyleDefs(36)  =   "Named:id=34:Heading"
         _StyleDefs(37)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(38)  =   ":id=34,.wraptext=-1"
         _StyleDefs(39)  =   "Named:id=35:Footing"
         _StyleDefs(40)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(41)  =   "Named:id=36:Selected"
         _StyleDefs(42)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(43)  =   "Named:id=37:Caption"
         _StyleDefs(44)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(45)  =   "Named:id=38:HighlightRow"
         _StyleDefs(46)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(47)  =   "Named:id=39:EvenRow"
         _StyleDefs(48)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(49)  =   "Named:id=40:OddRow"
         _StyleDefs(50)  =   ":id=40,.parent=33"
         _StyleDefs(51)  =   "Named:id=41:RecordSelector"
         _StyleDefs(52)  =   ":id=41,.parent=34"
         _StyleDefs(53)  =   "Named:id=42:FilterBar"
         _StyleDefs(54)  =   ":id=42,.parent=33"
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Nuclide:"
         Height          =   195
         Left            =   -74880
         TabIndex        =   236
         Top             =   120
         Width           =   585
      End
      Begin VB.Label lblExtUnits 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Label3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -72000
         TabIndex        =   235
         Top             =   3360
         Width           =   2655
      End
      Begin VB.Label lblICRP38Units 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Label3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   3000
         TabIndex        =   234
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Label lblICRP68Units 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Label3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -72000
         TabIndex        =   233
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Label lblICRP72IngUnits 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Label3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -72000
         TabIndex        =   232
         Top             =   3000
         Width           =   1935
      End
      Begin VB.Label lblICRP72InhUnits 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Label3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -72000
         TabIndex        =   231
         Top             =   3000
         Width           =   1935
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Units:"
         Height          =   195
         Left            =   -70200
         TabIndex        =   230
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblICRP38SAUnits 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Bq / kg"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -69720
         TabIndex        =   229
         Top             =   960
         Width           =   1575
      End
      Begin VB.Label lblRiskUnit 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "/ Bq"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -71280
         TabIndex        =   228
         Top             =   2520
         Width           =   1815
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Coefficients:"
         Height          =   195
         Left            =   -71760
         TabIndex        =   227
         Top             =   1500
         Width           =   870
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "Range:"
         Height          =   195
         Left            =   -71400
         TabIndex        =   226
         Top             =   2100
         Width           =   525
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "Coefficients:"
         Height          =   195
         Left            =   -71760
         TabIndex        =   225
         Top             =   1560
         Width           =   870
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "Range:"
         Height          =   195
         Left            =   -71400
         TabIndex        =   224
         Top             =   2160
         Width           =   525
      End
      Begin VB.Label lblNeutron 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "pSv  cm^2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -74640
         TabIndex        =   223
         Top             =   3000
         Width           =   1935
      End
      Begin VB.Label lblPhoton1 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "pSv  cm^2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -74640
         TabIndex        =   222
         Top             =   3000
         Width           =   1935
      End
      Begin VB.Label lblPhoton2 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Sv  /  Gy "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -74640
         TabIndex        =   221
         Top             =   3480
         Width           =   1935
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "(Specific Activity)"
         Height          =   195
         Left            =   -69600
         TabIndex        =   220
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Nuclide:"
         Height          =   195
         Left            =   -74760
         TabIndex        =   219
         Top             =   240
         Width           =   585
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         Caption         =   "Absorption Type:"
         Height          =   195
         Left            =   -74760
         TabIndex        =   218
         Top             =   720
         Width           =   1200
      End
      Begin VB.Label lblEarlyUnits 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Label3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -71520
         TabIndex        =   217
         Top             =   2280
         Width           =   1935
      End
      Begin VB.Label Label16 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Note: Biological materials are found under Biological Data"
         Height          =   495
         Left            =   -74760
         TabIndex        =   216
         Top             =   720
         Width           =   2175
      End
      Begin VB.Label lblKermaUnit 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Gy  cm^2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   -70800
         TabIndex        =   215
         Top             =   3360
         Width           =   1935
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Note: For gamma constants, go the Decay Data / Summary display."
         ForeColor       =   &H80000008&
         Height          =   555
         Left            =   -74520
         TabIndex        =   214
         Top             =   5220
         Width           =   2880
      End
   End
   Begin VB.Label Label19 
      AutoSize        =   -1  'True
      Caption         =   "Ing Units:"
      Height          =   195
      Left            =   4440
      TabIndex        =   241
      Top             =   3360
      Width           =   675
   End
   Begin VB.Menu mnuToolbox 
      Caption         =   "&General Help"
   End
   Begin VB.Menu mnuGlossary 
      Caption         =   "&Glossary"
   End
   Begin VB.Menu mnuManual 
      Caption         =   "&View Manual"
   End
   Begin VB.Menu mnuIndex 
      Caption         =   "&Help Index"
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "&About"
   End
End
Attribute VB_Name = "Rad_Toolbox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' File frmRadTool.frm
Option Explicit
Private Const MODULE_NAME As String = "Rad_Toolbox"

Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
   (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" _
   (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias _
      "ShellExecuteA" (ByVal hWnd As Long, ByVal lpszOp As _
      String, ByVal lpszFile As String, ByVal lpszParams As String, _
      ByVal lpszDir As String, ByVal FsShowCmd As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Const SW_SHOWNORMAL = 1
Private Const WS_EX_APPWINDOW = &H40000
Private Const WS_EX_TOOLWINDOW = &H80&
Private Const GWL_EXSTYLE = (-20)
Dim xExt As New XArrayDB
Dim x68 As New XArrayDB
Dim x38 As New XArrayDB

Dim x72Inh As New XArrayDB
Dim x72Ing As New XArrayDB
Dim xRisk As New XArrayDB
Dim nDoseCols As Integer, from38or68 As Integer, myQuery As String

Public Sub RTShowInTaskBar(ByVal hWnd As Long, ByVal bState As Boolean)
   Dim ls As Long

   ls = GetWindowLong(hWnd, GWL_EXSTYLE)
   If (bState) Then
      ls = ls Or WS_EX_APPWINDOW
      ls = ls And Not WS_EX_TOOLWINDOW
   Else
      ls = ls And Not WS_EX_APPWINDOW
   End If
   SetWindowLong hWnd, GWL_EXSTYLE, ls
End Sub

Private Sub cboBioNuc_Validate(Cancel As Boolean)
  Dim sEle As String, i As Integer
  
  Cancel = False
' don't try this until you have the real data
'  Exit Sub
  i = InStr(cboBioNuc.Text, "-")
  If i > 0 Then
    sEle = Mid(cboBioNuc.Text, 1, i - 1)
  Else
   sEle = cboBioNuc.Text
  End If
  ddADoses.DatabaseName = gs_DataPath & "bioassay.mdb"
  ddADoses.RecordSource = "Select Distinct Type from Types where Element = '" & sEle & "'"
  ddADoses.Refresh
  Set rsNuc = ddADoses.Recordset
  rsNuc.MoveFirst
  cboBioType.Clear
  While Not rsNuc.EOF
    cboBioType.AddItem rsNuc("Type")
    rsNuc.MoveNext
  Wend
  cboBioType.ListIndex = 0
  Set rsNuc = Nothing
End Sub

Private Sub cboDecayNuc_Validate(Cancel As Boolean)
  Dim rsNuc As Recordset, sStr As String, Found As Boolean, i As Integer
  Dim FirstChar As String * 1
  
  Cancel = False
  i = Asc(cboDecayNuc.Text)
  If i > 90 Then
    FirstChar = Chr(i - 32)
    sStr = FirstChar & Mid(cboDecayNuc.Text, 2, 5)
    cboDecayNuc.Text = sStr
  End If
'  If cboDecayNuc.ListIndex < 0 Then
    Found = False
    For i = 0 To cboDecayNuc.ListCount
      If cboDecayNuc.Text = cboDecayNuc.List(i) Then
        Found = True
        cboDecayNuc.ListIndex = i
      End If
    Next i
    If Not Found Then
      Cancel = True
      MsgBox cboDecayNuc.Text & " is not a valid nuclide name. Please use the choice list."
      Exit Sub
    End If
'  End If
End Sub

Private Sub cboEarlyNuc_Validate(Cancel As Boolean)
  Dim sStr As String, Found As Boolean, i As Integer
  Dim FirstChar As String * 1
  
  Cancel = False
  i = Asc(cboEarlyNuc.Text)
  If i > 90 Then
    FirstChar = Chr(i - 32)
    sStr = FirstChar & Mid(cboEarlyNuc.Text, 2, 5)
    cboEarlyNuc.Text = sStr
  End If

  If cboEarlyNuc.ListIndex < 0 Then
    Found = False
    For i = 1 To cboEarlyNuc.ListCount
      If cboEarlyNuc.Text = cboEarlyNuc.List(i) Then
        Found = True
        cboEarlyNuc.ListIndex = i
      End If
    Next i
    If Not Found Then
      Cancel = True
      MsgBox cboEarlyNuc.Text & " is not a valid nuclide name. Please use the choice list."
      Exit Sub
    End If
  End If
  ddADoses.RecordSource = "Select * from [Adoses] where [Nuclide] = '" & cboEarlyNuc & "'"
  ddADoses.Refresh
  Set rsNuc = ddADoses.Recordset
  rsNuc.MoveFirst
  gs_EarlyLET = rsNuc("LET")
  If gs_EarlyLET = "H" Or gs_EarlyLET = "B" Then
    Label12.Visible = False
  Else
    Label12.Visible = True
  End If
  cboEarlyType.Clear
  If (rsNuc("Clcs 1") <> "") Then
    cboEarlyType.AddItem rsNuc("Clcs 1")
    cboEarlyType.ListIndex = 0
  End If
  If (rsNuc("Clcs 2") <> "") Then
    cboEarlyType.AddItem rsNuc("Clcs 2")
  End If
  If (rsNuc("Clcs 3") <> "") Then
    cboEarlyType.AddItem rsNuc("Clcs 3")
  End If
  If (rsNuc("Clcs 4") <> "") Then
    cboEarlyType.AddItem rsNuc("Clcs 4")
  End If
  If (rsNuc("Clcs 5") <> "") Then
    cboEarlyType.AddItem rsNuc("Clcs 5")
  End If
  If (rsNuc("Clcs 6") <> "") Then
    cboEarlyType.AddItem rsNuc("Clcs 6")
  End If
  cboEarlyType.ListIndex = 0
  Set rsNuc = Nothing

End Sub

Private Sub cmbPeriodicTableIso_Click()
 Dim Scr_hDC As Long, sDoc As Long
 On Error GoTo noadobe
  gs_LinkSelected = gs_DataPath & "periodic-table.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"
End Sub

Private Sub cmd72IngPaste_Click()
Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x72Ing(j, i) = gd_CopyArray(j, i)
    Next j
  Next i
  grd72Ing.Refresh

End Sub

Private Sub cmd72InhPaste_Click()
Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x72Inh(j, i) = gd_CopyArray(j, i)
    Next j
  Next i
  grd72Inh.Refresh

End Sub

Private Sub cmdA1A2_Click()
  gs_NucSelected = "A1A2"
  gs_Columns = "*"
  gs_myTable = "BioPublic"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing

End Sub

Private Sub cmdAbsorberEle_Click()
  cmdAbsorberEle.FontBold = True
  cmdAbsorberMat.FontBold = False
  gs_AbsorberType = "Ele"
  cmdAbsorberData
End Sub

Private Sub cmdAbsorberMat_Click()
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = True
  gs_AbsorberType = "Mat"
  cmdAbsorberData
End Sub

Private Sub cmdAKRC_Click()
  gAirKermaNuc = cboDecayNuc
  frmAirKermaRC.Show
  Set frmAirKermaRC = Nothing
End Sub

Private Sub cmdAlphaHelp_Click()
Const PROCEDURE_NAME As String = "cmdAlphaHelp_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   If gs_AbsorberType = "Ele" Then
     FN = gs_HelpPath & "Element.chm"
   Else
     FN = gs_HelpPath & "Material.chm"
   End If
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdAtomicMass_Click()
Const PROCEDURE_NAME As String = "cmdAtomicMass_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "Element.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
  HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdBackBody_Click()
  gView_File_Name = gs_TextPath & "pexptxt2.rtf"
  frmFileViewer.Caption = cmdBackBody.Caption
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing

End Sub

Private Sub cmdBio2_Click()
  mnuCoefficients_Click
End Sub

Private Sub cmdBioK_Click()
 mnuCoefficients_Click
End Sub

Private Sub cmdbiok3_Click()
 mnuCoefficients_Click
End Sub

Private Sub cmdBioassay_Click()
  Const PROCEDURE_NAME As String = "cmdBioassay_Click"
  Dim sEle As String, i As Integer, dHL As Double, sHL As String
  On Error GoTo Error_Handler:
  
' set bioassay factor based on half life of nuclide
'  i = InStr(cboBioNuc.Text, "-")
'  If i = 0 Then
'    sEle = cboBioNuc.Text
    gd_BioassayFactor = 1
'  Else
'    sEle = Mid(cboBioNuc.Text, 1, i - 1)
'    dataEle.DatabaseName = gs_DataPath & "bioassay.mdb"
'    dataEle.RecordSource = _
'      "Select [Half Life] from Isotopes where Nuclide = '" & cboBioNuc.Text & "'"
'    dataEle.Refresh
'    Set rsNuc = dataEle.Recordset
'    rsNuc.MoveFirst
'    sHL = rsNuc.Fields(0).Value
'    dHL = getHL(sHL) ' in units of days
'    Set rsNuc = Nothing
''    gd_BioassayFactor = dhl
'    gd_BioassayFactor = 1
'  End If
' set nucSelected by bionuc and bioType
'  i = InStr(cboBioNuc.Text, "-")
'  If i > 0 Then
'    gs_NucSelected = Mid(cboBioNuc.Text, 1, i - 1) & cboBioType.Text
'  Else
    gs_NucSelected = cboBioNuc.Text & cboBioType.Text
'  End If
' the following for temporary data only.
'  If cboBioType.Text = "S" Then
'    gs_NucSelected = "PuS"
'  ElseIf gs_NucSelected <> "IM" Then
'    gs_NucSelected = "PuM"
'  End If
  gs_Columns = "*"
  gs_myTable = "bioassay"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub cmdBiokineticBio_Click()
Const PROCEDURE_NAME As String = "cmdBiokineticBio_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   If cboBiokinetic.Text = "GI model" Then
     FN = gs_HelpPath & "GI_Tract.chm"
   ElseIf cboBiokinetic.Text = "Bladder model" Then
     FN = gs_HelpPath & "Bladder.chm"
   ElseIf cboBiokinetic.Text = "Lung model" Then
     FN = gs_HelpPath & "Lung.chm"
   ElseIf cboBiokinetic.Text = "Systemic model" Then
     FN = gs_HelpPath & "SysBioMods.chm"
   End If

   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
End Sub

Private Sub cmdBiological_Click()
Dim i As Integer
  For i = 0 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.TabEnabled(15) = True
  tabNuclide.TabVisible(15) = True
  tabNuclide.Tab = 15
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = True
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  cmdRisk.FontBold = False
 gs_AbsorberType = ""
End Sub

Private Sub cmdConstants_Click()
'  MsgBox "Not Implemented Yet"
  gs_myTable = "Constants"
  frmConstants.Show vbModal
  Set frmConstants = Nothing
End Sub

Private Sub cmdClear30_Click()
 Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x38(j, i) = ""
    Next j
  Next i
  grd38.Refresh
End Sub

Private Sub cmdClear68_Click()
 Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x68(j, i) = ""
    Next j
  Next i
  grdICRP68.Refresh

End Sub

Private Sub cmdClearExt_Click()
 Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      xExt(j, i) = ""
    Next j
  Next i
  grdExt.Refresh
End Sub

Private Sub cmdClearInh_Click()
 Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x72Inh(j, i) = ""
    Next j
  Next i
  grd72Inh.Refresh
End Sub

Private Sub cmdClearW_Click()
 Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x72Ing(j, i) = ""
    Next j
  Next i
  grd72Ing.Refresh
End Sub

Private Sub Command1_Click()
  frmAirKermaRC.Show
  Set frmAirKermaRC = Nothing
End Sub

Private Sub cmdCompositionHelp_Click()
Const PROCEDURE_NAME As String = "cmdComposition_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "Material.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdCTExam_Click()
  gView_File_Name = gs_TextPath & "pexptxt7.rtf"
  frmFileViewer.Caption = "Medical Diagnostic Procedures"
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing
End Sub

Private Sub cmdDisplay_Risk_Click()
  Const PROCEDURE_NAME As String = "cmdDisplay_Risk_Click"

  Dim myNucs As String, bRemove As Boolean
  Dim i As Integer, j As Integer, nListIndex As Long, NumCols As Integer
  Dim myQuery As String, rsNuc As Recordset
  
  On Error Resume Next
  gsRisk_Path = optPath
  
  grdRisk.Update
  myNucs = xRisk(0, 0)
  On Error GoTo Error_Handler
  If Len(Trim(myNucs)) = 0 Then
    MsgBox "You must pick at least one nuclide"
    Exit Sub
  End If
  
  If chkDau.Value = 0 Then
    gs_MyWhere = "Nuclide = '" & myNucs & "'"
    gn_NucCount = 1
    For i = 0 To 20
      myNucs = xRisk(i, 0)
      gs_NucNames(0, gn_NucCount) = myNucs
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
    Next i
    gs_myTable = optPath.Value
    gs_myDataBase = "Risk.mdb"
    dataRiskExt.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from FGR13CD where " & gs_MyWhere
    dataRiskExt.RecordSource = myQuery
    dataRiskExt.Refresh
    Set rsNuc = dataRiskExt.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    NumCols = 0
    While Not rsNuc.EOF
      If gs_myTable = "Inhalation" Then
        NumCols = NumCols + rsNuc![InhCount]
      ElseIf gsRisk_Path = "Ingestion" Then
        NumCols = NumCols + rsNuc![IngCount]
      Else
        NumCols = NumCols + 1
      End If
      rsNuc.MoveNext
    Wend
    If NumCols < 1 Then
      MsgBox "There are no risk coefficients for these nuclides."
      Exit Sub
    End If

    frmRiskDisplay.Show vbModal
    Set frmRiskDisplay = Nothing
    If gsRisk_Path = "Inhalation" Or gsRisk_Path = "Ingestion" Then
      lblRiskUnit = gsRisk_Unit_Int
    Else
      If gsRisk_Path = "Ground Plane" Then
        lblRiskUnit = gsRisk_Unit_Gnd
      Else
        lblRiskUnit = gsRisk_Unit_Ext
      End If
    End If
  Else
    gn_NucCount = 0
    gn_Parent = 0
    bRemove = False
    gs_MyWhere = "Nuclide = '" & myNucs & "'"
    For i = 0 To 20
      myNucs = xRisk(i, 0)
      If myNucs = "Md-257" Or myNucs = "Md-258" Then
        bRemove = True
      Else
        If Len(Trim(myNucs)) <> 0 Then
          gn_Parent = gn_Parent + 1
          gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
          gs_MyWhereArray(gn_Parent) = "Nuclide = '" & myNucs & "'"
          For j = 0 To cboDecayNuc.ListCount - 1
            If cboDecayNuc.List(j) = myNucs Then
              nListIndex = j + 1
            End If
          Next j
          Call ReadDecayChain(nListIndex, myNucs, "ICRP-07", " ")
          For j = 1 To gn_DauCount(gn_Parent)
            gs_MyWhereArray(gn_Parent) = gs_MyWhereArray(gn_Parent) & " or Nuclide = '" & Trim(gs_NucNames(j, gn_Parent)) & "'"
          Next j
        End If
      End If
    Next i
    If bRemove Then
      MsgBox "No daughters can be shown for Md-257 or Md-258"
    End If
    
    gs_myDataBase = "Risk.mdb"
    dataRiskExt.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from FGR13CD where " & gs_MyWhere
    dataRiskExt.RecordSource = myQuery
    dataRiskExt.Refresh
    Set rsNuc = dataRiskExt.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    NumCols = 0
    While Not rsNuc.EOF
      If gs_myTable = "Inhalation" Then
        NumCols = NumCols + rsNuc![InhCount]
      ElseIf gsRisk_Path = "Ingestion" Then
        NumCols = NumCols + rsNuc![IngCount]
      Else
        NumCols = NumCols + 1
      End If
      rsNuc.MoveNext
    Wend
    If NumCols < 1 Then
      MsgBox "There are no risk coefficients for these nuclides."
      Exit Sub
    End If

    If gn_Parent > 0 Then
      gs_myTable = optPath.Value
      gs_myDataBase = "Risk.mdb"
      frmRiskDisplayDau.Show vbModal
      Set frmRiskDisplayDau = Nothing
    End If
  End If
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub cmdDisplayNX_Click()
  gs_AbsorberType = "Ele"
  gs_EleSelected = cboNX.Text
  gs_myTable = "Element"
  gs_AtomType = "Neutron Cross Section"
  gs_Columns = "[Mass Number], [Isotopic Composition], [Sigma], [Serr] "
  ddADoses.DatabaseName = gs_DataPath & "element.mdb"
  ddADoses.RecordSource = "Select * from " & gs_EleSelected & " where [Isotopic Composition] > 0"
  ddADoses.Refresh
  Set rsNuc = ddADoses.Recordset
  If rsNuc.RecordCount > 0 Then
    frmEleTable.Show vbModal
  Else
    MsgBox "No cross sections found for " & gs_EleSelected
  End If
  Set frmEleTable = Nothing
  gs_AtomType = ""
End Sub

Private Sub cmdElectronHelp_Click()
Const PROCEDURE_NAME As String = "cmdElectronHelpn_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   If gs_AbsorberType = "Ele" Then
     FN = gs_HelpPath & "Element.chm"
   Else
     FN = gs_HelpPath & "Material.chm"
   End If
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdHelpDecay_Click()
Const PROCEDURE_NAME As String = "cmdDecayHelp_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ICRP107.chm"
 '  Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdHelpEarly_Click()
Const PROCEDURE_NAME As String = "cmdDecayHelp_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ADose.chm"
 '  Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
End Sub

Private Sub cmdINES_Click()
Dim Scr_hDC As Long, sDoc As Long
On Error GoTo noadobe
  gs_LinkSelected = gs_HelpPath & "IAEA_ines.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"
End Sub

Private Sub cmdKermaHelp_Click()
Const PROCEDURE_NAME As String = "cmdKermaHelp_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   If gs_AbsorberType = "Ele" Then
     FN = gs_HelpPath & "Element.chm"
   Else
     FN = gs_HelpPath & "Material.chm"
   End If
 '  Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdPeriodicTable_Click()
  Dim Scr_hDC As Long, sDoc As Long
  On Error GoTo noadobe
  gs_LinkSelected = gs_DataPath & "periodic-table.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"
End Sub

Private Sub cmdPhotonBUHelp_Click()
Const PROCEDURE_NAME As String = "cmdPhotonBUHelp_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   If gs_AbsorberType = "Ele" Then
     FN = gs_HelpPath & "Element.chm"
   Else
     FN = gs_HelpPath & "Material.chm"
   End If
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
  HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdPhotonXsection_Click()
Const PROCEDURE_NAME As String = "cmdPhotonXsection_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   If gs_AbsorberType = "Ele" Then
     FN = gs_HelpPath & "Element.chm"
   Else
     FN = gs_HelpPath & "Material.chm"
   End If
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
End Sub

Private Sub cmdRefNX_Click(Index As Integer)
 Dim i As Integer, nRefs As Integer, sStr As String
  
  nRefs = gs_References(Index, 0)
  sStr = ""
  For i = 1 To nRefs
    sStr = sStr & vbCr & vbLf & gs_References(Index, i) & vbLf
  Next i
  MsgBox sStr, 0, "References"
End Sub

Private Sub cmdRadGraph_Click()
Dim Scr_hDC As Long, sDoc As Long
On Error GoTo noadobe
  gs_LinkSelected = gs_HelpPath & "DoseRanges.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"
End Sub

Private Sub cmdRisk_Click()
Dim i As Integer
  For i = 0 To 20
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.TabVisible(13) = True
  tabNuclide.TabEnabled(13) = True
  tabNuclide.Tab = 13
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdRisk.FontBold = True
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  gs_AbsorberType = ""
End Sub

Private Sub cmdRiskHelp_Click()
   Const PROCEDURE_NAME As String = "cmdRiskHelp_Click"
    Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "Risk.chm"
 '  Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
    HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub


Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error


End Sub

Private Sub cmdUnits_Risk_Click()

  gsRisk_Path = optPath
  frmSetRiskUnits.Show vbModal
  Set frmSetRiskUnits = Nothing
  If gsRisk_Path = "Ingestion" Or gsRisk_Path = "Inhalation" Then
    lblRiskUnit = gsRisk_Unit_Int
  ElseIf gsRisk_Path = "Ground Plane" Then
    lblRiskUnit = gsRisk_Unit_Gnd
  Else
    lblRiskUnit = gsRisk_Unit_Ext
  End If
End Sub

Private Sub mnuExt_Click()
 Const PROCEDURE_NAME As String = "mnuInt_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "External.chm"
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub Command4_Click()
  grdICRP68.ClearFields
End Sub

Private Sub cmdView_Click()
Dim Scr_hDC As Long, sDoc As Long
On Error GoTo noadobe
  gs_LinkSelected = gs_HelpPath & "pnnl-15870.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"
End Sub

Private Sub grdRisk_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)

Const PROCEDURE_NAME As String = "grdRisk_BeforeColUpdate"
   Dim sStr As String
   Dim sSQL_Query As String
   Dim dbNuc As Database
   Dim rsNuc As Recordset
   
   On Error GoTo Error_Handler
   
   Cancel = False
   If Len(Trim$(grdRisk.Columns(0).Value)) > 0 Then
     If optPath = "Ingestion" Or optPath = "Inhalation" Then
       sSQL_Query = "Select Nuclide from FGR13CD where InhCount <> 0"
       dataRiskInt.RecordSource = sSQL_Query
       Set rsNuc = dataRiskInt.Recordset
     Else
       sSQL_Query = "Select Nuclide from FGR13CD where ExtCount <> 0"
       dataRiskExt.RecordSource = sSQL_Query
       Set rsNuc = dataRiskExt.Recordset
     End If
     rsNuc.MoveFirst
     sSQL_Query = " [Nuclide] =  '" & Trim$(grdRisk.Columns(0).Value) & "'"
     rsNuc.FindFirst sSQL_Query
     If rsNuc.NoMatch Then
       sStr = grdRisk.Columns(0).Value & _
       " is not a valid nuclide name.  Please use the choice list to enter names."
       MsgBox sStr, vbInformation + vbOKOnly
       Cancel = True
       rsNuc.MoveFirst
     Else
       grdRisk.Columns(0).Value = rsNuc![Nuclide]
     End If
   End If
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub


Private Sub mnuGlossary_Click()
 Const PROCEDURE_NAME As String = "mnuInt_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "Glossary.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub mnuIndex_Click()
  Const PROCEDURE_NAME As String = "mnuIndex_Click"
  Dim FN As String
 
  On Error GoTo Error_Handler
 
  FN = gs_HelpPath & "Index.chm"
 ' Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
  HTMLHelp hWnd, FN, HH_DISPLAY_TOC, Null
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub mnuInt_Click()
 Const PROCEDURE_NAME As String = "mnuInt_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "Internal.chm"
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
End Sub

Private Sub mnuManual_Click()
Dim Scr_hDC As Long, sDoc As Long
On Error GoTo noadobe
  gs_LinkSelected = gs_HelpPath & "tboxman.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"
End Sub

Private Sub cmdConversionFactors_Click()
'  MsgBox "Not Implemented Yet"
  gs_myTable = "Factors"
  frmConstants.Show vbModal
  Set frmConstants = Nothing
End Sub

Private Sub cmdDecayData_Click()
Dim i As Integer, C As Boolean

  For i = 0 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.TabEnabled(5) = True
  tabNuclide.TabEnabled(8) = True
'  tabNuclide.TabEnabled(13) = True
  tabNuclide.TabVisible(5) = True
  tabNuclide.TabVisible(8) = True
'  tabNuclide.TabVisible(13) = True
  tabNuclide.Tab = 5
  cboDecayNuc_Validate (C)
' cboJaeriNuc_Validate (C)
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = True
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  cmdRisk.FontBold = False
  gs_AbsorberType = ""
End Sub

Private Sub cmdDevices_Click()
  gView_File_Name = gs_TextPath & "pexptxt4.rtf"
  frmFileViewer.Caption = cmdDevices.Caption
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing

End Sub

Private Sub cmdDisplay_38_Click()
  Const PROCEDURE_NAME As String = "cmdDisplay_38_Click"

  Dim myNucs As String, bRemove As Boolean
  Dim i As Integer, j As Integer, nListIndex As Long
  
  On Error Resume Next
  
  grd38.Update
  myNucs = x38(0, 0)
  On Error GoTo Error_Handler
  If Len(Trim(myNucs)) = 0 Then
    MsgBox "You must pick at least one nuclide"
    Exit Sub
  End If
  If (gb_IsDoseCalc) Then
    gd_Activity(0, 0) = x38(0, 1)
  End If
  
  gs_myTable = optICRP38.Value
  gs_myDataBase = "FGR12.mdb"
  gs_MyWhere = "Nuclide = '" & myNucs & "'"
  If chkICRP30Dau.Value = 0 Then
    gn_NucCount = 1
    For i = 0 To 20
      myNucs = x38(i, 0)
      gs_NucNames(0, gn_NucCount) = myNucs
      If (gb_IsDoseCalc) Then
        gd_Activity(0, i) = x38(i, 1)
        gs_NucNames(i, 0) = myNucs
      End If
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
    Next i
    
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If

    frmInhDisplay.Show vbModal
    Set frmInhDisplay = Nothing
  Else
    gn_NucCount = 0
    gn_Parent = 0
    For i = 0 To 20
      myNucs = x38(i, 0)
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
      If myNucs = "Md-257" Or myNucs = "Md-258" Then
        bRemove = True
      Else
        If Len(Trim(myNucs)) <> 0 Then
          gs_NucNames(0, i) = myNucs
          gn_Parent = gn_Parent + 1
          gs_MyWhereArray(gn_Parent) = "Nuclide = '" & myNucs & "'"
          For j = 0 To cboDecayNuc.ListCount - 1
            If cboDecayNuc.List(j) = myNucs Then
              nListIndex = j + 1
            End If
          Next j
          Call ReadDecayChain(nListIndex, myNucs, "ICRP-07", " ")
          For j = 1 To gn_DauCount(gn_Parent)
            gs_MyWhereArray(gn_Parent) = gs_MyWhereArray(gn_Parent) & " or Nuclide = '" & gs_NucNames(j, gn_Parent) & "'"
          Next j
        End If
      End If
    Next i
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    If bRemove Then
      MsgBox "No daughters can be shown for Md-257 or Md-258"
    End If
    If gn_Parent > 0 Then
      gs_myTable = optICRP38.Value
      gs_myDataBase = "FGR12.mdb"
      frmInhDisplayDau.Show vbModal
      Set frmInhDisplayDau = Nothing
    End If
  End If
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub cmdDisplay_68_Click()
 Const PROCEDURE_NAME As String = "cmdDisplay_68_Click"

  Dim myNucs As String, bRemove As Boolean
  Dim i As Integer, j As Integer, nListIndex As Long
  
  On Error Resume Next
  
  grdICRP68.Update
  myNucs = x68(0, 0)
  On Error GoTo Error_Handler
  If Len(Trim(myNucs)) = 0 Then
    MsgBox "You must pick at least one nuclide"
    Exit Sub
  End If
  If (gb_IsDoseCalc) Then
    gd_Activity(0, 0) = x68(0, 1)
  End If
  
  gs_myTable = optICRP68.Value
  gs_myDataBase = "icrp68.mdb"
  gs_MyWhere = "Nuclide = '" & myNucs & "'"
  If chkICRP68Dau.Value = 0 Then
    gn_NucCount = 1
    For i = 0 To 20
      myNucs = x68(i, 0)
      gs_NucNames(0, gn_NucCount) = myNucs
      If (gb_IsDoseCalc) Then
        gd_Activity(0, i) = x68(i, 1)
        gs_NucNames(i, 0) = myNucs
      End If
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
    Next i
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If

    frmInhDisplay.Show vbModal
    Set frmInhDisplay = Nothing
  Else
    gn_NucCount = 0
    gn_Parent = 0
    For i = 0 To 20
      myNucs = x68(i, 0)
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
      If myNucs = "Md-257" Or myNucs = "Md-258" Then
        bRemove = True
      Else
        If Len(Trim(myNucs)) <> 0 Then
          gs_NucNames(0, i) = myNucs
          gn_Parent = gn_Parent + 1
          gs_MyWhereArray(gn_Parent) = "Nuclide = '" & myNucs & "'"
          For j = 0 To cboDecayNuc.ListCount - 1
            If cboDecayNuc.List(j) = myNucs Then
              nListIndex = j + 1
            End If
          Next j
          Call ReadDecayChain(nListIndex, myNucs, "ICRP68", " ")
          For j = 1 To gn_DauCount(gn_Parent)
            gs_MyWhereArray(gn_Parent) = gs_MyWhereArray(gn_Parent) & " or Nuclide = '" & gs_NucNames(j, gn_Parent) & "'"
          Next j
        End If
      End If
    Next i
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    If bRemove Then
      MsgBox "No daughters can be shown for Md-257 or Md-258"
    End If
    If gn_Parent > 0 Then
      gs_myTable = optICRP68.Value
      gs_myDataBase = "icrp68.mdb"
      frmInhDisplayDau.Show vbModal
      Set frmInhDisplayDau = Nothing
    End If
  End If
  
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub cmdDisplay_72Ing_Click()
  Const PROCEDURE_NAME As String = "cmdDisplay_72Ing_Click"

  Dim myNucs As String, bRemove As Boolean
  Dim i As Integer, j As Integer, nListIndex As Long
  
  On Error Resume Next
  grd72Ing.Update
  
  myNucs = x72Ing(0, 0)
  On Error GoTo Error_Handler
  If Len(Trim(myNucs)) = 0 Then
    MsgBox "You must pick at least one nuclide"
    Exit Sub
  End If
  If (gb_IsDoseCalc) Then
    gd_Activity(0, 0) = x72Ing(0, 1)
  End If
  
  gs_myTable = "Ingestion " & opt72ing.Value
  gs_myDataBase = "icrp72.mdb"
  gs_MyWhere = "Nuclide = '" & myNucs & "'"
  If chk72IngDau.Value = 0 Then
    gn_NucCount = 1
    For i = 0 To 20
      myNucs = x72Ing(i, 0)
      gs_NucNames(0, gn_NucCount) = myNucs
      If (gb_IsDoseCalc) Then
        gd_Activity(0, i) = x72Ing(i, 1)
        gs_NucNames(i, 0) = myNucs
      End If
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
    Next i
    
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    
    frmInhDisplay.Show vbModal
    Set frmInhDisplay = Nothing
  Else
    gn_NucCount = 0
    gn_Parent = 0
    For i = 0 To 20
      myNucs = x72Ing(i, 0)
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If

      If myNucs = "Md-257" Or myNucs = "Md-258" Then
        bRemove = True
      Else
        If Len(Trim(myNucs)) <> 0 Then
          gs_NucNames(0, i) = myNucs
          gn_Parent = gn_Parent + 1
          gs_MyWhereArray(gn_Parent) = "Nuclide = '" & myNucs & "'"
          For j = 0 To cboDecayNuc.ListCount - 1
            If cboDecayNuc.List(j) = myNucs Then
              nListIndex = j + 1
            End If
          Next j
          Call ReadDecayChain(nListIndex, myNucs, "ICRP-07", " ")
          For j = 1 To gn_DauCount(gn_Parent)
            gs_MyWhereArray(gn_Parent) = gs_MyWhereArray(gn_Parent) & " or Nuclide = '" & gs_NucNames(j, gn_Parent) & "'"
          Next j
        End If
      End If
    Next i
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    If bRemove Then
      MsgBox "No daughters can be shown for Md-257 or Md-258"
    End If
    If gn_Parent > 0 Then
      gs_myTable = "Ingestion " & opt72ing.Value
      gs_myDataBase = "icrp72.mdb"
      frmInhDisplayDau.Show vbModal
      Set frmInhDisplayDau = Nothing
    End If
  End If
 Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub cmdDisplay_72Inh_Click()
  Const PROCEDURE_NAME As String = "cmdDisplay_72Inh_Click"

  Dim myNucs As String, bRemove As Boolean
  Dim i As Integer, j As Integer, nListIndex As Long
  
  On Error Resume Next
  grd72Inh.Update
  myNucs = x72Inh(0, 0)
  On Error GoTo Error_Handler
  If Len(Trim(myNucs)) = 0 Then
    MsgBox "You must pick at least one nuclide"
    Exit Sub
  End If
   If (gb_IsDoseCalc) Then
    gd_Activity(0, 0) = x72Inh(0, 1)
  End If
 
  gs_myTable = "Inhalation " & opt72Inh.Value
  gs_myDataBase = "icrp72.mdb"
  gs_MyWhere = "Nuclide = '" & myNucs & "'"
  If chk72InhDau.Value = 0 Then
    gn_NucCount = 1
    For i = 0 To 20
      myNucs = x72Inh(i, 0)
      gs_NucNames(0, gn_NucCount) = myNucs
      If (gb_IsDoseCalc) Then
        gd_Activity(0, i) = x72Inh(i, 1)
        gs_NucNames(i, 0) = myNucs
     End If
     If Len(Trim(myNucs)) <> 0 Then
       gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
       gn_NucCount = gn_NucCount + 1
     End If
    Next i
    
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    
    frmInhDisplay.Show vbModal
    Set frmInhDisplay = Nothing
  Else
    gn_NucCount = 0
    gn_Parent = 0
    For i = 0 To 20
      myNucs = x72Inh(i, 0)
     If Len(Trim(myNucs)) <> 0 Then
       gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
       gn_NucCount = gn_NucCount + 1
     End If
      If myNucs = "Md-257" Or myNucs = "Md-258" Then
        bRemove = True
      Else
        If Len(Trim(myNucs)) <> 0 Then
          gs_NucNames(0, i) = myNucs
          gn_Parent = gn_Parent + 1
          gs_MyWhereArray(gn_Parent) = "Nuclide = '" & myNucs & "'"
          For j = 0 To cboDecayNuc.ListCount - 1
            If cboDecayNuc.List(j) = myNucs Then
              nListIndex = j + 1
            End If
          Next j
          Call ReadDecayChain(nListIndex, myNucs, "ICRP-07", " ")
          For j = 1 To gn_DauCount(gn_Parent)
            gs_MyWhereArray(gn_Parent) = gs_MyWhereArray(gn_Parent) & " or Nuclide = '" & gs_NucNames(j, gn_Parent) & "'"
            If (gb_IsDoseCalc) Then
              gd_Activity(j, i) = x72Inh(i, 1)
            End If
          Next j
        End If
      End If
    Next i
    dataJaeri.DatabaseName = gs_DataPath & gs_myDataBase
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    
    If bRemove Then
      MsgBox "No daughters can be shown for Md-257 or Md-258"
    End If
    If gn_Parent > 0 Then
      gs_myTable = "Inhalation " & opt72Inh.Value
      gs_myDataBase = "icrp72.mdb"
      frmInhDisplayDau.Show vbModal
      Set frmInhDisplayDau = Nothing
    End If
  End If
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub cmdDisplay_Alpha_Click()
  Dim i As Integer
  
  gs_myTable = "Alpha"
  If gs_AbsorberType = "Ele" Then
    gs_EleSelected = cboAlpha
  Else
    gs_MatSelected = cboAlphaMat
    If gs_MatSelected = "User-defined" Then
      frmDefineMaterial.Show vbModal
      Set frmDefineMaterial = Nothing
      If gs_UserMaterialName = "Cancel" Or g_NumUserEles = 0 Then
        Exit Sub
      End If
    Else
      b_UserDefinedMat = True
    End If
  End If
  gs_Columns = ""
  For i = 1 To 4
    If chkAlpha(i).Value = 1 Then
      If Len(gs_Columns) > 0 Then
        gs_Columns = gs_Columns & ", [" & gAlpType(i) & "]"
      Else
        gs_Columns = "[" & gAlpType(i) & "]"
      End If
    End If
  Next i
  If Len(gs_Columns) = 0 Then
    MsgBox "You must check at least one type of data to display"
  Else
    gs_Columns = "[Alpha Energy], " & gs_Columns
    frmEleTable.Show vbModal
    Set frmEleTable = Nothing
  End If

End Sub

Private Sub cmdDisplay_Atom_Click()
  gs_AbsorberType = "Ele"
  gs_EleSelected = cboAtom.Text
  gs_myTable = "Element"
  If optMass.Value = "General" Then
    frmElement.Show vbModal
    Set frmElement = Nothing
  Else
    gs_AtomType = optMass.Value
    If optMass.Value = "Abundance" Then
      gs_Columns = "[Mass Number], [Isotopic Composition], [Isotopic Composition Err]"
    Else
      gs_Columns = "[Mass Number], [Atomic Mass], [Atomic Mass Err], [Stable Isotope Flag]"
    End If
    frmEleTable.Show vbModal
    Set frmEleTable = Nothing
    gs_AtomType = ""
  End If
End Sub

Private Sub cmdDisplay_Decay_Click()
  Dim FN As String, RadRec As String * 27, BetaRec As String * 19
  Dim ThisRec As Long, BetaCount As Integer, BetaFirst As Long
  Dim RadCount As Integer, RadFirst As Long, i As Integer, Ind As Long
  Dim ReturnedNuc As String * 7
  Dim Mean As Double, Freq As Double, Energy As Double, EndPoint As Double
  Dim EgridBeta(150) As Double, Dwork(150) As Double, y As Double
  Dim ierr As Long, n As Long
  
  gs_NucSelected = cboDecayNuc
  If optDecayType = "Summary" Then
' convert factor to a string and pass to fortran
    FN = Str(gd_SAFactor)
    Ind = cboDecayNuc.ListIndex + 1
    Call ShowSummary(Ind, cboDecayNuc.Text, "ICRP-07", FN)
  ElseIf optDecayType = "Decay Chain Table" Then
' convert factor to a string and pass to fortran
    FN = Str(gd_SAFactor)
    Ind = cboDecayNuc.ListIndex + 1
    Call ShowDecayData(Ind, cboDecayNuc.Text, "ICRP-07", FN)
  ElseIf optDecayType = "Activity" Then
' convert factor to a string and pass to fortran
    FN = Str(gd_SAFactor)
    Ind = cboDecayNuc.ListIndex + 1
    Call ShowDecayActivity(Ind, cboDecayNuc.Text, txtDecayTime.Text, cboDecayTimeUnits.Text, "ICRP-07")
  ElseIf optDecayType = "Decay Chain Graphic" Then
    If gs_NucSelected = "Es-254m" Then
      MsgBox "Sorry, but the graphic is not enabled for " & gs_NucSelected
      Exit Sub
    End If
    Ind = cboDecayNuc.ListIndex + 1
    Call ShowDecayChain(Ind, cboDecayNuc.Text, "ICRP-07")
  ElseIf optDecayType = "Energy-Intensity Data" Then
    gs_DecayDataSource = "ICRP-07"
    gn_Cutoff = optICRP38Cutoff.ListIndex
    frmRadDisplay.Show vbModal
    Set frmRadDisplay = Nothing
' beta spectrum
  Else
    Data38Index.DatabaseName = gs_DataPath & "icrp07-index.mdb"
    Data38Index.RecordSource = "Select * from [ICRP-07] where [Nuclide] = '" & cboDecayNuc & "'"
    Data38Index.Refresh
    Set rsNuc = Data38Index.Recordset
    rsNuc.MoveFirst
    BetaFirst = rsNuc.Fields![Beta Loc].Value
  '  BetaCount = rsNuc.Fields![Beta Particle Num].Value - 1
    Set rsNuc = Nothing
    If BetaFirst < 1 Then
      MsgBox "There is no Beta spectrum data for " & cboDecayNuc
      Exit Sub
    End If
      
    FN = gs_DataPath & "icrp-07.bet"
    Open FN For Random As #10 Len = 19
    Get #10, BetaFirst, BetaRec
    BetaCount = Val(Mid(BetaRec, 8))
    gd_BetaEnd = BetaCount
    frmBetaDisplay.gphBeta.GraphStyle = 4

    frmBetaDisplay.gphBeta.NumSets = 1
    frmBetaDisplay.gphBeta.ThisSet = 1
    frmBetaDisplay.gphBeta.IndexStyle = graphEnhanced
    frmBetaDisplay.gphBeta.NumPoints = BetaCount
    frmBetaDisplay.gphBeta.XAxisMin = 1
    i = 1
    Freq = 0
    Energy = 0
    For ThisRec = BetaFirst + 1 To BetaFirst + BetaCount
      Get #10, ThisRec, BetaRec
        gd_BetaSpectrum(i) = Val(Mid(BetaRec, 8))
        frmBetaDisplay.gphBeta.ThisPoint = i
        gd_EGrid(i) = Val(Mid(BetaRec, 1, 7))
        EgridBeta(i) = gd_EGrid(i) * gd_BetaSpectrum(i)
        frmBetaDisplay.gphBeta.XPos(i) = gd_EGrid(i)
        frmBetaDisplay.gphBeta.GraphData = gd_BetaSpectrum(i)
        i = i + 1
    Next ThisRec
    Close #10
    n = BetaCount     'this should be the # of points in the spectrum
    n = i - 1
    Call pchim(n, gd_EGrid(), gd_BetaSpectrum(), Dwork(), ierr)
    y = pchid(n, gd_EGrid, gd_BetaSpectrum(), Dwork(), False, 1, n, ierr)
    Call pchim(n, gd_EGrid(), EgridBeta(), Dwork(), ierr)
    Mean = pchid(n, gd_EGrid(), EgridBeta(), Dwork(), False, 1, n, ierr)
    Mean = Mean / y
    Mean = Int(Mean * 10000)
    Mean = Mean / 10000
    EndPoint = gd_EGrid(i - 1)
    EndPoint = Int(EndPoint * 10000)
    EndPoint = EndPoint / 10000
    frmBetaDisplay.Caption = "ICRP 07 Beta Spectrum for " & cboDecayNuc & _
      ": End point " & EndPoint & " and average energy " & Mean & " MeV"
    frmBetaDisplay.gphBeta.DrawMode = 3
    frmBetaDisplay.Show vbModal
    Set frmBetaDisplay = Nothing

  End If
  
End Sub

Private Sub cmdDisplay_Electron_Click()
  Dim i As Integer
  
  gs_myTable = "Electron"
  If gs_AbsorberType = "Ele" Then
    gs_EleSelected = cboElectron
  Else
    gs_MatSelected = cboElectronMat
    If gs_MatSelected = "User-defined" Then
      frmDefineMaterial.Show vbModal
      Set frmDefineMaterial = Nothing
      If gs_UserMaterialName = "Cancel" Or g_NumUserEles = 0 Then
        Exit Sub
      End If
    Else
      b_UserDefinedMat = True
    End If
  End If
  gs_Columns = ""
  For i = 1 To 6
    If chkElectron(i).Value = 1 Then
      If Len(gs_Columns) > 0 Then
        gs_Columns = gs_Columns & ", [" & gEleType(i) & "]"
      Else
        gs_Columns = "[" & gEleType(i) & "]"
      End If
    End If
  Next i
  If Len(gs_Columns) = 0 Then
    MsgBox "You must check at least one type of data to display"
  Else
    gs_Columns = "[Kinetic Energy], " & gs_Columns
    frmEleTable.Show vbModal
    Set frmEleTable = Nothing
  End If

End Sub

Private Sub cmdDisplay_Ext_Click()
Const PROCEDURE_NAME As String = "cmdDisplay_Ext_Click"
  Dim myNucs As String, bRemove As Boolean
  Dim i As Integer, j As Integer, nListIndex As Long
  
  On Error Resume Next
  grdExt.Update
  myNucs = xExt(0, 0)
  On Error GoTo Error_Handler
  If Len(Trim(myNucs)) = 0 Then
    MsgBox "You must pick at least one nuclide"
    Exit Sub
  End If
  If (gb_IsDoseCalc) Then
    gd_Activity(0, 0) = xExt(0, 1)
  End If
  gs_myTable = optExternal.Value
  
  gs_MyWhere = "Nuclide = '" & myNucs & "'"
  If chkExtDau.Value = 0 Then
    gn_NucCount = 1
    For i = 1 To 20
      myNucs = xExt(i, 0)
      If (gb_IsDoseCalc) Then
        gd_Activity(0, i) = xExt(i, 1)
        gs_NucNames(i, 0) = myNucs
      End If
      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
    Next i
  
    dataJaeri.DatabaseName = gs_DataPath & "FGR12.mdb"
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    
    frmExtDisplay.Show vbModal
    Set frmExtDisplay = Nothing
  Else
    gn_NucCount = 0
    gn_Parent = 0
    For i = 0 To 20
      myNucs = xExt(i, 0)

      If Len(Trim(myNucs)) <> 0 Then
        gs_MyWhere = gs_MyWhere & " or Nuclide = '" & myNucs & "'"
        gn_NucCount = gn_NucCount + 1
      End If
      If myNucs = "Md-257" Or myNucs = "Md-258" Then
        bRemove = True
      Else
        If Len(Trim(myNucs)) <> 0 Then
          gs_NucNames(0, i) = myNucs
          gn_Parent = gn_Parent + 1
          gs_MyWhereArray(gn_Parent) = "Nuclide = '" & myNucs & "'"
          For j = 0 To cboDecayNuc.ListCount - 1
            If cboDecayNuc.List(j) = myNucs Then
              nListIndex = j + 1
            End If
            If (gb_IsDoseCalc) Then
              gd_Activity(j, i) = xExt(i, 1)
            End If
          Next j
          Call ReadDecayChain(nListIndex, myNucs, "ICRP-07", " ")
          For j = 1 To gn_DauCount(gn_Parent)
            gs_MyWhereArray(gn_Parent) = gs_MyWhereArray(gn_Parent) & " or Nuclide = '" & gs_NucNames(j, gn_Parent) & "'"
          Next j
        End If
      End If
    Next i
    
    dataJaeri.DatabaseName = gs_DataPath & "FGR12.mdb"
    myQuery = "Select * from [" & gs_myTable & "] where " & gs_MyWhere
    dataJaeri.RecordSource = myQuery
    dataJaeri.Refresh
    Set rsNuc = dataJaeri.Recordset
    If rsNuc.RecordCount < 1 Then
      MsgBox "No nuclides found"
      Exit Sub
    End If
    
    If bRemove Then
      MsgBox "No daughters can be shown for Md-257 or Md-258"
    End If
    If gn_Parent > 0 Then
      frmExtDisplayDau.Show vbModal
      Set frmExtDisplayDau = Nothing
    End If
  End If
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub cmdDisplay_Kerma_Click()
If optKerma = "Neutron" Then
    gs_myTable = "KermaN"
    If gs_AbsorberType = "Ele" Then
      gs_EleSelected = cboNKermaEle.Text
    Else
      gs_MatSelected = cboNKermaMaterial.Text
      If gs_MatSelected = "User-defined" Then
        frmDefineMaterial.Show vbModal
        Set frmDefineMaterial = Nothing
        If gs_UserMaterialName = "Cancel" Or g_NumUserEles = 0 Then
          Exit Sub
        End If
      Else
        b_UserDefinedMat = True
      End If
    End If
  Else
    gs_myTable = "KermaP"
    If gs_AbsorberType = "Ele" Then
      gs_EleSelected = cboKermaEle.Text
    Else
      gs_MatSelected = cboKermaMaterial.Text
      If gs_MatSelected = "User-defined" Then
        frmDefineMaterial.Show vbModal
        Set frmDefineMaterial = Nothing
        If gs_UserMaterialName = "Cancel" Or g_NumUserEles = 0 Then
          Exit Sub
        End If
      Else
        b_UserDefinedMat = True
     End If
    End If
  End If
  
  gs_Columns = "*"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing
End Sub

Private Sub cmdDisplay_Photon_Click()
  Dim i As Integer
  
  gs_myTable = "Photon"
  If gs_AbsorberType = "Ele" Then
    gs_EleSelected = cboPhoton
  Else
    gs_MatSelected = cboPhotonMat
    If gs_MatSelected = "User-defined" Then
      frmDefineMaterial.Show vbModal
      Set frmDefineMaterial = Nothing
      If gs_UserMaterialName = "Cancel" Or g_NumUserEles = 0 Then
        Exit Sub
      End If
    Else
      b_UserDefinedMat = True
    End If
  End If
  gs_Columns = ""
  For i = 1 To 8
    If chkPhoton(i).Value = 1 Then
      If (i = 8) Then
        If (gs_EleSelected = "Am" Or gs_EleSelected = "Bk" _
          Or gs_EleSelected = "Cf" Or gs_EleSelected = "Cm" _
          Or gs_EleSelected = "Es" Or gs_EleSelected = "Fm" _
          Or gs_EleSelected = "Np" Or gs_EleSelected = "Pu") Then
          MsgBox "There is no Mass Energy-Attenuation data for " & gs_EleSelected
        Else
          If Len(gs_Columns) > 0 Then
            gs_Columns = gs_Columns & ", [" & gPhoType(i) & "], [Mass E-Abs Type]"
          Else
            gs_Columns = gs_Columns & "[" & gPhoType(i) & "], [Mass E-Abs Type]"
          End If
        End If
      Else
        If Len(gs_Columns) > 0 Then
          gs_Columns = gs_Columns & ", [" & gPhoType(i) & "]"
        Else
          gs_Columns = gs_Columns & "[" & gPhoType(i) & "]"
        End If
      End If
    End If
  Next i
  If Len(gs_Columns) = 0 Then
    MsgBox "You must check at least one type of data to display"
  Else
    gs_Columns = "[Photon Energy], " & gs_Columns
    frmEleTable.Show vbModal
    Set frmEleTable = Nothing
  End If

End Sub

Private Sub cmdDisplay_Proton_Click()
  MsgBox "Not Implemented Yet"
End Sub

Private Sub cmdAbsorberData()
Dim i As Integer
  For i = 7 To 13
    tabNuclide.TabEnabled(i) = True
    tabNuclide.TabVisible(i) = True
  Next i
  For i = 0 To 5
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  For i = 13 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.TabVisible(8) = False
  tabNuclide.TabEnabled(8) = False
  tabNuclide.TabVisible(11) = False
  tabNuclide.TabEnabled(11) = False
  tabNuclide.Tab = 10
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  cmdRisk.FontBold = False
 
  If (gs_AbsorberType = "Ele") Then
    cboPhotonMat.Enabled = False
    cboPhotonMat.Visible = False
    cboAlphaMat.Enabled = False
    cboAlphaMat.Visible = False
    cboElectronMat.Enabled = False
    cboElectronMat.Visible = False
    cboKermaMaterial.Enabled = False
    cboKermaMaterial.Visible = False
    cboNKermaMaterial.Enabled = False
    cboNKermaMaterial.Visible = False
    cboMaterial.Enabled = False
    cboMaterial.Visible = False
    cboPhoton.Enabled = True
    cboPhoton.Visible = True
    cboAlpha.Enabled = True
    cboAlpha.Visible = True
    cboElectron.Enabled = True
    cboElectron.Visible = True
    cboKermaEle.Enabled = True
    cboKermaEle.Visible = True
    cboNKermaEle.Enabled = True
    cboNKermaEle.Visible = True
    cboGPElement.Enabled = True
    cboGPElement.Visible = True
    cboGPMaterial.Enabled = False
    cboGPMaterial.Visible = False
    tabNuclide.TabVisible(6) = False
    tabNuclide.TabEnabled(6) = False
    tabNuclide.TabVisible(21) = True
    tabNuclide.TabEnabled(21) = True
    tabNuclide.TabVisible(20) = True
    tabNuclide.TabEnabled(20) = True
  Else
    cboPhotonMat.Enabled = True
    cboPhotonMat.Visible = True
    cboAlphaMat.Enabled = True
    cboAlphaMat.Visible = True
    cboElectronMat.Enabled = True
    cboElectronMat.Visible = True
    cboKermaMaterial.Enabled = True
    cboKermaMaterial.Visible = True
    cboNKermaMaterial.Enabled = True
    cboNKermaMaterial.Visible = True
    cboMaterial.Enabled = True
    cboMaterial.Visible = True
    cboPhoton.Enabled = False
    cboPhoton.Visible = False
    cboAlpha.Enabled = False
    cboAlpha.Visible = False
    cboElectron.Enabled = False
    cboElectron.Visible = False
    cboKermaEle.Enabled = False
    cboKermaEle.Visible = False
    cboNKermaEle.Enabled = False
    cboNKermaEle.Visible = False
    cboGPElement.Enabled = False
    cboGPElement.Visible = False
    cboGPMaterial.Enabled = True
    cboGPMaterial.Visible = True
    tabNuclide.TabVisible(6) = True
    tabNuclide.TabEnabled(6) = True
    tabNuclide.TabVisible(8) = False
    tabNuclide.TabEnabled(8) = False
    tabNuclide.TabVisible(20) = True
    tabNuclide.TabEnabled(20) = True
  End If
End Sub

Private Sub cmdDisplay_Early_Click()
  Const PROCEDURE_NAME As String = "cmdDisplay_Early_Click"
  Dim sCommandLine As String, nTemp As Integer, sTime As String, i As Integer
  Dim iL As Integer, sCaption As String, sTemp As String
  
  On Error GoTo Error_Handler:
  grdRBE.Update
  If (optRBE = "Dose") Then
    gs_UseRBE = "N"
  Else
    gs_UseRBE = "Y"
  End If
  sCommandLine = "Inh " & Trim(cboEarlyNuc.Text) & " " _
    & Trim(cboEarlyType.Text) & " " & Trim(gs_EarlyLET) & " " & gs_UseRBE
  If gs_EarlyLET = "L" Then
    sCommandLine = sCommandLine & " 0 0 0 0"
    gs_UseRBE = "N"
  Else
    For i = 1 To 4
      If XRBE(i, 1) = " " Then
        XRBE(i, 1) = 0#
      ElseIf Not IsNumeric(XRBE(i, 1)) Then
        XRBE(i, 1) = 0#
      End If
      sCommandLine = sCommandLine & " " & Trim(Str(XRBE(i, 1)))
    Next i
  End If
  grdTimes.Update
  For i = 1 To 10
    If (XTimes(i, 0) > 0 And Len(Trim(XTimes(i, 0))) > 0) Then
      If optIntUnits.Value = "Years" Then
        nTemp = Val(XTimes(i, 0)) * 365
        sTime = Str(nTemp)
      Else
        sTime = XTimes(i, 0)
      End If
      sCommandLine = sCommandLine & " " & Trim(sTime)
    End If
  Next i
  Call Dose_Rates(sCommandLine)
   
  gView_File_Name = gs_TempPath & "DoseRate.tmp"
  Load frmEarlyViewer
'  If (gs_UseRBE = "N") Then
'    i = InStr(lblEarlyUnits, "Sv")
    sTemp = lblEarlyUnits
'    Mid(sTemp, i, 2) = "Gy"
    sCaption = "Absorbed Dose Coefficient (" & sTemp & ")"
'  Else
'    sCaption = "Absorbed Inhalation Dose Equivalent (" & lblEarlyUnits & ")"
'  End If
  frmEarlyViewer.Caption = sCaption
  frmEarlyViewer.Show vbModal
  Set frmEarlyViewer = Nothing
  Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

Display_Abort:

End Sub

Private Sub cmdDisplayGP_Click()
  gs_myTable = optGSDisplayType.Value
  If gs_AbsorberType = "Ele" Then
    gs_EleSelected = cboGPElement.Text
  Else
    gs_MatSelected = cboGPMaterial.Text
    If gs_MatSelected = "User-defined" Then
      frmDefineMaterial.Show vbModal
      Set frmDefineMaterial = Nothing
      If gs_UserMaterialName = "Cancel" Or g_NumUserEles = 0 Then
        Exit Sub
      End If
    Else
      b_UserDefinedMat = True
   End If
  End If
  frmPhoBuildup.Show vbModal
  Set frmPhoBuildup = Nothing
End Sub

Private Sub cmdDisplayNeutronField_Click()
  Dim i As Integer, sTable As String
    
  If (Mid(optNeutronField, 1, 1) <> "O") Then
    i = InStr(optNeutronField, " ")
    sTable = Mid(optNeutronField, 1, i)
    gs_NucSelected = sTable
  Else
    gs_NucSelected = optNeutronField
  End If
  gs_Columns = "*"
  If Len(gs_Columns) = 0 Then
    MsgBox "You must select at least one type of data to display"
  Else
    gs_myTable = "NeutronField"
    frmEleTable.Show vbModal
    Set frmEleTable = Nothing
  End If
End Sub

Private Sub cmdDisplayPhotonField_Click()
  Dim i As Integer, sTable As String
    
  If (Mid(optPhotonField, 1, 1) <> "O") Then
    i = InStr(optPhotonField, " ")
    sTable = Mid(optPhotonField, 1, i)
    gs_NucSelected = sTable
  Else
    gs_NucSelected = optPhotonField
  End If
  gs_Columns = "*"
  If Len(gs_Columns) = 0 Then
    MsgBox "You must select at least one type of data to display"
  Else
    gs_myTable = "PhotonField"
    frmEleTable.Show vbModal
    Set frmEleTable = Nothing
  End If
End Sub

Private Sub cmdDoseCalcs_Click()
Dim i As Integer, C As TrueDBGrid80.Column
  
  nThisTab = tabNuclide.Tab
  If nThisTab > 4 Then
    nThisTab = 0
  End If
  For i = 0 To 4
    tabNuclide.TabEnabled(i) = True
    tabNuclide.TabVisible(i) = True
  Next i
  For i = 5 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.Tab = 1
  cmdDoseCalcs.FontBold = True
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  lblICRP38Units = gs_Activity_Unit
  lblICRP68Units = gs_Activity_Unit
  lblICRP72IngUnits = gs_Activity_Unit
  lblICRP72InhUnits = gs_Activity_Unit
  cmdRisk.FontBold = False
  If optExternal = "Ground Surface" Then
    lblExtUnits = gs_GndActivity_Unit
  Else
    lblExtUnits = gs_AirActivity_Unit
  End If
  gs_AbsorberType = ""
  
  chkExtDau.Enabled = False
  chkExtDau.Visible = False
  cmdExtPaste.Enabled = True
  cmdExtPaste.Visible = True
  chkICRP30Dau.Enabled = False
  chkICRP30Dau.Visible = False
  chkICRP68Dau.Enabled = False
  chkICRP68Dau.Visible = False
  chk72IngDau.Enabled = False
  chk72IngDau.Visible = False
  chk72InhDau.Enabled = False
  chk72InhDau.Visible = False
  cmdICRP30Paste.Enabled = True
  cmdICRP30Paste.Visible = True
  cmdICRP68Paste.Enabled = True
  cmdICRP68Paste.Visible = True
  cmd72IngPaste.Enabled = True
  cmd72IngPaste.Visible = True
  cmd72InhPaste.Enabled = True
  cmd72InhPaste.Visible = True
  
  If (nDoseCols <> 2) Then
    Set C = grdICRP68.Columns.Add(1)
    C.Visible = True
    C.NumberFormat = "Scientific"
    C.Caption = "Activity"
    C.AllowFocus = True
    C.Width = 1000
    grdICRP68.Width = 2575
    grdICRP68.ReBind
'    grdICRP68.SetFocus
    
    Set C = grd38.Columns.Add(1)
    C.Visible = True
    C.NumberFormat = "Scientific"
    C.Caption = "Activity"
    C.Width = 1000
    grd38.Width = 2575
    grd38.ReBind
    
    Set C = grd72Inh.Columns.Add(1)
    C.Visible = True
    C.NumberFormat = "Scientific"
    C.Caption = "Activity"
    C.Width = 1000
    grd72Inh.Width = 2575
    grd72Inh.ReBind
    
    Set C = grd72Ing.Columns.Add(1)
    C.Visible = True
    C.NumberFormat = "Scientific"
    C.Caption = "Activity"
    C.Width = 1000
    grd72Ing.Width = 2575
    grd72Ing.ReBind
    
    Set C = grdExt.Columns.Add(1)
    C.Visible = True
    C.NumberFormat = "Scientific"
    C.Caption = "Activity"
    C.Width = 1000
    grdExt.Width = 2575
    grdExt.ReBind
    nDoseCols = 2
  End If
  gb_IsDoseCalc = True
  tabNuclide.Tab = nThisTab
End Sub

Private Sub cmdDoseRangeRem_Click()
  frmPicture2.Show vbModal
  Set frmPicture2 = Nothing
End Sub

Private Sub cmdDoseRangeSv_Click()
Dim Scr_hDC As Long, sDoc As Long
On Error GoTo noadobe
  gs_LinkSelected = gs_HelpPath & "DoseRanges.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"
End Sub

Private Sub cmdEarlyEffects_Click()
Dim i As Integer
  For i = 0 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.TabEnabled(19) = True
  tabNuclide.TabVisible(19) = True
  tabNuclide.Tab = 19
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = True
  cmdRisk.FontBold = False
  gs_AbsorberType = ""

End Sub

Private Sub cmdExposure_Click()
Dim i As Integer
  For i = 0 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.TabVisible(14) = True
  tabNuclide.TabEnabled(14) = True
  tabNuclide.Tab = 14
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = True
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  cmdRisk.FontBold = False
  gs_AbsorberType = ""
End Sub

Private Sub cmdExtPaste_Click()
Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      xExt(j, i) = gd_CopyArray(j, i)
    Next j
  Next i
  grdExt.Refresh
  
End Sub

Private Sub cmdFGR12Help_Click()
   Const PROCEDURE_NAME As String = "mnuFGR12Help_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "Dose_12.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdFoodRates_Click()
  gs_NucSelected = "Usage Gender Specific"
  gs_Columns = "*"
  gs_myTable = "BioPublic"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing
End Sub

Private Sub cmdFormulas_Click()
  gView_File_Name = gs_EqnPath & gs_FormulaFiles(cboFormulas.ListIndex, 0)
  frmFileViewer.Caption = cboFormulas.Text
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing
End Sub

Private Sub cmdICRP30Help_Click()
   Const PROCEDURE_NAME As String = "mnuICRP30Help_Click"
    Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ICRP_Pub30.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub


Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdICRP30Paste_Click()
Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x38(j, i) = gd_CopyArray(j, i)
    Next j
  Next i
  grd38.Refresh

End Sub

Private Sub cmdICRP68Paste_Click()
Dim i As Integer, j As Integer

  For i = 0 To 1
    For j = 0 To 20
      x68(j, i) = gd_CopyArray(j, i)
    Next j
  Next i
  grdICRP68.Refresh

End Sub

Private Sub cmdICRP89_Click()
'Dim iRet As Integer, Prg As String
'  Prg = gs_EXEPath & "ICRP_89.exe"
'  iRet = Shell(Prg, vbNormalFocus)
  gsICRP89Type = cboICRP89.Text
  frmDisplayICRP89.Show vbModal
  Set frmDisplayICRP89 = Nothing
End Sub

Private Sub cmdInhRates_Click()
  gs_NucSelected = cboInhRates.Text
  gs_Columns = "*"
  gs_myTable = "BioPublic"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing
End Sub

Private Sub cmdMaterials_Click()
  gView_File_Name = gs_TextPath & "pexptxt3.rtf"
  frmFileViewer.Caption = cmdMaterials.Caption
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing
  
End Sub

Private Sub cmdMedical_Click()
  gView_File_Name = gs_TextPath & "pexptxt6.rtf"
  frmFileViewer.Caption = "Medical Diagnostic Procedures"
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing

End Sub

Private Sub cmdNatBack_Click()
  gView_File_Name = gs_TextPath & "pexptxt1.rtf"
  frmFileViewer.Caption = cmdNatBack.Caption
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing

End Sub

Private Sub cmdNeutronFieldHelp_Click()
   Const PROCEDURE_NAME As String = "cmdNeutronFieldHelp_Click"
    Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ICRP_74.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdNIST_Click()
  frmPicture3.Show vbModal
  Set frmPicture3 = Nothing
End Sub

Private Sub cmdOrganMassUnits_Click()
  Const PROCEDURE_NAME As String = "cmdOrganMassUnits_Click"
   
   lblMassUnits = fns_Mass_Units
   gs_Mass_Units = lblMassUnits
   Exit Sub
   
Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub cmdPhotonFieldHelp_Click()
   Const PROCEDURE_NAME As String = "cmdPhotonFieldHelp_Click"
    Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ICRP_74.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdPhysConstants_Click()
  Const PROCEDURE_NAME As String = "cmdPhysConstants_Click"
  Dim Scr_hDC As Long, sDoc As Long

  On Error GoTo noadobe
 
  gs_LinkSelected = gs_HelpPath & "Extensive_List.pdf"
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
  If sDoc <= 32 Then
    MsgBox "Can't display PDF file"
  End If
  Exit Sub
noadobe:
  MsgBox "Can't display PDF file"

End Sub

Private Sub cmdPrimordial_Click()
  gView_File_Name = gs_TextPath & "pexptxt5.rtf"
  frmFileViewer.Caption = cmdPrimordial.Caption
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing


End Sub

Private Sub cmdRef_Click(Index As Integer)
  Dim i As Integer, nRefs As Integer, sStr As String
  
  nRefs = gs_References(Index, 0)
  sStr = ""
  For i = 1 To nRefs
    sStr = sStr & vbCr & vbLf & gs_References(Index, i) & vbLf
  Next i
  MsgBox sStr, 0, "References"
End Sub

Private Sub cmdSIUnits_Click()
  Const PROCEDURE_NAME As String = "cmdSIUnits_Click"
    Dim FN As String

  On Error GoTo Error_Handler
 
  FN = gs_HelpPath & "SIUnits.chm"
  HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub cmdThreshold_Click()
  gView_File_Name = gs_TextPath & gs_TextFiles(cboThreshold.ListIndex, 0)
  frmFileViewer.Caption = cboThreshold.Text
  frmFileViewer.lblDecay.Visible = False
  Load frmFileViewer
  frmFileViewer.Show vbModal
  Set frmFileViewer = Nothing
End Sub

Private Sub cmdTissue_Click()
  gs_AbsorberType = "Tissue"
  gs_NucSelected = cboTissue.Text
  gs_Columns = "[" & gs_NucSelected & "].[Atomic Number], [" & gs_NucSelected _
    & "].Symbol, [Weight Fraction], [Std Atomic Weight]"
  gs_myTable = "Material"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing
'  gs_AbsorberType = "Mat"
  gs_AbsorberType = ""

End Sub

Private Sub mnuAbsGloss_Click()
  Const PROCEDURE_NAME As String = "mnuGlossary_Click"
 
  On Error GoTo Error_Handler
 
  With cmnDialog
     .HelpFile = gs_HelpPath & "Definitions.hlp"
     .HelpContext = 1
     .HelpCommand = &H1&
     .ShowHelp
  End With
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub mnuBladder_Click()
  Const PROCEDURE_NAME As String = "mnuCoefficients_Click"
 
  On Error GoTo Error_Handler
 
  With cmnDialog
     .HelpFile = gs_HelpPath & "ubmod.hlp"
     .HelpCommand = &H3&
     .ShowHelp
  End With
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub mnuCoeff_Click()
   Const PROCEDURE_NAME As String = "mnuExtHelp_Click"
 
   On Error GoTo Error_Handler
 
   With cmnDialog
      .HelpFile = gs_HelpPath & "Dose_74.hlp"
      .HelpCommand = &H3&
      .ShowHelp
   End With
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub mnuCoefficients_Click()
  Const PROCEDURE_NAME As String = "mnuCoefficients_Click"
 
  On Error GoTo Error_Handler
 
  With cmnDialog
     .HelpFile = gs_HelpPath & "biokinet.hlp"
     .HelpCommand = &H3&
     .ShowHelp
  End With
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub mnuDoseGloss_Click()
  Const PROCEDURE_NAME As String = "mnuDoseGloss_Click"
 
  On Error GoTo Error_Handler
 
  With cmnDialog
     .HelpFile = gs_HelpPath & "glossary.hlp"
     .HelpContext = 1
     .HelpCommand = &H1&
     .ShowHelp
  End With
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub mnuGI_Click()
  Const PROCEDURE_NAME As String = "mnuCoefficients_Click"
 
  On Error GoTo Error_Handler
 
  With cmnDialog
     .HelpFile = gs_HelpPath & "gitmod.hlp"
     .HelpCommand = &H3&
     .ShowHelp
  End With
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub cmdHelp68_Click()
   Const PROCEDURE_NAME As String = "mnuHelp68_Click"
    Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ICRP_Pub68.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub


Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdHelp72Ing_Click()
  cmdHelp72Inh_Click
End Sub

Private Sub cmdHelp72Inh_Click()
   Const PROCEDURE_NAME As String = "mnuHelp72Inh_Click"
    Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ICRP_Pub72.chm"
'   Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub


Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub cmdLinks_Click()
Dim Scr_hDC As Long, sDoc As Long, i As Integer

  i = cboWebLinks.ListIndex
  If (i < 0) Then
    i = 0
  End If
  gs_LinkSelected = XLinks(i, 1)
  Scr_hDC = GetDesktopWindow()
  sDoc = ShellExecute(Scr_hDC, "Open", gs_LinkSelected, "", "C:\", SW_SHOWNORMAL)
    
End Sub

Private Sub cmdNuclideData_Click()
Dim i As Integer

  nThisTab = tabNuclide.Tab
  If nThisTab > 4 Then
    nThisTab = 0
  End If
  For i = 0 To 4
    tabNuclide.TabEnabled(i) = True
    tabNuclide.TabVisible(i) = True
  Next i
  For i = 5 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.Tab = 1
  cmdNuclideData.FontBold = True
  cmdDoseCalcs.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  lblICRP38Units = gs_Inh_Units
  lblICRP68Units = gs_Inh_Units
  lblICRP72IngUnits = gs_Inh_Units
  lblICRP72InhUnits = gs_Inh_Units
  cmdRisk.FontBold = False
  If optExternal = "Ground Surface" Then
    lblExtUnits = gs_Gnd_Units
  Else
    lblExtUnits = gs_Air_Units
  End If
  gs_AbsorberType = ""
    
  chkExtDau.Enabled = True
  chkExtDau.Visible = True
  cmdExtPaste.Enabled = False
  cmdExtPaste.Visible = False
  chkICRP30Dau.Enabled = True
  chkICRP30Dau.Visible = True
  chkICRP68Dau.Enabled = True
  chkICRP68Dau.Visible = True
  chk72IngDau.Enabled = True
  chk72IngDau.Visible = True
  chk72InhDau.Enabled = True
  chk72InhDau.Visible = True
  cmdICRP30Paste.Enabled = False
  cmdICRP30Paste.Visible = False
  cmdICRP68Paste.Enabled = False
  cmdICRP68Paste.Visible = False
  cmd72IngPaste.Enabled = False
  cmd72IngPaste.Visible = False
  cmd72InhPaste.Enabled = False
  cmd72InhPaste.Visible = False
  
  If (nDoseCols <> 1) Then
    grdICRP68.Columns.Remove (1)
    grdICRP68.Width = 1575
    grd38.Columns.Remove (1)
    grd38.Width = 1575
    nDoseCols = 2
    grd72Inh.Columns.Remove (1)
    grd72Inh.Width = 1575
    grd72Ing.Columns.Remove (1)
    grd72Ing.Width = 1575
    grdExt.Columns.Remove (1)
    grdExt.Width = 1575
    nDoseCols = 1
  End If
  gb_IsDoseCalc = False
  tabNuclide.Tab = nThisTab
End Sub

Private Sub cmdOrganMasses_Click()
  gs_Columns = "*"
  gs_myTable = "OrganMasses"
  'if cboOrganMass.Text = "ICRP 72" Then
    gs_NucSelected = "Organ Masses ICRP 72"
  'Else
   ' gs_NucSelected = "Organ Masses ICRP 89"
  'End If
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing
End Sub

Private Sub cmdRadField_Click()
Dim i As Integer
  For i = 0 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  For i = 17 To 18
    tabNuclide.TabEnabled(i) = True
    tabNuclide.TabVisible(i) = True
  Next i
  tabNuclide.Tab = 17
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = False
  cmdRadField.FontBold = True
  cmdEarlyEffects.FontBold = False
  cmdRisk.FontBold = False
  gs_AbsorberType = ""
End Sub

Private Sub cmdSupplement_Click()
Dim i As Integer
  isSupp = True
  For i = 0 To 23
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.TabEnabled(16) = True
  tabNuclide.TabVisible(16) = True
  tabNuclide.Tab = 16
  cmdDoseCalcs.FontBold = False
  cmdNuclideData.FontBold = False
  cmdAbsorberEle.FontBold = False
  cmdAbsorberMat.FontBold = False
  cmdDecayData.FontBold = False
  cmdExposure.FontBold = False
  cmdBiological.FontBold = False
  cmdSupplement.FontBold = True
  cmdRadField.FontBold = False
  cmdEarlyEffects.FontBold = False
  cmdRisk.FontBold = False
  cmdRisk.FontBold = False
  gs_AbsorberType = ""
  isSupp = False
End Sub

Private Sub cmdUnits_38_Click()
  Set_Internal_Units
End Sub

Private Sub cmdUnits_68_Click()
  Set_Internal_Units
End Sub

Private Sub cmdUnits_72Ing_Click()
  Set_Internal_Units
End Sub

Private Sub cmdUnits_72Inh_Click()
  Set_Internal_Units
End Sub

Private Sub cmdUnits_Alpha_Click()
Dim i As Integer, sStr As String

  gs_EleForm = "Alpha"
  gs_Energy_Units = fns_Ele_Units
  gs_Photon_Units = Mid(gs_Energy_Units, 5)
  gs_Range_Units = Mid(gs_Photon_Units, 8) & " / " & Mid(gs_Photon_Units, 1, 4)
  lblPhotonUnits = gs_Photon_Units
  lblElectronUnits = gs_Range_Units
  lblAlphaUnits = gs_Range_Units
  lblElectronEUnits = gs_Energy_Units
  lblAlphaEUnits = gs_Energy_Units
   Call NoBlanks(lblPhotonUnits, sStr)
   For i = 1 To 8
     gPhoUnit(i) = sStr
   Next i
   Call NoBlanks(lblElectronEUnits, sStr)
   For i = 1 To 3
     gEleUnit(i) = sStr
   Next i
   Call NoBlanks(lblElectronUnits, gEleUnit(4))
   Call NoBlanks(lblAlphaEUnits, sStr)
   For i = 1 To 3
     gAlpUnit(i) = sStr
   Next i
   Call NoBlanks(lblAlphaUnits, gAlpUnit(4))

End Sub

Private Sub cmdUnits_Atom_Click()
  MsgBox "Not Implemented Yet"
End Sub

Private Sub cmdUnits_Comp_Click()
  MsgBox "Not Implemented Yet"
End Sub

Private Sub cmdUnits_Early_Click()
   Dim L As Integer
   gs_Early_Unit = fns_Early_Units
   lblEarlyUnits = gs_Early_Unit
End Sub

Private Sub cmdUnits_Electron_Click()
Dim i As Integer, sStr As String

  gs_EleForm = "Electron"
  gs_Energy_Units = fns_Ele_Units
  gs_Photon_Units = Mid(gs_Energy_Units, 5)
  gs_Range_Units = Mid(gs_Photon_Units, 8) & " / " & Mid(gs_Photon_Units, 1, 4)
  lblPhotonUnits = gs_Photon_Units
  lblElectronUnits = gs_Range_Units
  lblAlphaUnits = gs_Range_Units
  lblElectronEUnits = gs_Energy_Units
  lblAlphaEUnits = gs_Energy_Units
   Call NoBlanks(lblPhotonUnits, sStr)
   For i = 1 To 8
     gPhoUnit(i) = sStr
   Next i
   Call NoBlanks(lblElectronEUnits, sStr)
   For i = 1 To 3
     gEleUnit(i) = sStr
   Next i
   Call NoBlanks(lblElectronUnits, gEleUnit(4))
   Call NoBlanks(lblAlphaEUnits, sStr)
   For i = 1 To 3
     gAlpUnit(i) = sStr
   Next i
   Call NoBlanks(lblAlphaUnits, gAlpUnit(4))
End Sub

Private Sub cmdUnits_Ext_Click()
Dim L As Integer

'MsgBox tabNuclide.Tab
  nThisTab = tabNuclide.Tab
  If gb_IsDoseCalc Then
    gs_GndActivity_Unit = fns_GndActivity_Units
    lblExtUnits = gs_GndActivity_Unit
    L = InStr(gs_GndActivity_Unit, "2")
    gs_AirActivity_Unit = gs_GndActivity_Unit
    Mid(gs_AirActivity_Unit, L, 1) = "3"
    lblICRP38Units = gs_Activity_Unit
    lblICRP68Units = gs_Activity_Unit
    lblICRP72IngUnits = gs_Activity_Unit
    lblICRP72InhUnits = gs_Activity_Unit
  Else
    If optExternal.Value = "Ground Surface" Then
      gs_Gnd_Units = fns_Gnd_Units
      lblExtUnits = gs_Gnd_Units
      L = InStr(gs_Gnd_Units, "2")
      gs_Air_Units = gs_Gnd_Units
      Mid(gs_Air_Units, L, 1) = "3"
    Else
      gs_Air_Units = fns_Air_Units
      lblExtUnits = gs_Air_Units
      L = InStr(gs_Air_Units, "3")
      gs_Gnd_Units = gs_Air_Units
      Mid(gs_Gnd_Units, L, 1) = "2"
    End If
    lblICRP38Units = gs_Inh_Units
    lblICRP68Units = gs_Inh_Units
    lblICRP72IngUnits = gs_Inh_Units
    lblICRP72InhUnits = gs_Inh_Units
  End If
End Sub

Private Sub cmdUnits_ICRP38_Click()
  Const PROCEDURE_NAME As String = "cmdUnits_ICRP38_Click"
   
   lblICRP38SAUnits = fns_SA_Units
   gs_SA_Units = lblICRP38SAUnits
   Exit Sub
   
Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub cmdUnits_Kerma_Click()
Dim i As Integer, sStr As String, sTemp As String

  gsKerma_Unit = fns_Kerma_Units
  lblKermaUnit = gsKerma_Unit
  Call NoBlanks(lblKermaUnit, sStr)
  gKermUnit = sStr
End Sub
  

Private Sub cmdUnits_NField_Click()
Dim i As Integer, sStr As String, sTemp As String

  gs_FieldForm = "NeutronField"
  gsField_Unit = fns_Field_Units
  lblNeutron = gsField_Unit
  lblPhoton1 = gsField_Unit
  Call NoBlanks(lblNeutron, sStr)
  gNeuFldUnit(1, 1) = sStr
  gNeuFldUnit(2, 1) = sStr
  gNeuFldUnit(14, 2) = sStr
  If (Mid(gsField_Unit, 2, 2) = "Sv") Then
    sTemp = Mid(gsField_Unit, 1, 1) & "Gy " & Mid(gsField_Unit, 5)
  Else
    sTemp = Mid(gsField_Unit, 1, 1) & "rad" & Mid(gsField_Unit, 5)
  End If
  Call NoBlanks(sTemp, sStr)
  gPhoFldUnit(3, 1) = sStr
  For i = 1 To 13
    gNeuFldUnit(i, 2) = sStr
  Next i

  If (Mid(gsField_Unit, 2, 2) = "Sv") Then
    sStr = "Sv/Gy"
    lblPhoton2 = " Sv  /  Gy "
  Else
    sStr = "rem/rad"
    lblPhoton2 = " rem /  rad"
  End If
  gPhoFldUnit(1, 1) = sStr
  gPhoFldUnit(2, 1) = sStr
  gPhoFldUnit(17, 2) = sStr
  If (sStr = "Sv/Gy") Then
    sTemp = "Gy/Gy"
  Else
    sTemp = "rad/rad"
  End If
  sStr = sTemp
  For i = 1 To 16
    gPhoFldUnit(i, 2) = sStr
  Next i
End Sub

Private Sub cmdUnits_PField_Click()
Dim i As Integer, sStr As String, sTemp As String

  gs_FieldForm = "PhotonField"
  gsField_Unit = fns_Field_Units
  lblNeutron = gsField_Unit
  lblPhoton1 = gsField_Unit
  Call NoBlanks(lblNeutron, sStr)
  gNeuFldUnit(1, 1) = sStr
  gNeuFldUnit(2, 1) = sStr
  gNeuFldUnit(14, 2) = sStr
  If (Mid(gsField_Unit, 2, 2) = "Sv") Then
    sTemp = Mid(gsField_Unit, 1, 1) & "Gy " & Mid(gsField_Unit, 5)
  Else
    sTemp = Mid(gsField_Unit, 1, 1) & "rad" & Mid(gsField_Unit, 5)
  End If
  Call NoBlanks(sTemp, sStr)
  gPhoFldUnit(3, 1) = sStr
  For i = 1 To 13
    gNeuFldUnit(i, 2) = sStr
  Next i

  If (Mid(gsField_Unit, 2, 2) = "Sv") Then
    sStr = "Sv/Gy"
    lblPhoton2 = " Sv  /  Gy "
  Else
    sStr = "rem/rad"
    lblPhoton2 = " rem /  rad"
  End If
  gPhoFldUnit(1, 1) = sStr
  gPhoFldUnit(2, 1) = sStr
  gPhoFldUnit(4, 1) = sStr
  gPhoFldUnit(5, 1) = sStr
  gPhoFldUnit(17, 2) = sStr
  If (sStr = "Sv/Gy") Then
    sTemp = "Gy/Gy"
  Else
    sTemp = "rad/rad"
  End If
  sStr = sTemp
  For i = 1 To 16
    gPhoFldUnit(i, 2) = sStr
  Next i
End Sub

Private Sub cmdUnits_Photon_Click()
Dim i As Integer, sStr As String

  gs_EleForm = "Photon"
  gs_Energy_Units = fns_Ele_Units
  gs_Photon_Units = Mid(gs_Energy_Units, 5)
  gs_Range_Units = Mid(gs_Photon_Units, 8) & " / " & Mid(gs_Photon_Units, 1, 4)
  lblPhotonUnits = gs_Photon_Units
  lblElectronUnits = gs_Range_Units
  lblAlphaUnits = gs_Range_Units
  lblElectronEUnits = gs_Energy_Units
  lblAlphaEUnits = gs_Energy_Units
   Call NoBlanks(lblPhotonUnits, sStr)
   For i = 1 To 8
     gPhoUnit(i) = sStr
   Next i
   Call NoBlanks(lblElectronEUnits, sStr)
   For i = 1 To 3
     gEleUnit(i) = sStr
   Next i
   Call NoBlanks(lblElectronUnits, gEleUnit(4))
   Call NoBlanks(lblAlphaEUnits, sStr)
   For i = 1 To 3
     gAlpUnit(i) = sStr
   Next i
   Call NoBlanks(lblAlphaUnits, gAlpUnit(4))
End Sub

Private Sub cmdUnits_Proton_Click()
  MsgBox "Not Implemented Yet"
End Sub

Private Sub cmdDisplay_Comp_Click()
  
  If optComp = "Atom fraction" Then
    MsgBox "Only Mass Fraction currently available"
    Exit Sub
  End If
  gs_AbsorberType = ""
  gs_MatSelected = cboMaterial.Text
  gs_Columns = "[" & gs_MatSelected & "].[Atomic Number], [" & gs_MatSelected _
    & "].Symbol, [Weight Fraction], [Std Atomic Weight]"
  gs_myTable = "Material"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing
  gs_AbsorberType = "Mat"
End Sub

Private Sub Form_Activate()
  Call RTShowInTaskBar(hWnd, True)
End Sub

Private Sub Form_Load()
  Dim i As Integer, j As Integer, ne As Integer, sDBName As String, sName As String
  Dim rsNuc As Recordset, bDum As Boolean, sFile As String
  Dim nR As Integer, nRi As Integer, rc As Integer
  
  PositionForm Me
  from38or68 = 68
  
  tabNuclide.TabVisible(21) = False
  tabNuclide.TabVisible(22) = False
  tabNuclide.TabVisible(23) = False
  
 ' App.HelpFile = App.Path & "\HELP\RadToolBox.hlp"
 ' cmnDialog.HelpFile = App.Path & "\HELP\RadToolBox.hlp"

  dataEle.DatabaseName = gs_DataPath & "electron.mdb"
  dataEle.RecordSource = "Select Name from Elements"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboElectron.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboElectron.ListIndex = 0

  dataEle.DatabaseName = gs_DataPath & "photon.mdb"
  dataEle.RecordSource = "Select Name from Elements"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboPhoton.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboPhoton.ListIndex = 0

  dataEle.DatabaseName = gs_DataPath & "Material.mdb"
  dataEle.RecordSource = "Select * from Matnames"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    If rsNuc![MatType] = "M" Then
      cboMaterial.AddItem rsNuc.Fields(0).Value
    Else
      cboTissue.AddItem rsNuc.Fields(0).Value
    End If
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboMaterial.ListIndex = 0
  cboTissue.ListIndex = 1

  dataEle.DatabaseName = gs_DataPath & "Element.mdb"
  dataEle.RecordSource = "Select Symbol from Elements order by Symbol"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboAtom.AddItem rsNuc.Fields(0).Value
    cboNX.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboAtom.ListIndex = 0
  cboNX.ListIndex = 0

  dataEle.DatabaseName = gs_DataPath & "Alpha.mdb"
  dataEle.RecordSource = "Select Name from Elements order by Name"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboAlpha.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboAlpha.ListIndex = 0
  
  dataEle.DatabaseName = gs_DataPath & "KermaP.mdb"
  dataEle.RecordSource = "Select * from Elements order by Element"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboKermaEle.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  dataEle.RecordSource = "Select * from Materials order by material"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  cboKermaMaterial.AddItem "User-defined"
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboKermaMaterial.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  
  dataEle.DatabaseName = gs_DataPath & "Material.mdb"
  dataEle.RecordSource = "Select * from Matnames"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  cboPhotonMat.AddItem "User-defined"
  cboGPMaterial.AddItem "User-defined"
  cboAlphaMat.AddItem "User-defined"
  cboElectronMat.AddItem "User-defined"
  While Not rsNuc.EOF
    cboPhotonMat.AddItem rsNuc.Fields(0).Value
    cboGPMaterial.AddItem rsNuc.Fields(0).Value
    cboAlphaMat.AddItem rsNuc.Fields(0).Value
    cboElectronMat.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboKermaEle.ListIndex = 0
  cboKermaMaterial.ListIndex = 0
  cboPhotonMat.ListIndex = 0
  cboGPMaterial.ListIndex = 0
  cboAlphaMat.ListIndex = 0
  cboElectronMat.ListIndex = 0
  
  dataEle.DatabaseName = gs_DataPath & "KermaN.mdb"
  dataEle.RecordSource = "Select * from Elements order by Element"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboNKermaEle.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  dataEle.RecordSource = "Select * from Materials order by Material"
  dataEle.Refresh
  Set rsNuc = dataEle.Recordset
  cboNKermaMaterial.AddItem "User-defined"
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboNKermaMaterial.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboKermaEle.ListIndex = 0
  cboKermaMaterial.ListIndex = 0
  cboNKermaEle.ListIndex = 0
  cboNKermaMaterial.ListIndex = 0
  
  Data38Index.DatabaseName = gs_DataPath & "icrp07-index.mdb"
  Data38Index.RecordSource = "Select Nuclide from [ICRP-07]"
  Data38Index.Refresh
  Set rsNuc = Data38Index.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboDecayNuc.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  Data38Index.RecordSource = "Select * from [ICRP-07] where [Nuclide] = '" & cboDecayNuc & "'"
  
  ddADoses.DatabaseName = gs_DataPath & "bioassay.mdb"
  ddADoses.RecordSource = "Select Name from ChoiceList order by Name"
  ddADoses.Refresh
  Set rsNuc = ddADoses.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboBioNuc.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboBioNuc.ListIndex = 0
  
  ddADoses.DatabaseName = gs_DataPath & "adoses.mdb"
  ddADoses.RecordSource = "Select Nuclide from [Adoses]"
  ddADoses.Refresh
  Set rsNuc = ddADoses.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboEarlyNuc.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboEarlyNuc.ListIndex = 0
  
  dataGP.DatabaseName = gs_DataPath & "geoProg.mdb"
  dataGP.RecordSource = "Select Symbol from Elements order by Symbol"
  dataGP.Refresh
  Set rsNuc = dataGP.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboGPElement.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboGPElement.ListIndex = 0
  
  ddADoses.RecordSource = "Select * from [ADoses] where [Nuclide] = '" & cboEarlyNuc & "'"
  
  DataExt.DatabaseName = gs_DataPath & "FGR12.mdb"
  DataExt.RecordSource = "Select Nuclide from [Air Submersion]"
  DataInh.DatabaseName = gs_DataPath & "FGR12.mdb"
  DataInh.RecordSource = "Select Distinct Nuclide from Inhalation"
  data68Data.DatabaseName = gs_DataPath & "icrp68.mdb"
  data68Data.RecordSource = "Select Distinct Nuclide from Inhalation"
  data72.DatabaseName = gs_DataPath & "icrp72.mdb"
  data72.RecordSource = "Select Distinct Nuclide from [Inhalation Adult]"
  dataRiskInt.DatabaseName = gs_DataPath & "risk.mdb"
  dataRiskInt.RecordSource = "Select Nuclide from FGR13CD where InhCount <> 0"
  dataRiskExt.DatabaseName = gs_DataPath & "risk.mdb"
  dataRiskExt.RecordSource = "Select Nuclide from FGR13CD where ExtCount <> 0"
  dataRisk.DatabaseName = gs_DataPath & "risk.mdb"
  dataRisk.RecordSource = "Select Nuclide from FGR13CD"
  

  DataICRP89.DatabaseName = gs_DataPath & "icrp_89.mdb"
  DataICRP89.RecordSource = "Select Distinct Type from [ICRP89_20Aug05] where type <> 'organ Mass'"
  DataICRP89.Refresh
  Set rsNuc = DataICRP89.Recordset
  rsNuc.MoveFirst
  While Not rsNuc.EOF
    cboICRP89.AddItem rsNuc.Fields(0).Value
    rsNuc.MoveNext
  Wend
  Set rsNuc = Nothing
  cboICRP89.ListIndex = 0
  
  xExt.ReDim 0, 20, 0, 1
  x38.ReDim 0, 20, 0, 1
  x68.ReDim 0, 20, 0, 1
  x72Inh.ReDim 0, 20, 0, 1
  x72Ing.ReDim 0, 20, 0, 1
  xRisk.ReDim 0, 20, 0, 1
  grdExt.Array = xExt
  grd38.Array = x38
  grdICRP68.Array = x68
  grd72Inh.Array = x72Inh
  grd72Ing.Array = x72Ing
  grdRisk.Array = xRisk
  nDoseCols = 1
  
  grdRBE.Array = XRBE
  grdRBE.Columns(0).Locked = True
  grdRBE.Columns(1).Locked = False
  grdTimes.Array = XTimes
  grdTimes.AllowRowSelect = False
  grdRBE.AllowRowSelect = False
  
  cboEarlyType.AddItem "F"
  cboEarlyType.AddItem "M"
  cboEarlyType.AddItem "S"
  cboEarlyType.ListIndex = 0
  cboEarlyNuc_Validate bDum
  
  cboBioType.AddItem "M"
  cboBioType.ListIndex = 0
  
  cboInhRates.AddItem "Air Intake Worker"
  cboInhRates.AddItem "Air Intake Public"
  cboInhRates.ListIndex = 0
  
  'cboOrganMass.AddItem "ICRP 72"
'  cboOrganMass.AddItem "ICRP 89"
 ' cboOrganMass.ListIndex = 0
  
  cboBiokinetic.AddItem "GI model"
  cboBiokinetic.AddItem "Bladder model"
  cboBiokinetic.AddItem "Lung model"
  cboBiokinetic.AddItem "Systemic model"
  cboBiokinetic.ListIndex = 0
  
  cboDecayTimeUnits.AddItem "years"
  cboDecayTimeUnits.AddItem "days"
  cboDecayTimeUnits.AddItem "hours"
  cboDecayTimeUnits.AddItem "minutes"
  cboDecayTimeUnits.ListIndex = 0

' equations
  sName = gs_EqnPath & "equations.dat"
  Open sName For Input As #20
  Input #20, ne
  gs_FormulaFiles.ReDim 0, ne - 1, 0, 0
  For i = 1 To ne
    Input #20, sFile, sName
    gs_FormulaFiles(i - 1, 0) = sFile
    cboFormulas.AddItem sName
  Next i
  Close #20
  cboFormulas.ListIndex = 0
'  cboFormulas.VisibleItems = ne
  
' references
  sName = gs_DataPath & "refs.txt"
  Open sName For Input As #20
  Input #20, nR, rc
  gs_References.ReDim 0, 22, 0, rc
  For i = 0 To nR - 1
    Input #20, nRi, rc, sName
    gs_References(nRi, 0) = rc
    For j = 1 To gs_References(nRi, 0)
      Input #20, sName
      gs_References(nRi, j) = sName
    Next j
  Next i
  Close #20
  
' thresholds
  sName = gs_TextPath & "textfiles.dat"
  Open sName For Input As #20
  Input #20, ne
  gs_TextFiles.ReDim 0, ne - 1, 0, 0
  For i = 1 To ne
    Input #20, sFile, sName
    gs_TextFiles(i - 1, 0) = sFile
    cboThreshold.AddItem sName
  Next i
  Close #20
  cboThreshold.ListIndex = 0
'  cboThreshold.Text = ne   10/12/10
  
' links
  For i = 0 To gnNumLinks - 1
    cboWebLinks.List(i) = XLinks(i, 0)
  Next i
  cboWebLinks.Text = cboWebLinks.List(gnFirstLink)
 
  For i = 0 To 4
    tabNuclide.TabEnabled(i) = True
    tabNuclide.TabVisible(i) = True
  Next i
  For i = 5 To 20
    tabNuclide.TabEnabled(i) = False
    tabNuclide.TabVisible(i) = False
  Next i
  tabNuclide.Tab = 1
  cmdNuclideData.FontBold = True
  cboDecayNuc.ListIndex = 0
  '.AddItem " "
  
  cmdExtPaste.Enabled = False
  cmdExtPaste.Visible = False
  cmdICRP30Paste.Enabled = False
  cmdICRP30Paste.Visible = False
  cmdICRP68Paste.Enabled = False
  cmdICRP68Paste.Visible = False
  cmd72IngPaste.Enabled = False
  cmd72IngPaste.Visible = False
  cmd72InhPaste.Enabled = False
  cmd72InhPaste.Visible = False
  
  nThisTab = 1
  
  
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
' Check to make sure no other forms are still loaded. Leaving forms loaded may cause some
' computers to keep the process running and then not allow the shell to restart them.
   Dim nFormCount As Integer, sFormName As String, frmForm As Form, sStr As String
   
'   nFormCount = 0
'   sFormName = ""
'   For Each frmForm In Forms
'      nFormCount = nFormCount + 1
'      sFormName = frmForm.Name
'      MsgBox sFormName
'   Next
   gb_AllDone = True
   For Each frmForm In Forms
      If frmForm.Name <> Me.Name Then
'         Unload frmForm
         Set frmForm = Nothing
      End If
   Next
   
End Sub

Private Sub Form_Unload(Cancel As Integer)
' Check to make sure no other forms are still loaded. Leaving forms loaded may cause some
' computers to keep the process running and then not allow the shell to restart them.
   Dim nFormCount As Integer, sFormName As String, frmForm As Form, sStr As String
   
   nFormCount = 0
   sFormName = ""
   For Each frmForm In Forms
      nFormCount = nFormCount + 1
      sFormName = frmForm.Name
   Next
   
   For Each frmForm In Forms
      If frmForm.Name <> Me.Name Then
         Unload frmForm
         Set frmForm = Nothing
      End If
   Next
  
   End
End Sub

Private Sub grd38_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
   Const PROCEDURE_NAME As String = "grd38_BeforeColUpdate"
   Dim sStr As String
   Dim sSQL_Query As String
   Dim dbNuc As Database
   Dim rsNuc As Recordset
   
   On Error GoTo Error_Handler
   
   Cancel = False
   If ColIndex <> 0 Then
     If Not IsNumeric(grd38.Columns(1).Value) Then
       MsgBox "Must be a numeric value"
       Cancel = True
     End If
     Exit Sub
   End If
   If Len(Trim$(grd38.Columns(0).Value)) > 0 Then
     sSQL_Query = "SELECT * FROM Nuclides"
     DataExt.RecordSource = sSQL_Query
     Set rsNuc = DataExt.Recordset
     rsNuc.MoveFirst
     sSQL_Query = " [Nuclide] =  '" & Trim$(grd38.Columns(0).Value) & "'"
     rsNuc.FindFirst sSQL_Query
     If rsNuc.NoMatch Then
       sStr = grd38.Columns(0).Value & _
       " is not a valid nuclide name.  Please use the choice list to enter names."
       MsgBox sStr, vbInformation + vbOKOnly
       Cancel = True
       rsNuc.MoveFirst
     Else
       grd38.Columns(0).Value = rsNuc![Nuclide]
     End If
   End If

   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error
End Sub

Private Sub grd72Ing_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
   Const PROCEDURE_NAME As String = "grdicrp72ing_BeforeColUpdate"
   Dim sStr As String
   Dim sSQL_Query As String
   Dim dbNuc As Database
   Dim rsNuc As Recordset
   
   On Error GoTo Error_Handler
   
   Cancel = False
   g_UserCheck = True
   If ColIndex <> 0 Then
     If Not IsNumeric(grd72Ing.Columns(1).Value) Then
       MsgBox grd72Ing.Columns(1).Value & " must be a numeric value"
       Cancel = True
       g_UserCheck = False
     End If
     Exit Sub
   End If
   If Len(Trim$(grd72Ing.Columns(0).Value)) > 0 Then
     sSQL_Query = "SELECT * FROM Ingestion"
     data68Data.RecordSource = sSQL_Query
     Set rsNuc = data72.Recordset
     rsNuc.MoveFirst
     sSQL_Query = " [Nuclide] =  '" & Trim$(grd72Ing.Columns(0).Value) & "'"
     rsNuc.FindFirst sSQL_Query
     If rsNuc.NoMatch Then
       sStr = grd72Ing.Columns(0).Value & _
       " is not a valid nuclide name.  Please use the choice list to enter names."
       MsgBox sStr, vbInformation + vbOKOnly
       Cancel = True
       g_UserCheck = False
       rsNuc.MoveFirst
     Else
       grd72Ing.Columns(0).Value = rsNuc![Nuclide]
     End If
   End If
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub grd72Inh_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
   Const PROCEDURE_NAME As String = "grdicrp72inh_BeforeColUpdate"
   Dim sStr As String
   Dim sSQL_Query As String
   Dim dbNuc As Database
   Dim rsNuc As Recordset
   
   On Error GoTo Error_Handler
   
   Cancel = False
   If ColIndex <> 0 Then
     If Not IsNumeric(grd72Inh.Columns(1).Value) Then
       MsgBox "Must be a numeric value"
       Cancel = True
     End If
     Exit Sub
   End If
   If Len(Trim$(grd72Inh.Columns(0).Value)) > 0 Then
     sSQL_Query = "SELECT * FROM Inhalation"
     data68Data.RecordSource = sSQL_Query
     Set rsNuc = data72.Recordset
     rsNuc.MoveFirst
     sSQL_Query = " [Nuclide] =  '" & Trim$(grd72Inh.Columns(0).Value) & "'"
     rsNuc.FindFirst sSQL_Query
     If rsNuc.NoMatch Then
       sStr = grd72Inh.Columns(0).Value & _
       " is not a valid nuclide name.  Please use the choice list to enter names."
       MsgBox sStr, vbInformation + vbOKOnly
       Cancel = True
       rsNuc.MoveFirst
     Else
       grd72Inh.Columns(0).Value = rsNuc![Nuclide]
     End If
   End If
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error


End Sub

Private Sub grdExt_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
   Const PROCEDURE_NAME As String = "grdExt_BeforeColUpdate"
   Dim sStr As String
   Dim sSQL_Query As String
   Dim dbNuc As Database
   Dim rsNuc As Recordset
   
   On Error GoTo Error_Handler
   
   Cancel = False
   If ColIndex <> 0 Then
     If Not IsNumeric(grdExt.Columns(1).Value) Then
       MsgBox "Must be a numeric value"
       Cancel = True
     End If
     Exit Sub
   End If
   If Len(Trim$(grdExt.Columns(0).Value)) > 0 Then
     sSQL_Query = "SELECT * FROM Nuclides"
     DataExt.RecordSource = sSQL_Query
     Set rsNuc = DataExt.Recordset
     rsNuc.MoveFirst
     sSQL_Query = " [Nuclide] =  '" & Trim$(grdExt.Columns(0).Value) & "'"
     rsNuc.FindFirst sSQL_Query
     If rsNuc.NoMatch Then
       sStr = grdExt.Columns(0).Value & _
       " is not a valid nuclide name.  Please use the choice list to enter names."
       MsgBox sStr, vbInformation + vbOKOnly
       Cancel = True
       rsNuc.MoveFirst
     Else
       grdExt.Columns(0).Value = rsNuc![Nuclide]
     End If
   End If
 
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub grdICRP68_BeforeColUpdate(ByVal ColIndex As Integer, _
  OldValue As Variant, Cancel As Integer)
   Const PROCEDURE_NAME As String = "grdicrp68_BeforeColUpdate"
   Dim sStr As String
   Dim sSQL_Query As String
   Dim dbNuc As Database
   Dim rsNuc As Recordset
   
   On Error GoTo Error_Handler
   
   Cancel = False
   If ColIndex <> 0 Then
     If Not IsNumeric(grdICRP68.Columns(1).Value) Then
       MsgBox "Must be a numeric value"
       Cancel = True
     End If
     Exit Sub
   End If
   If Len(Trim$(grdICRP68.Columns(0).Value)) > 0 Then
     sSQL_Query = "SELECT * FROM Inhalation"
     data68Data.RecordSource = sSQL_Query
     Set rsNuc = data68Data.Recordset
     rsNuc.MoveFirst
     sSQL_Query = " [Nuclide] =  '" & Trim$(grdICRP68.Columns(0).Value) & "'"
     rsNuc.FindFirst sSQL_Query
     If rsNuc.NoMatch Then
       sStr = grdICRP68.Columns(0).Value & _
       " is not a valid nuclide name.  Please use the choice list to enter names."
       MsgBox sStr, vbInformation + vbOKOnly
       Cancel = True
       rsNuc.MoveFirst
     Else
       grdICRP68.Columns(0).Value = rsNuc![Nuclide]
     End If
   End If
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Call Display_UI_Error

End Sub

Private Sub grdRBE_Validate(Cancel As Boolean)
  Dim i As Integer
  
  grdRBE.Update
  Cancel = False
  For i = 1 To 4
    If Not IsNumeric(XRBE(i, 1)) Then
      Cancel = True
    ElseIf Val(XRBE(i, 1)) < 0 Then
      Cancel = True
    End If
  Next i
  If Cancel Then
    MsgBox "RBE values must positive numbers"
    Exit Sub
  End If

End Sub

Private Sub grdTimes_Validate(Cancel As Boolean)
  Dim sTime As Single, i As Integer
    
  grdTimes.Update
  Cancel = False
  For i = 1 To 10
    If (i = 1) Then
      If (Len(Trim(XTimes(i, 0))) = 0) Then
        Cancel = True
        MsgBox "First integration period must be a number."
        Exit Sub
      End If
    Else
      If (Len(Trim(XTimes(i, 0))) <> 0) Then
        If (Not IsNumeric(XTimes(i, 0))) Then
          Cancel = True
          MsgBox "Integration period must be a number."
          Exit Sub
        End If
      End If
    End If
    sTime = Val(XTimes(i, 0))
    If (sTime < 0) Then
      Cancel = True
      MsgBox "Integration period must be a positive number."
    ElseIf (sTime > 10# And optIntUnits.Value = "Years") Then
      Cancel = True
      MsgBox "Integration period must be between 1 day and 10 years"
      Exit Sub
    ElseIf (sTime > 3650# And optIntUnits.Value = "Days") Then
      Cancel = True
      MsgBox "Integration period must be between 1 day and 10 years"
      Exit Sub
    End If
  Next i
End Sub

Private Sub mnuAbout_Click()
   frmAboutApp.Show vbModal
   Set frmAboutApp = Nothing
End Sub

'Private Sub mnuExit_Click()
'  End
'End Sub


Private Sub mnuExtHelp_Click()
   Const PROCEDURE_NAME As String = "mnuExtHelp_Click"
 
   On Error GoTo Error_Handler
 
   With cmnDialog
      .HelpFile = gs_HelpPath & "Dose_12.hlp"
      .HelpCommand = &H3&
      .ShowHelp
   End With
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
   
End Sub

Private Sub mnuIntHelp_Click()
   Const PROCEDURE_NAME As String = "mnuIntHelp_Click"
 
   On Error GoTo Error_Handler
 
   With cmnDialog
      .HelpFile = gs_HelpPath & "DoseInt.hlp"
      .HelpCommand = &H3&
      .ShowHelp
   End With
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub mnuLung_Click()
  Const PROCEDURE_NAME As String = "mnuCoefficients_Click"
 
  On Error GoTo Error_Handler
 
  With cmnDialog
     .HelpFile = gs_HelpPath & "hrtmod.hlp"
     .HelpCommand = &H3&
     .ShowHelp
  End With
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub mnuMaterials_Click()
   Const PROCEDURE_NAME As String = "mnuMaterials_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
 
   FN = gs_HelpPath & "Material.chm"
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
End Sub

Private Sub mnuSymbols_Click()
  gs_NucSelected = "Elements"
  gs_Columns = "Symbol, Name"
  gs_myTable = "Element"
  frmEleTable.Show vbModal
  Set frmEleTable = Nothing

End Sub

Private Sub mnuSystemic_Click()
  Const PROCEDURE_NAME As String = "mnuCoefficients_Click"
 
  On Error GoTo Error_Handler
 
  With cmnDialog
     .HelpFile = gs_HelpPath & "biosytic.hlp"
     .HelpCommand = &H3&
     .ShowHelp
  End With
  Exit Sub

Error_Handler:

  gud_PrgErr.Number = Err.Number
  gud_PrgErr.Severity = 5
  gud_PrgErr.Description = Err.Description
  gud_PrgErr.Module = MODULE_NAME
  gud_PrgErr.Procedure = PROCEDURE_NAME
  Display_UI_Error

End Sub

Private Sub mnuRisks_Click()
 Const PROCEDURE_NAME As String = "mnuInt_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "Risk.chm"
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, 0
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error

End Sub

Private Sub mnuToolbox_Click()
   Const PROCEDURE_NAME As String = "mnuToolbox_Click"
   Dim FN As String
 
   On Error GoTo Error_Handler
   FN = gs_HelpPath & "ToolBoxHlp.chm"
   'Call ShellExecute(Me.hWnd, "Open", FN, vbNullString, vbNullString, 5)
   HTMLHelp hWnd, FN, HH_DISPLAY_TOC, Null
   Exit Sub

Error_Handler:

   gud_PrgErr.Number = Err.Number
   gud_PrgErr.Severity = 5
   gud_PrgErr.Description = Err.Description
   gud_PrgErr.Module = MODULE_NAME
   gud_PrgErr.Procedure = PROCEDURE_NAME
   Display_UI_Error
End Sub

Private Sub optExternal_Click()
  If Not gb_IsDoseCalc Then
    If optExternal = "Ground Surface" Then
      lblExtUnits = gs_Gnd_Units
    Else
      lblExtUnits = gs_Air_Units
    End If
  Else
    If optExternal = "Ground Surface" Then
      lblExtUnits = gs_GndActivity_Unit
    Else
      lblExtUnits = gs_AirActivity_Unit
    End If
  End If
End Sub

Public Sub NoBlanks(inpStr As String, outStr As String)
Dim i As Integer, sl As Integer, sCh As String * 1

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
   If (InStr(outStr, "/") = 0 And InStr(outStr, "V") = 0) Then
     i = InStr(outStr, "r")
     If (i = 0) Then
       i = InStr(outStr, "S")
       If (i = 0) Then
         i = InStr(outStr, "G")
       End If
       outStr = Mid(outStr, 1, i + 1) & " " & Mid(outStr, i + 2)
     Else
       outStr = Mid(outStr, 1, i + 2) & " " & Mid(outStr, i + 3)
     End If
   End If
End Sub

Private Sub optNeutronField_Click()
  If (optNeutronField.ListIndex <= 1) Then
    picNeutron.Picture = LoadPicture(gs_DataPath & "ap.jpg")
  ElseIf (optNeutronField.ListIndex = 2) Then
    picNeutron.Picture = LoadPicture(gs_DataPath & "pa.jpg")
  ElseIf (optNeutronField.ListIndex = 3) Then
    picNeutron.Picture = LoadPicture(gs_DataPath & "lat.jpg")
  ElseIf (optNeutronField.ListIndex = 4) Then
    picNeutron.Picture = LoadPicture(gs_DataPath & "lat.jpg")
  ElseIf (optNeutronField.ListIndex = 5) Then
    picNeutron.Picture = LoadPicture(gs_DataPath & "rot.jpg")
  ElseIf (optNeutronField.ListIndex = 6) Then
    picNeutron.Picture = LoadPicture(gs_DataPath & "iso.jpg")
  End If
End Sub

Private Sub optPath_Click()
  If optPath = "Ingestion" Or optPath = "Inhalation" Then
    lblRiskUnit = gsRisk_Unit_Int
  ElseIf optPath = "Ground Plane" Then
    lblRiskUnit = gsRisk_Unit_Gnd
  Else
    lblRiskUnit = gsRisk_Unit_Ext
  End If
End Sub

Private Sub optPhotonField_Click()
  If (optPhotonField.ListIndex <= 1) Then
    picPhoton.Picture = LoadPicture(gs_DataPath & "ap.jpg")
  ElseIf (optPhotonField.ListIndex = 2) Then
    picPhoton.Picture = LoadPicture(gs_DataPath & "pa.jpg")
  ElseIf (optPhotonField.ListIndex = 3) Then
    picPhoton.Picture = LoadPicture(gs_DataPath & "lat.jpg")
  ElseIf (optPhotonField.ListIndex = 4) Then
    picPhoton.Picture = LoadPicture(gs_DataPath & "lat.jpg")
  ElseIf (optPhotonField.ListIndex = 5) Then
    picPhoton.Picture = LoadPicture(gs_DataPath & "rot.jpg")
  ElseIf (optPhotonField.ListIndex = 6) Then
    picPhoton.Picture = LoadPicture(gs_DataPath & "iso.jpg")
  End If
End Sub

Private Sub tabNuclide_Click(PreviousTab As Integer)
Dim i As Integer, Found As Boolean

' to pass lists of nuclides between tabs
  If PreviousTab = 0 Then
    For i = 0 To 20
      x72Ing(i, 0) = x38(i, 0)
      xExt(i, 0) = x38(i, 0)
      x68(i, 0) = x38(i, 0)
      x72Inh(i, 0) = x38(i, 0)
    Next i
    If gb_IsDoseCalc Then
      For i = 0 To 20
        x72Ing(i, 1) = x38(i, 1)
        xExt(i, 1) = x38(i, 1)
        x68(i, 1) = x38(i, 1)
        x72Inh(i, 1) = x38(i, 1)
      Next i
    End If
    If optICRP38.Value = "Ingestion" Then
      optICRP68.Value = "Ingestion"
    Else
      optICRP68.Value = "Inhalation"
    End If
  ElseIf PreviousTab = 1 Then
    For i = 0 To 20
      x72Inh(i, 0) = x68(i, 0)
      xExt(i, 0) = x68(i, 0)
      x72Ing(i, 0) = x68(i, 0)
      x38(i, 0) = x68(i, 0)
    Next i
    If gb_IsDoseCalc Then
      For i = 0 To 20
        x72Ing(i, 1) = x68(i, 1)
        xExt(i, 1) = x68(i, 1)
        x38(i, 1) = x68(i, 1)
        x72Inh(i, 1) = x68(i, 1)
      Next i
    End If
    If optICRP68.Value = "Ingestion" Then
      optICRP38.Value = "Ingestion"
    Else
      optICRP38.Value = "Inhalation"
    End If
  ElseIf PreviousTab = 2 Then
    For i = 0 To 20
      x72Inh(i, 0) = x72Ing(i, 0)
      xExt(i, 0) = x72Ing(i, 0)
      x68(i, 0) = x72Ing(i, 0)
      x38(i, 0) = x72Ing(i, 0)
    Next i
    If gb_IsDoseCalc Then
      For i = 0 To 20
        x72Inh(i, 1) = x72Ing(i, 1)
        xExt(i, 1) = x72Ing(i, 1)
        x68(i, 1) = x72Ing(i, 1)
        x38(i, 1) = x72Ing(i, 1)
      Next i
    End If
  ElseIf PreviousTab = 3 Then
    For i = 0 To 20
      x72Ing(i, 0) = x72Inh(i, 0)
      xExt(i, 0) = x72Inh(i, 0)
      x68(i, 0) = x72Inh(i, 0)
      x38(i, 0) = x72Inh(i, 0)
    Next i
    If gb_IsDoseCalc Then
      For i = 0 To 20
        x72Ing(i, 1) = x72Inh(i, 1)
        xExt(i, 1) = x72Inh(i, 1)
        x68(i, 1) = x72Inh(i, 1)
        x38(i, 1) = x72Inh(i, 1)
      Next i
    End If
  ElseIf PreviousTab = 4 Then
    For i = 0 To 20
      x72Ing(i, 0) = xExt(i, 0)
      x72Inh(i, 0) = xExt(i, 0)
      x68(i, 0) = xExt(i, 0)
      x38(i, 0) = xExt(i, 0)
    Next i
    If gb_IsDoseCalc Then
      For i = 0 To 20
        x72Ing(i, 1) = xExt(i, 1)
        x68(i, 1) = xExt(i, 1)
        x38(i, 1) = xExt(i, 1)
        x72Inh(i, 1) = xExt(i, 1)
      Next i
    End If
  ElseIf PreviousTab = 5 Then
'    Found = False
'    For i = 0 To cboJaeriNuc.ListCount
'    If cboJaeriNuc.Text = cboJaeriNuc.List(i) Then
'      Found = True
'      cboJaeriNuc.ListIndex = i
'    End If
'    Next i
'    If Not Found Then
'      cboJaeriNuc.ListIndex = 0
'      MsgBox cboJaeriNuc.Text & " is not a valid nuclide name." & vbCrLf & "Please use the choice list."
'    End If
  ElseIf PreviousTab = 13 Then
'    cboDecayNuc.Text = cboJaeriNuc.Text
    Found = False
    For i = 0 To cboDecayNuc.ListCount
    If cboDecayNuc.Text = cboDecayNuc.List(i) Then
      Found = True
      cboDecayNuc.ListIndex = i
    End If
    Next i
    If Not Found Then
      cboDecayNuc.ListIndex = 0
      MsgBox cboDecayNuc.Text & " is not a valid nuclide name." & vbCrLf & "Please use the choice list."
    End If
  End If
  grd72Ing.Refresh
  grd72Inh.Refresh
  grdICRP68.Refresh
  grd38.Refresh
  grdExt.Refresh
  
' to pass an element or material between tabs
  If PreviousTab = 20 Or _
    (PreviousTab > 5 And PreviousTab < 13 And PreviousTab <> 11 And tabNuclide.Tab <> 20) Then
    If gs_AbsorberType = "Ele" And PreviousTab <> 6 And gs_EleSelected <> "" _
      And Not isSupp Then
    
        Found = False
        For i = 0 To cboPhoton.ListCount - 1
          If gs_EleSelected = cboPhoton.List(i) Then
            Found = True
            cboPhoton.ListIndex = i
            cboPhoton.Text = gs_EleSelected
          End If
        Next i
      If tabNuclide.Tab = 9 Then
        If Not Found Then
          cboPhoton.ListIndex = 0
          MsgBox gs_EleSelected & " is not a valid element name." & vbCrLf & "Please use the choice list."
        End If
      End If
      
        Found = False
        For i = 0 To cboAlpha.ListCount - 1
          If gs_EleSelected = cboAlpha.List(i) Then
            Found = True
           cboAlpha.ListIndex = i
            cboAlpha.Text = gs_EleSelected
          End If
        Next i
      If tabNuclide.Tab = 12 Then
        If Not Found Then
          cboAlpha.ListIndex = 0
          MsgBox gs_EleSelected & " is not a valid element name." & vbCrLf & "Please use the choice list."
        End If
      End If
      
        Found = False
        For i = 0 To cboElectron.ListCount - 1
          If gs_EleSelected = cboElectron.List(i) Then
            Found = True
            cboElectron.ListIndex = i
            cboElectron.Text = gs_EleSelected
          End If
        Next i
      If tabNuclide.Tab = 10 Then
        If Not Found Then
          cboElectron.ListIndex = 0
          MsgBox gs_EleSelected & " is not a valid element name." & vbCrLf & "Please use the choice list."
        End If
      End If
      
        Found = False
        For i = 0 To cboKermaEle.ListCount - 1
          If gs_EleSelected = cboKermaEle.List(i) Then
            Found = True
            cboKermaEle.ListIndex = i
            cboKermaEle.Text = gs_EleSelected
          End If
        Next i
      If tabNuclide.Tab = 7 Then
        If Not Found Then
          cboKermaEle.ListIndex = 0
          MsgBox gs_EleSelected & " is not a valid element name." & vbCrLf & "Please use the choice list."
        End If
      End If
      
        Found = False
        For i = 0 To cboGPElement.ListCount - 1
          If gs_EleSelected = cboGPElement.List(i) Then
            Found = True
            cboGPElement.ListIndex = i
            cboGPElement.Text = gs_EleSelected
          End If
        Next i
      If tabNuclide.Tab = 20 Then
        If Not Found Then
          cboGPElement.ListIndex = 0
          MsgBox gs_EleSelected & " is not a valid element name." & vbCrLf & "Please use the choice list."
        End If
      End If
      
        Found = False
        For i = 0 To cboAtom.ListCount - 1
          If gs_EleSelected = cboAtom.List(i) Then
            Found = True
            cboAtom.ListIndex = i
            cboAtom.Text = gs_EleSelected
          End If
        Next i
      If tabNuclide.Tab = 8 Then
        If Not Found Then
          cboAtom.ListIndex = 0
          MsgBox gs_EleSelected & " is not a valid element name." & vbCrLf & "Please use the choice list."
        End If
      End If
    End If
    
    If gs_AbsorberType = "Mat" And (Not b_UserDefinedMat) And PreviousTab <> 8 And gs_MatSelected <> "" Then
      If tabNuclide.Tab = 7 Then
        If optKerma = "Neutron" Then
          For i = 0 To cboKermaMaterial.ListCount - 1
            If gs_MatSelected = cboKermaMaterial.List(i) Then
              Found = True
              cboKermaMaterial.ListIndex = i
            End If
          Next i
          If Not Found Then
            cboKermaMaterial.ListIndex = 0
            MsgBox gs_MatSelected & " is not a valid material name." & vbCrLf & _
              "Please use the choice list."
          Else
            cboKermaMaterial.ListIndex = i
          End If
        Else
          For i = 0 To cboNKermaMaterial.ListCount - 1
            If gs_MatSelected = cboNKermaMaterial.List(i) Then
              Found = True
              cboNKermaMaterial.ListIndex = i
            End If
          Next i
          If Not Found Then
            cboNKermaMaterial.ListIndex = 0
            MsgBox gs_MatSelected & " is not a valid material name." & vbCrLf & _
              "Please use the choice list."
          Else
            cboNKermaMaterial.Text = gs_MatSelected
          End If
        End If
      Else
        For i = 0 To cboMaterial.ListCount - 1
          If gs_MatSelected = cboMaterial.List(i) Then
            Found = True
            cboPhotonMat.ListIndex = 0
            cboAlphaMat.ListIndex = 0
            cboElectronMat.ListIndex = 0
            cboGPMaterial.ListIndex = 0
            cboMaterial.ListIndex = 0
          End If
        Next i
        If Not Found Then
          cboPhotonMat.ListIndex = 0
          cboAlphaMat.ListIndex = 0
          cboElectronMat.ListIndex = 0
          cboGPMaterial.ListIndex = 0
          cboMaterial.ListIndex = 0
          MsgBox gs_MatSelected & " is not a valid material name." & vbCrLf & _
            "Please use the choice list."
        Else
          cboPhotonMat.Text = gs_MatSelected
          cboAlphaMat.Text = gs_MatSelected
          cboElectronMat.Text = gs_MatSelected
          cboGPMaterial.Text = gs_MatSelected
          cboMaterial.Text = gs_MatSelected
        End If
      End If
    End If
  End If
End Sub

Private Sub Set_Internal_Units()
  Dim L As Integer
  nThisTab = tabNuclide.Tab
  If gb_IsDoseCalc Then
    gs_Activity_Unit = fns_InhActivity_Units
    lblICRP38Units = gs_Activity_Unit
    lblICRP68Units = gs_Activity_Unit
    lblICRP72IngUnits = gs_Activity_Unit
    lblICRP72InhUnits = gs_Activity_Unit
'   lblEarlyUnits = gs_Activity_Units
    L = InStr(gs_GndActivity_Unit, "2")
    Mid(gs_AirActivity_Unit, L, 1) = "3"
    If optExternal = "Ground Surface" Then
      lblExtUnits = gs_GndActivity_Unit
    Else
      lblExtUnits = gs_AirActivity_Unit
    End If
  Else
    gs_Inh_Units = fns_Inh_Units
    lblICRP38Units = gs_Inh_Units
    lblICRP68Units = gs_Inh_Units
    lblICRP72IngUnits = gs_Inh_Units
    lblICRP72InhUnits = gs_Inh_Units
'   lblEarlyUnits = gs_Inh_Units
    L = InStr(gs_Gnd_Units, "2")
    Mid(gs_Air_Units, L, 1) = "3"
    If optExternal = "Ground Surface" Then
      lblExtUnits = gs_Gnd_Units
    Else
      lblExtUnits = gs_Air_Units
    End If
  End If
End Sub
Private Function getHL(sHL As String) As Double
  Dim i As Integer, L As Integer, Factor As Double, Number As Double
  Dim unit As String
  
  Number = Val(sHL)
  L = Len(sHL)
  unit = Mid(sHL, L, 1)
  If unit = "m" Then
    Factor = 1 / 3600
  ElseIf unit = "h" Then
    Factor = 1 / 60
  ElseIf unit = "d" Then
    Factor = 1
  ElseIf unit = "y" Then
    Factor = 365
  End If
  getHL = Number * Factor
  
End Function

