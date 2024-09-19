'----------------------------------------------------------------------------+
'  DECDATA  Copyright (c) 2008, Keith F. Eckerman,  Oak Ridge, TN 37830.     |
'                                                                            |
' Permission is hereby granted to any person obtaining a copy of the         |
' DECDATA source code to use, copy, and distribute the code with or without  |
' any modifications for educational, research, and not-for-profit purposes,  |
' without fee and without a signed licensing agreement provided that the     |
' above copyright notice, this paragraph and the following two paragraphs    |
' appears in all copies, modifications, and distributions.                   |
'                                                                            |
' IN NO EVENT SHALL THE AUTHOR BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT,  |
' SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS,     |
' ARISING OUT OF THE USE OF THE SOFTWARE AND ITS DOCUMENTATION. THE AUTHOR   |
' SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE  |
' IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.|
'                                                                            |
' THE SOFTWARE PROVIDED HEREUNDER IS PROVIDED "AS IS". THE AUTHOR HAS NO     |
' OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, FUTURE UPDATES, ENHANCEMENTS,  |
' OR MODIFICATIONS TO THE SOFTWARE.                                          |
'                                                                            |
'  DECDATA Code  Oct 15, 2008   Compiled using PowerBASIC CC5.00 compiler    |
'----------------------------------------------------------------------------+
'
'----------------------------------------------------------------------------+
' The source code for this resource file DECDATA.RC, include in the          |
' distribution, was compiled with PowerBASIC CC5.00 compiler.                |
'                                                                            |
#RESOURCE "DECDATA.pbr"                                                    ' |
'                                                                            |
'----------------------------------------------------------------------------+
'
 $Title = "DECDATA - A Summary of Radiation Emissions"
'
 %NULL = 0                                                 ' From Win32API
 %SW_MAXIMIZE = 3                                          '
 %SW_SHOWNORMAL = 1                                        '
 %RT_BITMAP = 2                                            '
 %INVALID_HANDLE_VALUE = &HFFFFFFFF???                     '
 %MAXDWORD = &HFFFFFFFF???                                 '
 %MAX_PATH = 260                                           '
'                                                          '
 TYPE RECT                                                 ' used by DPlotJr
  nLeft AS LONG                                            '
  nTop AS LONG                                             '
  nRight AS LONG                                           '
  nBottom AS LONG                                          '
 END TYPE                                                  '
'                                                          '
 TYPE FILETIME                                             ' used in DECDATA
   dwLowDateTime AS DWORD                                  '
   dwHighDateTime AS DWORD                                 '
 END TYPE                                                  '
'                                                          '
 TYPE WIN32_FIND_DATA                                      '
   dwFileAttributes AS DWORD                               '
   ftCreationTime AS FILETIME                              '
   ftLastAccessTime AS FILETIME                            '
   ftLastWriteTime AS FILETIME                             '
   nFileSizeHigh AS DWORD                                  '
   nFileSizeLow AS DWORD                                   '
   dwReserved0 AS DWORD                                    '
   dwReserved1 AS DWORD                                    '
   cFileName AS ASCIIZ * %MAX_PATH                         '
   cAlternateFileName AS ASCIIZ * 14                       '
 END TYPE                                                  '
'                                                          '
 TYPE SYSTEMTIME                                           '
   wYear AS WORD                                           '
   wMonth AS WORD                                          '
   wDayOfWeek AS WORD                                      '
   wDay AS WORD                                            '
   wHour AS WORD                                           '
   wMinute AS WORD                                         '
   wSecond AS WORD                                         '
   wMilliseconds AS WORD                                   '
 END TYPE                                                  '
'                                                          '
 TYPE tagBitMap                                            '
   bmType AS LONG                                          '
   bmWidth AS LONG                                         '
   bmHeight AS LONG                                        '
 END TYPE                                                  '
'
'----------------------------------------------------------------------------+
' The include file noted below is used by DPlotJr and is included with the   |
' distribution. DPlotJr is a product of HydeSoft Computing, Inc.             |
'                                                                            |
#INCLUDE "PB_DPlot.inc"                                                    ' |
'                                                                            |
'----------------------------------------------------------------------------+
'
'----------------------------------------------------------------------------+
' The include files for CT_Pro.DLL and GfxT_Pro.DLL of Perfect Sync, Inc.    |
' are noted below. K.F. Eckerman owes the license to distribution these DLLs |
' but not the include files.  © Copyright 2002 Perfect Sync, Inc.            |
'                                                                            |
#INCLUDE "C:\ConTools\CT_Pro.INC"                                          ' |
#INCLUDE "C:\Gfxtools\GfxT_Pro.INC"                                        ' |
'                                                                            |
'----------------------------------------------------------------------------+
'
 %indx = 1      : %irad = 2     : %ibet = 3      : %iaug = 4     : %ineu = 5
 %iout = 6      : %xBlack = 0   : %xblue = 1     : %xYellow = 14 : %xWhite = 7
 %xBright = 8   : %F1Key = 1059 : %F2Key = 1060  : %F3Key = 1061 : %F4Key = 1062
 %F5Key = 1063  : %F6Key = 1064 : %F7Key = 1065  : %F8Key = 1066
 %chand = 32649 : %IDYES = 6&   : %IDNO = 7&
 %mWindow = 40     ' height of the console, used in many locates
 %misotope = 40    ' max # isotopes of an element
 %mspec = 40       ' max # chain members
'
 $Code = "DECDATA"         : $Version = "Ver. 2.7"
 $DecFile = "ICRP-07.NDX"  : $DEFAULT_MSGBOX_CAPTION =  "ICRP-07 Data Set"
 $data = "DATA\"           : $OutDir = "OutPut\"      : $Report = "Report\"
 $figs = "Figs\"
 $fmt1 = "##.###^^^^"
 $fline1 = " <F1>=Export   <F2>=Chain    <F3>=Plots    <F4>=Tables   <F5>=Unknown    <F6>=Help    <F7>=About "
 $Prompt = " Press a key (or left click mouse) to continue..."
'
 $sym = "H-HeLiBeB-C-N-O-F-NeNaMgAlSiP-S-ClArK-CaScTiV-CrMnFeCoNiCuZnGaGeAsSe" + _
        "BrKrRbSrY-ZrNbMoTcRuRhPdAgCdInSnSbTeI-XeCsBaLaCePrNdPmSmEuGdTbDyHoEr" + _
        "TmYbLuHfTaW-ReOsIrPtAuHgTlPbBiPoAtRnFrRaAcThPaU-NpPuAmCmBkCfEsFmMdNoLr"
'
' Declarations: Functions written by KF Eckerman
 DECLARE FUNCTION CenterMess(a$, i&) AS STRING
 DECLARE FUNCTION Chfiv(a#, b#, c#, d#, e#, f#, g#, h#, i&) AS DOUBLE
 DECLARE FUNCTION CRC32(BYVAL dwOffset AS DWORD, dwLen AS DWORD) AS DWORD
 DECLARE FUNCTION Elname(a&) AS STRING
 DECLARE FUNCTION Expf1(a##, b#) AS EXT
 DECLARE FUNCTION ExpFun(a##) AS EXT
 DECLARE FUNCTION FawFun(E#) AS DOUBLE
 DECLARE FUNCTION GetFileCount(FileSpec$) AS LONG
 DECLARE FUNCTION GetResourceBitMapSize(szBM AS ASCIIZ, n&, m&) AS LONG
 DECLARE FUNCTION Ibinry(a$) AS LONG
 DECLARE FUNCTION IcutOff(a#(), b#(), c#(), n&) AS LONG
 DECLARE FUNCTION InKeyCode(sKey$) AS LONG
 DECLARE FUNCTION InVect(clist() AS STRING *7, citem AS STRING * 7, n&) AS LONG
 DECLARE FUNCTION IzMass(a$) AS LONG
 DECLARE FUNCTION IzWho(a&, b&) AS LONG
 DECLARE FUNCTION MsgBox(a$, b$) AS LONG
 DECLARE FUNCTION pchia(a&, b#(), c#(), d#(), e&, f#, g#, h&) AS DOUBLE
 DECLARE FUNCTION pchid(a&, b#(), c#(), d#(), e&, f&, g&, h&) AS DOUBLE
 DECLARE FUNCTION pchst(a#, b#) AS DOUBLE
 DECLARE FUNCTION RefreshWindow(BYVAL lPlaceHolder AS LONG) AS LONG
 DECLARE FUNCTION ResABC(a$, b$, c$, d$, e$) AS STRING
 DECLARE FUNCTION Sign(a#, b#) AS DOUBLE
 DECLARE FUNCTION SkinDose(a#) AS DOUBLE
 DECLARE FUNCTION TableEntry(a$) AS STRING
 DECLARE FUNCTION Timest(a AS STRING*8, b AS STRING*2) AS DOUBLE
'
' Declarations: Functions within Win32API
 DECLARE FUNCTION FindClose LIB "KERNEL32.DLL" ALIAS "FindClose" (BYVAL hFindFile AS DWORD) AS LONG
 DECLARE FUNCTION FindFirstFile LIB "KERNEL32.DLL" ALIAS "FindFirstFileA" (lpFileName AS ASCIIZ, _
                  lpFindFileData AS WIN32_FIND_DATA) AS DWORD
 DECLARE FUNCTION FindResource LIB "KERNEL32.DLL" ALIAS "FindResourceA" (BYVAL hInstance AS DWORD, _
                  lpName AS ASCIIZ, lpType AS ASCIIZ) AS LONG
 DECLARE FUNCTION FileTimeToLocalFileTime LIB "KERNEL32.DLL" ALIAS "FileTimeToLocalFileTime" _
                 (lpFileTime AS FILETIME, lpLocalFileTime AS FILETIME) AS LONG
 DECLARE FUNCTION FileTimeToSystemTime LIB "KERNEL32.DLL" ALIAS "FileTimeToSystemTime" (lpFileTime AS FILETIME, _
                  lpSystemTime AS SYSTEMTIME) AS LONG
 DECLARE FUNCTION GetModuleHandle LIB "KERNEL32.DLL" ALIAS "GetModuleHandleA" (lpModuleName AS ASCIIZ) _
                  AS DWORD
 DECLARE FUNCTION LoadResource LIB "KERNEL32.DLL" ALIAS "LoadResource" (BYVAL hInstance AS DWORD, _
                  BYVAL hResInfo AS DWORD) AS LONG
 DECLARE FUNCTION LockResource LIB "KERNEL32.DLL" ALIAS "LockResource" (BYVAL hResData AS DWORD) AS DWORD
 DECLARE FUNCTION ShellExecute LIB "SHELL32.DLL" ALIAS "ShellExecuteA" (BYVAL hwnd AS DWORD, _
                  lpOperation AS ASCIIZ, lpFile AS ASCIIZ, lpParameters AS ASCIIZ, lpDirectory AS ASCIIZ, _
                  BYVAL nShowCmd AS LONG) AS DWORD
 DECLARE FUNCTION ShowWindow LIB "USER32.DLL" ALIAS "ShowWindow" (BYVAL hWnd AS DWORD, BYVAL nCmdShow _
                  AS LONG) AS LONG
'
' Some data structures
 TYPE IndexType                           ' structure of ICRP-07.NDX
   Nuke AS STRING * 7                     ' nuclide name; e.g., Cl-38, Tc-99m
   t AS STRING * 8                        ' physical half-life of nuclide
   tu AS STRING * 2                       ' units of T1/2
   Mode AS STRING * 8                     ' decay mode
   mdec AS STRING * 7                     ' location of nuclide in ICRP-07.RAD
   mbet AS STRING * 7                     ' locatation of nuclide in ICRP-07.BET
   mack AS STRING * 7                     ' location of nuclide in ICRP-07.ACK
   mneu AS STRING * 6                     ' location of nuclide in ICRP-07.NSF
   dmy1 AS STRING * 1                     ' a blank
   dau1 AS STRING * 8                     ' daughter 1, e.g., Po-210
   idau1 AS STRING * 5                    ' location of daughter 1 in ICRP-07.NDX
   bf1 AS STRING * 11                     ' branching fraction to daughter 1
   dmy2 AS STRING * 1                     ' a blank
   dau2 AS STRING * 8                     ' daughter 2
   idau2 AS STRING * 5                    ' location of daughter 2 in ICRP-07.NDX
   bf2 AS STRING * 11                     ' branching fraction to daughter 2
   dmy3 AS STRING * 1                     ' blank
   dau3 AS STRING * 8                     ' daughter 3
   idau3 AS STRING * 5                    ' location of daughter 3 in ICRP-07.NDX
   bf3 AS STRING * 11                     ' branching fraction to daughter 3
   dmy4 AS STRING * 1                     ' blank
   dau4 AS STRING * 8                     ' daughter 3
   idau4 AS STRING * 5                    ' location of daughter 3 in ICRP-07.NDX
   bf4 AS STRING * 11                     ' branching fraction to daughter 3
   ea AS STRING * 7                       ' alpha transition energy (alpha + recoil) MeV/nt
   eb AS STRING * 8                       ' beta + IC + Auger/CK electron MeV/nt
   eg AS STRING * 8                       ' x-ray + gamma + annihilation energy MeV/nt
   dmy5 AS STRING * 1                     ' a blank space
   np10 AS STRING * 3                     ' # photon of energy < 10 keV
   npg10 AS STRING * 4                    ' # photon of energy >= 10 keV
   nbet AS STRING * 4                     ' # beta particles (# transitions)
   nel AS STRING * 5                      ' # electrons of discrete energy
   nalpha AS STRING * 4                   ' # alpha particles
   dmy6 AS STRING * 1                     ' a blank space
   Mass AS STRING * 10                    ' atomic mass
   Kair AS STRING * 10                    ' ICRU air kerma-rate constant
   Kpts AS STRING * 9                     ' point source air kerma rate
   CrLf AS STRING * 2                     '
 END TYPE
'
 TYPE HeadType                            ' structure of first recond in
   i1 AS STRING * 4                       ' ICRP-07.NDX. I1 is first data
   i2 AS STRING * 4                       ' record, I2 is last data record
   dmy AS STRING * 218                    ' in the file.
   CrLf AS STRING * 2
 END TYPE
'
 TYPE DecayType                           ' structure of ICRP-07.RAD records
   icode AS STRING * 2                    ' radiation type
   Freq AS STRING * 12                    ' frequency %/nt
   E AS STRING * 12                       ' energy (MeV)
   jcode AS STRING * 3                    ' mnumonic
   CrLf AS STRING * 2
 END TYPE
'
 TYPE DecayHtype                          ' structure of ICRP-07.RAD records
   Nuke AS STRING * 7                     ' radiation type
   dmy1 AS STRING * 3                     ' blank space
   t AS STRING * 8                        ' physical half-life of nuclide
   tu AS STRING * 2                       ' units of T1/2
   dmy2 AS STRING * 4                     ' blank space
   ndec AS STRING * 5                     ' number of radiation records
   CrLf AS STRING * 2
 END TYPE
'
 TYPE BetaType                            ' structure ICRP-07.BET records
    Eelc AS STRING * 8                    ' energy E (MeV)
    Freq AS STRING * 9                    ' frequency #/MeV per nt, P(E)
    CrLf AS STRING * 2
 END TYPE
'
 TYPE BetaHead                            ' structure ICRP-07.BET head record
    Nuke AS STRING * 7                    ' nuclide name, Sr-90
    nbet AS STRING * 10                   ' # energy grid points
    CrLf AS STRING * 2
 END TYPE
'
 TYPE AugerHead                           ' structure ICRP-07.ACK head record
    Nuke AS STRING * 7                    ' nuclide name, Hg-193m
    dmy1 AS STRING * 20                   ' space
    naug AS STRING * 5                    ' # auger-ck electrons
    CrLf AS STRING * 2
 END TYPE
'
 TYPE AugerData                           ' structure ICRP-07.ACK records
    Freq AS STRING * 11                   ' #/nt of electron
    E AS STRING * 12                      ' energy of electron (eV)
    tran AS STRING * 9                    ' atomic transition
    CrLf AS STRING * 2
 END TYPE
'
 TYPE NeutHead                            ' structure ICRP-07.NSF head record
   Nuke AS STRING * 8                     ' nuclide name, Cf-252
   sfnt AS STRING * 10                    ' SF/nt
   dmy AS STRING * 8                      ' space
   npts AS STRING * 3                     ' # neutrons
   CrLf AS STRING * 2
 END TYPE
'
 TYPE NeutRecord                          ' structure ICRP-07.NSF records
   E1 AS STRING * 8                       ' low energy of bin (eV)
   E2 AS STRING * 9                       ' high energy of bin (eV)
   yield AS STRING * 12                   ' #/nt in bin
   CrLf AS STRING * 2
 END TYPE
'
 TYPE tagBitMap                           ' need by function
   bmType AS LONG                         ' GetResourceBitMapSize
   bmWidth AS LONG
   bmHeight AS LONG
 END TYPE
'
 DEFLNG I-N                               ' implicit declaration
 DEFDBL A-H, O-Z
'
'----------------------------------------------------------------------------------------
 FUNCTION PBMAIN()
'----------------------------------------------------------------------------------------
   CONSOLE NAME $Title
   CONSOLE SET SCREEN %mWindow, 97                           ' Console size
   hWnd& = CONSHNDL                                          ' Console handle
   ShowWindow hWnd&, %SW_MAXIMIZE
   CONSOLE GET SIZE TO w&, h&
   DESKTOP GET CLIENT TO ncWidth&, ncHeight&
   DESKTOP GET LOC TO x&, y&
   CONSOLE SET LOC x& + (ncWidth& - w&) \ 2, y& + (ncHeight& - h&) \ 2
   ConsoleToolsAuthorize  %MY_GFXT_AUTHCODE                  ' Authorize Console Tools.
   COLOR %xWhite + %xBright, %xblue
   CLS
   lresult = InitConsoleTools(hWnd&, 0, 5, 3, 0, 0)          ' Initialize Console Tools
'
   DIM Dp AS GLOBAL Dplot
   DIM BetHed AS GLOBAL BetaHead
   DIM BetSpec AS GLOBAL BetaType
   DIM DecHed AS GLOBAL DecayHtype
   DIM DecDat AS GLOBAL DecayType
   DIM IndHed AS GLOBAL HeadType
   DIM IndDat AS GLOBAL IndexType
   DIM AugHed AS GLOBAL AugerHead
   DIM AugDat AS GLOBAL AugerData
   DIM NeuHed AS GLOBAL NeutHead
   DIM NeuDat AS  GLOBAL NeutRecord
   DIM ealpha(1 TO %mspec) AS GLOBAL DOUBLE
   DIM ebeta(1 TO %mspec)  AS GLOBAL DOUBLE
   DIM egamm(1 TO %mspec)  AS GLOBAL DOUBLE
   DIM zlmr(1 TO %mspec)   AS GLOBAL EXT
   DIM fhold(1 TO %mspec)  AS GLOBAL DOUBLE
   DIM branch(1 TO %mspec, 1 TO %mspec) AS GLOBAL DOUBLE
   DIM nucnam(1 TO %mspec) AS GLOBAL STRING * 7
   DIM thalf(1 TO %mspec)  AS GLOBAL STRING * 8
   DIM named(1 TO %mspec)  AS GLOBAL STRING * 7
   DIM iu(1 TO %mspec)     AS GLOBAL STRING * 2
   DIM maxi(1 TO %mspec)   AS GLOBAL LONG
   DIM CRC_Check AS GLOBAL STRING * 40
   DIM nspec AS GLOBAL LONG
   DIM ipt   AS GLOBAL LONG
   DIM ibrch AS GLOBAL LONG
   DIM ipar  AS GLOBAL LONG
   DIM ieob  AS GLOBAL LONG
   DIM ipob  AS GLOBAL LONG
   DIM iptb(1 TO %mspec)  AS GLOBAL LONG
   DIM iparb(1 TO %mspec) AS GLOBAL LONG
   DIM mpath(1 TO %mspec, 1 TO %mspec) AS GLOBAL LONG
'
   GraphicsToolsAuthorize %MY_GFXT_AUTHCODE                 ' Authorize Graphics Tools.
'
   IF GetFileCount("License_DECDATA.TXT") = 0 THEN
      CLS
      BEEP
      PRINT
      PRINT " The DECDATA license was not found. The file 'License_DECDATA.TXT' must"
      PRINT " be present in the folder with its executible."
      PRINT
      PRINT " DECDATA must abort, press any key to abort.";
      WAITKEY$
      EXIT FUNCTION
   END IF
   OPEN "License_DECDATA.TXT" FOR INPUT AS #1
   LINE INPUT #1, CRC_Check
   CLOSE #1
'
   IF GetFileCount($data + "*.ndx") = 0 THEN
      CLS
      BEEP
      PRINT
      PRINT " No decay data files exist in the folder " + $data + "."
      PRINT ""
      PRINT " DECDATA must abort, press any key to abort.";
      WAITKEY$
      EXIT FUNCTION
   END IF
'
'  open the ICRP-07 data files
'
   FileRoot$ = $data + LEFT$($DecFile, INSTR($DecFile, "."))
   OPEN FileRoot$ + "ndx" FOR RANDOM AS %indx LEN = LEN(IndDat)
   OPEN FileRoot$ + "rad" FOR RANDOM AS %irad LEN = LEN(DecDat)
   OPEN FileRoot$ + "bet" FOR RANDOM AS %ibet LEN = LEN(BetSpec)
   OPEN FileRoot$ + "ack" FOR RANDOM AS %iaug LEN = LEN(AugDat)
   OPEN FileRoot$ + "nsf" FOR RANDOM AS %ineu LEN = LEN(NeuDat)
'
   CALL GetNukeLst(NukeCover$)                            ' Get string of elements in collection
'
   MOUSE 3, DOUBLE, DOWN
   MOUSE ON
'
   ConsoleGfx 2, 2, 96, %mWindow - 5                      ' Fill console with a graphics window.
   iwidth = GfxConvert(%X_PIXELS_TO_UNITS, GfxMetrics(%GFX_DRAWING_WIDTH))
   jwidth = GfxConvert(%Y_PIXELS_TO_UNITS, GfxMetrics(%GFX_DRAWING_HEIGHT))
   lResult& = StretchImage($data + "pchart.emf", iwidth, jwidth)
'
   THREAD CREATE RefreshWindow(0) TO lResult              ' Thread to refresh graphic window
   THREAD CLOSE lResult TO lResult                        ' Don't need to monitor the thread.
'
   DO
      CURSOR OFF
      GfxWindow %GFX_Show
      REDIM Listx$(1 TO %misotope)
      Nukex$ = ""
      LOCATE %mWindow, 1
      COLOR %xBlack, %xWhite
      PRINT $fline1;
      COLOR %xYellow, %xblue
      LOCATE %mWindow - 3, 2
      PRINT "Click on an element to list its radioisotopes."
      PRINT TAB(2) "Press <Esc> to exit DECDATA.";
      DO
         iz = 0
         ix = MouseOverX
         IF ix <> %GFX_NONE THEN
            iy = MouseOverY
            iz = IzWho(ix, iy)
            LOCATE %mWindow - 2, 77
            IF iz <> 0 THEN
               SLEEP 1
               Chx$ = MID$($sym, (iz -1) * 2 + 1, 2)
               PRINT TRIM$(ElName(iz)) + ": ";
               IF INSTR(NukeCover$, Chx$) > 0 THEN
                  IF INSTR(Chx$, "-") = 0 THEN
                     PRINT Chx$ + STRING$(21 - LEN(ElName(iz)) - 4, " ")
                  ELSE
                     PRINT LEFT$(Chx$,1) + STRING$(22 - LEN(ElName(iz)) - 4, " ")
                  END IF
               ELSE
                  PRINT "No Data" + STRING$(16 - LEN(ElName(iz)) - 4, " ")
               END IF
            ELSE
               SLEEP 1
               PRINT STRING$(20, " ")
            END IF
         ELSE
            SLEEP 1
         END IF
'
         skey$ = INKEY$
         IF skey$ = $ESC THEN
            CLS
            CLOSE
            EXIT FUNCTION
         ELSEIF LEN(skey$) > 0 AND LEN(skey$) < 3 THEN
            Ikey = InKeyCode(skey$)
            IF Ikey = %F1key THEN
               INPUT FLUSH
               iresponse = MsgBox("A radionuclide needs to be selected;", "")
               IF iresponse = %IDNO THEN
                  CLOSE
                  EXIT FUNCTION
               END IF
            ELSEIF Ikey = %F2key THEN
               INPUT FLUSH
               iresponse = MsgBox("A radionuclide needs to be selected;", "")
               IF iresponse = %IDNO THEN
                  CLOSE
                  EXIT FUNCTION
               END IF
            ELSEIF Ikey = %F3key THEN
               INPUT FLUSH
               iresponse = MsgBox ("A radionuclide needs to be selected;", "")
               IF iresponse = %IDNO THEN
                  CLOSE
                  EXIT FUNCTION
               END IF
            ELSEIF Ikey = %F4key THEN
               GfxWindow %GFX_FREEZE
               CALL TableGen
               GfxWindow %GFX_UNFREEZE
            ELSEIF Ikey = %F5key THEN
               GfxWindow %GFX_HIDE
               CALL Searchem
               GfxWindow %GFX_SHOW                        ' Show the graphics window
               CURSOR OFF
            ELSEIF Ikey = %F6key THEN
               GfxWindow %GFX_FREEZE
               CALL Helpem
               GfxWindow %GFX_UNFREEZE
            ELSEIF Ikey = %F7key THEN
               GfxWindow %GFX_HIDE
               CALL Aboutem
               GfxWindow %GFX_SHOW
            END IF
         ELSEIF LEN(skey$) = 4 AND iz <> 0 THEN
            EXIT LOOP
         END IF
      LOOP
'
      IF INSTR(NukeCover$, Chx$) > 0 THEN
         CALL Listex(Chx$, Listx$(), nlist)                  ' we have something to process
         IF nlist = 1 THEN
            Nukex$ = LEFT$(Listx$(1), 7)
            i = 1
         ELSE
            IF nlist < 6 THEN
               GfxWindow %GFX_FREEZE
               INPUT FLUSH
               list$ = ConsoleListBox(1, %CONSOLE_CENTER, 0, _
                       "Select Radioisotope of " + ElName(iz) + "...", "ICRP-07 Decay Data",  _
                       Listx$(), 1, %RETURN_INDEX, 0)
            ELSE
               GfxWindow %GFX_FREEZE
               INPUT FLUSH
               list$ = ConsoleListBox(3, %CONSOLE_CENTER, 0, _
                       "Select Radioisotope of " + ElName(iz) + "...", "ICRP-07 Decay Files",  _
                       Listx$(), 1, %RETURN_INDEX, 0)
            END IF
            IF LEN(list$) = 0 THEN                         ' user cancelled selection
               i = 0
            ELSE                                           ' user selected a radionuclide
               i = VAL(list$)
               Nukex$ = LEFT$(Listx$(i), 7)
            END IF
         END IF
         IF i = 0 THEN EXIT IF
'
         GfxWindow %Gfx_Hide
         CLS
         CALL ShowTable(Nukex$)
         CURSOR ON
         LOCATE %mWindow - 2, 1
         COLOR %xYellow
         PRINT $Prompt;
'
         DO
            INPUT FLUSH
            a$ = WAITKEY$                                  ' a wait the user selecting an action
            IF a$ = $ESC THEN
               EXIT LOOP
            END IF
            Ikey = InKeyCode(a$)
            IF Ikey = %F1key THEN
               PCOPY 1, 2
               CALL Exportem(Nukex$)
               PCOPY 2, 1
            ELSEIF Ikey = %F2key THEN
               PCOPY 1, 2
               CALL Chain(Nukex$, 0)
               PCOPY 2, 1
               ip = ibinry(Nukex$)                        ' chain may have destroyed parent's
               GET %indx, ip, IndDat                      ' IndDat record - so read again.
            ELSEIF Ikey = %F3key THEN
               CALL Plotem(Nukex$)
            ELSEIF Ikey = %F4key THEN
               CALL TableGen
               ip = ibinry(Nukex$)                        ' TableGen may have destroyed parent's
               GET %indx, ip, IndDat                      ' IndDat record - so read again.
            ELSEIF Ikey = %F5key THEN
               PCOPY 1, 2
               CALL Searchem
               PCOPY 2, 1
               LOCATE %mWindow - 2, LEN($Prompt) + 1
               CURSOR ON
               ip = ibinry(Nukex$)                        ' Searchem may have destroyed parent's
               GET %indx, ip, IndDat                      ' IndDat record - so read again.
            ELSEIF Ikey = %F6key THEN
               CALL Helpem
               LOCATE %mWindow - 2, LEN($Prompt) + 1
            ELSEIF Ikey = %F7key THEN
               PCOPY 1, 2
               CALL Aboutem
               PCOPY 2, 1
               LOCATE %mWindow - 2, LEN($Prompt) + 1
               CURSOR ON
            END IF
         LOOP WHILE (Ikey > 1058 AND Ikey < 1066)
         CLS
         GfxWindow %GFX_UNFREEZE
      ELSE
         INPUT FLUSH
         iresponse = MsgBox("No isotopes of " + ElName(iz) + _
                            " in ICRP-07;", "")
         IF iresponse = %IDYES THEN                       ' try again
            EXIT IF                                       '   or
         ELSE                                             ' just quit
            CLOSE
            EXIT FUNCTION
        END IF
      END IF
   LOOP
   CLOSE
 END FUNCTION

'----------------------------------------------------------------------------------------
 SUB ShowTable(Nukex$)
'----------------------------------------------------------------------------------------
'  Display the summary report on the nuclide's emissions.
'
   DIM SumEnergy(1 TO 14), TotalFreq(1 TO 14), NumberRad(1 TO 14)
   cMeVtoJoule = 1.6022E-13
'
   DATA "Gamma rays"        , "X rays"            , "Annh photons"    , "Beta +"
   DATA "Beta -"            , "IC electrons"      , "Auger electrons" , "Alpha particles"
   DATA "Alpha recoils"     , "Fission fragments" , "Neutrons"        , "Prompt gamma"
   DATA "Delayed gamma"     , "Delayed beta"
'
   nucnam(1) = Nukex$
   LOCATE %mWindow, 1
   COLOR %xBlack, %xWhite
   PRINT $fline1;
   LOCATE 3, 1
   COLOR %xYellow, %xblue
   PRINT CenterMess("Summary of " + TRIM$(Nukex$) + " Emissions", 97)
   COLOR %xWhite + %xBright
   PRINT
   ip = ibinry(Nukex$)
   GET %indx, ip, IndDat
'
   CALL RedDecay(ip, NumberRad(), SumEnergy(), TotalFreq(), SpA, ntotal)
'
'  All radiations have been read, now write out the info.
'
   Ls$ = "   Half-Life : " + LTRIM$(IndDat.T) + " " + IndDat.Tu
   ispace = 95 - (LEN(Ls$) + 25)
   PRINT Ls$ + STRING$(ispace, " ") + "SpA =" + USING$($fmt1, SpA) + " TBq/kg"
   Ls$ = "   Decay Mode: " + LEFT$(IndDat.mode, 2) + " " + _
                           MID$(IndDat.mode, 3, 2) + " " + _
                           MID$(IndDat.mode, 5, 2) + " " + _
                           MID$(IndDat.mode, 7, 2)
   ispace = 95 - (LEN(Ls$) + 25)
   PRINT Ls$ + STRING$(ispace," ") + "Data files: ICRP-07"
   PRINT
'
'  this block determines the radioactive daughters for the nuclide
'
   IF VAL(IndDat.idau1) <> 0 THEN                 ' we have a radioactive
      PRINT "   Radioactive daughters & branching fractions"
      branch1 = VAL(IndDat.bf1)                   ' daughter with branching
      idau1 = VAL(IndDat.idau1)                   ' fraction and index number
      IF VAL(IndDat.idau2) <> 0 THEN              ' check to see if a second
         branch2 = VAL(IndDat.bf2)                ' daughter is present
         idau2 = VAL(IndDat.idau2)
         IF VAL(IndDat.idau3) <> 0 THEN           ' if second present how
            branch3 = VAL(IndDat.bf3)             ' about a third daughter
            idau3 = VAL(IndDat.idau3)
            IF VAL(IndDat.idau4) <> 0 THEN
               branch4 = VAL(IndDat.bf4)
               idau4 = VAL(IndDat.idau4)
            ELSE
               idau4 = 0
            END IF
         ELSE
            idau3 = 0                             ' if no 3rd set idau3 = 0
            idau4 = 0
         END IF
      ELSE
         idau2 = 0                                ' if no 2nd set idau2 and
         idau3 = 0
         idau4 = 0                                ' idau3 to 0
      END IF
      IF idau1 < 9999 THEN                        ' 9999 is flag for SF
         PRINT "   " + IndDat.Dau1 + USING$($fmt1, branch1) + "  ";
      ELSE
         PRINT "   SF " + USING$($fmt1, branch1)+ "  ";
      END IF
      IF idau2 > 0 AND idau2 < 9999 THEN
         PRINT IndDat.Dau2 + USING$($fmt1, branch2)+ "  ";
      ELSEIF idau2 = 9999 THEN
         PRINT " SF " + USING$($fmt1, branch2)+ "  ";
      END IF
      IF idau3 > 0 AND idau3 < 9999 THEN
         PRINT IndDat.Dau3 + USING$($fmt1, branch3)+ "  ";
      ELSEIF idau3 = 9999 THEN
         PRINT " SF " + USING$($fmt1, branch3)+ "  ";
      END IF
      IF idau4 > 0 AND idau4 < 9999 THEN
         PRINT IndDat.Dau4 + USING$($fmt1, branch4)+ "  ";
      ELSEIF idau4 = 9999 THEN
         PRINT " SF " + USING$($fmt1, branch4)+ "  ";
      END IF
      PRINT
   END IF
   PRINT
   PRINT
   PRINT
   PRINT STRING$(27, " ") + "  Number    Yield     Energy   Mean Energy   Delta"
   PRINT STRING$(12, " ") + " Radiations      Records   (/nt)    (MeV/nt)    (MeV)     (Gy kg/nt)"
   PRINT STRING$(13, " ") + STRING$(67, "-")
   TotalEnergy = 0#
   Delta = 0#
   FOR ic = 1 TO 14
      IF NumberRad(ic) > 0 THEN
         PRINT STRING$(13," ") + READ$(ic)+ STRING$(17 - LEN(READ$(ic))," ") + _
               USING$("#####", NumberRad(ic)) + " " + _
               USING$($fmt1, TotalFreq(ic)) + " " + _
               USING$($fmt1, SumEnergy(ic)) + " " + _
               USING$($fmt1, SumEnergy(ic) / TotalFreq(ic)) + " " + _
               USING$($fmt1, cMeVtoJoule * SumEnergy(ic))
         TotalEnergy = TotalEnergy + SumEnergy(ic)
         Delta = Delta + cMeVtoJoule * SumEnergy(ic)
      END IF
   NEXT ic
   PRINT TAB(24) "Totals " + USING$("#####", ntotal) + STRING$(12, " ") + _
                 USING$($fmt1, TotalEnergy) + STRING$(12, " ") + USING$($fmt1, Delta)
   PRINT
'
   IF VAL(IndDat.Kpts) > 0.0 THEN
      PRINT TAB(14) USING$ ("Point Source Air Kerma Coefficient =##.##^^^^ Gy m^2/(Bq s)", _
            VAL(IndDat.Kpts))
   END IF
   IF VAL(IndDat.Kair) > 0.0 THEN
      PRINT TAB(25) USING$ ("Air Kerma-Rate Constant =##.##^^^^ Gy m^2/(Bq s)", _
            VAL(IndDat.Kair))
   END IF
'
   Nukexx$ = LEFT$(Nukex$, INSTR(Nukex$, "-") - 1) + TRIM$(MID$(Nukex$, INSTR(Nukex$, "-") + 1)) + _
             ".eps"
   IF GetFileCount($figs + Nukexx$) > 0 THEN
      LOCATE %mWindow - 4, 2
      PRINT "Decay scheme schematic in FIGS folder."
   END IF
'
   SLEEP 100
 END SUB

'----------------------------------------------------------------------------------------
 SUB RedDecay(ip, NumberRad(), SumEnergy(), TotalFreq(), SpA, ndecay)
'----------------------------------------------------------------------------------------
'  read the decay data for the nuclide IndDat.Nuke with RAD record IndDat.mdec.
'
   jdec = VAL(IndDat.mdec)                ' location of rad records
   GET %irad, jdec, DecHed
   ndecay = VAL(DecHed.ndec)              ' number of radiations
   IF VAL(IndDat.Mass) = 0 THEN
      SpA = 0#
   ELSE
      SpA = 6.0231D+23 * 0.693147# / Timest(IndDat.T, IndDat.tu) / VAL(IndDat.Mass)
      SpA = 1.0D-09 * SpA                 ' (TBq/kg)
   END IF
   FOR i = 1 TO 14                        ' zero the radiation cummulators
      NumberRad(i) = 0                    ' number of radiations of type i
      SumEnergy(i) = 0#                   ' total energy of type i
      TotalFreq(i) = 0#
   NEXT i
'
   FOR i = 1 TO ndecay                    ' now we go get the radiation
      GET %irad, , DecDat                 ' records begining at IndDat.mdec
      ic = VAL(DecDat.icode)
      Freq = VAL(DecDat.Freq)
      Enr = VAL(DecDat.E)
      IF ic = 1 AND DecDat.jcode = " PG" THEN
          INCR NumberRad(12)
          SumEnergy(12) = SumEnergy(12) + Freq * Enr
          TotalFreq(12) = TotalFreq(12) + Freq
      ELSEIF ic = 1 AND DecDat.jcode = " DG" THEN
          INCR NumberRad(13)
          SumEnergy(13) = SumEnergy(13) + Freq * Enr
          TotalFreq(13) = TotalFreq(13) + Freq
      ELSEIF ic = 5 AND DecDat.jcode = " DB" THEN
          INCR NumberRad(14)
          SumEnergy(14) = SumEnergy(14) + Freq * Enr
          TotalFreq(14) = TotalFreq(14) + Freq
      ELSE
          INCR NumberRad(ic)
          SumEnergy(ic) = SumEnergy(ic) + Freq * Enr
          TotalFreq(ic) = TotalFreq(ic) + Freq
      END IF
   NEXT i
 END SUB

'------------------------------------------------------------------------------
 SUB Exportem(nukex$)
'------------------------------------------------------------------------------
'  Routine to extract the decay data for nuclide IndDat.nuke and write the
'  info to ASCII data files.
   CLS
   LOCATE 2, 1
   COLOR %xYellow
   PRINT CenterMess("Export Decay Data of " + TRIM$(Nukex$) + " to ASCII data files", 80)
   COLOR %xWhite + %xBright
   PRINT
   OutFile$ = $OutDir + TRIM$(Nukex$) + ".RAD"
   OPEN OutFile$ FOR OUTPUT AS %iout
   PRINT #%iout, "File: "+ TRIM$(Nukex$) + ".RAD" + " for " + Nukex$
   mrads = VAL(IndDat.mdec)
   GET %irad, mrads, DecHed
   PRINT #%iout, DecHed.nuke + "   " + DecHed.T + DecHed.tu + "    " + DecHed.ndec
   PRINT #%iout, "T1/2 = "; TRIM$(IndDat.T) + TRIM$(IndDat.tu) + " Decay Mode: "; TRIM$(IndDat.Mode)
   nrecord = VAL(DecHed.ndec)
   PRINT #%iout, "Radiations of each type listed in increasing energy"
'
   IF VAL(IndDat.np10) + VAL(IndDat.npg10) > 0 THEN
      PRINT #%iout, "Number of photon radiations:"; VAL(IndDat.np10) + VAL(IndDat.npg10)
   END IF
'
   IF VAL(IndDat.nbet) > 0 THEN
      PRINT #%iout, "Number of beta radiations:"; VAL(IndDat.nbet)
   END IF
'
   IF VAL(IndDat.nel) > 0 THEN
      PRINT #%iout, "Number of monoenergetic electron radiations:"; VAL(IndDat.nel)
   END IF
'
   IF VAL(IndDat.nalpha) > 0 THEN
      PRINT #%iout, "Number of alpha radiations:"; VAL(IndDat.nalpha)
      PRINT #%iout, "Number of alpha recoil radiations:"; VAL(IndDat.nalpha)
   END IF
'
   PRINT #%iout, "ICODE  Y (/nt) E(MeV) Mnemonic"
   PRINT #%iout, "START RADIATION RECORDS"
   FOR i = 1 TO nrecord
      GET %irad, , DecDat
      PRINT #%iout, DecDat.icode; DecDat.Freq; DecDat.E; DecDat.jcode
   NEXT i
   PRINT #%iout, "END RADIATION RECORDS"
   CLOSE #%iout
   PRINT
   PRINT " File "; TRIM$(RIGHT$(OutFile$, -INSTR(OutFile$, "\"))); " written in the OUTPUT folder."
'
   IF VAL(IndDat.mbet) > 0 THEN
      ioffset = VAL(IndDat.np10) + VAL(IndDat.npg10)
      GET %irad, VAL(IndDat.mdec) + ioffset, DecDat
      mbeta = VAL(IndDat.mbet)
      nbeta = VAL(IndDat.nbet)
      Byield = 0.0
      FOR i = 1 TO nbeta
         GET %irad, , DecDat
         Byield = Byield + VAL(DecDat.Freq)
      NEXT i
      OutFile$ = $OutDir + TRIM$(Nukex$) + ".BET"
      OPEN OutFile$ FOR OUTPUT AS %iout
      PRINT #%iout, "File: "+ TRIM$(Nukex$) + ".BET for " + Nukex$
      GET %ibet, mbeta, BetHed
      PRINT #%iout, BetHed.Nuke + BetHed.nbet
      PRINT #%iout, "Beta Spectrum for "; Nukex$
      PRINT #%iout, "Spectrum is normalized to 1 nt (Bq s)"
      PRINT #%iout, "To normalize to 1 beta, divide by " + TRIM$(USING$("##.####^^^^", Byield))
      PRINT #%iout, "Number of energy points: "; TRIM$(BetHed.nbet)
      PRINT #%iout, "E(MeV)    P(E)"
      nrecord = VAL(BetHed.nbet)
      PRINT #%iout, "START RADIATION RECORDS"
      FOR i = 1 TO nrecord
         GET %ibet, , BetSpec
         PRINT #%iout, BetSpec.Eelc; BetSpec.Freq
      NEXT i
      PRINT #%iout, "END RADIATION RECORDS"
      CLOSE #%iout
      PRINT " File "; TRIM$(RIGHT$(OutFile$, -INSTR(OutFile$, "\"))); " written in the OUTPUT folder."
   END IF
'
   IF VAL(IndDat.mack) > 0 THEN
      OutFile$ = $OutDir + TRIM$(Nukex$) + ".ACK"
      OPEN OutFile$ FOR OUTPUT AS %iout
      PRINT #%iout, "File: "+ TRIM$(Nukex$) + ".ACK for " + Nukex$
      mauger = VAL(IndDat.mack)                    ' location of detailed auger
      GET %iaug, mauger, AugHed
      PRINT #%iout, AugHed.Nuke + STRING$(20, " ") + AugHed.naug
      PRINT #%iout, "Auger/Coster-Kronig Spectrum for "; Nukex$
      PRINT #%iout, "Number of electrons: "; TRIM$(AugHed.naug)
      PRINT #%iout, "  Y(/nt)       E(eV)   transition"
      PRINT #%iout, "START RADIATION RECORDS"
      nrecord = VAL(AugHed.naug)
      FOR i = 1 TO nrecord
         GET %iaug, , AugDat
         PRINT #%iout, AugDat.Freq; AugDat.E; AugDat.tran
      NEXT i
      PRINT #%iout, "END RADIATION RECORDS"
      CLOSE #%iout
      PRINT " File "; TRIM$(RIGHT$(OutFile$, -INSTR(OutFile$, "\"))); " written in the OUTPUT folder."
   END IF
'
   IF VAL(IndDat.mneu) > 0 THEN
      OutFile$ = $OutDir + TRIM$(Nukex$) + ".NSF"
      OPEN OutFile$ FOR OUTPUT AS %iout
      PRINT #%iout, "File: "+ TRIM$(Nukex$) + ".NSF for " + Nukex$
      ioffset = VAL(IndDat.np10) + VAL(IndDat.npg10) + VAL(IndDat.nbet) + _
                VAL(IndDat.nel) + 2 * VAL(IndDat.nalpha) + 2
      GET %irad, VAL(IndDat.mdec) + ioffset, DecDat
      meutron = VAL(IndDat.mneu)
      GET %ineu, meutron, NeuHed
      znu = VAL(DecDat.Freq)/VAL(NeuHed.sfnt)           ' # neutrons/fission
      PRINT #%iout, NeuHed.Nuke + NeuHed.sfnt + STRING$(8, " ") + NeuHed.npts
      PRINT #%iout, "Neutron Spectrum for "; Nukex$
      PRINT #%iout, "Number of neutron per fission - " + TRIM$(USING$("##.###", znu))
      PRINT #%iout, "Spectrum is normalized to 1 nt (Bq s)"
      PRINT #%iout, "To normalize to 1 fission, divide by" + NeuHed.sfnt
      PRINT #%iout, "To normalize to 1 neutron, divide by " + _
                     TRIM$(USING$("##.####^^^^", VAL(NeuHed.sfnt) * znu))
      PRINT #%iout, "Number of energy bins: " + TRIM$(NeuHed.npts)
      PRINT #%iout, "E1 (MeV) E2 (MeV)    Y (/nt)"
      PRINT #%iout, "START RADIATION RECORDS"
      nrecord = VAL(NeuHed.npts)
      FOR j = 1 TO nrecord
         GET %ineu, , NeuDat
         PRINT #%iout, NeuDat.E1; NeuDat.E2; NeuDat.Yield
      NEXT j
      PRINT #%iout, "END RADIATION RECORDS"
      CLOSE #%iout
      PRINT " File "; TRIM$(RIGHT$(OutFile$, -INSTR(OutFile$, "\"))); " written in the OUTPUT folder."
   END IF
'
   LOCATE %mWindow - 2, 1
   COLOR %xYellow
   PRINT $Prompt;
   INPUT FLUSH
   WAITKEY$
   SLEEP 200
 END SUB

'----------------------------------------------------------------------------------------
 SUB Plotem(nuke$)
'----------------------------------------------------------------------------------------
'  Routine using DPlotJr to plot the emission data for nuclide IndDat.nuke
'
   REDIM x(0 TO 100) AS LOCAL SINGLE
   REDIM y(0 TO 100) AS LOCAL SINGLE
   DIM cmds AS LOCAL STRING
   CALL ShowMSG(0)
   Dp.Version = %DPLOT_DDE_VERSION
   Dp.hwnd = CONSHNDL
   Dp.DataFormat = %DATA_XYXY
   Dp.LegendX = 0.05
   Dp.LegendY = 0.05
   ylow = 1.0E+30
   mrads = VAL(IndDat.mdec)
   iplots = 0                                             ' counter of plots
   IF GetFileCount($data + "DPlotJr.ini") > 0 THEN        ' if file present then
      MaxPlot = %true                                     ' plots expanded
   ELSE                                                   ' else
      MaxPlot = %false                                    ' cascade view
   END IF
'
'  beta spectra
'
   Dp.Legend = STRING$(8080, " ")                         ' blank out the legend
   IF VAL(IndDat.mbet) > 0 THEN                           ' if a beta emitters
      INCR iplots                                         ' then do a plot
      mbeta = VAL(IndDat.mbet)
      nbeta = VAL(IndDat.nbet)
      Ebar = 0.0
      GET %irad, mrads + VAL(IndDat.np10) + VAL(IndDat.npg10), DecDat
      Ftot = 0
      FOR i = 1 TO nbeta
         GET %irad, , DecDat
         Ebar = Ebar + VAL(DecDat.Freq) * VAL(DecDat.E)
         Ftot = Ftot + VAL(DecDat.Freq)
      NEXT i
      Ebar = Ebar/Ftot
      GET %ibet, mbeta, BetHed
      Ne = VAL(BetHed.nbet)
      REDIM x(0 TO ne - 1)
      REDIM y(0 TO ne - 1)
      FOR j = 0 TO Ne - 1
         GET %ibet, , BetSpec
         x(j) = VAL(BetSpec.Eelc)
         y(j) = VAL(BetSpec.Freq)
      NEXT j
      MID$(Dp.Legend, 81, 80) = "E{\dmax} = " + BetSpec.Eelc + ", E{\dave} = " + USING$("##.#### MeV", Ebar)
      Dp.SymbolType(0) = 0
      Dp.LineType(0) = %LINESTYLE_SOLID
      Dp.MaxCurves = 1                 ' Must be >= number of curves we plot
      Dp.MaxPoints = ne                ' Anything >= NP will do
      Dp.NumCurves = 1
      Dp.ScaleCode = %SCALE_LINEARX_LINEARY
      Dp.NP(0) = ne
      Dp.Title1 = TRIM$(Nuke$) + " Beta Spectrum"
      Dp.XAxis = "Electron Energy (MeV)" & CHR$(0)
      Dp.YAxis = "P(E) (/MeV/nt)" & CHR$(0)
      cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) & " Beta Spectrum" & CHR$(34) & ")]"
      IF ngamma + nelectron + nalpha = 0 THEN
         cmds = cmds & "[DocMaximize()][ClearEditFlag()]"
      ELSE
         IF ISFALSE MaxPlot THEN
            cmds = cmds & "[ClearEditFlag()]"
         ELSE
            cmds = cmds & "[DocMaximize()][ClearEditFlag()]"
         END IF
      END IF
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   ELSE
      nbeta = 0
   END IF
'
'  photons
'
   Dp.Legend = STRING$(8080, " ")
   IF VAL(IndDat.np10) + VAL(IndDat.npg10) = 1 THEN
      INCR iplots
      ngamma = 1
      REDIM x(0 TO 4)
      REDIM y(0 TO 4)
      GET %irad, mrads + 1, DecDat
      ylow = 0.001 * VAL(DecDat.Freq)
      ylow = 10^INT(LOG10(ylow))
      IF VAL(DecDat.icode) = 1 THEN
         ng = 1 : nx = 0 : npp = 0
      ELSEIF VAL(DecDat.icode) = 2 THEN
         ng = 0 : nx = 1 : npp = 0
      ELSEIF VAL(DecDat.icode) = 3 THEN
         ng = 0 : nx = 0 : npp = 1
      END IF
      x(0) = 0.9 * VAL(DecDat.E)
      y(0) = ylow
      x(1) = VAL(DecDat.E)
      y(1) = ylow
      x(2) = VAL(DecDat.E)
      y(2) = VAL(DecDat.Freq)
      x(3) = VAL(DecDat.E)
      y(3) = ylow
      x(4) = 1.3 * VAL(DecDat.E)
      y(4) = ylow
      npoints = 5
      Dp.MaxCurves = 1                      ' Must be >= number of curves we plot
      Dp.MaxPoints = npoints                ' Anything >= NP will do
      IF ISFALSE MaxPlot THEN
         cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
         cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(6,14,  0,0,0,0,0,""Arial"")]"
      ncur = 1
      MID$(Dp.Legend, 81, 80) = ""
      Dp.NP(0) = npoints
      Dp.SymbolType(0) = 0
      Dp.LineType(0) = %LINESTYLE_SOLID
      IF nx > 0 THEN
         Dp.Title1 = TRIM$(Nuke$) + " X-ray Line Spectrum"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur,1) + ", 255, 0, 255)]"  ' magenata
      END IF
      IF ng > 0 THEN
         Dp.Title1 = TRIM$(Nuke$) + " Gamma-ray Line Spectrum"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur,1) + ", 255, 0, 0)]"    ' red
      END IF
      IF npp > 0 THEN
         Dp.Title1 = TRIM$(Nuke$) + " Annihilation Photon Line Spectrum"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur, 1) + ", 0, 0, 0)]"     ' black
      END IF
      Dp.NumCurves = 1
      Dp.ScaleCode = %SCALE_LOGX_LOGY     ' %SCALE_LOGX_LOGY
      Dp.XAxis = "Photon energy (MeV)" & CHR$(0)
      Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Photon Line Spectrum" & CHR$(34) & ")]"
      cmds = cmds & "[ClearEditFlag()]"
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   ELSEIF VAL(IndDat.np10) + VAL(IndDat.npg10) > 1 THEN
      INCR iplots
      ngamma = VAL(IndDat.np10) + VAL(IndDat.npg10)
      REDIM x(0 TO 3 * ngamma - 1)
      REDIM y(0 TO 3 * ngamma - 1)
      ylow = 1.0E+30
      nx = 0 : ng = 0 : npp = 0 : npg = 0 : ndg = 0
      GET %irad, mrads, DecHed
      FOR j = 1 TO Ngamma
         GET %irad, , DecDat
         yx = VAL(DecDat.Freq)
         IF yx < ylow THEN ylow = yx
         IF VAL(DecDat.icode) = 2 THEN
            INCR nx
         ELSEIF VAL(DecDat.icode) = 3 THEN
            INCR npp
         ELSEIF VAL(DecDat.icode) = 1 AND DecDat.jcode = " PG" THEN
            INCR npg
         ELSEIF VAL(DecDat.icode) = 1 AND DecDat.jcode = " DG" THEN
            INCR ndg
         ELSE
            INCR ng
         END IF
      NEXT j
      ylow = 10^INT(LOG10(ylow))
      ix = -1
      ig = 3 * nx - 1
      ipp = 3 * (nx + ng) - 1
      ipg = 3 * (nx + ng + npp) - 1
      idg = 3 * (nx + ng +  npp + npg) - 1
      GET %irad, mrads, DecHed
      FOR j = 1 TO Ngamma
         GET %irad, , DecDat
         IF VAL(DecDat.icode) = 2 THEN
            INCR ix
            x(ix) = VAL(DecDat.E)
            y(ix) = ylow
            INCR ix
            x(ix) = x(ix - 1)
            y(ix) = VAL(DecDat.Freq)
            INCR ix
            y(ix) = x(ix - 1)
            y(ix) = ylow
         ELSEIF VAL(DecDat.icode) = 3 THEN
            INCR ipp
            x(ipp) = VAL(DecDat.E)
            y(ipp) = ylow
            INCR ipp
            x(ipp) = x(ipp - 1)
            y(ipp) = VAL(DecDat.Freq)
            INCR ipp
            x(ipp) = x(ipp - 1)
            y(ipp) = ylow
         ELSEIF VAL(DecDat.icode) = 1 AND DecDat.jcode = " PG" THEN
            INCR ipg
            x(ipg) = VAL(DecDat.E)
            y(ipg) = ylow
            INCR ipg
            x(ipg) = x(ipg - 1)
            y(ipg) = VAL(DecDat.Freq)
            INCR ipg
            x(ipg) = x(ipg - 1)
            y(ipg) = ylow
         ELSEIF VAL(DecDat.icode) = 1 AND DecDat.jcode = " DG" THEN
            INCR idg
            x(idg) = VAL(DecDat.E)
            y(idg) = ylow
            INCR idg
            x(idg) = x(idg - 1)
            y(idg) = VAL(DecDat.Freq)
            INCR idg
            x(idg) = x(idg - 1)
            y(idg) = ylow
         ELSE
            INCR ig
            x(ig) = VAL(DecDat.E)
            y(ig) = ylow
            INCR ig
            x(ig) = x(ig - 1)
            y(ig) = VAL(DecDat.Freq)
            INCR ig
            x(ig) = x(ig - 1)
            y(ig) = ylow
         END IF
      NEXT j
'
      Dp.MaxCurves = 6                    ' Must be >= number of curves we plot
      Dp.MaxPoints = 3 * ngamma           ' Anything >= NP will do
      MID$(Dp.Legend, 1, 80) = "Photons"
      IF ISFALSE MaxPlot THEN
         cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
         cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(6,14,  0,0,0,0,0,""Arial"")]"
      ncur = 0
      IF nx > 0 THEN
         INCR ncur
         Dp.SymbolType(ncur-1) = 0
         Dp.LineType(ncur-1) = %LINESTYLE_SOLID
         Dp.NP(ncur - 1) = 3 * nx
         MID$(Dp.Legend, 81+(ncur-1)*80 , 80) = "X-rays"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur,1) + ", 255, 0, 255)]"  ' magenata
      END IF
      IF ng > 0 THEN
         INCR ncur
         Dp.SymbolType(ncur-1) = 0
         Dp.LineType(ncur-1) = %LINESTYLE_SOLID
         Dp.NP(ncur - 1) = 3 * ng
         MID$(Dp.Legend, 81+(ncur-1)*80 , 80) = "Gamma-rays"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur,1) + ", 255, 0, 0)]"    ' red
      END IF
      IF npp > 0 THEN
         INCR ncur
         Dp.SymbolType(ncur-1) = 0
         Dp.LineType(ncur-1) = %LINESTYLE_SOLID
         Dp.NP(ncur - 1) = 3 * npp
         MID$(Dp.Legend, 81+(ncur-1)*80 , 80) = "Annihilation photons"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur, 1) + ", 0, 0, 0)]"     ' black
      END IF
      IF npg > 0 THEN
         INCR ncur
         Dp.SymbolType(ncur-1) = 0
         Dp.LineType(ncur-1) = %LINESTYLE_SOLID
         Dp.NP(ncur - 1) = 3 * npg
         MID$(Dp.Legend, 81+(ncur-1)*80 , 80) = "Prompt gamma-rays"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur, 1) + ", 0, 0, 255)]"   ' blue
      END IF
      IF ndg > 0 THEN
         INCR ncur
         Dp.SymbolType(ncur-1) = 0
         Dp.LineType(ncur-1) = %LINESTYLE_SOLID
         Dp.NP(ncur - 1) = 3 * ndg
         MID$(Dp.Legend, 81 + (ncur-1)*80 , 80) = "Delayed gamma-rays"
         cmds = cmds + "[LineWidth(" + STR$(ncur,1) + ",30)][color(" + STR$(ncur, 1) + ", 0, 255, 255)]" ' cyan
      END IF
      Dp.NumCurves = ncur
      Dp.ScaleCode = %SCALE_LOGX_LOGY     ' %SCALE_LOGX_LOGY
      Dp.Title1 = TRIM$(Nuke$) + " Photon Line Spectrum"
      Dp.XAxis = "Photon energy (MeV)" & CHR$(0)
      Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Photon Line Spectrum" & CHR$(34) & ")]"
      cmds = cmds & "[ClearEditFlag()]"
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   ELSE
      ngamma = VAL(IndDat.np10) + VAL(IndDat.npg10)
   END IF
'
'  electrons
'
   Dp.Legend = STRING$(8080, " ")
   IF VAL(IndDat.nel) = 1 THEN
      INCR iplots
      nelectron = 1
      npoints = 5
      REDIM x(0 TO 4)
      REDIM y(0 TO 4)
      GET %irad, mrads + ngamma + nbeta + 1, DecDat
      ylow = 0.001 * VAL(DecDat.Freq)
      ylow = 10^INT(LOG10(ylow))
      IF VAL(DecDat.icode) = 6 THEN
         na = 0 : ni = 1
         Dp.Title1 = Nuke$ + " Internal Conversion Electron Line Spectrum"
      ELSEIF VAL(DecDat.icode) = 7 THEN
         na = 1 : ni = 0
         Dp.Title1 = Nuke$ + " Auger-CK Electron Line Spectrum"
      END IF
      Dp.NP(0) = npoints
      Dp.SymbolType(0) = 0
      x(0) = 0.9 * VAL(DecDat.E)
      y(0) = ylow
      x(1) = VAL(DecDat.E)
      y(1) = ylow
      x(2) = VAL(DecDat.E)
      y(2) = VAL(DecDat.Freq)
      x(3) = VAL(DecDat.E)
      y(3) = ylow
      x(4) = 1.3 * VAL(DecDat.E)
      y(4) = ylow
      Dp.MaxCurves = 1                      ' Must be >= number of curves we plot
      Dp.MaxPoints = npoints                ' Anything >= NP will do
      Dp.LineType(0) = %LINESTYLE_SOLID
      Dp.XAxis = "Electron energy (MeV)" & CHR$(0)
      Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
      IF ISFALSE MaxPlot THEN
            cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
            cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds + "[LineWidth(1,30)][LineWidth(2,30)]"
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(6,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[color(1,255,0,255)][color(2,255,0,0)][NumTicks(1,10,10)]"
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Discrete Electron Spectrum" & CHR$(34) & ")]"
      cmds = cmds & "[ClearEditFlag()]"
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   ELSEIF VAL(IndDat.nel) > 1 THEN
      INCR iplots
      nelectron = VAL(IndDat.nel)
      GET %irad, mrads + ngamma + nbeta, DecHed
      na = 0                                              ' auger-CK electrons
      ni = 0                                              ' int conv electrons
      ylow = 1.0E+30
      FOR j = 1 TO nelectron
         GET %irad, , DecDat
         IF VAL(DecDat.icode) = 7 THEN
            INCR na
         ELSE
            INCR ni
         END IF
         yx = VAL(DecDat.Freq)
         IF yx < ylow THEN ylow = yx
      NEXT j
      REDIM x(0 TO 3 * nelectron - 1)
      REDIM y(0 TO 3 * nelectron - 1)
      ylow = 10^INT(LOG10(ylow))
      GET %irad, mrads + ngamma + nbeta, DecHed
      IF na * ni > 0 THEN
         i1 = -1
         i2 = -1
         ioffset = 3 * na - 1
         FOR j = 1 TO nelectron
            GET %irad, , DecDat
            IF VAL(DecDat.icode) = 7 THEN                    ' Auger
               INCR i1
               x(i1) = VAL(DecDat.E)
               y(i1) = ylow
               INCR i1
               x(i1) = x(i1 - 1)
               y(i1) = VAL(DecDat.Freq)
               INCR i1
               x(i1) = x(i1 - 1)
               y(i1) = ylow
            ELSE
               INCR ioffset
               x(ioffset) = VAL(DecDat.E)
               y(ioffset) = ylow
               INCR ioffset
               x(ioffset) = x(ioffset - 1)
               y(ioffset) = VAL(DecDat.Freq)
               INCR ioffset
               x(ioffset) = x(ioffset - 1)
               y(ioffset) = ylow
            END IF
         NEXT j
         Dp.MaxCurves = 3                    ' Must be >= number of curves we plot
         Dp.MaxPoints = 3 * nelectron        ' Anything >= NP will do
         Dp.NumCurves = 2
         Dp.ScaleCode = %SCALE_LOGX_LOGY     ' %SCALE_LOGX_LOGY
         Dp.NP(0) = 3 * na
         Dp.Np(1) = 3 * ni
         MID$(Dp.Legend, 1, 80) = "Electrons"
         MID$(Dp.Legend, 81, 80) = "Auger-CK"
         MID$(Dp.Legend, 161, 80) = "Int. Conversion"
         Dp.SymbolType(0) = 0
         Dp.SymbolType(1) = 0
         Dp.LineType(0) = %LINESTYLE_SOLID
         Dp.LineType(1) = %LINESTYLE_SOLID
         Dp.Title1 = TRIM$(Nuke$) + " Monoenergetic Electron Line Spectrum"
         Dp.XAxis = "Electron energy (MeV)" & CHR$(0)
         Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
         IF ISFALSE MaxPlot THEN
            cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
         ELSE
            cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
         END IF
         cmds = cmds + "[LineWidth(1,30)][LineWidth(2,30)]"
         cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
         cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
         cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
         cmds = cmds & "[TextFont(6,14,  0,0,0,0,0,""Arial"")]"
         cmds = cmds & "[color(1,255,0,255)][color(2,255,0,0)][NumTicks(1,10,10)]"
         cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Discrete Electron Spectrum" & CHR$(34) & ")]"
         cmds = cmds & "[ClearEditFlag()]"
      ELSE
         i1 = -1
         FOR j = 1 TO nelectron
            GET %irad, , DecDat
            INCR i1
            x(i1) = VAL(DecDat.E)
            y(i1) = ylow
            INCR i1
            x(i1) = x(i1 - 1)
            y(i1) = VAL(DecDat.Freq)
            INCR i1
            x(i1) = x(i1 - 1)
            y(i1) = ylow
         NEXT j
         Dp.MaxCurves = 3                    ' Must be >= number of curves we plot
         Dp.MaxPoints = 3 * nelectron        ' Anything >= NP will do
         Dp.NumCurves = 1
         Dp.ScaleCode = %SCALE_LOGX_LOGY     ' %SCALE_LOGX_LOGY
         Dp.NP(0) = 3 * nelectron
         Dp.SymbolType(0) = 0
         Dp.LineType(0) = %LINESTYLE_SOLID
         IF na > 0 THEN
            Dp.Title1 = Nuke$ + " Auger-CK Electron Line Spectrum"
         ELSE
            Dp.Title1 = Nuke$ + " Internal Conversion Electron Line Spectrum"
         END IF
         Dp.XAxis = "Electron energy (MeV)" & CHR$(0)
         Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
         IF ISFALSE MaxPlot THEN
            cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
         ELSE
            cmds = "[AutoScale()][NumTicks(1,10,10)]"
         END IF
         cmds = cmds + "[LineWidth(1,30)][LineWidth(2,30)]"
         cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
         cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
         cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
         cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Discrete Electron Spectrum" & CHR$(34) & ")]"
         cmds = cmds & "[ClearEditFlag()]"
      END IF
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   ELSE
      nelectron = VAL(IndDat.nel)
   END IF
'
'  alpha particles
'
   Dp.Legend = STRING$(8080, " ")
   IF VAL(IndDat.nalpha) > 0 THEN
      INCR iplots
      nalpha = VAL(IndDat.nalpha)
      GET %irad, mrads + ngamma + nbeta + nelectron, DecDat
      ylow = 1.0E+30
      FOR j = 1 TO nalpha
         GET %irad, , DecDat
         yx = VAL(DecDat.Freq)
         IF yx < ylow THEN ylow = yx
      NEXT j
      GET %irad, mrads + ngamma + nbeta + nelectron, DecDat
      IF nalpha = 1 THEN
         REDIM x(0 TO 4)
         REDIM y(0 TO 4)
         ylow = 10^INT(LOG10(0.1 * ylow))
         GET %irad, , DecDat
         x(0) = 0.9 * VAL(DecDat.E)
         y(0) = ylow
         x(1) = VAL(DecDat.E)
         y(1) = ylow
         x(2) = VAL(DecDat.E)
         y(2) = VAL(DecDat.Freq)
         x(3) = VAL(DecDat.E)
         y(3) = ylow
         x(4) = 1.3 * VAL(DecDat.E)
         y(4) = ylow
         npoints = 5
      ELSE
         ylow = 10^INT(LOG10(ylow))
         REDIM x(0 TO 3 * nalpha - 1)
         REDIM y(0 TO 3 * nalpha - 1)
         ii = -1
         FOR j = 1 TO nalpha
            GET %irad, , DecDat
            INCR ii
            x(ii) = VAL(DecDat.E)
            y(ii) = ylow
            INCR ii
            x(ii) = x(ii - 1)
            y(ii) = VAL(DecDat.Freq)
            INCR ii
            x(ii) = x(ii - 1)
            y(ii) = ylow
         NEXT j
         npoints = 3 * nalpha
      END IF
      Dp.SymbolType(0) = 0
      Dp.LineType(0) = %LINESTYLE_SOLID
      Dp.MaxCurves = 3                      ' Must be >= number of curves we plot
      Dp.MaxPoints = npoints                ' Anything >= NP will do
      Dp.NumCurves = 1
      Dp.ScaleCode = %SCALE_LINEARX_LOGY    ' %SCALE_LOGX_LOGY
      Dp.NP(0) = npoints                    ' 3 * nalpha
      Dp.Title1 = TRIM$(Nuke$) + " Alpha Particle Line Spectrum"
      Dp.XAxis = "Alpha particle energy (MeV)" & CHR$(0)
      Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
      IF ISFALSE MaxPlot THEN
         cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
         cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Alpha Spectrum"  & CHR$(34) & ")]"
      cmds = cmds & "[ClearEditFlag()]"
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
'     Alpha recoil line spectrum
      Dp.Legend = STRING$(8080, " ")
      INCR iplots
      GET %irad, mrads + ngamma + nbeta + nelectron + nalpha, DecDat
      IF nalpha = 1 THEN
         REDIM x(0 TO 4)
         REDIM y(0 TO 4)
         ylow = 10^INT(LOG10(0.1 * ylow))
         GET %irad, , DecDat
         x(0) = 0.9 * VAL(DecDat.E)
         y(0) = ylow
         x(1) = VAL(DecDat.E)
         y(1) = ylow
         x(2) = VAL(DecDat.E)
         y(2) = VAL(DecDat.Freq)
         x(3) = VAL(DecDat.E)
         y(3) = ylow
         x(4) = 1.3 * VAL(DecDat.E)
         y(4) = ylow
         npoints = 5
      ELSE
         ylow = 10^INT(LOG10(ylow))
         REDIM x(0 TO 3 * nalpha - 1)
         REDIM y(0 TO 3 * nalpha - 1)
         ii = -1
         FOR j = 1 TO nalpha
            GET %irad, , DecDat
            INCR ii
            x(ii) = VAL(DecDat.E)
            y(ii) = ylow
            INCR ii
            x(ii) = x(ii - 1)
            y(ii) = VAL(DecDat.Freq)
            INCR ii
            x(ii) = x(ii - 1)
            y(ii) = ylow
         NEXT j
         npoints = 3 * nalpha
      END IF
      Dp.SymbolType(0) = 0
      Dp.LineType(0) = %LINESTYLE_SOLID
      Dp.MaxCurves = 3                     ' Must be >= number of curves we plot
      Dp.MaxPoints = npoints               ' Anything >= NP will do
      Dp.NumCurves = 1
      Dp.ScaleCode = %SCALE_LINEARX_LOGY   ' %SCALE_LOGX_LOGY
      Dp.NP(0) = npoints                   ' 3 * nalpha
      Dp.Title1 = TRIM$(Nuke$) + " Alpha Recoil Line Spectrum"
      Dp.XAxis = "Alpha recoil energy (MeV)" & CHR$(0)
      Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
      IF ISFALSE MaxPlot THEN
         cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
         cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Alpha Recoil Spectrum"  & CHR$(34) & ")]"
      cmds = cmds & "[ClearEditFlag()]"
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   ELSE
      nalpha = 0
   END IF
'
'  Auger-CK electrons
'
   Dp.Legend = STRING$(8080, " ")
   IF VAL(IndDat.mack) > 0 THEN
      INCR iplots
      mauger = VAL(IndDat.mack)
      GET %iaug, mauger, AugHed
      nauger = VAL(AugHed.naug)
      REDIM x(0 TO 3 * nauger - 1)
      REDIM y(0 TO 3 * nauger - 1)
      ylow = 1.0E+30
      FOR j = 1 TO Nauger
         GET %iaug, , AugDat
         yx = VAL(AugDat.Freq)
         IF yx < ylow THEN ylow = yx
      NEXT i
      ylow = 10^INT(LOG10(ylow))
      GET %iaug, mauger, AugHed
      ii = -1
      FOR j = 1 TO Nauger
         GET %iaug, , AugDat
         INCR ii
         x(ii) = VAL(AugDat.E)
         y(ii) = ylow
         INCR ii
         x(ii) = x(ii - 1)
         y(ii) = VAL(AugDat.Freq)
         INCR ii
         x(ii) = x(ii - 1)
         y(ii) = ylow
      NEXT j
      Dp.MaxCurves = 3                    ' Must be >= number of curves we plot
      Dp.MaxPoints = 3 * nauger           ' Anything >= NP will do
      Dp.NumCurves = 1
      Dp.ScaleCode = %SCALE_LOGX_LOGY     ' %SCALE_LOGX_LOGY
      Dp.NP(0) = 3 * nauger
      Dp.Title1 = TRIM$(Nuke$) + " Detailed Auger-CK Electron Line Spectrum"
      Dp.XAxis = "Auger electron energy (eV)" & CHR$(0)
      Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
      IF ISFALSE MaxPlot THEN
         cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
         cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) & " Detailed Auger-CK Spectrum" & CHR$(34) & ")]"
      cmds = cmds & "[LineWidth(1,30)][ClearEditFlag()]"
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   END IF
'
'  neutrons
'
   Dp.Legend = STRING$(8080, " ")
   IF VAL(IndDat.mneu) > 0 THEN
      INCR iplots
      meutron = VAL(IndDat.mneu)
      GET %ineu, meutron, NeuHed
      neutron = VAL(NeuHed.npts)
      REDIM x(0 TO 2 * neutron - 1)
      REDIM y(0 TO 2 * neutron - 1)
      ii = -1
      FOR j = 1 TO neutron
         GET %ineu, , NeuDat
         x1 = VAL(NeuDat.E1)
         X2 = VAL(NeuDat.E2)
         INCR ii
         x(ii) = X1
         y(ii) = VAL(NeuDat.Yield)
         INCR ii
         x(ii) = X2
         y(ii) = y(ii-1)
      NEXT j
      Dp.MaxCurves = 2                 ' Must be >= number of curves we plot
      Dp.MaxPoints = 2 * neutron       ' Anything >= NP will do
      Dp.NumCurves = 1
      Dp.ScaleCode = %SCALE_LOGX_LOGY  ' %SCALE_LOGX_LOGY
      Dp.NP(0) = 2 * neutron
      Dp.LineType(0) =  %LINESTYLE_SOLID
      Dp.Title1 = TRIM$(Nuke$) + " Spontaneous Fission Neutron Spectrum"
      Dp.XAxis = "Neutron energy (MeV)" & CHR$(0)
      Dp.YAxis = "Yield per nuclear transformation" & CHR$(0)
      IF ISFALSE MaxPlot THEN
         cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
         cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) &" Spontaneous Fission Neutron Spectrum" & CHR$(34) & ")]"
      cmds = cmds & "[ClearEditFlag()]"
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
'     lethargy plot
      INCR iplots
      FOR j = 1 TO neutron
         x1 = x((j-1) * 2)
         X2 = x((j-1) * 2 + 1)
         y1 = y((j-1) * 2)/LOG(X2/X1)
'         if y1 > yhigh then yhigh = y1
         y((j-1) * 2) = y1
         y((j-1) * 2 + 1) = y1
      NEXT j
      Dp.MaxCurves = 2                 ' Must be >= number of curves we plot
      Dp.MaxPoints = 2 * neutron       ' Anything >= NP will do
      Dp.NumCurves = 1
      Dp.ScaleCode = %SCALE_LOGX_LOGY  ' %SCALE_LOGX_LOGY
      Dp.NP(0) = 2 * neutron
      Dp.LineType(0) =  %LINESTYLE_SOLID
      Dp.Title1 = TRIM$(Nuke$) + " Spontaneous Fission Neutron Lethargy Spectrum"
      Dp.XAxis = "Neutron energy (MeV)" & CHR$(0)
      Dp.YAxis = "Yield per unit lethargy per nuclear transformation" & CHR$(0)
      IF ISFALSE MaxPlot THEN
         cmds = "[WindowCascade()][AutoScale()][NumTicks(1,10,10)]"
      ELSE
         cmds = "[DocMaximize()][AutoScale()][NumTicks(1,10,10)]"
      END IF
      cmds = cmds & "[TextFont(2,16,700,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(4,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[TextFont(5,14,  0,0,0,0,0,""Arial"")]"
      cmds = cmds & "[Caption(" & CHR$(34) & " " & TRIM$(Nuke$) & _
                     " Spontaneous Fission Neutron Lethargy Spectrum" & CHR$(34) & ")]"
      cmds = cmds & "[ClearEditFlag()]"
      PRINT cmd$
      iret = DPlot_Plot(Dp, x(0), y(0), cmds)
      IF iret < 0 THEN GOTO PlotError
   END IF
   SLEEP 100
   IF iplots = 0 THEN
      CALL ShowMSG(1)
      iresponse = MsgBox("No plots were generated. ",_
                          TRIM$(Nuke$) + " decay data")
      EXIT SUB
   END IF
   CALL ShowMSG(1)
   EXIT SUB
 PlotError:
   INPUT FLUSH
   IF iret = -1 THEN
      iresponse = MsgBox("Can not find DPlotJr. ", "")
   ELSEIF iret = -2 THEN
      iresponse = MsgBox("Can not establish DDE connection. ", "")
   ELSEIF iret = -3 THEN
      iresponse = MsgBox("Data format error. ", "")
   ELSEIF iret = -4 THEN
      iresponse = MsgBox("Incorrect DPlotJr Ver. number specified. ","")
   END IF
   IF iresponse = %IDYES THEN                ' try again
      EXIT SUB
   ELSE                                      ' just quit
      EXIT SUB
   END IF
 END SUB

'----------------------------------------------------------------------------------------
 SUB TableGen
'----------------------------------------------------------------------------------------
'  Routine to create tables under F4 key
'
   LOCAL zText AS ASCIIZ * %MAX_PATH
   LOCAL hInst AS DWORD, lRes AS DWORD, lRes2 AS DWORD, lRes3 AS DWORD
   DIM ListTab$(1 TO 17)
   DATA Atomic Number(Z)                   , Physical Half-life                  , Total Emitted Energy
   DATA Decay by Alpha Emission            , Decay by Beta- Emission             , Decay by Beta+ Emission
   DATA Decay by Isomeric Transition       , Decay by Spontaneous Fission        , Detailed Auger-CK Spectra
   DATA Principal Alpha Emission           , Principal Beta Transition           , Principal Photon Emission
   DATA Air Kerma Constant & Coefficient   , Beta/Electron Skin Dose Coefficient , Serial Decay Chains
   DATA Dimensions of ICRP-07 Collection   , Check Integrity of Installed Files
   FOR i = 1 TO 17
      ListTab$(i) = READ$(i)
   NEXT i
   GET %indx, 1, IndHed
   i1 = CINT(VAL(IndHed.i1))
   i2 = CINT(VAL(IndHed.i2))
   ipos = 1
'
   DO
      GfxWindow %GFX_FREEZE                      ' freeze graphic
      REDIM NucLst(i2 - i1 + 1) AS STRING
      REDIM Izsort(i2 - i1 + 1), Rsort(i2 - i1 + 1)
      INPUT FLUSH
      list$ = ConsoleListBox(3, %CONSOLE_CENTER, 0, _
              "Tabulate by:", "ICRP-07 Collection", _
              ListTab$(), ipos, %RETURN_INDEX, 0)
      IF LEN(list$) = 0 THEN EXIT SUB
      GfxWindow %GFX_UNFREEZE
      CALL ShowMSG(0)
      zText = $OutDir + "NucList-" + TRIM$(list$) + ".TXT"
      ipos = VAL(list$)
'
      SELECT CASE ipos
'
         CASE 1                                       ' by Atomic Number
            n = 0
            DIM Nl10(100), Ng10(100)
            OPEN zText FOR OUTPUT AS %iout
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               Nukex$ = TRIM$(IndDat.nuke)
               iz = INSTR($sym, LEFT$(Nukex$, 2))\2 + 1
               half = Timest(IndDat.T, IndDat.tu)      ' T1/2 in sec
               IF half < 600.0 THEN
                  INCR NL10(iz)
               ELSE
                  INCR ng10(iz)
               END IF
               ir = VAL(IndDat.mdec)
               ng = VAL(IndDat.np10) + VAL(IndDat.npg10)
               nb = VAL(IndDat.nbet)
               ne = VAL(IndDat.Nel)
               na = VAL(IndDat.nalpha)
               Ep = 0.0#
               IF ng > 0 THEN
                   FOR i = 1 TO ng
                       GET %irad, ir + i, DecDat
                       Ep = Ep + VAL(DecDat.Freq) * VAL(DecDat.E)
                   NEXT i
               END IF
               Ee = 0.0#
               IF nb > 0 THEN
                   FOR i = 1 TO nb
                       GET %irad, ir + ng + i, DecDat
                       Ee = Ee + VAL(DecDat.Freq) * VAL(DecDat.E)
                   NEXT i
               END IF
               IF ne > 0 THEN
                   FOR i = 1 TO ne
                       GET %irad, ir + ng + nb + i, DecDat
                       Ee = Ee + VAL(DecDat.Freq) * VAL(DecDat.E)
                   NEXT i
               END IF
               Ea = 0.0#
               IF na > 0 THEN
                   FOR i = 1 TO 2 * na
                       GET %irad, ir + ng + nb + ne + i, DecDat
                       Ea = Ea + VAL(DecDat.Freq) * VAL(DecDat.E)
                   NEXT i
               END IF
               Et = Ep + Eb + Ee + Ea
               IF INSTR(IndDat.mode, "SF") > 0 THEN
                   GET %irad, ir + ng + nb + ne + 2*na + 1, DecDat
                   Et = Et + VAL(DecDat.Freq) * VAL(DecDat.E)
                   GET %irad, , DecDat
                   Et = Et + VAL(DecDat.Freq) * VAL(DecDat.E)
               END IF
               INCR n
               NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode + "  "
               IF Ea = 0.0# THEN
                   NucLst(n) = NucLst(n) + "    -   "
               ELSEIF Ea < 1.0E-04 THEN
                   NucLst(n) = NucLst(n) + "  < E-04"
               ELSE
                   NucLst(n) = NucLst(n) + USING$(" ##.####", Ea)
               END IF
               IF Ee = 0.0# THEN
                   NucLst(n) = NucLst(n) + "    -   "
               ELSEIF Ee < 1.0E-04 THEN
                   NucLst(n) = NucLst(n) + "  < E-04"
               ELSE
                   NucLst(n) = NucLst(n) + USING$(" ##.####", Ee)
               END IF
               IF Ep = 0.0# THEN
                   NucLst(n) = NucLst(n) + "    -   "
               ELSEIF Ep < 1.0E-04 THEN
                   NucLst(n) = NucLst(n) + "  < E-04"
               ELSE
                   NucLst(n) = NucLst(n) + USING$(" ##.####", Ep)
               END IF
               IF Et = 0.0# THEN
                   NucLst(n) = NucLst(n) + "    -   "
               ELSEIF Et < 1.0E-04 THEN
                   NucLst(n) = NucLst(n) + "  < E-04"
               ELSE
                   NucLst(n) = NucLst(n) + USING$(" ###.####", Et)
                   IF INSTR(IndDat.mode, "SF") > 0 THEN NucLst(n) = NucLst(n) + "*"
               END IF
               IZsort(n) = IzMass(Nukex$)
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            izold = 0
            PRINT #%iout, " Nuclides of the ICRP-07 Collection Ordered by Atomic Number"
            PRINT #%iout, ""
            PRINT #%iout, "                                     Decay       ------- Energy (MeV/nt) --------"
            PRINT #%iout, "   Z Element     Nuclide     T1/2    Mode         Alpha   Beta    Photon   Total "
            PRINT #%iout, "  " + STRING$(79, "-")
            nelement = 0
            FOR i = 1 TO n
               iz = INSTR($sym, LEFT$(NucLst(i),2))\2 + 1
               IF iz <> izold THEN
                  PRINT #%iout, USING$("#### ", iz);
                  PRINT #%iout, ElName(iz) + STRING$(14 - LEN(ElName(iz)), " ");
                  INCR nelement
                  izold = iz
               ELSE
                  PRINT #%iout, STRING$(19, " ");
               END IF
               PRINT #%iout, NucLst(i)
               Nukex$ = LEFT$(NucLst(i), 7)
               iptr = ibinry(Nukex$)
               GET %indx, iptr, IndDat
               IF IndDat.dau1 <> STRING$(8, " ") THEN
                  PRINT #%iout, STRING$(28, " ");
                  IF VAL(IndDat.idau1) = 0 THEN
                     PRINT #%iout, TRIM$(IndDat.dau1) + CHR$(36) + STRING$(7-LEN(TRIM$(IndDat.dau1)), " ");
                  ELSE
                     PRINT #%iout, IndDat.dau1;
                  END IF
                  IF IndDat.bf1 = " 1.0000E+00" THEN
                     PRINT #%iout, " 1.00"
                  ELSE
                     PRINT #%iout, RTRIM$(IndDat.bf1)
                  END IF
                  IF IndDat.dau2 <> STRING$(8, " ") THEN
                     PRINT #%iout, STRING$(28, " ");
                     IF VAL(IndDat.idau2) = 0 THEN
                        PRINT #%iout, TRIM$(IndDat.dau2) + CHR$(36) + STRING$(7-LEN(TRIM$(IndDat.dau2)), " ");
                     ELSE
                        PRINT #%iout, IndDat.dau2;
                     END IF
                     PRINT #%iout, RTRIM$(IndDat.bf2)
                     IF IndDat.dau3 <> STRING$(8, " ") THEN
                        PRINT #%iout, STRING$(28, " ");
                        IF VAL(IndDat.idau3) = 0 THEN
                           PRINT #%iout, TRIM$(IndDat.dau3) + CHR$(36) + STRING$(7-LEN(TRIM$(IndDat.dau3)), " ");
                        ELSE
                           PRINT #%iout, IndDat.dau3;
                        END IF
                        PRINT #%iout, RTRIM$(IndDat.bf3)
                        IF IndDat.dau4 <> STRING$(8, " ") THEN
                           PRINT #%iout, STRING$(28, " ");
                           IF VAL(IndDat.idau4) = 0 THEN
                              PRINT #%iout, TRIM$(IndDat.dau4) + CHR$(36) + STRING$(7-LEN(TRIM$(IndDat.dau4)), " ");
                           ELSE
                              PRINT #%iout, IndDat.dau4;
                           END IF
                           PRINT #%iout, RTRIM$(IndDat.bf4)
                        END IF
                     END IF
                  END IF
               END IF
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout,"*Includes energy of fission fragments and neutrons."
            PRINT #%iout, CHR$(36) + "Denotes stable nucleus."
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides of ";
            PRINT #%iout, TRIM$(USING$("#####", nelement));
            PRINT #%iout, " elements."
'            FOR i = 1 TO 100
'               PRINT #%iout, USING$(" ### ### ####", i, nl10(i), Ng10(i))
'            NEXT i
            CLOSE %iout
'
         CASE 2                                       ' by increasing T1/2
            OPEN zText FOR OUTPUT AS %iout
            nlt10 = 0 : ngt10 = 0 : n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               Nukex$ = TRIM$(IndDat.nuke)
               INCR n
               Et = VAL(IndDat.ea) + VAL(IndDat.eb) + VAL(IndDat.eg)
               IF INSTR(IndDat.mode, "SF") > 0 THEN
                   ir = VAL(IndDat.mdec) + VAL(IndDat.np10) + VAL(IndDat.npg10) + _
                        VAL(IndDat.nbet) + VAL(IndDat.Nel) + 2 * VAL(IndDat.nalpha)
                   GET %irad, ir + 1, DecDat
                   Et = Et + VAL(DecDat.Freq) * VAL(DecDat.E)
                   GET %irad, , DecDat
                   Et = Et + VAL(DecDat.Freq) * VAL(DecDat.E)
               END IF
               NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode+ " "
               a$ = IndDat.ea
               NucLst(n) = NucLst(n) + TableEntry(a$)
               a$ = IndDat.eb
               NucLst(n) = NucLst(n) + TableEntry(a$)
               a$ = IndDat.eg
               NucLst(n) = NucLst(n) + TableEntry(a$)
               NucLst(n) = NucLst(n) + USING$("##.####", Et)
               IF INSTR(IndDat.mode, "SF") > 0 THEN NucLst(n) = NucLst(n) + "*"
               half = Timest(IndDat.T, IndDat.tu)      ' T1/2 in sec
               IF half < 600.0 THEN
                  INCR nlt10
               ELSE
                  INCR ngt10
               END IF
               Rsort(irec - i1 + 1) = half
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE Rsort(n)
            ARRAY SORT Rsort(), TAGARRAY NucLst()
            PRINT #%iout," Nuclides of the ICRP-07 Collection Ordered by Half-Life"
            PRINT #%iout, ""
            PRINT #%iout, "                    Decay       ------ Energy (MeV/nt) ------"
            PRINT #%iout, "  Nuclide    T1/2   Mode        Alpha   Beta   Photon   Total"
            PRINT #%iout, "  " + STRING$(59, "-")
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout, " " + STRING$(15, "-")
            PRINT #%iout, "*Includes energy of fission fragments and neutrons."
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", ngt10));
            PRINT #%iout, " radionuclides with T1/2 => 10 min and ";
            PRINT #%iout, TRIM$(USING$("#####", nlt10));
            PRINT #%iout, " with T1/2 < 10 min."
            CLOSE %iout
'
         CASE 3                                       ' by total emitted energy
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               Nukex$ = TRIM$(IndDat.nuke)
               INCR n
               NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode
               Rsort(n) = VAL(IndDat.ea) + VAL(IndDat.eb) + VAL(IndDat.eg)
               IF INSTR(IndDat.mode, "SF") > 0 THEN
                   ir = VAL(IndDat.mdec) + VAL(IndDat.np10) + VAL(IndDat.npg10) + _
                        VAL(IndDat.nbet) + VAL(IndDat.Nel) + 2 * VAL(IndDat.nalpha)
                   GET %irad, ir + 1, DecDat
                   Rsort(n) = Rsort(n) + VAL(DecDat.Freq) * VAL(DecDat.E)
                   GET %irad, , DecDat
                   Rsort(n) = Rsort(n) + VAL(DecDat.Freq) * VAL(DecDat.E)
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE Rsort(n)
            ARRAY SORT Rsort(), TAGARRAY NucLst()
            PRINT #%iout," Nuclides of the ICRP-07 Collection Ordered by Emitted Energy"
            PRINT #%iout, ""
            PRINT #%iout, "                    Decay      Energy"
            PRINT #%iout, "  Nuclide   T(1/2)  Mode      (Mev/nt)"
            PRINT #%iout, "  " + STRING$(36, "-")
            FOR i = 1 TO n
               IF INSTR(NucLst(i), "SF") > 0 THEN
                   PRINT #%iout, "  " + NucLst(i) + USING$("###.#####*", Rsort(i))
               ELSE
                   PRINT #%iout, "  " + NucLst(i) + USING$("###.#####", Rsort(i))
               END IF
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "*Includes energy of fission fragments and neutrons."
            CLOSE %iout
'
         CASE 4                                       ' alpha emitters
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF INSTR(IndDat.mode, "A") <> 0 THEN
                  Nukex$ = TRIM$(IndDat.nuke)
                  INCR n
                  na = VAL(IndDat.nalpha)
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + _
                              IndDat.mode + USING$("###", na) + "  "
                  IF VAL(IndDat.ea) = 0.0 THEN
                      NucLst(n) = NucLst(n) + " < E-04"
                  ELSE
                      NucLst(n) = NucLst(n) + IndDat.ea
                  END IF
                  IZsort(n) = izMass(Nukex$)
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            PRINT #%iout, " Nuclides of the ICRP-07 Collection Decaying by Alpha Eimission"
            PRINT #%iout, ""
            PRINT #%iout, "                    Decay          Energy"
            PRINT #%iout, "  Nuclide   T1/2    Mode     #/nt (MeV/nt)"
            PRINT #%iout, "  " + STRING$(40, "-")
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides that decay by alpha emission."
            CLOSE %iout
'
         CASE 5                                       ' Decay by Beta- Emission
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF INSTR(IndDat.mode, "B-") <> 0 THEN
                  INCR n
                  Nukex$ = IndDat.nuke
                  IZsort(n) = IzMass(Nukex$)
                  ngamma = VAL(IndDat.np10) + VAL(IndDat.npg10)
                  nbetrec = VAL(IndDat.nbet)
                  ndec = VAL(IndDat.mdec)
                  i = 0
                  Ebar = 0.0#
                  Yield = 0.0#
                  iplus = %false
                  DO
                     INCR i
                     GET %irad, ndec + ngamma + i, DecDat
                     IF DecDat.jcode = " B-" THEN
                        Ebar = Ebar + VAL(DecDat.Freq) * VAL(DecDat.E)
                        Yield = Yield + VAL(DecDat.Freq)
                     ELSEIF DecDat.jcode = " B+" THEN
                        iplus = %true
                     END IF
                  LOOP WHILE i < nbetrec
                  Ebar = Ebar/Yield
                  mbeta = VAL(IndDat.mbet)
                  GET %ibet, mbeta, BetHed
                  Ne = VAL(BetHed.nbet)
                  GET %ibet, mbeta + Ne, BetSpec
                  Emax = VAL(BetSpec.Eelc)
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode + _
                              USING$("##.###^^^^", Yield) + _
                              USING$("##.#####", Ebar) + _
                              USING$("##.#####", Emax)
                  IF ISTRUE iplus THEN
                     NucLst(n) = NucLst(n) + "*"
                  END IF
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            PRINT #%iout, " Nuclides of the ICRP-07 Collection Decaying by Beta Minus Emission"
            PRINT #%iout, ""
            PRINT #%iout, "                                         --- Energy ---"
            PRINT #%iout, "                     Decay      Yield    Mean  End Point"
            PRINT #%iout, "  Nuclide    T1/2    Mode       (/nt)    (MeV)   (MeV)"
            PRINT #%iout, "  " + STRING$(54, "-")
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides that decay by beta minus emission."
            PRINT #%iout, "* Endpoint energy of composite beta minus and beta plus spectrum."
            CLOSE %iout
'
         CASE 6                                       ' Decay by Beta+ Emission
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF INSTR(IndDat.mode, "B+") <> 0 THEN
                  Nukex$ = IndDat.nuke
                  INCR n
                  IZsort(n) = IzMass(Nukex$)
                  ngamma = VAL(IndDat.np10) + VAL(IndDat.npg10)
                  nbetrec = VAL(IndDat.nbet)
                  ndec = VAL(IndDat.mdec)
                  i = 0
                  Ebar = 0.0#
                  Yield = 0.0#
                  iminus = %false
                  DO
                     INCR i
                     GET %irad, ndec + ngamma + i, DecDat
                     IF DecDat.jcode = " B+" THEN
                        Ebar = Ebar + VAL(DecDat.Freq) * VAL(DecDat.E)
                        Yield = Yield + VAL(DecDat.Freq)
                     ELSEIF DecDat.jcode = " B-" THEN
                        iminus = %true
                     END IF
                  LOOP WHILE i < nbetrec
                  Ebar = Ebar/Yield
                  mbeta = VAL(IndDat.mbet)
                  GET %ibet, mbeta, BetHed
                  Ne = VAL(BetHed.nbet)
                  GET %ibet, mbeta + Ne, BetSpec
                  Emax = VAL(BetSpec.Eelc)
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode + _
                              USING$("##.###^^^^", Yield) + _
                              USING$("##.#####", Ebar) + _
                              USING$("##.#####", Emax)
                  IF ISTRUE iminus THEN
                     NucLst(n) = NucLst(n) + "*"
                  END IF
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            PRINT #%iout, " Nuclides of the MIRD-07 Collection Decaying by Beta Plus Decay"
            PRINT #%iout, ""
            PRINT #%iout, "                                         --- Energy ---"
            PRINT #%iout, "                     Decay      Yield    Mean  End Point"
            PRINT #%iout, "  Nuclide    T1/2    Mode       (/nt)    (MeV)   (MeV)"
            PRINT #%iout, "  " + STRING$(54, "-")
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides that decay by beta plus emission."
            PRINT #%iout, "* Endpoint energy of composite beta minus and beta plus spectrum."
            CLOSE %iout
'
         CASE 7                                       ' Decay by Internal Transition
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF INSTR(IndDat.mode, "IT") <> 0 THEN
                  Nukex$ = IndDat.nuke
                  INCR n
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode
                  IZsort(n) = IzMass(Nukex$)
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            PRINT #%iout, " Nuclides of the ICRP-07 Collection Decaying by Isomeric Transition"
            PRINT #%iout, ""
            PRINT #%iout, "  Nuclide    T1/2    Decay Mode"
            PRINT #%iout, "  " + STRING$(29, "-")
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides that decay by isomeric transition."
            CLOSE %iout
'
         CASE 8                                           ' Spontaneous fission
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF INSTR(IndDat.mode, "SF") <> 0 THEN
                  Nukex$ = IndDat.nuke
                  IF TRIM$(IndDat.Dau1) = "SF" THEN
                     BF$ = IndDat.bf1
                  ELSEIF TRIM$(IndDat.Dau2) = "SF" THEN
                     BF$ = IndDat.bf2
                  ELSEIF TRIM$(IndDat.Dau3) = "SF" THEN
                     BF$ = IndDat.bf3
                  ELSEIF TRIM$(IndDat.Dau4) = "SF" THEN
                     BF$ = IndDat.bf4
                  ELSE
                     BF$ = "1"
                  END IF
                  jdec = VAL(IndDat.mdec)
                  GET %irad, jdec, DecHed
                  ndecay = VAL(DecHed.ndec)              ' number of radiations
                  EPromptGamma = 0.0
                  EDelayedGamma = 0.0
                  FOR i = 1 TO ndecay
                     GET %irad, , DecDat                 ' records begining at IndDat.mdec
                     ic = VAL(DecDat.icode)
                     Freq = VAL(DecDat.Freq)
                     Enr = VAL(DecDat.E)
                     IF ic = 1 AND DecDat.jcode = " PG" THEN
                         EPromptGamma = EpromptGamma + Freq * Enr
                     ELSEIF ic = 1 AND DecDat.jcode = " DG" THEN
                         EDelayedGamma = EDelayedGamma + Freq * Enr
                     ELSEIF ic = 5 AND DecDat.jcode = " DB" THEN
                         EDelayedBeta = Freq * Enr
                     ELSEIF ic = 10 THEN
                         EFissFrag = Freq * Enr
                     ELSEIF ic = 11 THEN
                         EFissNeut = Freq * Enr
                     END IF
                  NEXT i
                  ioffset = VAL(IndDat.np10) + VAL(IndDat.npg10) + VAL(IndDat.nbet) + _
                            VAL(IndDat.nel) + 2 * VAL(IndDat.nalpha) + 2
                  GET %irad, VAL(IndDat.mdec) + ioffset, DecDat
                  BF = VAL(Bf$)
                  znu = VAL(DecDat.Freq)/BF                            ' # neutrons/fission
                  INCR n
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode + _
                            BF$ + USING$(" ##.###", znu) + _
                            USING$("   ##.## ", EFissNeut/BF) + USING$("   ###.##", EFissFrag/BF) + _
                            USING$("   ##.##", EPromptGamma/BF) + USING$("   ##.##", EDelayedGamma/BF) + _
                            USING$("   ##.##", EDelayedBeta/BF)
                  IZsort(n) = IzMass(Nukex$)
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            PRINT #%iout, " Nuclides of the ICRP-07 Collection Decaying by Spontaneous Fission"
            PRINT #%iout, ""
            PRINT #%iout, "                     Decay               Neutron/ -------- Energy (MeV)/Fission ---------"
            PRINT #%iout, "  Nuclide    T1/2    Mode     Fission/nt Fission  Neutron Fragment  Prompt* Delay*  Beta**"
            PRINT #%iout, "  " + STRING$(87, "-")
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "*Prompt and delayed gamma emission."
            PRINT #%iout, "**Delayed beta emission."
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides that decay by spontaneous fission."
            CLOSE %iout
'
         CASE 9                                       ' Detailed Auger-CK Spectra
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF VAL(IndDat.mack) > 0 THEN
                  INCR n
                  Nukex$ = TRIM$(IndDat.nuke)
                  GET %iaug, VAL(IndDat.mack), AugHed
                  IF INSTR(AugHed, Nukex$) = 0 THEN
                     PRINT #%iout, "Problem: target "; Nukex$; " found "; AugHed
                  END IF
                  na = VAL(AugHed.naug)
                  x = 0.0 : y = 0.0
                  FOR i = 1 TO na
                     GET %iaug, , AugDat
                     x = x + VAL(AugDat.Freq)
                     y = y + 1.0E-06 * VAL(AugDat.E) * VAL(AugDat.Freq)
                  NEXT i
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + _
                              IndDat.mode + AugHed.naug + "  " +_
                              USING$("##.#####", x) + _
                              USING$("###.####", y)
                  IZsort(n) = IzMass(Nukex$)
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            PRINT #%iout, " Nuclides of the ICRP-07 Collection with Detailed Auger-CK Spectra"
            PRINT #%iout, ""
            PRINT #%iout, "                     Decay  Spectrum  Yield   Energy"
            PRINT #%iout, "  Nuclide    T1/2    Mode       N     (/nt)  (MeV/nt)"
            PRINT #%iout, "  " + STRING$(51, "-")
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides with detailed Auger-CK spectra."
            CLOSE %iout
'
         CASE 10                                       ' Principal Alpha Emission
            OPEN zText FOR OUTPUT AS %iout
            PRINT #%iout, "Nuclides of the ICRP-07 Collection Order by Energy of Principal Alpha Transition"
            PRINT #%iout, ""
            PRINT #%iout, "  Nuclide   T1/2    Decay Mode  E(MeV)  Yield(/nt)"
            PRINT #%iout, "  " + STRING$(48, "-")
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF VAL(IndDat.nalpha) <> 0 THEN
                  na = VAL(IndDat.nalpha)
                  INCR n
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode
                  irecord = VAL(IndDat.mdec) + VAL(IndDat.np10) + VAL(IndDat.npg10) + _
                            VAL(IndDat.nbet) + VAL(IndDat.nel)
                  prime = 0#
                  FOR i = 1 TO na
                     GET %irad, irecord + i, DecDat
                     IF VAL(DecDat.freq) > prime THEN
                        prime = VAL(DecDat.freq)
                        irechold = irecord + i
                     END IF
                  NEXT i
                  GET %irad, irechold, DecDat
                  Rsort(n) = VAL(DecDat.E)
                  NucLst(n) = NucLst(n) + USING$("###.#####", VAL(DecDat.E)) + DecDat.Freq
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE Rsort(n)
            ARRAY SORT Rsort(), TAGARRAY NucLst()
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "Energy is that of the alpha particle."
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides that decay by alpha emission."
            CLOSE %iout
'
         CASE 11                                      ' Beta Transition
            OPEN zText FOR OUTPUT AS %iout
            PRINT #%iout, "Nuclides of the ICRP Collection Order by Average Energy of Principal Beta Transition"
            PRINT #%iout, ""
            PRINT #%iout, "                     Decay     Energy   Yield"
            PRINT #%iout, "  Nuclide    T1/2    Mode       (MeV)   (/nt)"
            PRINT #%iout, "  " + STRING$(44, "-")
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF VAL(IndDat.nbet) <> 0 THEN
                  na = VAL(IndDat.nbet)
                  INCR n
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode
                  irecord = VAL(IndDat.mdec) + VAL(IndDat.np10) + VAL(IndDat.npg10)
                  prime = 0#
                  FOR i = 1 TO na
                     GET %irad, irecord + i, DecDat
                     IF VAL(DecDat.freq) > prime THEN
                        prime = VAL(DecDat.freq)
                        irechold = irecord + i
                     END IF
                  NEXT i
                  GET %irad, irechold, DecDat
                  Rsort(n) = VAL(DecDat.E)
                  NucLst(n) = NucLst(n) + USING$(" ##.####", VAL(DecDat.E)) + USING$(" ##.#####", VAL(DecDat.Freq))
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE Rsort(n)
            ARRAY SORT Rsort(), TAGARRAY NucLst()
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides that decay by beta emission."
            CLOSE %iout
'
         CASE 12                                      ' Principal Photon Transition
            OPEN zText FOR OUTPUT AS %iout
            PRINT #%iout, "Nuclides of the ICRP-07 Collection Order by Energy of Principal Photon"
            PRINT #%iout, ""
            PRINT #%iout, "                   Decay      Energy  Yield"
            PRINT #%iout, "  Nuclide    T1/2  Mode       E(MeV)  (/nt)"
            PRINT #%iout, "  " + STRING$(42, "-")
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF VAL(IndDat.npg10) > 0 THEN
                  na = VAL(IndDat.npg10)
                  INCR n
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode
                  irecord = VAL(IndDat.mdec) + VAL(IndDat.np10)
                  prime = 0#
                  FOR i = 1 TO na
                     GET %irad, irecord + i, DecDat
                     IF VAL(DecDat.freq) > prime THEN
                        prime = VAL(DecDat.freq)
                        irechold = irecord + i
                     END IF
                  NEXT i
                  GET %irad, irechold, DecDat
                  Rsort(n) = VAL(DecDat.E)
                  NucLst(n) = NucLst(n) + USING$("##.####", VAL(DecDat.E)) + _
                              USING$(" ##.####", VAL(DecDat.Freq))
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE Rsort(n)
            ARRAY SORT Rsort(), TAGARRAY NucLst()
            FOR i = 1 TO n
               PRINT #%iout, "  " + NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "Restricted to photon of energy greater than 10 keV."
            PRINT #%iout, "ICRP-07 collection contains ";
            PRINT #%iout, TRIM$(USING$("#####", n));
            PRINT #%iout, " radionuclides with photon emission."
            CLOSE %iout
'
         CASE 13                                      ' Air Kerma-Rate Coefficient
            OPEN zText FOR OUTPUT AS %iout
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               INCR n
               Nukex$ = TRIM$(IndDat.nuke)
               NucLst(n) = IndDat.nuke + " " + IndDat.t + " " + IndDat.tu + " " + IndDat.mode
               IF VAL(IndDat.Kair) = 0 THEN
                   NucLst(n) = NucLst(n) + "     -      "
               ELSE
                   NucLst(n) = NucLst(n) + " " + IndDat.Kair + " "
               END IF
               IF VAL(IndDat.Kpts) = 0 THEN
                   NucLst(n) = NucLst(n) + "     -"
               ELSE
                   NucLst(n) = NucLst(n) + " " + IndDat.Kpts
               END IF
               IZsort(n) = IzMass(Nukex$)
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE Rsort(n)
            ARRAY SORT Izsort(), TAGARRAY NucLst()
            PRINT #%iout, " Air Kerma-Rate Constant and Point Source Air Kerma Coefficient"
            PRINT #%iout, ""

            PRINT #%iout, "                       Decay    Air Kerma Gy m^2/(Bq s)"
            PRINT #%iout, "  Nuclide      T1/2    Mode      Constant  Coefficient"
            PRINT #%iout, "  " + STRING$(53, "-")
            FOR i = 1 TO n
               PRINT #%iout, "    "; NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            CLOSE %iout
'
         CASE 14                                      ' Beta/Electron Skin Dose
            OPEN zText FOR OUTPUT AS %iout
            PRINT #%iout, "   Absorbed Dose Rate to Skin for Beta/Electrons Emitter on Surface"
            PRINT #%iout, "      Dskin - Skin Dose Rate Coefficient (Gy/s per Bq/cm2)"
            PRINT #%iout, ""
            PRINT #%iout, "                                     Decay       Dskin     Emax*"
            PRINT #%iout, "   Z Element     Nuclide    T1/2     Mode        (Gy/s)    (MeV)"
            PRINT #%iout, " " + STRING$(64, "-")
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF VAL(IndDat.nel) + VAL(IndDat.nbet) > 0 THEN
                  Nukex$ = TRIM$(IndDat.nuke)
                  Dx = SkinDose(Emax)
                  INCR n
                  NucLst(n) = IndDat.nuke + IndDat.t + " " + IndDat.tu + " " + IndDat.mode + " " + _
                              USING$("##.##^^^^", Dx) + USING$("###.#####", Emax)
                              IF Emax > 5 THEN
                                  NucLst(n) = NucLst(n) + "$"
                              END IF
                  IZsort(n) = IzMass(Nukex$)
               END IF
            NEXT irec
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            izold = 0
            FOR i = 1 TO n
               iz = INSTR($sym, LEFT$(NucLst(i),2))\2 + 1
               IF iz <> izold THEN
                  PRINT #%iout, USING$("#### ", iz);
                  PRINT #%iout, ElName(iz) + STRING$(14 - LEN(ElName(iz)), " ");
                  INCR nelement
                  izold = iz
               ELSE
                  PRINT #%iout, STRING$(19, " ");
               END IF
               PRINT #%iout, NucLst(i)
            NEXT i
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, "*Maximum energy of IC electrons or end point energy of beta spectra."
            PRINT #%iout, "$Extrapolation of data beyond 5.0 MeV."
            PRINT #%iout, "Based on Table 3 (with air reflection, 5-10 mg/cm2) of R.E. Faw,"
            PRINT #%iout, "Health Phys. 63(4):443-448, 1992."
            CLOSE %iout

         CASE 15                                      ' Serial Decay Chains
            n = 0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               IF VAL(IndDat.iDau1) > 0 THEN
                  Nukex$ = TRIM$(IndDat.nuke)
                  INCR n
                  NucLst(n) = Nukex$
                  IZsort(n) = IzMass(Nukex$)
               END IF
            NEXT i
            REDIM PRESERVE NucLst(n) AS STRING
            REDIM PRESERVE IZsort(n)
            ARRAY SORT IZsort(), TAGARRAY NucLst()
            OPEN zText FOR OUTPUT AS %iout
            PRINT #%iout, "Decay Chains of the ICRP-07 Collection"
            PRINT #%iout, ""
            FOR i = 1 TO n
               Nukex$ = NucLst(i)
               PRINT #%iout, Nukex$
               CALL chain(nukex$, 2)
               PRINT #%iout, " "
            NEXT irec
            PRINT #%iout," " + STRING$(15, "-")
            PRINT #%iout, " " + CHR$(36) + " stable nucleus."
            CLOSE %iout
'
         CASE 16                                      ' Dimensions of Database
            OPEN zText FOR OUTPUT AS %iout
            PRINT #%iout, "Dimensions of the ICRP-07 Collection"
            PRINT #%iout, ""
            MaxRads = 0
            MaxBetas = 0
            MaxElectrons = 0
            MaxPhotons = 0
            MaxPhotons1 = 0
            MaxPhotons2 = 0
            MaxAlphas = 0
            MaxBetaGrid = 0
            MaxAugerGrid = 0
            MaxNeutronGrid = 0
            MaxChainLength = 0
            MaxIsotopes = 0
            Nisotope = 1
            NukeCover$ = ""
            NumElements = 0
            EalphaLow = 1.0E+30
            EalphaHigh = 0.0
            EalphaRecoilLow = 1.0E+30
            EalphaRecoilHigh = 0.0
            EphotonLow = 1.E+30
            EphotonHigh = 0.0
            EelectronLow = 1.0E+30
            EelectronHigh = 0.0
            EbetaLow = 1.0E+30
            EbetaHigh = 0.0
            EaveBetaLow = 1.0E+30
            EaveBetaHigh = 0.0
            EaugerLow = 1.0E+30
            EaugerHigh = 0.0
            EneutronLow = 1.0E+30
            EneutronHigh = 0.0
            EaveNeutronLow = 1.0E+30
            EaveNeutronHigh = 0.0
            EaveFissFragLow = 1.0E+30
            EaveFissFragHigh = 0.0
            FOR irec = i1 TO i2
               GET %indx, irec, IndDat
               Nukex$ = IndDat.Nuke
               Chx$ = LEFT$(Nukex$, 2)
               IF Chx$ = NukeCover$ THEN
                  INCR Nisotope
               ELSE
                  INCR NumElements
                  IF Nisotope > MaxIsotopes THEN
                     MaxIsotopes = Nisotope
                     MaxElement$ = NukeCover$
                  END IF
                  NukeCover$ = Chx$
                  Nisotope = 1
               END IF
               ipt = VAL(IndDat.mdec)
               GET %irad, ipt, DecHed
               n = VAL(DecHed.ndec)
               IF n > MaxRads THEN
                  MaxRads = n
                  MaxRadsNuke$ = Nukex$
               END IF
               n = VAL(IndDat.np10)
               IF n > MaxPhotons1 THEN
                  MaxPhotons1 = n
                  MaxPhotons1Nuke$ = Nukex$
               END IF
               IF n > 0 THEN
                  GET %irad, ipt+1, DecDat
                  IF VAL(DecDat.E) < EphotonLow THEN
                     EphotonLow = VAL(DecDat.E)
                     NukePhotonLow$ = Nukex$
                  END IF
                  GET %irad, ipt+n, DecDat
                  IF VAL(DecDat.E) > EphotonHigh THEN
                     EphotonHigh = VAL(DecDat.E)
                     NukePhotonHigh$ = Nukex$
                  END IF
               END IF
               n = VAL(IndDat.npg10)
               IF n > MaxPhotons2 THEN
                  MaxPhotons2 = n
                  MaxPhotons2Nuke$ = Nukex$
               END IF
               IF n > 0 THEN
                  GET %irad, ipt + VAL(IndDat.np10) + 1, DecDat
                  IF VAL(DecDat.E) < EphotonLow THEN
                     EphotonLow = VAL(DecDat.E)
                     NukePhotonLow$ = Nukex$
                  END IF
                  GET %irad, ipt + VAL(IndDat.np10) + n, DecDat
                  IF VAL(DecDat.E) > EphotonHigh THEN
                     EphotonHigh = VAL(DecDat.E)
                     NukePhotonHigh$ = Nukex$
                  END IF
               END IF
               n = VAL(IndDat.npg10) + VAL(IndDat.np10)
               IF n > MaxPhotons THEN
                  MaxPhotons = n
                  MaxPhotonsNuke$ = Nukex$
               END IF
               n = VAL(IndDat.nbet)
               IF n > MaxBetas THEN
                  MaxBetas = n
                  MaxBetasNuke$ = Nukex$
               END IF
               IF n > 0 THEN
                  GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10) + 1, DecDat
                  IF VAL(DecDat.E) < EaveBetaLow THEN
                     EaveBetaLow = VAL(DecDat.E)
                     NukeBetaAveLow$ = Nukex$
                  END IF
                  GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10) + n, DecDat
                  IF VAL(DecDat.E) > EaveBetaHigh THEN
                     EaveBetaHigh = VAL(DecDat.E)
                     NukeBetaAveHigh$ = Nukex$
                  END IF
               END IF

               n = VAL(IndDat.nel)
               IF n > MaxElectrons THEN
                  MaxElectrons = n
                  MaxElectronsNuke$ = Nukex$
               END IF
               IF n > 0 THEN
                  GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet) + 1, DecDat
                  IF VAL(DecDat.E) < EelectronLow THEN
                     EelectronLow = VAL(DecDat.E)
                     NukeElectronLow$ = Nukex$
                  END IF
                  GET %irad, ipt+ VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet) + n, DecDat
                  IF VAL(DecDat.E) > EelectronHigh THEN
                     EelectronHigh = VAL(DecDat.E)
                     NukeElectronHigh$ = Nukex$
                  END IF
               END IF
               n = VAL(IndDat.nalpha)
               IF n > MaxAlphas THEN
                  MaxAlphas = n
                  MaxAlphasNuke$ = Nukex$
               END IF
               IF n > 0 THEN
                  GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet) + _
                      VAL(IndDat.nel) + 1, DecDat
                  IF VAL(DecDat.E) < EalphaLow THEN
                     EalphaLow = VAL(DecDat.E)
                     NukeAlphaLow$ = Nukex$
                  END IF
                  GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet)+ _
                      VAL(IndDat.nel) + n, DecDat
                  IF VAL(DecDat.E) > EalphaHigh THEN
                     EalphaHigh = VAL(DecDat.E)
                     NukeAlphaHigh$ = Nukex$
                  END IF
                  GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet) + _
                      VAL(IndDat.nel) + VAL(IndDat.nalpha) + 1, DecDat
                  IF VAL(DecDat.E) < EalphaRecoilLow THEN
                     EalphaRecoilLow = VAL(DecDat.E)
                     NukeAlphaRecoilLow$ = Nukex$
                  END IF
                  GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet)+ _
                      VAL(IndDat.nel) +VAL(IndDat.nalpha) + n, DecDat
                  IF VAL(DecDat.E) > EalphaRecoilHigh THEN
                     EalphaRecoilHigh = VAL(DecDat.E)
                     NukeAlphaRecoilHigh$ = Nukex$
                  END IF
               END IF
'              Spontaneous Fission
               IF INSTR(IndDat.Mode, "SF") > 0 THEN
                   GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet) + _
                      VAL(IndDat.nel) + 2 * VAL(IndDat.nalpha) + 1, DecDat
                   IF VAL(DecDat.E) < EaveFissFragLow THEN
                       EaveFissFragLow = VAL(DecDat.E)
                       NukeFissFragLow$ = Nukex$
                   END IF
                   IF VAL(DecDat.E) > EaveFissFragHigh THEN
                       EaveFissFragHigh = VAL(DecDat.E)
                       NukeFissFragHigh$ = Nukex$
                   END IF
'
                   GET %irad, ipt + VAL(IndDat.np10) + VAL(IndDat.npg10)+ VAL(IndDat.nbet) + _
                      VAL(IndDat.nel) + 2 * VAL(IndDat.nalpha) + 2, DecDat
                   IF VAL(DecDat.E) < EaveNeutronLow THEN
                       EaveNeutronLow = VAL(DecDat.E)
                       NukeNeutronLow$ = Nukex$
                   END IF
                   IF VAL(DecDat.E) > EaveNeutronHigh THEN
                       EaveNeutronHigh = VAL(DecDat.E)
                       NukeNeutronHigh$ = Nukex$
                   END IF
               END IF
               ipt = VAL(IndDat.mbet)
               IF ipt > 0 THEN
                  GET %ibet, ipt, BetHed
                  n = VAL(BetHed.nbet)
                  IF n > MaxBetaGrid THEN
                     MaxBetaGrid = n
                     MaxBetaGridNuke$ = Nukex$
                  END IF
                  GET %ibet, ipt + n, BetSpec
                  IF VAL(BetSpec.Eelc) > EbetaHigh THEN
                     EbetaHigh = VAL(BetSpec.Eelc)
                     NukeBetaHigh$ = Nukex$
                  END IF
               END IF
               ipt = VAL(IndDat.mack)
               IF ipt > 0 THEN
                  GET %iaug, ipt, AugHed
                  n = VAL(AugHed.naug)
                  IF n > MaxAugerGrid THEN
                     MaxAugerGrid = n
                     MaxAugerGridNuke$ = Nukex$
                  END IF
               END IF
               ipt = VAL(IndDat.mneu)
               IF ipt > 0 THEN
                  GET %ineu, ipt, NeuHed
                  n = VAL(NeuHed.npts)
                  IF n > MaxNeutronGrid THEN
                     MaxNeutronGrid = n
                     MaxNeutronGridNuke$ = Nukex$
                  END IF
                  IF n > 0 THEN
                      GET %ineu, ipt + 1, NeuDat
                      IF VAL(NeuDat.E1) < EneutronLow THEN
                          EneutronLow = VAL(NeuDat.E1)
                          NukeNeutronLow$ = Nukex$
                      END IF
                      GET %ineu,ipt + n, NeuDat
                      IF VAL(NeuDat.E2) > EneutronHigh THEN
                          EneutronHigh = VAL(NeuDat.E2)
                          NukeNeutronHigh$ = Nukex$
                      END IF
                  END IF
               END IF
               IF INSTR(IndDat.Dau1, "-") > 0 THEN
                  CALL Chain(Nukex$, 1)
                  IF nspec > MaxChainLength THEN
                     MaxChainLength = nspec
                     MaxChainLengthNuke$ = Nukex$
                  END IF
               END IF
            NEXT irec
'           now look at ICRP-07.ACK File
            irec = 0
            DO
               INCR irec
               GET #%iaug, irec, AugHed
               Nukex$ = AugHed.Nuke
               n = VAL(AugHed.naug)
               IF n = 0 THEN EXIT LOOP
               irec = irec + 1
               GET #%iaug, irec, AugDat
               IF VAL(AugDat.e) < EaugerLow THEN
                  EaugerLow = VAL(AugDat.e)
                  NukeAugerLow$ = Nukex$
               END IF
               irec = irec + n - 1
               GET #%iaug, irec, AugDat
               IF VAL(AugDat.e) > EaugerHigh THEN
                  EaugerHigh = VAL(AugDat.e)
                  NukeAugerHigh$ = Nukex$
               END IF
            LOOP WHILE NOT EOF(%iaug)

            PRINT #%iout, " Radionuclides        -"; USING$("#####", i2-i1 + 1)
            PRINT #%iout, " Radiation records    -"; USING$("#####", MaxRads); " ("; TRIM$(MaxRadsNuke$);")"
            PRINT #%iout, " Beta transitions     -"; USING$("#####", MaxBetas); " ("; TRIM$(MaxBetasNuke$);")"
            PRINT #%iout, " Alpha transitions    -"; USING$("#####", MaxAlphas); " ("; TRIM$(MaxAlphasNuke$);")"
            PRINT #%iout, " Photons: E < 10 keV  -"; USING$("#####", MaxPhotons1); " ("; TRIM$(MaxPhotons1Nuke$);")"
            PRINT #%iout, " Photons: E > 10 keV  -"; USING$("#####", MaxPhotons2); " ("; TRIM$(MaxPhotons2Nuke$);")"
            PRINT #%iout, "               Total  -"; USING$("#####", MaxPhotons); " ("; TRIM$(MaxPhotonsNuke$);")"
            PRINT #%iout, " Discrete electrons   -"; USING$("#####", MaxElectrons); " ("; TRIM$(MaxElectronsNuke$);")"
            PRINT #%iout, " "
            PRINT #%iout, " Energy Range: Discrete Radiations"
            PRINT #%iout, "   Betas*             -"; USING$(" ##.#^^^^ to ##.#### MeV", EaveBetaLow, EaveBetaHigh) + _
                          " (" + TRIM$(NukeBetaAveLow$) + ", " + TRIM$(NukeBetaAveHigh$) +")"
            PRINT #%iout, "   Photons            -"; USING$(" ##.#^^^^ to ##.#### MeV", EphotonLow, EphotonHigh) + _
                          " (" + TRIM$(NukePhotonLow$) + ", " + TRIM$(NukePhotonHigh$) +")"
            PRINT #%iout, "   Electrons          -"; USING$(" ##.#^^^^ to ##.#### MeV", EelectronLow, EelectronHigh) + _
                          " (" + TRIM$(NukeElectronLow$) + ", " + TRIM$(NukeElectronHigh$) +")"
            PRINT #%iout, "   Alphas             -"; USING$(" ##.##### to ##.#### MeV", EalphaLow, EalphaHigh)+ _
                          " (" + TRIM$(NukeAlphaLow$) + ", " + TRIM$(NukeAlphaHigh$) +")"
            PRINT #%iout, "   Alpha recoils      -"; USING$(" ##.##### to ##.#### MeV", EalphaRecoilLow, EalphaRecoilHigh)+ _
                          " (" + TRIM$(NukeAlphaRecoilLow$) + ", " + TRIM$(NukeAlphaRecoilHigh$) +")"
            PRINT #%iout, "   Fission fragments$ -"; USING$(" ##.##### to ##.#### MeV", EaveFissFragLow, EaveFissFragHigh) + _
                          " (" + TRIM$(NukeFissFragLow$) + ", " + TRIM$(NukeFissFragHigh$) +")"
            PRINT #%iout, "   Fission neutrons$  -"; USING$(" ##.##### to ##.#### MeV", EaveNeutronLow, EaveNeutronHigh) + _
                          " (" + TRIM$(NukeNeutronLow$) + ", " + TRIM$(NukeNeutronHigh$) +")"
            PRINT #%iout, "   --------------------"
            PRINT #%iout, "   *Average energy of beta transitions"
            PRINT #%iout, "   $Average energy in spontaneous fission"
            PRINT #%iout, " "
            PRINT #%iout, " Spectral Dimensions"
            PRINT #%iout, "   Beta spectrum      -"; USING$("#####", MaxBetaGrid); " ("; TRIM$(MaxBetaGridNuke$);")"
            PRINT #%iout, "   Auger-CK spectrum  -"; USING$("#####", MaxAugerGrid); " ("; TRIM$(MaxAugerGridNuke$);")"
            PRINT #%iout, "   Neutron spectrum   -"; USING$("#####", MaxNeutronGrid); " ("; TRIM$(MaxNeutronGridNuke$);")"
            PRINT #%iout, " "
            PRINT #%iout, " Energy Range: Spectra"
            PRINT #%iout, "   Beta               -"; USING$(" 0.00    to ##.#### MeV", EbetaHigh) + _
                          " (" + TRIM$(NukeBetaHigh$) +")"
            PRINT #%iout, "   Neutron (bins)     -"; USING$("##.## eV to ##.#### MeV", 1.0E+06 * EneutronLow, EneutronHigh)+ _
                          " (" + TRIM$(NukeNeutronLow$) + ", " + TRIM$(NukeNeutronHigh$) +")"
            PRINT #%iout, "   Auger-CK electrons -"; USING$("##.## eV to ##.#### keV", EaugerLow, 0.001 * EaugerHigh)+ _
                          " (" + TRIM$(NukeAugerLow$) + ", " + TRIM$(NukeAugerHigh$) +")"
            PRINT #%iout, " "
            PRINT #%iout, " Decay Chains"
            PRINT #%iout, "   Chain length       -"; USING$("#####", MaxChainLength); " ("; TRIM$(MaxChainLengthNuke$);")"
            PRINT #%iout, " "
            PRINT #%iout, " Elements"
            PRINT #%iout, "   Number             -"; USING$("#####", NumElements)
            PRINT #%iout, "   Radioisotopes      -"; USING$("#####", MaxIsotopes); " ("; ElName(INSTR($sym, MaxElement$) \ 2 + 1); ")"
            PRINT #%iout, " "
            PRINT #%iout, " Data File             Record length  # records"
            PRINT #%iout, "   ICRP-07.NDX        -"; USING$("     ####        ######", LEN(IndDat) - 2, LOF(%indx)/LEN(IndDat))
            PRINT #%iout, "   ICRP-07.RAD        -"; USING$("     ####        ######", LEN(DecDat) - 2, LOF(%irad)/LEN(DecDat))
            PRINT #%iout, "   ICRP-07.BET        -"; USING$("     ####        ######", LEN(BetSpec) - 2, LOF(%ibet)/LEN(BetSpec))
            PRINT #%iout, "   ICRP-07.ACK        -"; USING$("     ####        ######", LEN(AugDat) - 2, LOF(%iaug)/LEN(AugDat))
            PRINT #%iout, "   ICRP-07.NSF        -"; USING$("     ####        ######", LEN(NeuDat) - 2, LOF(%ineu)/LEN(NeuDat))
            CLOSE %iout
'
         CASE 17                                   ' integrity of data files
            OPEN zText FOR OUTPUT AS %iout
            PRINT #%iout, "Check Integrity of ICRP-07 Data Files: Verify Checksum"
            PRINT #%iout, ""
            PRINT #%iout, "DecData Code " + $Version + "."
            PRINT #%iout, ""
            DIM CRC AS DWORD, Buffer AS STRING
            PRINT #%iout, " Integrity of installed data files:"
            PRINT #%iout, ""
'           checking index file
            CLOSE #%indx
            OPEN $data + $DecFile FOR BINARY AS #%indx
            GET$ #%indx, LOF(#%indx), Buffer
            CLOSE #%indx
            CRC = CRC32(BYVAL STRPTR(Buffer), BYVAL LEN(Buffer))
            IF HEX$(CRC,8) = LEFT$(CRC_Check, 8) THEN
               PRINT #%iout, " File "; $DecFile ; " is OK."
            ELSE
               PRINT #%iout, " File "; $DecFile ; "maybe corrupted - Checksum is "; HEX$(CRC,8)
            END IF
'           Checking bet file
            CLOSE #%ibet
            FileIn$ = LEFT$($DecFile, INSTR($DecFile, ".") ) + "BET"
            OPEN $data + FileIn$ FOR BINARY AS #%ibet
            GET$ #%ibet, LOF(#%ibet), Buffer
            CLOSE #%ibet
            CRC = CRC32(BYVAL STRPTR(Buffer), BYVAL LEN(Buffer))
            IF HEX$(CRC,8) = MID$(CRC_Check, 9, 8) THEN
               PRINT #%iout, " File "; FileIn$ ; " is OK."
            ELSE
               PRINT #%iout, " File "; FileIn$ ; ", maybe corrupted - Checksum is "; HEX$(CRC,8)
            END IF
'           checking ACK file
            CLOSE #%iaug
            FileIn$ = LEFT$($DecFile, INSTR($DecFile, ".") ) + "ACK"
            OPEN $data + FileIn$ FOR BINARY AS #%iaug
            GET$ #%iaug, LOF(#%iaug), Buffer
            CLOSE #%iaug
            CRC = CRC32(BYVAL STRPTR(Buffer), BYVAL LEN(Buffer))
            IF HEX$(CRC,8) = MID$(CRC_Check, 17, 8)THEN
               PRINT #%iout, " File "; FileIn$ ; " is OK."
            ELSE
               PRINT #%iout, " File "; FileIn$ ; " maybe corrupted - Checksum is "; HEX$(CRC,8)
            END IF
'           checking NSF file
            CLOSE #%ineu
            FileIn$ = LEFT$($DecFile, INSTR($DecFile, ".") ) + "NSF"
            OPEN $data + FileIn$ FOR BINARY AS #%ineu
            GET$ #%ineu, LOF(#%ineu), Buffer
            CLOSE #%ineu
            CRC = CRC32(BYVAL STRPTR(Buffer), BYVAL LEN(Buffer))
            IF HEX$(CRC,8) = MID$(CRC_Check, 25 , 8)THEN
               PRINT #%iout, " File "; FileIn$ ; " is OK."
            ELSE
               PRINT #%iout, " File "; FileIn$ ; " maybe corrupted - Checksum is "; HEX$(CRC,8)
            END IF
'           checking RAD file
            CLOSE #%irad
            FileIn$ = LEFT$($DecFile, INSTR($DecFile, ".") ) + "RAD"
            OPEN $data + FileIn$ FOR BINARY AS #%irad
            GET$ #%irad, LOF(#%irad), Buffer
            CLOSE #%irad
            CRC = CRC32(BYVAL STRPTR(Buffer), BYVAL LEN(Buffer))
            IF HEX$(CRC,8) = MID$(CRC_Check, 33, 8) THEN
               PRINT #%iout, " File "; FileIn$ ; " is OK."
            ELSE
               PRINT #%iout, " File "; FileIn$ ; " maybe corrupted - Checksum is "; HEX$(CRC,8)
            END IF
            CLOSE
            FileRoot$ = $data + LEFT$($DecFile, INSTR($DecFile, "."))
            OPEN FileRoot$ + "ndx" FOR RANDOM AS %indx LEN = LEN(IndDat)
            OPEN FileRoot$ + "rad" FOR RANDOM AS %irad LEN = LEN(DecDat)
            OPEN FileRoot$ + "bet" FOR RANDOM AS %ibet LEN = LEN(BetSpec)
            OPEN FileRoot$ + "ack" FOR RANDOM AS %iaug LEN = LEN(AugDat)
            OPEN FileRoot$ + "nsf" FOR RANDOM AS %ineu LEN = LEN(NeuDat)
      END SELECT
'
      CALL ShowMSG(1)
      ShellExecute BYVAL %Null, "open", zText, BYVAL %Null, BYVAL %Null, %SW_SHOWNORMAL
      INCR ipos
      IF ipos > 17 THEN ipos = 1
   LOOP
 END SUB

'----------------------------------------------------------------------------------------
 SUB Searchem
'----------------------------------------------------------------------------------------
'  Routine to identify nuclide by either its alpha or photon emission.
'
   LOCAL zText AS ASCIIZ * %MAX_PATH
   CURSOR ON
   CLS
   LOCATE 2, 1
   COLOR %xYellow
   PRINT CenterMess("Identify Nuclides Emitting Alpha/Photon of Specified Energy", 80)
   COLOR %xWhite + %xBright
   PRINT
   PRINT " Search results written to file SCRATCH.TXT in OUTPUT folder."
   Quest$ = " Radiation [a]lpha or [p]hoton radiations or [e]xit search"
   LOCATE 6, 1
   resp$ = ResABC(Quest$, "a", "p", "e", "a")
   IF resp$ = "e" THEN
      CLS
      LOCATE 34, 1                               ' note this is the last
      COLOR %xBlack, %xWhite                     ' line of the screen
      PRINT $fline1;                             ' hence the ; at the end of
      COLOR %xYellow, %xblue                     ' the print statement
      LOCATE 31, 2
      PRINT "Click on an element to list its radioisotopes."
      PRINT " Press <Esc> to exit RADTABS.";
      EXIT SUB
   END IF
   OPEN "OUTPUT\Scratch.TXT" FOR OUTPUT AS %iout
   PRINT #%iout, "Identify Nuclide in ICRP-07 Collection with Observed Emission"
   PRINT #%iout, ""
   IF resp$ = "a" THEN
      PRINT " List nuclides emitting an alpha of energy E +/- dE."
      LINE INPUT " Enter alpha energy E (MeV) -> "; Ls$
      REPLACE "," WITH "." IN Ls$
      Ex = VAL(Ls$)
      LINE INPUT " Enter delta on alpha energy dE -> "; Ls$
      REPLACE "," WITH "." IN Ls$
      dE = VAL(Ls$)
      Elow = Ex - dE
      Ehigh = Ex + dE
      LINE INPUT " Enter lower bound on alpha yield (#/nt or 0.0) -> "; Ls$
      IF LEN(Ls$) = 0 THEN
          Y = 0.0#
      ELSE
          REPLACE "," WITH "." IN Ls$
          Y = VAL(Ls$)
      END IF
      CLS
      LOCATE 2,1
      COLOR %xYellow
      PRINT CenterMess("Identify Nuclides Emitting Alpha/Photon of Specified Energy", 80)
      COLOR %xWhite + %xBright
      PRINT
      PRINT " Alpha emitters of energy between"; USING$("##.#### and##.#### MeV", Elow, Ehigh)
      PRINT "   and # per nt greater than"; USING$("##.##^^^^", Y)
      PRINT #%iout, " Alpha emitters of energy"; USING$("##.#### +/-##.#### MeV", Ex, dE)
      PRINT #%iout, "   and # per nt greater than"; USING$("##.##^^^^", Y)
      GET %indx, 1, IndHed
      istart = VAL(IndHed.i1)
      ifinal = VAL(IndHed.i2)
      FOR i = istart TO ifinal
         GET %indx, i, IndDat
         IF VAL(IndDat.nalpha) > 0 THEN
            nrecord = VAL(IndDat.nalpha)
            nukex$ = IndDat.nuke
            ialpha = VAL(IndDat.np10) + VAL(IndDat.npg10) + _
                     VAL(IndDat.nbet) + VAL(IndDat.nel) + VAL(IndDat.mdec)
            FOR j = 1 TO nrecord
               GET %irad, ialpha + j, DecDat
               Ea = VAL(DecDat.E)
               Ya = VAL(DecDat.Freq)
               IF Ea > Elow AND Ea < Ehigh THEN
                  IF Y = 0.0 THEN
                      IF Ya < 0.0001 THEN
                          PRINT TAB(2) Nukex$; USING$(" E = ##.#### Yield (/nt) <  0.0001", Ea)
                          PRINT #%iout, TAB(5) Nukex$; USING$(" E = ##.#### Yield (/nt) <  0.0001", Ea)
                      ELSE
                          PRINT TAB(2) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                          PRINT #%iout, TAB(5) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                      END IF
                  ELSEIF Ya > Y THEN
                     PRINT TAB(2) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                     PRINT #%iout, TAB(5) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                  END IF
               END IF
               IF Ea > Ehigh THEN EXIT FOR
            NEXT j
         END IF
      NEXT i
   ELSEIF resp$ = "p" THEN
      PRINT " List nuclides emitting a photon of energy E +/- dE."
      LINE INPUT " Enter photon energy E (MeV) -> "; Ls$
      REPLACE "," WITH "." IN Ls$
      Ex = VAL(Ls$)
      LINE INPUT " Enter delta on photon energy dE -> "; Ls$
      REPLACE "," WITH "." IN Ls$
      dE = VAL(Ls$)
      Elow = Ex - dE
      Ehigh = Ex + dE
      LINE INPUT " Enter lower bound on photon yield (#/nt or 0.0) -> "; Ls$
      IF LEN(Ls$) = 0 THEN
          Y = 0.0#
      ELSE
          REPLACE "," WITH "." IN Ls$
          Y = VAL(Ls$)
      END IF
      CLS
      LOCATE 2,1
      COLOR %xYellow
      PRINT CenterMess("Identify Nuclides Emitting Alpha/Photon of Specified Energy", 80)
      COLOR %xWhite + %xBright
      PRINT
      PRINT " Photon emitters of energy between"; USING$("##.#### and##.#### MeV", Elow, Ehigh)
      PRINT "   and # per nt greater than"; USING$("##.##^^^^", Y)
      PRINT #%iout, " Photon emitters of energy"; USING$("##.#### +/-##.#### MeV", Ex, dE)
      PRINT #%iout, "   and # per nt greater than"; USING$("##.##^^^^", Y)
      GET %indx, 1, IndHed
      istart = VAL(IndHed.i1)
      ifinal = VAL(IndHed.i2)
      FOR i = istart TO ifinal
         GET %indx, i, IndDat
         nrecord = VAL(IndDat.np10) + VAL(IndDat.npg10)
         IF nrecord > 0 THEN
            nukex$ = IndDat.nuke
            istart = VAL(IndDat.mdec)
            FOR j = 1 TO nrecord
               GET %irad, istart + j, DecDat
               Ea = VAL(DecDat.E)
               Ya = VAL(DecDat.Freq)
               IF Ea > Elow AND Ea < Ehigh THEN
                  IF Y = 0.0 THEN
                      IF Ya < 0.0001 THEN
                          PRINT TAB(2) Nukex$; USING$(" E = ##.#### Yield (/nt) <  0.0001", Ea)
                          PRINT #%iout, TAB(5) Nukex$; USING$(" E = ##.#### Yield (/nt) <  0.0001", Ea)
                      ELSE
                          PRINT TAB(2) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                          PRINT #%iout, TAB(5) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                      END IF
                  ELSEIF Ya > Y THEN
                     PRINT TAB(2) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                     PRINT #%iout, TAB(5) Nukex$; USING$(" E = ##.#### Yield (/nt) = ##.####", Ea, Ya)
                  END IF
               END IF
               IF Ea > Ehigh THEN EXIT FOR
            NEXT j
         END IF
      NEXT i
   END IF
   PRINT #%iout, "The search is complete."
   CLOSE %iout
   PRINT " The search is complete."
   PRINT
   zText = "output\scratch.txt"
   ShellExecute BYVAL %Null, "open", zText, BYVAL %Null, BYVAL %Null, %SW_SHOWNORMAL
   PRINT
   COLOR %xYellow
   PRINT $Prompt;
   INPUT FLUSH
   WAITKEY$
   CLS
   LOCATE %mWindow, 1
   COLOR %xBlack, %xWhite                     ' line of the screen
   PRINT $fline1;                             ' hence the ; at the end of
   COLOR %xYellow, %xblue                     ' the print statement
   LOCATE %mWindow -3, 2
   PRINT "Click on an element to list its radioisotopes."
   PRINT " Press <Esc> to exit RADTABS.";
 END SUB

'------------------------------------------------------------------------------
 SUB Helpem
'------------------------------------------------------------------------------
'  Routine to list online help files
'
   LOCAL zText AS ASCIIZ * %MAX_PATH
   DIM sInputFile$(1 TO 20)
   CALL ShowMSG(0)
   Filex$ = UCASE$(DIR$($Report + "*.*"))
   nfile = 1
   iord = 0
   IF LEN(Filex$) > 0 THEN
      sInputFile$(nfile) = UCASE$(Filex$)
      DO
         INCR nfile
         Filex$ = UCASE$(DIR$)
         IF Filex$ = "USERGUIDE.PDF" THEN iord = nfile
         IF LEN(Filex$) = 0 THEN
            sInputFile$(nfile) = ""
            EXIT DO
         END IF
         sInputFile$(nfile) = Filex$
      LOOP
      DECR nfile
   END IF
 ' Order the files so guide, etc at top
   IF iord <> 0 THEN
      SWAP sInputFile$(1), sInputFile$(iord)
   END IF
   iord = 0
   FOR i = 2 TO nfile
      IF sInputFile$(i) = "ICRP_NUCLIDES.TXT" THEN iord = i
   NEXT i
   IF iord <> 0 THEN
      SWAP sInputFile$(2), sInputFile$(iord)
   END IF
'
   DO
      iOutofOrder = %false
      FOR i = 3 TO nfile - 1
         ioutorder = %false
         IF INSTR(sInputFile$(i), ".PDF") = 0 AND INSTR(sInputFile$(i+1), ".PDF") > 0 THEN
            SWAP sInputFile$(i), sInputFile$(i+1)
            iOutofOrder = %true
         END IF
      NEXT i
   LOOP WHILE ISTRUE iOutOfOrder
'
   LOCATE 2, 1
   COLOR %xYellow
   ipoint = 1
   SLEEP 600
   CALL ShowMSG(1)
   DO
      GfxWindow %GFX_FREEZE                      ' freeze graphic
      ist$ = ConsoleListBox(1, %CONSOLE_CENTER, 0, _
             "Select File or Escape to Quit", "Files in REPORT Folder ", _
             sInputFile$(), ipoint, %RETURN_INDEX, 0)
      IF LEN(ist$) = 0 THEN EXIT DO
      GfxWindow %GFX_UNFREEZE                      ' freeze graphic
      ipoint = VAL(ist$)
      zText = "Report\" + sInputFile$(ipoint)
      ShellExecute BYVAL %Null, "open", zText, BYVAL %Null, BYVAL %Null, %SW_SHOWNORMAL
      INCR ipoint
      IF ipoint > nfile THEN ipoint = 1
   LOOP
 END SUB

'----------------------------------------------------------------------------------------
 SUB Aboutem
'----------------------------------------------------------------------------------------
'  Usual software about screen
'
   LOCAL zText AS ASCIIZ * %MAX_PATH
   zText = "License_DECDATA.TXT"
   LOCAL Nfile&, hgw1&
   CLS
   LOCATE 3, 1
   COLOR %xYellow
   PRINT CenterMess("About " + $Code, 96)
   PRINT CenterMess($Version, 97)
   COLOR %xWhite + %xBright
   LOCATE 6, 1
   PRINT TAB(3) $code + " provides access to a nuclear decay database of 1252 radionuclide presented in ICRP"
   PRINT TAB(3) "Publication 107 entitled 'Nuclear Decay Data for Dosimetric Calculations'. The database "
   PRINT TAB(3) "contains the physical data needed in calculations of absorbed dose due to intake of, or "
   PRINT TAB(3) "exposure to, a radionuclide and members of its decay chain. The data are contained in five"
   PRINT TAB(3) "formatted direct access files described in Publication 107 and in the " + $code + " user guide."
   PRINT
   PRINT TAB(3) "This work was carried out by A. Endo at Japan Atomic Energy Agency (JAEA) and K.F. Eckerman"
   PRINT TAB(3) "at Oak Ridge National Laboratory (ORNL) under an agreement of cooperation between JAEA and "
   PRINT TAB(3) "the US Environmental Protection Agency (USEPA) and a USEPA-sponsored project at ORNL. Thanks"
   PRINT TAB(3) "to M. Boyd, USEPA, for arranging this collaboration. Reports prepared during the course of "
   PRINT TAB(3) "the work can be accessed via the F6 key."
   PRINT
   PRINT TAB(3) $code + " was developed for Windows 98/NT/2000/XP/Vista operating systems. The software is "
   PRINT TAB(3) "copyrighted by K.F. Eckerman with portions copyrighted by Perfect Sync, Inc. The data files"
   PRINT TAB(3) "are copyrighted by A Endo and K.F. Eckerman. Report any problems to K.F. Eckerman "
   PRINT TAB(3) "(kfe@ornl.gov) or A. Endo (endo.akira3@jaea.go.jp)."
   PRINT
   PRINT
   PRINT TAB(3) "The authors express appreciation to:"
   PRINT
   PRINT TAB(3) "  Y. Yamaguchi (JAEA)                           T. Tamura (JAERI)"
   PRINT TAB(3) "  K. Umeda (Digital Retail Corp.)               L.T. Dillman (Ohio Wesleyan U.)"
   PRINT TAB(3) "  D.E. Cullen (LLNL)                            T.W. Burrow (BNL)"
   PRINT TAB(3) "  A. Nouri (NEA Data Bank)                      G. Audi (Centre de Spectrometrie)"
   PRINT TAB(3) "  M.M. Be (Lab. Nat. Henri Becquerel)           A.L. Nichols (IAEA)"
   PRINT TAB(3) "  H. Klein (Phys.Tech. Bundesanstalt)           R.W. Howell (UMDNJ)"
   PRINT
   PRINT TAB(3) "and to the members of ICRP Committee 2, the DOCAL Task Group, and the Medical Internal"
   PRINT TAB(3) "Radiation Dose (MIRD) Committee of the Society of Nuclear Medicine."
   CURSOR ON
   LOCATE %mWindow - 2, 1
   COLOR %xYellow
   PRINT " Press F8 to view software license or any other key (left click mouse) to continue...";
   INPUT FLUSH
   ikey$ = WAITKEY$
   IF InKeyCode(ikey$) = %F8key THEN
       ShellExecute BYVAL %Null, "open", zText, BYVAL %Null, BYVAL %Null, %SW_SHOWNORMAL
       WAITKEY$
   END IF
   INPUT FLUSH
   CURSOR OFF
   CLS
   LOCATE %mWindow, 1
   COLOR %xBlack, %xWhite
   PRINT $fline1;
   COLOR %xYellow, %xblue
   LOCATE %mWindow - 3, 2
   PRINT "Click on an element to list its radioisotopes."
   PRINT TAB(2) "Press <Esc> to exit DECDATA.";
 END SUB

'----------------------------------------------------------------------------------------
 SUB ShowMSG(iaction)
'----------------------------------------------------------------------------------------
'  Routine to display the bitmap 'message' in the resource file. call with iaction = 0
'  displays the bitmap and called with iaction <> 0 removes the displayed message. the
'  values of nWidth and nHeight need to be redefined if the 'patient.bmp' is changed.
'  the following code fragment is used to get these values from the resource file:
'   DIM szBM AS ASCIIZ * 8
'   szBM = "MESSAGE"
'   IF ISTRUE GetResourceBitmapSize (szBm, nWidth, nHEight) THEN
'      print "BitMap "; szBM; " is "; nWidth; " pixels wide x "; nHeight; " pixels High"
'   ELSE
'      Print "Bitmap resource "; szBM; " not found or corrupt"
'   END IF
'
   IF iaction = 0 THEN
      nWidth& = 342 : nHeight& = 67
      DESKTOP GET CLIENT TO ncWidth&, ncHeight&
      ix& = (ncWidth& - nWidth&)\2                               ' center graphic window
      iy& = (ncHeight& - nHeight&)\2                             ' on the desktop
      GRAPHIC WINDOW "", ix&, iy&, nWidth&, nHeight& TO hGW1&
      GRAPHIC ATTACH hGW1&, 0, REDRAW
      GRAPHIC RENDER "message", (0, 0) - (nWidth&-1, nHeight&-1) ' within the graphic window
      GRAPHIC REDRAW
      GRAPHIC SET FOCUS
   ELSE
      GRAPHIC WINDOW END                          ' Close selected graphic bitmap and put
      CONSOLE SET FOCUS                           ' focus on the console
   END IF
 END SUB

'------------------------------------------------------------------------------
 FUNCTION SkinDose(Emax)
'------------------------------------------------------------------------------
'  function computes the skin dose for a uniform source on the skin
'  using the data of Faw - see ffunction FawFun.
'
   Dskin = 0.0#  :  E1 = 0.0#  : E2 = 0.0#
   ne = VAL(IndDat.nel)
   IF ne > 0 THEN                          ' Auger/IC electrons
      irecord = VAL(IndDat.mdec) + VAL(IndDat.np10) + VAL(IndDat.npg10) + VAL(IndDat.nbet)
      FOR i = 1 TO ne
         GET %irad, irecord + i, DecDat
         Ee = VAL(DecDat.E)
         Ye = VAL(DecDat.freq)
         Dskin = Dskin + Ye * FawFun(Ee)
      NEXT i
      E1 = Ee
   END IF
   mbeta = VAL(IndDat.mbet)
   IF mbeta > 0 THEN                      ' beta sprectrum
      GET %ibet, mbeta, BetHed
      ne = VAL(BetHed.nbet)
      REDIM x(1 TO ne)
      REDIM y(1 TO ne)
      REDIM a(1 TO ne)
      FOR j = 1 TO ne
         GET %ibet, , BetSpec
         Ee = VAL(BetSpec.Eelc)
         x(j) = Ee
         y(j) = FawFun(Ee) * VAL(BetSpec.Freq)
      NEXT j
      E2 = Ee
      CALL pchim(ne, x(), y(), a(), ier1)
      Dskin = Dskin + pchid(ne, x(), y(), a(), %false, 1, ne, ierr)
   END IF
   Emax = MAX(E1, E2)
   FUNCTION = 1.602E-10 * Dskin
 END FUNCTION

'========================================================================================
' Decay chain routines - updated from earlier ORNL PBCC and FORTRAN codes
'========================================================================================
 SUB Chain(nuke$, icall)
'----------------------------------------------------------------------------------------
   IF icall = 0 THEN                 ' icall is nozero when called from TableGen
      CLS
      LOCATE 2, 1
      COLOR %xYellow
   END IF
'
   DIM eat(1 TO %mspec), ebt(1 TO %mspec), egt(1 TO %mspec)
   zln2## = 0.693147181##
   zero = 0.0#
   ibrch = 0                         ' initialize chain parameters
   ipar = 1
   nspec = 1
   ieob = %true
   ipob = %false
   nucnam(1) = nuke$
   FOR i = 1 TO %mspec
      FOR j = 1 TO %mspec
         branch(i, j) = zero
      NEXT j
   NEXT i
   branch(1, 1) = 1.0#                ' assign one unit of activity to the parent
   zlmr(1) = 0.0##
   IF imax < 0 THEN EXIT SUB          ' only initialize the chain parameters.
'
   DO                                 ' assemble list of chain members
      CALL frward
      CALL recver
   LOOP WHILE ISFALSE ieob
'  check on SF and if present move it to last position
   ispon = 0
   FOR i = 1 TO nspec
      IF INSTR(nucnam(i), "SF") > 0 THEN
         ispon = i
         EXIT FOR
      END IF
   NEXT i
   IF ispon > 0 THEN
      FOR i = ispon TO nspec - 1
         nucnam(i) = nucnam(i+1)
      NEXT i
      nucnam(nspec) = "SF"
   END IF
'
   CALL BldChain                     ' given the chain members now assemble chain
'
   IF ISTRUE ipob THEN CALL order    ' and order it
'
   FOR i = 1 TO nspec
      IF INSTR(nucnam(i), "SF") <> 0 THEN
         zlmr(i) = 0.0##
      ELSE
         zlmr(i) = zln2## / CEXT(timest(thalf(i), iu(i)))
      END IF
   NEXT i
   IF icall = 1 THEN
      IF LEFT$(nucnam(nspec), 2) = "SF" THEN nspec = nspec - 1
      EXIT SUB
   END IF
   IF nspec >  1  THEN
      text$ = TRIM$(nucnam(1)) + " Decay Chain:" + _
              " Half-lives and Branching Fractions"
   ELSE
      text$ = TRIM$(nucnam(1)) + " Decay Chain:" + _
              " No radioactive daughters."
   END IF
   IF icall = 0 THEN
      PRINT CenterMess(Text$, 97)
      COLOR %xWhite + %xBright
   END IF
'
   CALL printm (icall)
   IF icall > 0 THEN EXIT SUB
   CALL pathx
'
   timess = 3.1558E+09               ' 100 y in seconds
   text$ = ": Activity, Transformations, and Cumulative Energies " +_
           "(MeV) at 100y"
   IF nspec > 7 THEN
      PRINT
      COLOR %xYellow
      PRINT CenterMess(TRIM$(NucNam(1)) + Text$, 97)
      COLOR %xWhite + %xBright
   ELSE
      PRINT
      COLOR %xYellow
      PRINT CenterMess(TRIM$(nucnam(1))+ Text$, 97)
      COLOR %xWhite + %xBright
   END IF
   PRINT STRING$(43, " ") + "-- Cumulative Energy (MeV) --"
   PRINT "    Nuclide     T1/2    A(t)/Ao   nt/Ao(s)  Alpha    Electron    Photon"
   ea = zero : eb = zero : eg = zero
   REDIM eat(1 TO nspec)
   REDIM ebt(1 TO nspec)
   REDIM egt(1 TO nspec)
   FOR ispec = 1 TO nspec
      IF INSTR(nucnam(ispec), "SF") = 0 THEN
         CALL birch(rx1, rx2, timess, ispec)
         ea = ea + rx2 * ealpha(ispec)
         eb = eb + rx2 * ebeta(ispec)
         eg = eg + rx2 * egamm(ispec)
         PRINT USING$(" ##",ispec) + " " + nucnam(ispec)+ _
                      " " + thalf(ispec) + iu(ispec) +_
               USING$("##.###^^^^",rx1) + USING$("##.###^^^^",rx2) + _
               USING$("##.###^^^^",ea) + USING$("##.###^^^^",eb) + _
               USING$("##.###^^^^",eg)
         eat(ispec) = ea : ebt(ispec) = eb : egt(ispec) = eg
      END IF
   NEXT ispec
'
   IF nspec > 1 AND INSTR(nucnam(nspec), "SF") = 0 THEN
      imax = icutoff(eat(), ebt(), egt(), nspec)
   ELSE
      imax = icutoff(eat(), ebt(), egt(), nspec-1)
   END IF
   PRINT
   IF nspec > 1 THEN
      IF imax = nspec THEN
         PRINT " In dosimetric calculation the full chain should be considered."
      ELSE
         PRINT " In dosimetric calculations the " + TRIM$(nucnam(1)) +_
               " chain can be truncated at member" + STR$(imax) + "."
      END IF
   END IF
   LOCATE %mWindow - 2, 1
   COLOR %xYellow
   PRINT $Prompt;
   INPUT FLUSH
   WAITKEY$
   SLEEP 100
 END SUB

'---------------------------------------------------------------------------------------
  SUB Frward
'----------------------------------------------------------------------------------------
'  read down a chain branch.
'
   DIM nukex AS LOCAL STRING * 7
   IF ipar = 1 THEN
      nuke$ = nucnam(ipar)
      ipt = ibinry(nuke$)
      IF ipt = 0 THEN
        nspec = 0
        EXIT SUB
      END IF
   END IF
   DO
      IF ipt < 9999 THEN
         GET %indx, ipt, IndDat
         nukex = IndDat.nuke
         CALL bldvect(nucnam(), Nukex, nspec)
         id1 = CLNG(VAL(IndDat.idau1))
         IF id1 > 0 THEN
            nukex = IndDat.Dau1
            CALL bldvect(nucnam(), nukex, nspec)
            id2 = CLNG(VAL(IndDat.idau2))
            IF id2 > 0 THEN
               ieob = %false
               INCR ibrch
               nukex = IndDat.Dau2
               named(ibrch) = nukex
               iptb(ibrch) = VAL(IndDat.idau2)
               CALL bldvect(nucnam(), nukex, nspec)
               id3  = CLNG(VAL(IndDat.idau3))
               IF id3 > 0 THEN
                  nukex = IndDat.Dau3
                  INCR ibrch
                  ieob = %false
                  named(ibrch) = nukex
                  iptb(ibrch) = VAL(IndDat.idau3)
                  CALL bldvect(nucnam(), nukex, nspec)
                  id4  = CLNG(VAL(IndDat.idau4))
                  IF id4 > 0 THEN
                     nukex = IndDat.Dau4
                     INCR ibrch
                     ieob = %false
                     named(ibrch) = nukex
                     iptb(ibrch) = VAL(IndDat.idau4)
                     CALL bldvect(nucnam(), nukex, nspec)
                  END IF
               END IF
            END IF
         END IF
      END IF
      ipt = id1
   LOOP WHILE id1 > 0
 END SUB

'----------------------------------------------------------------------------------------
  SUB Recver
'----------------------------------------------------------------------------------------
'  recover info on branches in the chain that were detected by frward and
'  direct the reading of the new branch.
'
   IF ibrch = 0 THEN       ' no branches to treat
      ieob = %true         ' set end of branch and return
      EXIT SUB
   END IF
'
   WHILE ibrch > 0
'
'    consider remaining branches. set eoc to false, recover parent's
'    index at branch (ipar) and daughter's record number (ipt).
'    decrement branch counter and return.
'
      ipob = %true
      ipar = iparb(ibrch)
      ipt = iptb(ibrch)
      nuke$ = named(ibrch)
'
'     check if daughter of the branch is already in nucnam.
'
      FOR i = 1 TO nspec
         IF INSTR(nucnam(i), nuke$) > 0 THEN  ' member already in nucnam
            DECR ibrch                        ' the branch has converged
            IF ibrch = 0 THEN                 ' so decr ibrch and exit.
               EXIT SUB                       ' we may come back with next
            END IF                            ' branch if necessary
         END IF
      NEXT i
      EXIT SUB
   WEND
 END SUB

'----------------------------------------------------------------------------------------
  SUB BldChain
'----------------------------------------------------------------------------------------
   DIM daughter AS LOCAL STRING * 7
   FOR i = 1 TO nspec
      Nuke$ = nucnam(i)
      IF INSTR(Nuke$, "SF") > 0 THEN EXIT FOR
      iptr = ibinry(nuke$)
      GET %indx, iptr, IndDat
      thalf(i) = IndDat.t
      iu(i) = IndDat.Tu
      ealpha(i) = VAL(IndDat.ea)
      ebeta(i) = VAL(IndDat.eb)
      egamm(i) = VAL(IndDat.eg)
      IF CLNG(VAL(IndDat.idau1)) > 0 THEN
         Daughter = IndDat.Dau1
         ip = invect(nucnam(), Daughter, nspec)
         branch(i, ip) = VAL(IndDat.bf1)
         IF CLNG(VAL(IndDat.idau2)) > 0 THEN
            Daughter = IndDat.Dau2
            ip = invect(nucnam(), Daughter, nspec)
            branch(i, ip) = VAL(IndDat.bf2)
            IF CLNG(VAL(IndDat.idau3)) > 0 THEN
               Daughter = IndDat.Dau3
               ip = invect(nucnam(), Daughter, nspec)
               branch(i, ip) = VAL(IndDat.bf3)
               IF CLNG(VAL(IndDat.idau4)) > 0 THEN
                  Daughter = IndDat.Dau4
                  ip = invect(nucnam(), Daughter, nspec)
                  branch(i, ip) = VAL(IndDat.bf4)
               END IF
            END IF
         END IF
      END IF
   NEXT i
 END SUB

'----------------------------------------------------------------------------------------
 SUB Order
'----------------------------------------------------------------------------------------
'  order chain members so daughter index > parents.
'
   DIM rsave(1 TO %mspec), csave(1 TO %mspec)
   ipass = 0
   DO
      imove = 0
      INCR ipass
      IF ipass > 4 * nspec THEN
         PRINT "Failure in order: greater than" + STR$(ipass)+_
         " passes for "+TRIM$(nucnam(1))+"."
         INPUT FLUSH
         WAITKEY$
         EXIT SUB
      END IF
'
      FOR i = 1 TO nspec
         FOR j = 1 TO i-1
            IF branch(i, j) > 0.0 THEN
               ip = i
               jp = j
               imove = 1
               nuke$ = nucnam(ip)
               thold$ = thalf(ip)
               ea = ealpha(ip)
               eb = ebeta(ip)
               eg = egamm(ip)
               ix$ = iu(ip)
               FOR j = 1 TO nspec
                  rsave(j) = branch(ip, j)
               NEXT j
               FOR i = ip - 1 TO jp STEP -1
                  nucnam(i + 1) = nucnam(i)
                  thalf(i + 1) = thalf(i)
                  ealpha(i + 1) = ealpha(i)
                  ebeta(i + 1) = ebeta(i)
                  egamm(i + 1) = egamm(i)
                  iu(i + 1) = iu(i)
                  FOR j = 1 TO nspec
                     branch(i + 1, j) = branch(i, j)
                  NEXT j
               NEXT i
               nucnam(jp) = nuke$
               thalf(jp) = thold$
               iu(jp) = ix$
               ealpha(jp) = ea
               ebeta(jp) = eb
               egamm(jp) = eg
               FOR j = 1 TO nspec
                  branch(jp, j) = rsave(j)
               NEXT j
               FOR i = 1 TO nspec
                  csave(i) = branch(i, ip)
               NEXT i
               FOR j = ip - 1 TO jp STEP -1
                  FOR i = 1 TO nspec
                     branch(i, j + 1) = branch(i, j)
                  NEXT i
               NEXT j
               FOR i = 1 TO nspec
                  branch(i, jp) = csave(i)
               NEXT i
            END IF
         NEXT j
      NEXT i
      IF imove = 0 THEN EXIT LOOP                    ' nothing to move
   LOOP
 END SUB

'----------------------------------------------------------------------------------------
 SUB Printm (icall)
'----------------------------------------------------------------------------------------
'  purpose:  print the decay chain
'
   IF nspec = 1 THEN
      PRINT
      PRINT "    Nuclide  Halflife    f1      Nuclide   f2      Nuclide"
      COLOR %xWhite + %xBright
      PRINT USING$(" ##",nspec) + " " + nucnam(nspec) + " " +_
            thalf(nspec) + iu(nspec);
      nuke$ = nucnam(nspec)
      ipx = Ibinry(nuke$)
      GET %indx, ipx, IndDat
      PRINT USING$("##.###^^^^", VAL(IndDat.bf1)) + " ";
      COLOR %xYellow
      PRINT LEFT$(IndDat.Dau1, 7);
      COLOR %xWhite + %xBright
      IF VAL(IndDat.bf2) <> 0.0# THEN
          PRINT USING$("##.###^^^^", VAL(IndDat.bf2)) + " ";
          COLOR %xYellow
          PRINT IndDat.Dau2;
          COLOR %xWhite + %xBright
      ELSE
          PRINT
      END IF
     PRINT
   ELSE
      IF icall > 0 THEN
        PRINT #%iout, STRING$(23, " ") + STRING$(25, "-") + "  Daughter Products  " + STRING$(25, "-")
        PRINT #%iout, "    Nuclide  Halflife    f1" + STRING$(6," ") + _
               "Nuclide   f2" + STRING$(6, " ") + _
               "Nuclide   f3" + STRING$(6," ") + _
               "Nuclide   f4" + STRING$(6," ") + "Nuclide"
         FOR i = 1 TO nspec
            IF INSTR(nucnam(i), "SF") = 0 THEN
              PRINT #%iout, USING$(" ##",i) + " " + nucnam(i)+" " + thalf(i) + iu(i);
              FOR j = 1 TO nspec
                IF i <> j AND branch(i, j) > 0.0# THEN
                   PRINT #%iout, USING$("##.###^^^^", branch(i,j)) + " " + nucnam(j);
                END IF
              NEXT j
              nuke$ = nucnam(i)
              ipx = Ibinry(nuke$)
              GET %indx, ipx, IndDat
              IF VAL(IndDat.idau1) = 0 AND VAL(IndDat.bf1) <> 0.0# THEN
                  PRINT #%iout, USING$("##.###^^^^", VAL(IndDat.bf1)) + " " + TRIM$(IndDat.Dau1) + _
                        CHR$(36) + STRING$(7 - LEN(TRIM$(IndDat.Dau1)), " ");
                  IF VAL(IndDat.idau2) = 0 AND VAL(IndDat.bf2) <> 0.0# THEN
                     PRINT #%iout, USING$("##.###^^^^", VAL(IndDat.bf2)) + " " + TRIM$(IndDat.Dau2) + _
                            CHR$(36) + STRING$(7 - LEN(TRIM$(IndDat.Dau2)), " ")
                  ELSE
                     PRINT #%iout, ""
                  END IF
              ELSEIF VAL(IndDat.idau2) = 0 AND VAL(IndDat.bf2) <> 0.0# THEN
                  PRINT #%iout, USING$("##.###^^^^", VAL(IndDat.bf2)) + " " + TRIM$(IndDat.Dau2) + _
                        CHR$(36) + STRING$(7 - LEN(TRIM$(IndDat.Dau2)), " ");
                  IF VAL(IndDat.idau3) = 0  AND VAL(IndDat.bf3) <> 0.0# THEN
                     PRINT #%iout, USING$("##.###^^^^", VAL(IndDat.bf3)) + " " + TRIM$(IndDat.Dau3) + _
                          CHR$(36) + STRING$(7 - LEN(TRIM$(IndDat.Dau3)), " ")
                  ELSE
                     PRINT #%iout, " "
                  END IF
              ELSEIF VAL(IndDat.idau3) = 0 AND VAL(IndDat.bf3) <> 0.0# THEN
                  PRINT #%iout, USING$("##.###^^^^", VAL(IndDat.bf3)) + " " + TRIM$(IndDat.Dau3) + _
                        CHR$(36) + STRING$(7 - LEN(TRIM$(IndDat.Dau3)), " ")
              ELSE
                  PRINT #%iout, " "
              END IF
            END IF
         NEXT i
      ELSE
         PRINT STRING$(23, " ") + STRING$(25, "-") + "  Daughter Products  " + STRING$(25, "-")
         PRINT "    Nuclide  Halflife    f1" + STRING$(6," ") + _
               "Nuclide   f2" + STRING$(6, " ") + _
               "Nuclide   f3" + STRING$(6," ") + _
               "Nuclide   f4" + STRING$(6," ") + "Nuclide"
         FOR i = 1 TO nspec
            IF INSTR(nucnam(i), "SF") = 0 THEN
              PRINT USING$(" ##",i) + " " + nucnam(i) + " " + thalf(i) + iu(i);
              FOR j = 1 TO nspec
                IF i <> j AND branch(i, j) > 0.0# THEN
                   PRINT USING$("##.###^^^^", branch(i,j)) + " " + nucnam(j);
                END IF
              NEXT j
              nuke$ = nucnam(i)
              ipx = Ibinry(nuke$)
              GET %indx, ipx, IndDat
              IF VAL(IndDat.idau1) = 0 AND VAL(IndDat.bf1) <> 0.0# THEN
                 PRINT USING$("##.###^^^^", VAL(IndDat.bf1)) + " ";
                 COLOR %xYellow
                 PRINT LEFT$(IndDat.Dau1, 7);
                 COLOR %xWhite + %xBright
                 IF VAL(IndDat.idau2) = 0 AND VAL(IndDat.bf2) <> 0.0# THEN
                    PRINT USING$("##.###^^^^", VAL(IndDat.bf2))+ " ";
                    COLOR %xYellow
                    PRINT IndDat.Dau2
                    COLOR %xWhite + %xBright
                 ELSE
                    PRINT ""
                 END IF
              ELSEIF VAL(IndDat.idau2) = 0 AND VAL(IndDat.bf2) <> 0.0# THEN
                 PRINT USING$("##.###^^^^", VAL(IndDat.bf2)) + " ";
                 COLOR %xYellow
                 PRINT LEFT$(IndDat.Dau2, 7);
                 COLOR %xWhite + %xBright
                 IF VAL(IndDat.idau3) = 0  AND VAL(IndDat.bf3) <> 0.0# THEN
                    PRINT USING$("##.###^^^^", VAL(IndDat.bf3)) + " ";
                    COLOR %xYellow
                    PRINT IndDat.Dau3
                    COLOR %xWhite + %xBright
                 ELSE
                    PRINT
                 END IF
              ELSEIF VAL(IndDat.idau3) = 0 AND VAL(IndDat.bf3) <> 0.0# THEN
                 PRINT USING$("##.###^^^^", VAL(IndDat.bf3)) + " ";
                 COLOR %xYellow
                 PRINT IndDat.Dau3
                 COLOR %xWhite + %xBright
              ELSE
                 PRINT
              END IF
            END IF
         NEXT i
         PRINT " " + STRING$(10, "-")
         PRINT " Stable isotope(s) shown in yellow."
         PRINT
      END IF
      IF icall > 0 THEN EXIT SUB
      IF nspec > 7 THEN
         PRINT
         COLOR %xYellow
         LOCATE %mWindow - 2, 1
         PRINT $Prompt;
         INPUT FLUSH
         WAITKEY$
         CLS
      END IF
   END IF
'
 END SUB

'----------------------------------------------------------------------------------------
 SUB Pathx
'----------------------------------------------------------------------------------------
' Adapted from A. Birchall, Health Phys. 50(3):389-397, 1986.
'
   FOR i = 1 TO nspec
      maxi(i) = 0
      FOR j = 1 TO nspec
         mpath(i, j) = 0
      NEXT j
   NEXT i
   FOR j = 2 TO nspec
      FOR i = 1 TO j - 1
         IF branch(i, j) <> 0.# THEN
            INCR maxi(j)
            mpath(maxi(j), j) = i
         END IF
      NEXT i
   NEXT j
 END SUB

'----------------------------------------------------------------------------------------
 SUB Birch(x1, x2, t, imem)
'----------------------------------------------------------------------------------------
'
   DIM b(1 TO %mspec), b0(1 TO %mspec), zkt##(1 TO %mspec)
   DIM zk##(1 TO %mspec), mark(1 TO %mspec), jpath(1 TO %mspec)
   DIM ipath(1 TO %mspec)
'
'  trace the pathway backwards from imem to decide which elements
'  of the Mpath matrix to choose.
'
   x1 = 0.# :    x2 = 0.#
   FOR i = 1 TO nspec
      mark(i) = 1
      b(i) = branch(i, i)
   NEXT i
31:
   nmem = 1
   jpath(1) = imem
   IF maxi(imem) <> 0 THEN
      DO
         imem = mpath(mark(imem), imem)
         INCR nmem
         jpath(nmem) = imem
      LOOP WHILE maxi(imem) > 0
   END IF
'
   FOR i = 1 TO nmem
      ipath(i) = jpath(nmem - i + 1)
   NEXT i
   imem = ipath(nmem)
   FOR i = 1 TO nmem
      b0(i) = b(ipath(i))
      zkt##(i) = zlmr(ipath(i))
      IF i <  nmem THEN
         zk##(i) =  CEXT(branch(ipath(i), ipath(i + 1)) * zkt##(i))
      ELSE
         zk##(i) = zkt##(i)
      END IF
   NEXT i
   CALL batman(b0(), zk##(), zkt##(), an1, an2, t, nmem)
   x1 = x1 + an1
   x2 = x2 + an2
   FOR i = 1 TO nmem
      b(ipath(i)) = 0.0#
      IF i > 1 THEN
         IF mark(ipath(i)) <> maxi(ipath(i)) THEN
            m = ipath(i)
            INCR mark(m)
            FOR j = 1 TO m - 1
               mark(j) = 1
               b(j) = branch(j, j)
            NEXT j
            GOTO 31
         END IF
      END IF
   NEXT i
   imem = ipath(nmem)
 END SUB

'----------------------------------------------------------------------------------------
 SUB Batman(b0(), zk##(), zkt##(), an1, an2, t, n)
'----------------------------------------------------------------------------------------
'
   DIM s1 AS LOCAL EXT
   DIM s2 AS LOCAL EXT
   DIM ss1 AS LOCAL EXT
   DIM ss2 AS LOCAL EXT
   DIM prod AS LOCAL EXT
   DIM ann1 AS LOCAL EXT
   DIM ann2 AS LOCAL EXT
   DIM tt AS LOCAL EXT
'
   an1 = 0# :  an2 = 0# :  ann1 = 0## : ann2 = 0## : tt = CEXT(t)
   FOR i = 1 TO n
      IF b0(i) <> 0# THEN
         s1 = 0## :  s2 = 0## :  ss1 = 0## :  ss2 = 0##
         FOR j = i TO n
            prod = zkt##(n) / zk##(n) * zk##(j) / zkt##(i)
            FOR k = i TO n
               IF k <> j THEN prod = prod * zk##(k) / (zkt##(k) - zkt##(j))
            NEXT k
            IF prod < 0## THEN
               s1 = s1 + ABS(prod) * expfun(-zkt##(j) * tt)
               ss1 = ss1 + ABS(prod) * expf1(zkt##(j), t)
            ELSE
               s2 = s2 + prod * expfun(-zkt##(j) * tt)
               ss2 = ss2 + prod * expf1(zkt##(j), t)
            END IF
         NEXT j
'        only positive values are retained; negatives are zero
         IF s2 > s1 THEN  ann1 = ann1 + CEXT(b0(i)) * (s2 - s1)
         IF ss2 > ss1 THEN ann2 = ann2 + CEXT(b0(i)) * (ss2 - ss1)
      END IF
   NEXT i
   an1 = ann1
   an2 = ann2
 END SUB

'----------------------------------------------------------------------------------------
' End of chain routines
'========================================================================================
'
'------------------------------------------------------------------------------
 FUNCTION TableEntry(a$) AS STRING
'------------------------------------------------------------------------------
'  function returns string entry for tables in sub TableGen
'
    IF VAL(a$) = 0 THEN
        FUNCTION = "    -   "
    ELSEIF VAL(a$) < 0.0001 THEN
        FUNCTION = " < E-04 "
    ELSE
        FUNCTION = USING$("###.####", VAL(a$))
    END IF
 END FUNCTION

'------------------------------------------------------------------------------
 FUNCTION FawFun(Ex)
'------------------------------------------------------------------------------
'   function to compute MeV-cm2/g for electron of energy Ex
'   R.E. Faw. Absorbed doses to skin from radionuclide sources on the body surface.
'   Health Phys. 63(4):443-448, 1992.
'   coefficients from Table 3 of reference (with air reflection), 5-10 mg/cm2
'
   a = 4.2786# :  b = 6.7327#  : c = 2.6434#  : d = 0.0#
   e = 1.4157# :  f = 0.1681#  : g = -0.3181# : Emin = 0.062#
   IF Ex < Emin THEN
      FUNCTION = 0.0#
   ELSEIF Ex =< 5.0# THEN
      x = LOG10(Ex)
      FUNCTION = (a + x*(b + x*(c + d*x)))/(1.0# + x*(e + x*(f + g*x)))
   ELSE                    ' extrapolation beyond 5 MeV
      x2 = LOG10(5.0#)
      z1 = (a + x2*(b + x2*(c + d*x2)))/(1.0# + x2*(e + x2*(f + g*x2)))
      x1 = LOG10(4.0#)
      zm = (z1 - (a + x1*(b + x1*(c + d*x1)))/(1.0# + x1*(e + x1*(f + g*x1))))/(x2 - x1)
      FUNCTION = z1 + zm * (LOG10(Ex) - x2)
    END IF
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION Elname(iz) AS STRING
'----------------------------------------------------------------------------------------
'  return element name given atomic number, iz
'
   DATA Hydrogen,    Helium,    Lithium,      Beryllium,  Boron,      Carbon,    Nitrogen
   DATA Oxygen,      Fluorine,  Neon,         Sodium,     Magnesium,  Aluminum,  Silicon
   DATA Phosphorus,  Sulphur,   Chlorine,     Argon,      Potassium,  Calcium,   Scandium
   DATA Titanium,    Vanadium,  Chromium,     Manganese,  Iron,       Cobalt,    Nickel
   DATA Copper,      Zinc,      Gallium,      Germanium,  Arsenic,    Selenium,  Bromine
   DATA Krypton,     Rubidium,  Strontium,    Yttrium,    Zirconium,  Niobium,   Molybdenum
   DATA Technetium,  Ruthenium, Rhodium,      Palladium,  Silver,     Cadmium,   Indium
   DATA Tin,         Antimony,  Tellurium,    Iodine,     Xenon,      Cesium,    Barium
   DATA Lanthanum,   Cerium,    Praseodymium, Neodymium,  Promethium, Samarium,  Europium
   DATA Gadolinium,  Terbium,   Dysprosium,   Holmium,    Erbium,     Thulium,   Ytterbium
   DATA Lutetium,    Hafnium,   Tantalum,     Tungsten,   Rhenium,    Osmium,    Iridium
   DATA Platinum,    Gold,      Mercury,      Thallium,   Lead,       Bismuth,   Polonium
   DATA Astatine,    Radon,     Francium,     Radium,     Actinium,   Thorium,   Protactinium
   DATA Uranium,     Neptunium, Plutonium,    Americium,  Curium,     Berkelium, Californium
   DATA Einsteinium, Fermium,   Mendelevium,  Nobelium,   Lawrencium
   FUNCTION = READ$(iz)
 END FUNCTION

'----------------------------------------------------------------------------------------
 SUB GetNukeLst(NukeCover$)
'----------------------------------------------------------------------------------------
'  Assemble a string of the chemical sysmbols for nuclides in the collection
'
   GET %indx, 1, IndHed
   i1 = CINT(VAL(IndHed.i1))
   i2 = CINT(VAL(IndHed.i2))
   NukeCover$ = ""
   FOR irec = i1 TO i2
      GET %indx, irec, IndDat
      Chx$ = LEFT$(IndDat.nuke, 2)
      IF INSTR(NukeCover$, Chx$) = 0 THEN
         NukeCover$ = NukeCover$ + Chx$
      END IF
   NEXT irec
 END SUB

'----------------------------------------------------------------------------------------
 SUB Listex(Chx$, Listx$(), nlist)
'----------------------------------------------------------------------------------------
'  assemble list of radisotopes of element Chx$
'
   DIM IZval(1 TO %misotope)
   GET %indx, 1, IndHed
   i1 = CLNG(VAL(IndHed.i1))
   i2 = CLNG(VAL(IndHed.i2))
   icnt = 0
   ifound = %false
   FOR irec = i1 TO i2
     GET %indx, irec, IndDat
     IF LEFT$(IndDat.nuke, 2) = Chx$ THEN
        ifound = %true
        INCR icnt
        Listx$(icnt) = IndDat.nuke + STRING$(9 - LEN(TRIM$(IndDat.nuke)), " ")
        IF LEN(TRIM$(IndDat.mode)) = 8 THEN
            Listx$(icnt) = Listx$(icnt) + IndDat.mode + " " + TRIM$(IndDat.t) + " " + IndDat.Tu
        ELSE
            Listx$(icnt) = Listx$(icnt) + IndDat.mode + $TAB + " " + TRIM$(IndDat.t) + " " + IndDat.Tu
        END IF
        nuclide$ = IndDat.nuke
        izval(icnt) = IZMass(nuclide$)
     ELSEIF ISTRUE ifound AND LEFT$(IndDat.nuke, 2) <> Chx$ THEN
        EXIT FOR
     END IF
   NEXT irec
   nlist = icnt
   REDIM PRESERVE izval(1 TO Nlist), Listx$(1 TO Nlist)
   ARRAY SORT IZval(), TAGARRAY Listx$()
 END SUB

'----------------------------------------------------------------------------------------
  SUB BldVect(clist() AS STRING * 7, citem AS STRING * 7, n)
'----------------------------------------------------------------------------------------
' routine builds character vector clist(n) - no duplicate entries.
'
   IF n = 0 THEN                             ' just add it
      n = 1
      clist(n) = citem
   ELSE                                      ' check to see if already
      FOR i = 1 TO n                         ' present, if so then
         IF clist(i) = citem THEN EXIT SUB   ' exit, if not
      NEXT i                                 ' increment counter and
      INCR n                                 ' add the new member
      clist(n) = citem
   END IF
 END SUB

'========================================================================================
' PCHIP routines
'
' Translated from fortran by KF Eckerman, ORNL
' Fortran written by Fred N. Fritsch, LLNL
'
' F.N. Fritsch and R.E. Carlson, "Monotone piecewise cubic interpolation,"
'      Siam J. Numer. Anal. 17:238-246, 1980
'
' F.N. Fritsch and J. Butland, "A Method for Constructing Local Monotone
'      Piecewise Cubic Interpolants," UCRL-87559, april 1982.
'
'========================================================================================
'----------------------------------------------------------------------------------------
 SUB Chfev(x1, x2, f1, f2, d1, d2, jfirst, ne, xe(), fe(), nxt(), ierr)
'----------------------------------------------------------------------------------------
'  chfev:  cubic hermite function evaluator
'  evaluates the cubic polynomial determined by function values f1, f2 and derivatives
'  d1, d2 on interval (x1, x2) at the points xe(j), j=1 to ne.
'
'   parameters:
'     x1,x2 - (input) endpoints of interval of definition of cubic.
'             (error return if  x1 = x2 .)
'     f1,f2 - (input) values of function at x1 and x2, respectively.
'     d1,d2 - (input) values of derivative at x1 and x2, respectively.
'        ne - (input) number of evaluation points.  (error return if
'             ne < 1 .)
'        xe - (input) real array of points at which the functions are to
'             be evaluated.  if any of the xe are outside the interval
'             [x1, x2], a warning error is returned.
'       fe - (output) real array of values of the cubic function defined
'             by  x1,x2, f1,f2, d1,d2  at the points  xe.
'      nxt - (output) integer array indicating number of extrapolation
'            points:
'            nxt(1) = number of evaluation points to left of interval.
'            nxt(2) = number of evaluation points to right of interval.
'     ierr - (output) error flag.
'            normal return: ierr = 0  (no errors).
'            "recoverable" errors:
'                ierr = -1  if ne < 1 .
'                ierr = -2  if x1 = x2 .
'                (output arrays have not been changed in either case.)
'
   IF ne < 1 THEN
      ierr = -1
      EXIT SUB
   END IF
   h = x2 - x1
   IF h = 0.0# THEN
      ierr = -2
      EXIT SUB
   END IF
   ierr = 0
   nxt(1) = 0
   nxt(2) = 0
   xmi = MIN(0.0#, h)
   xma = MAX(0.0#, h)
   delta = (f2 - f1) / h
   del1 = (d1 - delta) / h
   del2 = (d2 - delta) / h
   c2 = -(del1 + del1 + del2)
   c3 = (del1 + del2) / h
   FOR i = 1 TO ne
      x = xe(i + jfirst - 1) - x1
      fe(i + jfirst - 1) = f1 + x * (d1 + x * (c2 + x * c3))
      IF x < xmi THEN
         nxt(1) = nxt(1) + 1
      ELSEIF x > xma THEN
         nxt(2) = nxt(2) + 1
      END IF
   NEXT i
 END SUB

'----------------------------------------------------------------------------------------
 FUNCTION Chfiv (x1, x2, f1, f2, d1, d2, a, b, ierr) AS DOUBLE
'----------------------------------------------------------------------------------------
'  chfiv:  cubic hermite function integral evaluator
'  called by pchia to evaluate the integral of a single cubic (in hermite form) over an
'  arbitrary interval (a, b).
'
'  calling sequence:
'     value = chfiv (x1, x2, f1, f2, d1, d2, a, b, ierr)
'  parameters
'     x1,x2 -- (input) endpoints of interval of definition of cubic.
'           (error return if  x1.eq.x2 .)
'     f1,f2 -- (input) values of function at x1 and x2, respectively.
'     d1,d2 -- (input) values of derivative at x1 and x2, respectively.
'     a,b -- (input) endpoints of interval of integration.
'     ierr -- (output) error flag.
'           normal return:
'              ierr = 0  (no errors).
'           "recoverable" errors:
'              ierr = -1  if x1 .eq. x2.
'                value has not been set in this case.)
'
   FUNCTION = 0.0#
   IF x1 = x2 THEN
      ierr = 0
      EXIT FUNCTION
   END IF
   h = x2 - x1
   ta1 = (a - x1) / h
   ta2 = (x2 - a) / h
   tb1 = (b - x1) / h
   tb2 = (x2 - b) / h
'
   ua1 = ta1^3
   phia1 = ua1 * (2.0# - ta1)
   psia1 = ua1 * (3.0# * ta1 - 4.0#)
   ua2 = ta2^3
   phia2 = ua2 * (2.0# - ta2)
   psia2 = -ua2 * (3.0# * ta2 - 4.0#)
'
   ub1 = tb1^3
   phib1 = ub1 * (2.0# - tb1)
   psib1 = ub1 * (3.0# * tb1 - 4.0#)
   ub2 = tb2^3
   phib2 = ub2 * (2.0# - tb2)
   psib2 = -ub2 * (3.0# * tb2 - 4.0#)
'
   fterm = f1 * (phia2 - phib2) + f2 * (phib1 - phia1)
   dterm = (d1 * (psia2 - psib2) + d2 * (psib1 - psia1)) * (h / 6.0#)
'
   FUNCTION = 0.5# * h * (fterm + dterm)
 END FUNCTION

'----------------------------------------------------------------------------------------
 SUB Pchfe (n, x(), f(), D(), iskip, ne, xe(), fe(), ierr)
'----------------------------------------------------------------------------------------
'  pchfe:  piecewise cubic hermite function evaluator
'
'  evaluates the cubic hermite function defined by  n, x, f, d  at the points
'  xe(j), j = 1 to ne.
'
'  parameters:
'     n --  (input) number of data points.  (error return if n < 2 .)
'     x --  (input) real array of independent variable values.  the elements of x must be
'           strictly increasing: x(i-1) < x(i),  i = 2(1)n. (error return if not.)
'     f --  (input) real array of function values.  f(i) is the value corresponding to x(i).
'     d --  (input) real array of derivative values.  d(i) is the value corresponding to x(i).
'     skip -(input/output) logical variable which should be set to true. if the user wishes
'           to skip checks for validity of preceding parameters, or to false otherwise. this
'           will save time in case these checks have already been performed (say, in pchim or
'           pchic). skip will be set to true on normal return.
'     ne -- (input) number of evaluation points.  (error return if ne < 1 .)
'     xe -- (input) real array of points at which the function is to be evaluated.
'           notes:
'            1. the evaluation will be most efficient if the elements of xe are increasing
'               relative to x; that is, xe(j) >= x(i) implies xe(k) >= x(i), all k >= j .
'            2. if any of the xe are outside the interval [x(1), x(n)], values are extrapolated
'               from the nearest extreme cubic, and a warning error is returned.
'     fe -- (output) real array of values of the cubic hermite function defined by  n, x, f, d
'           at the points  xe.
'     ierr -(output) error flag.
'            normal return:  ierr = 0  (no errors).
'            warning error:  ierr > 0  means that extrapolation was performed at ierr points.
'           "recoverable" errors:
'              ierr = -1  if n < 2 .
'              ierr = -3  if the x-array is not strictly increasing.
'              ierr = -4  if ne < 1. (the fe-array has not been changed in any of these cases.)
'                note: the above errors are checked in the order listed, and following arguments
'                      have "not" been validated.
'              ierr = -5  if an error has occurred in the lower-level routine chfev. this should
'                never happen.  notify the author if it does.
'
   DIM nxt(1:2)
   IF ISFALSE iskip THEN
      IF n < 2 THEN
         ierr = -1
         EXIT SUB
      END IF
      FOR i = 2 TO n
         IF x(i) <= x(i - 1) THEN
            ierr = -3
            EXIT SUB
         END IF
      NEXT i
   END IF
   IF ne < 1 THEN
      ierr = -4
      EXIT SUB
   END IF
   ierr = 0
   iskip = %true
   jfirst = 1
   ir = 2
   DO WHILE jfirst <= ne
      jump = %false
      FOR j = jfirst TO ne
         IF xe(j) >= x(ir) THEN
            jump = %true
            EXIT FOR
         END IF
      NEXT j
      IF ISTRUE jump THEN
         IF ir = n THEN j = ne + 1
      ELSE
         j = ne + 1
      END IF
      nj = j - jfirst
      IF nj <> 0 THEN
         a1 = x(ir - 1)
         a2 = x(ir)
         a2 = x(ir)
         f1 = f(ir - 1)
         f2 = f(ir)
         d1 = D(ir - 1)
         d2 = D(ir)
         CALL chfev(a1, a2, f1, f2, d1, d2, jfirst, nj, xe(), fe(), nxt(), ierc)
         IF ierc < 0 THEN
            ierr = -5
            EXIT SUB
         END IF
         IF nxt(2) > 0 THEN
            IF ir = n THEN
               ierr = ierr + nxt(2)
            ELSE
               ierr = -5
               EXIT SUB
            END IF
         END IF
         IF nxt(1) > 0 THEN
            IF ir = 2 THEN
               ierr = ierr + nxt(1)
            ELSE
               FOR i = jfirst TO j - 1
                  IF xe(i) < x(ir - 1) THEN
                     j = i
                     EXIT FOR
                  END IF
               NEXT i
               FOR i = 1 TO ir - 1
                  IF xe(j) < x(i) THEN
                     EXIT FOR
                  END IF
               NEXT i
               ir = MAX&(1, i - 1)
            END IF
         END IF
         jfirst = j
      END IF
      ir = ir + 1
      IF ir > n THEN EXIT DO
   LOOP
 END SUB

'----------------------------------------------------------------------------------------
 FUNCTION Pchia(n, x(), f(), D(), iskip, a, b, ierr) AS DOUBLE
'----------------------------------------------------------------------------------------
'  pchia:  piecewise cubic hermite integrator, arbitrary limits
'
'  evaluates the definite integral of the cubic hermite function defined by  n, x, f, d
'  over the interval <a, b>.
'
' calling sequence:
'  value = pchia (n, x, f, d, incfd, skip, a, b, ierr)
' parameters:
'  value - (output) value of the requested integral.
'     n -  (input) number of data points.  (error return if n < 2)
'     x -  (input) real array of independent variable values.  the elements of x must be
'          strictly increasing: x(i-1) < x(i), i = 2 to n.  (error return if not.)
'     f - (input) real array of function values. f(i) is the value corresponding to x(i).
'     d - (input) real array of derivative values.  d(i) is the value corresponding to x(i).
'  skip - (input/output) logical variable which should be set to true. if the user wishes to
'         skip checks for validity of preceding parameters, or to false otherwise. this will
'         save time in case these checks have already been performed (say, in pchim or pchic).
'         skip will be set to true on return with ierr = 0 or -4.
' a, b -- (input) the limits of integration.
'         note: there is no requirment that <a, b> be contained in <x(1), x(n)>.  however, the
'         resulting integral value will be highly suspect, if not.
' ierr -- (output) error flag.
'         normal return: ierr = 0  (no errors).
'         warning errors:
'            ierr = 1 if a is outside the interval <x(1), x(n)>.
'            ierr = 2 if b is outside the interval <x(1), x(n)>.
'            ierr = 3 if both of the above are true.  (note that this means that either <a, b>
'                     contains data interval or the intervals do not intersect at all.)
'         "recoverable" errors:
'            ierr = -1  if n.lt.2 .
'            ierr = -2  if incfd.lt.1 .
'            ierr = -3  if the x-array is not strictly increasing. (value has not been computed
'                       in any of these cases.)
'          note: the above errors are checked in the order listed, and following arguments have
'                not been validated.
'
   FUNCTION = 0.0#
   IF ISFALSE iskip THEN
      IF n < 2 THEN
         ierr = -1
         EXIT FUNCTION
      END IF
      FOR i = 2 TO n
         IF x(i) < x(i - 1) THEN
            ierr = -3
            EXIT FUNCTION
         END IF
      NEXT i
   END IF
   iskip = %true
   ierr = 0
   IF (a < x(1)) OR (a > x(n)) THEN ierr = ierr + 1
   IF (b < x(1)) OR (b > x(n)) THEN ierr = ierr + 2
   IF a = b THEN
      value = 0.0#
   ELSE
      xa = MIN(a, b)
      xb = MAX(a, b)
      IF xb <= x(2) THEN
         value = chfiv(x(1), x(2), f(1), f(2), D(1), D(2), a, b, ierv)
         IF ierv < 0 THEN
            ierr = -4
            EXIT FUNCTION
         END IF
      ELSEIF xa >= x(n - 1) THEN
         value = chfiv(x(n - 1), x(n), f(n - 1), f(n), D(n - 1), D(n), a, b, ierv)
         IF ierv < 0 THEN
            ierr = -4
            EXIT FUNCTION
         END IF
      ELSE
         ia = 1
         FOR i = 1 TO n - 1
            IF xa > x(i) THEN ia = i + 1
         NEXT i
         ib = n
         FOR i = n TO ia STEP -1
            IF xb < x(i) THEN ib = i - 1
         NEXT i
         ierv = 0
         IF ib < ia THEN
            value = chfiv(x(ib), x(ia), f(ib), f(ia), D(ib), D(ia), a, b, ierv)
            IF ierv < 0 THEN
               ierr = -4
               EXIT FUNCTION
            END IF
         ELSE
            IF ib = ia THEN
               value = 0.0#
            ELSE
               value = pchid(n, x(), f(), D(), iskip, ia, ib, ierd)
               IF ierd < 0 THEN
                  ierr = -5
                  EXIT FUNCTION
               END IF
            END IF
            IF xa < x(ia) THEN
               i1 = MAX&(1, ia - 1)
               ir = i1 + 1
               value = value + chfiv(x(i1), x(ir), f(i1), f(ir), D(i1), D(ir), xa, x(ia), ierv)
               IF ierv < 0 THEN
                  ierr = -4
                  EXIT FUNCTION
               END IF
            END IF
            IF xb > x(ib) THEN
               IF xb > x(ib) THEN
                  ir = MIN&(ib + 1, n)
                  i1 = ir - 1
                  value = value + chfiv(x(i1), x(ir), f(i1), f(ir), D(i1), D(ir), x(ib), xb, ierv)
                  IF ierv < 0 THEN
                     ierr = -4
                     EXIT FUNCTION
                  END IF
               END IF
            END IF
            IF a > b THEN value = -value
         END IF
      END IF
   END IF
   FUNCTION = value
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION Pchid(n, x(), f(), D(), iskip, ia, ib, ierr) AS DOUBLE
'----------------------------------------------------------------------------------------
' pchid:  piecewise cubic hermite integrator, data limits evaluates the definite integral
'         of the cubic hermite function defined by  n, x, f, d  over the interval
'         [x(ia), x(ib)].
'
' calling sequence:
'    value = pchid (n, x, f, d, skip, ia, ib, ierr)
' parameters:
'  value - (output) value of the requested integral.
'     n -  (input) number of data points.  (error return if n < 2)
'     x -  (input) real array of independent variable values. the elements of x must be
'           strictly increasing: x(i-1) < x(i), i = 2 to n. (error return if not.)
'     f - (input) real array of function values. f(i) is the value corresponding to x(i).
'     d - (input) real array of derivative values. d(i) is the value corresponding to x(i).
'  skip - (input/output) logical variable which should be set to true.
'         if the user wishes to skip checks for validity of preceding parameters, or to
'         false otherwise. this will save time in case these checks have already been
'         performed (say, in pchim or pchic). skip will be set to true on return with
'         ierr = 0 or -4.
' ia,ib - (input) indices in x-array for the limits of integration. both must be in the
'         range [1,n]. (error return if not.) no restrictions on their relative values.
'  ierr - (output) error flag.
'         normal return: ierr = 0  (no errors).
'          "recoverable" errors:
'            ierr = -1  if n < 2 .
'            ierr = -3  if the x-array is not strictly increasing.
'            ierr = -4  if ia or ib is out of range.
'            (value has not been computed in any of these cases.)
'            note:  the above errors are checked in the order listed, and following
'                   arguments have not been validated.
'
   FUNCTION = 0.0#
   IF ISFALSE iskip THEN
      IF n < 2 THEN
         ierr = -1
         EXIT FUNCTION
      END IF
      FOR i = 2 TO n
         IF x(i) < x(i - 1) THEN
            ierr = -3
            EXIT FUNCTION
         END IF
      NEXT i
   END IF
   iskip = %true
   IF (ia < 1) OR (ia > n) THEN
      ierr = -4
      EXIT FUNCTION
   END IF
   IF (ib < 1) OR (ib > n) THEN
      ierr = -4
      EXIT FUNCTION
   END IF
   ierr = 0
   IF ia = ib THEN
      value = 0.0#
   ELSE
      sum = 0.0#
      FOR i = MIN&(ia, ib) TO MAX&(ia, ib) - 1
          h = x(i + 1) - x(i)
          sum = sum + h * ((f(i) + f(i + 1)) + (D(i) - D(i + 1)) * (h / 6.0#))
      NEXT i
      value = 0.5# * sum
      IF ia > ib THEN value = -value
   END IF
   FUNCTION = value
 END FUNCTION

'----------------------------------------------------------------------------------------
  SUB Pchim (n, x(), f(), D(), ierr)
'----------------------------------------------------------------------------------------
'  pchim:  piecewise cubic hermite interpolation to monotone data.
'
'  sets derivatives needed to determine a monotone piecewise cubic hermite interpolant to
'  the data given in x and f. default boundary conditions are provided which are compatible
'  with monotonicity. (see pchic if user control of boundary conditions is desired.) if the
'  data are only piecewise monotonic, the interpolant will have an extremum at each point
'  where monotonicity switches direction.  (see pchic if user control is desired in such
'  cases.) the resulting piecewise cubic hermite function may be evaluated by pchfe or pchfd.
'
'   parameters:
'     n - (input) number of data points (error return if n < 2). if n = 2, simply does linear
'         interpolation.
'     x - (input) real array of independent variable values. the elements of x must be strictly
'         increasing: x(i-1) < x(i),  i = 2 to n (error return if not.)
'     f - (input) real array of dependent variable values to be interpolated. f(i) is value
'         corresponding to x(i).  pchim is designed for monotonic data, but it will work for
'         any f-array. it will force extrema at points where monotonicity switches direction.
'         if some other treatment of switch points is desired, pchic should be used instead.
'     d - (output) real array of derivative values at the data points. if the data are
'         monotonic, these values will determine a monotone cubic hermite function. the value
'         corresponding to x(i) is stored in d(i), i=1 to n.  no other entries in d are changed.
'  ierr - (output) error flag.
'         normal return:  ierr = 0  (no errors).
'         warning error:  ierr > 0  means that ierr switches in the direction of monotonicity
'                                   were detected.
'         "recoverable" errors:
'                         ierr = -1 if n < 2 .
'                         ierr = -3 if the x-array is not strictly increasing. (the d-array has
'                                   not been changed in any of these cases.)
'   note: the above errors are checked in the order listed, and the following arguments have
'         not been validated.
'
   IF n < 2 THEN
      ierr = -1
      EXIT SUB
   END IF
   FOR i = 2 TO n
      IF x(i) <= x(i - 1) THEN
         ierr = -3
         EXIT SUB
      END IF
   NEXT i
   ierr = 0
   nless1 = n - 1
   h1 = x(2) - x(1)
   del1 = (f(2) - f(1)) / h1
   dsave = del1
'
'  special case n=2 -- use linear interpolation.
'
   IF nless1 < 1 THEN
      D(1) = del1
      D(n) = del1
      EXIT SUB
   END IF
'
   h2 = x(3) - x(2)
   del2 = (f(3) - f(2)) / h2
   hsum = h1 + h2
   w1 = (h1 + hsum) / hsum
   w2 = -h1 / hsum
   D(1) = w1 * del1 + w2 * del2
   IF pchst(D(1), del1) <= 0.0# THEN
      D(1) = 0.0#
   ELSEIF pchst(del1, del2) < 0.0# THEN
      dmax = 3.0# * del1
      IF ABS(D(1)) > ABS(dmax) THEN
         D(1) = dmax
      END IF
   END IF
   FOR i = 2 TO nless1
      IF i <> 2 THEN
         h1 = h2
         h2 = x(i + 1) - x(i)
         hsum = h1 + h2
         del1 = del2
         del2 = (f(i + 1) - f(i)) / h2
      END IF
      D(i) = 0.0#
      IF pchst(del1, del2) < 0.0# THEN
         ierr = ierr + 1
         dsave = del2
      ELSEIF pchst(del1, del2) = 0.0# THEN
         IF del2 <> 0.0# THEN
            IF pchst(dsave, del2) < 0.0# THEN ierr = ierr + 1
            dsave = del2
         END IF
      ELSE
         hsumt3 = hsum + hsum + hsum
         w1 = (hsum + h1) / hsumt3
         w2 = (hsum + h2) / hsumt3
         dmax = MAX(ABS(del1), ABS(del2))
         dmin = MIN(ABS(del1), ABS(del2))
         drat1 = del1 / dmax
         drat2 = del2 / dmax
         D(i) = dmin / (w1 * drat1 + w2 * drat2)
      END IF
   NEXT i
   w1 = -h2 / hsum
   w2 = (h2 + hsum) / hsum
   D(n) = w1 * del1 + w2 * del2
   IF pchst(D(n), del2) < 0.0# THEN
      D(n) = 0.0#
   ELSEIF pchst(del1, del2) < 0.0# THEN
      dmax = 3.0# * del2
      IF ABS(D(n)) > ABS(dmax) THEN D(n) = dmax
   END IF
 END SUB

'----------------------------------------------------------------------------------------
 FUNCTION Pchst(arg1, arg2) AS DOUBLE
'----------------------------------------------------------------------------------------
'  pchst:  pchip sign-testing routine.
'    returns: -1. if arg1 and arg2 are of opposite sign.
'              0. if either argument is zero.
'             +1. if arg1 and arg2 are of the same sign.
'
   FUNCTION = sign(1.0#, arg1) * sign(1.0#, arg2)
   IF (arg1 = 0.0#) OR (arg2 = 0.0#) THEN FUNCTION = 0.0#
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION Sign(x, y) AS DOUBLE
'----------------------------------------------------------------------------------------
'  basic version of the fortran function sign(x, y)
'
   FUNCTION = ABS(x)
   IF y < 0.0# THEN FUNCTION = -ABS(x)
 END FUNCTION

' End of PCHIP routines
'========================================================================================
'
'----------------------------------------------------------------------------------------
  FUNCTION IcutOff(eat(), ebt(), egt(), nspec) AS LONG
'----------------------------------------------------------------------------------------
'  function determines cutoff length of decay chain
'
   ia = 1 : ib = 1 : ig = 1
   ea = eat(nspec) : eb = ebt(nspec) : eg = egt(nspec)
   IF nspec = 1 THEN
      FUNCTION = 1
      EXIT FUNCTION
   ELSE
     IF ea > 0.0# THEN                         ' cut point for alphas
       FOR i = nspec - 1 TO 1 STEP -1
          IF eat(i) < 0.99# * ea THEN
             ia = i + 1
             EXIT FOR
          END IF
       NEXT i
     END IF
'
     IF eb > 0.0# THEN                         ' cut point for electrons
       FOR i = nspec - 1 TO 1 STEP -1
          IF ebt(i) < 0.99# * eb THEN
             ib = i + 1
             EXIT FOR
          END IF
       NEXT i
     END IF
'
     IF eg >  0.0# THEN                        ' cut point for photons
       FOR i = nspec - 1 TO 1 STEP -1
          IF egt(i) < 0.99# * eg THEN
             ig = i + 1
             EXIT FOR
          END IF
       NEXT i
     END IF
   END IF
   FUNCTION = MAX&(ig, ia, ib)              ' max of the three cutpoints
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION CenterMess(a$, n) AS STRING
'----------------------------------------------------------------------------------------
'  function center text a$ in string of length n
'
   IF LEN(LTRIM$(a$)) >= n THEN
      FUNCTION = LEFT$(a$, n)
   ELSE
      tmp$ = STRING$((n - LEN(a$)) \ 2, " ") + a$
      FUNCTION = tmp$ + STRING$(n - LEN(tmp$), " ")
   END IF
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION Ibinry (Taget$) AS LONG        ' routine to find target$ nuclide
'----------------------------------------------------------------------------------------
'  function bisects file and returns record number for Taget$ in NDX file
'
   GET %indx, 1, IndHed                  ' first call read the 1st record
   l1 = VAL(IndHed.i1)                   ' to find what is the first and
   l2 = VAL(IndHed.i2)                   ' last data records.  set the
   FUNCTION = 0                          ' variable.
   DO                                    ' now start the a bisection
      itry = (l1 + l2) \ 2               ' search of the file. note it is
      GET %indx, itry, IndDat            ' sorted by nuclide field.  in
      IF IndDat.nuke < Taget$ THEN       ' less than 10 reads we will find
         l1 = itry + 1                   ' the record for the target.
      ELSEIF IndDat.nuke > Taget$ THEN   '
         l2 = itry - 1                   '
      ELSE
         FUNCTION = itry                 ' found it, return the ibinry as
         EXIT FUNCTION                   ' itry.
      END IF                             '
   LOOP WHILE l1 < l2 + 1                ' if target not found the routine
   EXIT FUNCTION                         ' returns a value of zero.
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION IZWho(ix, iy)
'----------------------------------------------------------------------------------------
'  function returns z of element under mouse cursor
'
   GfxCursor 0
   irow = CINT((CSNG(iy) - 67.)/46.5 + 0.4)
   icol = CINT((CSNG(ix) - 11.)/55.4 + 0.4)
   SELECT CASE irow
      CASE 1
         IF icol = 1 THEN
            FUNCTION = 1
            GfxCursor %chand
         ELSEIF icol = 18 THEN
            FUNCTION = 2
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE 2
         IF icol > 0 AND icol < 3 THEN
            FUNCTION = 2 + icol
            GfxCursor %chand
         ELSEIF icol > 12 AND icol < 19 THEN
            FUNCTION = 5 + icol - 13
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE 3
         IF icol > 0 AND icol < 3 THEN
            IzWho = 10 + icol
            GfxCursor %chand
         ELSEIF icol > 12 AND icol < 19 THEN
            FUNCTION = 13 + icol - 13
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE 4 TO 5
         IF icol > 0 AND icol < 19 THEN
            FUNCTION = (irow - 4) * 18 + icol + 18
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE 6
         IF icol > 0 AND icol < 4 THEN
            FUNCTION = 55 + icol - 1
            GfxCursor %chand
         ELSEIF icol > 3 AND icol < 19 THEN
            FUNCTION = 72 + icol - 4
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE 7
         IF icol > 0 AND icol < 4 THEN
            FUNCTION = 87 + icol - 1
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE 8
         IF icol > 4 AND icol < 19 THEN
            FUNCTION  = 58 + icol - 5
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE 9
         IF icol > 4 AND icol < 19 THEN
            FUNCTION  = 90 + icol - 5
            GfxCursor %chand
         ELSE
            GfxCursor 0
         END IF
      CASE ELSE
         FUNCTION = 0
         GfxCursor 0
   END SELECT
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION MsgBox(sText$, sCaption$)
'----------------------------------------------------------------------------------------
'  function print message and get user response
'
   uType = %yesno + %Applmodal
   IF LEN(sCaption$) = 0 THEN            ' if null use DEFAULT
      sCap$ = $DEFAULT_MSGBOX_CAPTION
   ELSE
      sCap$ = sCaption$
   END IF
   FUNCTION = ConsoleMessageBox(sText$ + " continue?", utype, sCap$, 0, 0)
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION RefreshWindow(BYVAL lPlaceHolder AS LONG) AS LONG
'----------------------------------------------------------------------------------------
' function refreshes graphics window every 1/4 second.
'
   DO
      SLEEP 250
      GfxRefresh 0
   LOOP
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION IzMass(Nuke$)
'----------------------------------------------------------------------------------------
'  construct unique integer key for radionuclide as f(z, A, metastable)
   ione = 0
   iz = INSTR($sym, LEFT$(Nuke$, 2))\2 + 1
   IF INSTR(MID$(Nuke$, 3), "m") > 0 THEN
      ia = ABS(VAL(MID$(Nuke$, 3, INSTR(Nuke$, "m") - 3)))
      ione = 1
   ELSEIF INSTR(MID$(Nuke$, 3), "n") > 0 THEN
      ia = ABS(VAL(MID$(Nuke$, 3, INSTR(Nuke$, "n") - 3)))
      ione = 2
   ELSEIF INSTR(MID$(Nuke$, 3), "o") > 0 THEN
      ia = ABS(VAL(MID$(Nuke$, 3, INSTR(Nuke$, "o") - 3)))
      ione = 3
   ELSE
      ia = ABS(VAL(RIGHT$(Nuke$, LEN(Nuke$) - 2)))
   END IF
   FUNCTION = iz * 10000 + ia * 10 + ione
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION InVect(clist() AS STRING *7, citem AS STRING * 7, n)
'----------------------------------------------------------------------------------------
' purpose:  function returns the index of citem in the array clist(m).
'           if citem is not in clist a zero is returned.
'
  IF n = 0 THEN
    PRINT "Error in invect, no elements in array"
    WAITKEY$
  ELSE
    FOR i = 1 TO n
      IF clist(i) = citem THEN
          FUNCTION = i
          EXIT FUNCTION
      END IF
    NEXT i
    FUNCTION = 0
  END IF
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION Timest (T AS STRING*8, ix AS STRING*2)
'----------------------------------------------------------------------------------------
'  function returns T1/2 in seconds
'
   tp = VAL(T)
   SELECT CASE TRIM$(ix)
      CASE "ys"                          ' yocto
         FUNCTION = 1D-24 * tp
      CASE "zs"                          ' zepto
         FUNCTION = 1D-21 * tp
      CASE "as"                          ' atto
         FUNCTION = 1D-18 * tp
      CASE "fs"                          ' femto
         FUNCTION = 1.0D-15 * tp
      CASE "ps"                          ' pico
         FUNCTION = 1.0D-12 * tp
      CASE "ns"                          ' nano
         FUNCTION = 1.0D-09 * tp
      CASE "us"                          ' micro
         FUNCTION = 1.0E-06 * tp
      CASE "ms"                          ' milli
         FUNCTION = 1.0E-03 * tp
      CASE "s"                           ' second
         FUNCTION = tp * 1.0#
      CASE "m"                           ' minute
         FUNCTION = 60# * tp
      CASE "h"                           ' hour
         FUNCTION = 3600# * tp
      CASE "d"                           ' day
         FUNCTION = 86400# * tp
      CASE "y"                           ' Gregorian year
         FUNCTION = 3.1556952D+07 * tp
      CASE "ky"                          ' kilo
         FUNCTION = 3.1556952D+10 * tp
      CASE "my"                          ' mega
         FUNCTION = 3.1556952D+13 * tp
      CASE "gy"                          ' giga
         FUNCTION = 3.1556952D+16 * tp
      CASE "ty"                          ' tera
         FUNCTION = 3.1556952D+19 * tp
      CASE "py"                          ' peta
         FUNCTION = 3.1556952D+22 * tp
      CASE "ey"                          ' exa
         FUNCTION = 3.1556952D+25 * tp
      CASE "zy"                          ' zetta
         FUNCTION = 3.1556952D+28 * tp
      CASE "yy"                          ' yotta
         FUNCTION = 3.1556952D+31 * tp
      CASE ELSE
         PRINT "Error in Timest; can not translate time units " + ix$
         WAITKEY$
    END SELECT
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION GetFileCount(FileSpec$) AS LONG
'----------------------------------------------------------------------------------------
'  function evaluates a file specification and returns the number of files that
'  match the specification.  Wild card characters ("*" and "?") are permitted. Drive
'  and directory path specifications may be included in filespec$.
'
   DIM FileCnt AS LOCAL INTEGER
   IF LEN(DIR$(FileSpec$)) = 0 THEN                        ' Ensure filespec is valid.
      FileCnt = 0                                          ' It's not.
   ELSE
      FileCnt = 1                                          ' It is, so count it.
      DO WHILE LEN(DIR$) > 0
         INCR FileCnt
      LOOP
   END IF
   FUNCTION = FileCnt
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION InKeyCode(sKey$) AS LONG
'----------------------------------------------------------------------------------------
'  function returns a unique integer for any key captured by Inkey$ or Waitkey$
'
   SELECT CASE LEN(skey$)
      CASE 1                                 ' Ordinary key
         FUNCTION = ASC(sKey$)
      CASE 2                                 ' Extended key
         FUNCTION = 1000 + ASC(sKey$,2)
      CASE ELSE
         FUNCTION = 0
   END SELECT
 END FUNCTION

'----------------------------------------------------------------------------------------
   FUNCTION Expf1(zlm##, t) AS EXT
'----------------------------------------------------------------------------------------
'  function returns [1.0 - exp(-lm * t)] / lm.
'
   DIM zlmt AS LOCAL EXT
   zlmt = zlm## * CEXT(t)
   IF zlmt <  1.0D-15## THEN
      FUNCTION = CEXT(t)*(1.0##-zlmt/2.0##*(1.0##-zlmt/3.0##*(1.0##-zmlt/4.0##*_
                (1.0##-zmlt/5.0##))))
   ELSE
      FUNCTION = (1.0## - EXP(-zlmt)) / CEXT(zlm##)
   END IF
 END FUNCTION

'----------------------------------------------------------------------------------------
  FUNCTION ExpFun(t##) AS EXT
'----------------------------------------------------------------------------------------
'  purpose:  routine to compute exp(t).
'
   IF t## < -229.0## THEN
      FUNCTION = 0.0##
   ELSE
      FUNCTION = EXP(t##)
   END IF
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION ResABC(Quest$, a$, b$, c$, def$) AS STRING
'----------------------------------------------------------------------------------------
'  Function attaches "([a]/b)?" or "(a/b/[c])?" to Quest$, and user's response is
'  returned as lower case.  The values of a$, b$, c$, the default (def$) passed
'  to the function must be lower case. If c$ = "#" then the option is a/b.
'
   tex$ = Quest$ + " ("
   IF def$ = a$ THEN
      tex$ = tex$ + "[" + a$ + "]/"
   ELSE
      tex$ = tex$ + a$ + "/"
   END IF
   IF def$ = b$ THEN
      tex$ = tex$ + "[" + b$ + "]"
   ELSE
      tex$ = tex$ + b$
   END IF
   IF c$ <> "#" THEN
      IF def$ = c$ THEN
         tex$ = tex$ + "/[" + c$ + "])? "
      ELSE
         tex$ = tex$ + "/" + c$ + ")? "
      END IF
   ELSE
      tex$ = tex$ + ")? "
   END IF
   icol = LEN(tex$) + 1
   irow = CURSORY
   LOCATE irow
   PRINT tex$; def$         ' print question & default response
   DO
      iok = %true
      LOCATE irow, icol
      INPUT Resp$
      IF LEN(TRIM$(Resp$)) = 0 THEN Resp$ = def$
      Resp$ = LCASE$(Resp$)
      IF Resp$ = a$ OR Resp$ =  b$ OR Resp$ = c$ THEN
         irow = CURSORY
         PRINT STRING$(50, " ")
         LOCATE irow
         FUNCTION = Resp$
      ELSE
         iok = %false
         PRINT " Incorrect response, try again.";
         LOCATE irow, icol
         PRINT STRING$(10, " ")
      END IF
   LOOP WHILE ISFALSE iok
 END FUNCTION

'------------------------------------------------------------------------------
 FUNCTION GetResourceBitMapSize (szBM AS ASCIIZ, nWidth&, nHeight&) AS LONG
'------------------------------------------------------------------------------
   LOCAL pBM AS tagBitMap PTR, hInst AS LONG, lres AS LONG, lres2 AS LONG
   FUNCTION = %FALSE                                        ' default = fail
   hInst = GetModuleHandle ("")                             ' resource in this module
   lRes  = FindResource(hInst, szBM, BYVAL %RT_BITMAP)
   IF lRes  THEN lRes2 = LoadResource(hInst, lRes)          ' if found, load the BMP
   IF lRes2 THEN pBM = LockResource(lRes2)                  ' lock to get a pointer
   IF pBM  THEN                                             ' to the BMP file
      nWidth&  = @pBM.BmWidth
      nHeight& = @pBM.bmHeight
      FUNCTION  =  %TRUE                                    ' SUCCESS!!
   END IF
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION CRC32(BYVAL dwOffset AS DWORD, dwLen AS DWORD) AS DWORD
'----------------------------------------------------------------------------------------
' CRC32, by Wayne Diamond, 9th December 2002. For PBCC/PBWIN
' Usage: dwHash = CRC32(BYVAL STRPTR(Buffer), BYVAL LEN(Buffer))
#REGISTER NONE
 ! mov esi, dwOffset  ;esi = ptr to buffer
 ! mov edi, dwLen     ;edi = length of buffer
 ! mov ecx, -1        ;ecx = -1
 ! mov edx, ecx       ;edx = -1
 nextbyte:           ';next byte from buffer
 ! xor eax, eax       ;eax = 0
 ! xor ebx, ebx       ;ebx = 0
 ! lodsb              ;get next byte
 ! xor al, cl         ;xor al with cl
 ! mov cl, ch         ;cl = ch
 ! mov ch, dl         ;ch = dl
 ! mov dl, dh         ;dl = dh
 ! mov dh, 8          ;dh = 8
 nextbit:            ';next bit in the byte
 ! shr bx, 1          ;shift bits in bx right by 1
 ! rcr ax, 1          ;(rotate through carry) bits in ax by 1
 ! jnc nocarry        ;jump to nocarry if carry flag not set
 ! xor ax, &h08320    ;xor ax with 33568
 ! xor bx, &h0EDB8    ;xor bx with 60856
 nocarry:            ';if carry flag wasn't set
 ! dec dh             ;dh = dh - 1
 ! jnz nextbit        ;if dh isnt zero, jump to nextbit
 ! xor ecx, eax       ;xor ecx with eax
 ! xor edx, ebx       ;xor edx with ebx
 ! dec edi            ;finished with that byte, decrement counter
 ! jnz nextbyte       ;if edi counter isnt at 0, jump to nextbyte
 ! not edx            ;invert edx bits - 1s complement
 ! not ecx            ;invert ecx bits - 1s complement
 ! mov eax, edx       ;mov edx into eax
 ! rol eax, 16        ;rotate bits in eax left by 16 places
 ! mov ax, cx         ;mov cx into ax
 ! mov FUNCTION, eax  ;crc32 result is in eax
 END FUNCTION
