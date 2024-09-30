[Setup]
AppName=Rad Toolbox
AppVerName=Rad Toolbox v 3.0.0
DefaultDirName={pf}\Rad_Toolbox
DefaultGroupName=Rad Toolbox
disableprogramgrouppage=yes
UninstallDisplayIcon={app}\Rtoolbox.exe
PrivilegesRequired=admin

[Dirs]
Name: "{app}\temp"
Name: "{app}\results"

[Files]
; begin VB system files - per Inno Setup Knowlede Base
; (Note: Scroll to the right to see the full lines!)
Source: vb6\stdole2.tlb;       DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regtypelib
Source: vb6\msvbvm60.dll;      DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: vb6\oleaut32.dll;      DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: vb6\olepro32.dll;      DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: vb6\asycfilt.dll;      DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile
Source: vb6\comcat.dll;        DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
; end VB system files


Source: sys\comdlg32.ocx;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\CSOPT32.OCX;       Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\DFORRT.DLL;        Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\expsrv.dll;        Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\GRAPHS32.OCX;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\GSW32.EXE;         Destdir: {sys}; Flags:
Source: sys\GSWAG32.DLL;       Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\GSWDLL32.DLL;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\GSPROP32.DLL;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\ltdis13n.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\ltefx13n.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\ltfil13n.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\ltkrn13n.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\mfc42.dll;         Destdir: {sys}; Flags: onlyifdoesntexist regserver allowunsafefiles
Source: sys\MSCOMCTL.OCX;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\mshflxgd.ocx;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\msjet40.dll;       Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msjint40.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msjter40.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msjtes40.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msrd2x40.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msrd3x40.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msrepl40.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msstdfmt.dll;      Destdir: {sys}; Flags: restartreplace sharedfile regserver allowunsafefiles
Source: sys\MSVCIRT.DLL;       Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\msvcrt.dll;        Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\MSVCRTD.DLL;       Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\mswdat10.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\mswstr10.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\odbc32.dll;        Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
; Source: sys\RICHED32.DLL;      Destdir: {sys}; Flags: allowunsafefiles
Source: sys\RICHTX32.OCX;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\sysinfo.ocx;       Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\TABCTL32.OCX;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\tdbg8.ocx;         Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\tdbgpp8.dll;       Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\VB5DB.DLL;         Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\vbajet32.dll;      Destdir: {sys}; Flags: onlyifdoesntexist allowunsafefiles
Source: sys\vsprint8.ocx;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\vsdraw8.ocx;       Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\vsvport8.ocx;      Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\vspdf8.ocx;        Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\vsrpt8.ocx;        Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\xadb8.ocx;         Destdir: {sys}; Flags: restartreplace sharedfile regserver
Source: sys\dao360.dll;        Destdir: {cf}\Microsoft Shared\DAO; Flags:
;
; toolbox text display files
Source: texts\*.*;             Destdir: {app}\TextDisplays
;
; help files
Source: help\*.*;              Destdir: {app}\help
;
; equation
Source: equations\*.*;         Destdir: {app}\equations

; toolbox data files
Source: data\*.mdb ;           Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.dat;            Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.RBS;            Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.NDX;            Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.txt;            Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.rad;            Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.bet;            Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.drt;            Destdir: {app}\data    ;  Flags: replacesameversion
Source: data\*.pdf;            Destdir: {app}\data    ;  Flags: replacesameversion
;
Source: Rtoolbox.exe;          Destdir: {app}         ;  Flags: replacesameversion
Source: CheckCRC.exe;          Destdir: {app}         ;  Flags: replacesameversion
Source: BinBeta.exe;           Destdir: {app}         ;  Flags: replacesameversion
Source: ChainDll.dll;          Destdir: {app}         ;  Flags: replacesameversion
Source: Tools.ico;             Destdir: {app}         ;  Flags: replacesameversion
Source: ReadMe.txt;            Destdir: {app}         ;  Flags: isreadme

[Icons]
Name: {commondesktop}\Rad Toolbox; Filename: {app}\Rtoolbox.exe; WorkingDir: {app}; IconFilename: "{app}\Tools.ico"

[Run]
Filename: {app}\CheckCRC.EXE; 
