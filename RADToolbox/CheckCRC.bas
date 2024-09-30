#COMPILE EXE
 $data = "Data\"
 %xBlack = 0   : %xblue = 1     : %xYellow = 14 : %xWhite = 15
 $Title = "CRC Check of Toolbox Data Files,   K.F. Eckerman, ORNL"
 %true = -1  : %false = NOT %true
 $FileTXT = "ToolChk.TXT"       ' results of current CRC check
 $Delimiter = "|"
 %MAX_PATH = 260
 %NULL = 0
 %SW_SHOWNORMAL = 1
'
 DECLARE FUNCTION ShellExecute LIB "SHELL32.DLL" ALIAS "ShellExecuteA" (BYVAL hwnd AS DWORD, _
                  lpOperation AS ASCIIZ, lpFile AS ASCIIZ, lpParameters AS ASCIIZ, _
                  lpDirectory AS ASCIIZ, BYVAL nShowCmd AS LONG) AS DWORD
 DEFLNG i-n
 DEFDBL a-h, o-z
'----------------------------------------------------------------------------------------
 FUNCTION PBMAIN () AS LONG
'---------------------------------------------------------------------------------------- EGRID.DAT|569C5803
   CONSOLE NAME $Title
   CONSOLE GET SIZE TO w&, h&
   DESKTOP GET CLIENT TO ncWidth&, ncHeight&
   DESKTOP GET LOC TO x&, y&
   CONSOLE SET LOC x& + (ncWidth& - w&) \ 2, y& + (ncHeight& - h&) \ 2
   CONSOLE GET SCREEN TO ncRows&, ncColumns&
   DIM CRC AS DWORD, Buffer AS STRING
   LOCAL zText AS ASCIIZ * %MAX_PATH
   COLOR %xYellow, %xblue
   CLS
   PRINT
   PRINT " Checking Rad Toolbox Data File Integrity" + STRING$(25, " ") + DATE$
   MOUSE 3, DOUBLE, DOWN
   MOUSE ON
'
'       Data File | CRC values
   DATA "ADOSES.MDB|A61DB36A"
   DATA "ALPHA.MDB|B69E0196"
   DATA "BIOASSAY.MDB|CCC0AA45"
   DATA "BIOPUBLIC.MDB|001724B8"
   DATA "ELECTRON.MDB|E0306C21"
   DATA "ELEMENT.MDB|25D22ABC"
   DATA "FGR12.MDB|75B707C8"
   DATA "GEOPROG.MDB|982BB8FD"
   DATA "ICRP68.MDB|9A11F28B"
   DATA "ICRP72.MDB|A706C048"
   DATA "ICRP_89.MDB|3F3D858D"
   DATA "KERMAN.MDB|E0B1490D"
   DATA "KERMAP.MDB|8EC34AB1"
   DATA "MATERIAL.MDB|E36D9C5A"
   DATA "NEUTRONFIELD.MDB|7DA04BCD"
   DATA "ORGANMASSES.MDB|092C3DB8"
   DATA "PHOTON.MDB|CC9C2617"
   DATA "PHOTONFIELD.MDB|B130BF06"
   DATA "RISK.MDB|3937DADF"
   DATA "ICRP07-INDEX.MDB|406D1A52"
   DATA "ICRP-07.BET|BE4E22BF"
   DATA "ICRP-07.NDX|D496857D"
   DATA "ICRP-07.RAD|4C1536A2"
   DATA "LICENSE.TXT|CDBEEE00"
   DATA "FGR13CD.NDX|AA94DC55"
   DATA "FGR13EXT.RBS|F9B7BBBD"
   DATA "FGR13ING.RBS|CCE90474"
   DATA "FGR13INH.RBS|254CDC8D"
   DATA "INHDOSE.DRT|DEA831FE"
   DATA "GAMMACNS.TXT|54553EEB"
   DATA "REFS.TXT|F3225208"
   DATA "MISC.DAT|2306203B"
   DATA "EOF|Done"
'
    ierr = 0
    i = 0
    icol = 3
    irow = 4
    COLOR %xWhite
    OPEN $FileTXT FOR OUTPUT AS #2
    PRINT #2, ""
    PRINT #2, " CRC check of toolbox data files:  " + DATE$
    PRINT #2, ""
    PRINT #2, " File             Status"
    PRINT #2, STRING$(24, "-")
'
    DO
       INCR i
       Ls$ = READ$(i)
       IF INSTR(Ls$, "EOF|Done") > 0 THEN EXIT DO
       ip = INSTR(Ls$, $Delimiter) - 1
       FileIn$ = LEFT$(Ls$, ip)
       Cval$ = MID$(Ls$, ip+2)
       Filex$ = $data + FileIn$
       IF LEN(DIR$(Filex$)) = 0 THEN
           PRINT
           PRINT
           COLOR %xYellow
           PRINT " Unable to find the file " + TRIM$(FileIn$)+ ". This is a fatal error."
           PRINT " It is necessary to abort and reinstall the software."
           PRINT
           PRINT #3, " Unable to find the file " + TRIM$(FileIn$)+ ". This is a fatal error."
           PRINT #3, " It is necessary to abort and reinstall the software."
           PRINT #3, " Left click mouse or press any key to abort ...";
           iabort = %true
           CON.WAITKEY$
           COLOR %xWhite
           CLOSE
           EXIT FUNCTION
       END IF
       LOCATE irow, icol-1
       PRINT "*o";
       icol = CURSORX
       OPEN Filex$ FOR BINARY LOCK SHARED AS #1
       GET$ #1, LOF(#1), Buffer
       CLOSE #1
       CRC = CRC32(BYVAL STRPTR(Buffer), BYVAL LEN(Buffer))
       IF HEX$(CRC,8) <> Cval$ THEN
           LOCATE irow + 3, 2
           PRINT FileIn$; " maybe corrupted; CRC was "; HEX$(CRC,8)
           PRINT #2, FileIn$; STRING$(18 - LEN(FileIn$), " "); " BAD"
           INCR ierr
           PRINT
           COLOR %xYellow
           PRINT " Left click mouse or press any key to continue...";
           WAITKEY$
           LOCATE irow + 3, 1
           PRINT STRING$(55, " ")
           PRINT STRING$(55, " ")
           PRINT STRING$(55, " ")
           COLOR %xWhite
       ELSE
           PRINT #2, FileIn$; STRING$(18 - LEN(FileIn$), " "); "Valid"
       END IF
'       print FileIn$ + $Delimiter + Hex$(CRC, 8)
    LOOP
    CLOSE
    LOCATE 19, 1
    IF ierr = 0 THEN
        PRINT " Integrity of"; i-1; "data files confirmed."
    ELSE
        PRINT " Integrity issue with"; ierr; " file(s)."
        PRINT " Reinstall the software to resolve this issue."
    END IF
'
    zText = $FileTXT
    ShellExecute BYVAL %Null, "open", zText, BYVAL %Null, BYVAL %Null, %SW_SHOWNORMAL
    LOCATE irow, icol-1
    PRINT "*"
    PRINT
    COLOR %xYellow
    PRINT " Left click mouse or press any key to exit ...";
    WAITKEY$
'    COLOR %xWhite
'    IF LEN($FileTXT) > 0 THEN KILL $FileTXT
 END FUNCTION

'----------------------------------------------------------------------------------------
 FUNCTION CRC32(BYVAL dwOffset AS DWORD, dwLen AS DWORD) AS DWORD
'----------------------------------------------------------------------------------------
' CRC32, by Wayne Diamond, 9th December 2002. For PBCC/PBWIN
 ! mov esi, dwOffset  ;esi = ptr to buffer
 ! mov edi, dwLen     ;edi = length of buffer
 ! mov ecx, -1        ;ecx = -1
 ! mov edx, ecx       ;edx = -1
 nextbyte:           ';next byte from butter
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
