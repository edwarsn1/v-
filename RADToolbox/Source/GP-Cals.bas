'========================================================= GP-Cals.BAS
' Program to calculate the coefficients for the GP approximation of
' the photon buildup in materials
' Based on methods of
' GS Sidhu et al. Rad. Prot. Dosi. 86(3):207-216 (1999).
' GS Sidhu et al. J. Raddio. Prot. 20:53-68 (2000)
' K.F. Eckerman, ORNL  May 18, 2006
'
%MAXMENUBUFFER = 64
%xblack = 0 : %xblue = 1 : %xyellow = 14 : %xwhite = 7  : %xGreen = 2
%xCyan = 3  : %xRed = 4  : %xMAGENTA = 5 : %xBROWN = 6  : %xBright = 8
%xLBlue = 9 : %true = -1 : %false = NOT %true
%nelements = 23
%nquery = 10
'
' GeoProg.mdb contains GP coefficients (5 coefficients) at 25 energies for
' 23 elements.
'
$Title = "GP Coefficients for Photon Buildup in Materials"
$Ref = " Ref.: G S Sidhu et al. J. Raddio. Prot. 20:53-68 (2000)."
$Message = "Put somthing here..."
#REGISTER NONE
#INCLUDE "c:\SQLTOOLS\SQLT_PRO.INC"
#INCLUDE "c:\CONTOOLS\CT_PRO.INC"
#INCLUDE "c:\pbcc40\basinc\pchip.inc"

DECLARE FUNCTION tanh(a#) AS DOUBLE
DECLARE FUNCTION Selectem(a$(), b&) AS STRING
DECLARE FUNCTION Zfun(a#, b#, c#, d#, e#) AS DOUBLE
DECLARE FUNCTION Zfun1(a#, b#, c#, d#, e#) AS DOUBLE
 DEFLNG I-N
 DEFDBL A-H, O-Z
'---------------------------------------------------------------
 FUNCTION WINMAIN(BYVAL hCurInstance  AS LONG, _
                  BYVAL hPrevInstance AS LONG, _
                  BYVAL lpszCmdLine   AS ASCIIZ PTR, _
                  BYVAL nCmdShow      AS LONG)EXPORT AS LONG
'---------------------------------------------------------------
   CONSOLE NAME $Title
   ConsoleToolsAuthorize &h4EAB7F24
   InitConsoleTools hCurInstance, %MAXMENUBUFFER, 0, 0, 0, 0
   ConsoleMove %DESKTOP_CENTER, %DESKTOP_CENTER
   SQL_Authorize &h4EAB7F24
   IF SQL_Init <> %SUCCESS THEN
      SQL_Msgbox "SQL TOOLS INIT FAILURE", %MSGBOX_OK
      EXIT FUNCTION
   END IF
   DIM query(1 TO %nquery) AS GLOBAL STRING
   DIM Chem$(1 TO 20), WFract(1 TO 20)
   DIM GP_Parm(23, 25, 5), Xcross(23, 25), XMatRatio(25)
   DIM GP_Mat(25, 5)
'
   COLOR %xWhite + %xBright, %xBlue
   MOUSE 7, DOUBLE, UP
   MOUSE ON
   DIM Material$(1 TO 200), Eg(25), Zelem(25), Chx$(25)
'
'  Start getting material and xcross data
'
   CALL GetElemGP(Zelem(), Chx$(), nx)                      ' Get elements w GP coefficients
   CALL GetGParms(Eg(), GP_Parm(), Chx$(), nx, ne)          ' Get the coefficients
   CALL GetXCross(Zelem(), Eg(), Chx$(), Xcross(), nx, ne)  ' Get photon Xsection for elements
'
   nmat = 0
   CALL GetMatList(Material$(), nmat)           ' Get list of materials in material.mdb
   iselect = 0
'
   DO                                           ' Start loop over user query
      MatSel$ = Selectem(Material$(), iselect)  ' select a material
      IF iselect = 0 THEN
         IF SQL_ErrorPending THEN
            SQL_MsgBox SQL_ErrorQuickAll, %MSGBOX_OK
         END IF
         SQL_SetOptionStr(%OPT_MY_PROGRAM, "GP Coefficient for Materials")
         SQL_Shutdown
         EXIT FUNCTION
      ELSE
         PRINT MatSel$
         nel = 0
         CALL GetMatComp(MatSel$, Chem$(), WFract(), nel) ' get the composition info for material
         xsum = 0.0
         PRINT "Element Weight Fraction"
         FOR i = 1 TO nel
            PRINT USING$(" \ \    ##.#### ",Chem$(i), WFract(i))
            xsum = xsum + WFract(i)
         NEXT i
         PRINT USING$(" Sum  = ##.####", xsum)
         IF xsum < 0.99 OR Xsum > 1.01 THEN
            PRINT "Warning: Possible material balance problem."
            WAITKEY$
         END IF
'
'        now get the photon cross section information for the material
'        and then calculate the GP parameters (GP_Mat()) for the material
'
         CALL GetMatXCross(Chem$(), WFract(), Eg(), XMatRatio(), MatSel$, nel, ne)
         CALL CalGPParameters(Eg(), XMatRatio(), MatSel$, ne, GP_Parm(), GP_Mat(),_
                              Xcross(), Zelem(), nx)
         CALL Builup(Eg(), GP_Mat(), MatSel$, ne)
         PRINT
         PRINT "Press any key to continue...";
         WAITKEY$
      END IF
      IF iselect = nmat THEN iselect = 0
   LOOP
 END FUNCTION

'---------------------------------------------------------------
 SUB GetMatList(Material$(), n)
'---------------------------------------------------------------
'
   SQL_OpenDB "Data\material.DSN"
   SQL_SetOptionSInt %OPT_TEXT_MAXLENGTH, 60
   Work$ = "SELECT * FROM MatNames "
   SQL_Stmt %SQL_STMT_IMMEDIATE, work$
   DO
      SQL_Fetch %NEXT_ROW
      IF SQL_EOD THEN EXIT DO
      n = n + 1
      Material$(n) = SQL_ResColText(1)
   LOOP
   SQL_CloseDB              ' close the database
 END SUB

'---------------------------------------------------------------
 SUB GetMatComp(Matx$, Chem$(), WFract (), n)
'---------------------------------------------------------------
'
   SQL_OpenDB "Data\material.DSN"
   SQL_SetOptionSInt %OPT_TEXT_MAXLENGTH, 60
   Work$ = "SELECT * FROM [" + Matx$ +"]"
   n = 0
   IF SQL_Stmt(%SQL_STMT_IMMEDIATE, work$) = %SUCCESS THEN
      DO
         SQL_Fetch %NEXT_ROW
         lResult = SQL_FetchPos
         IF SQL_EOD THEN EXIT DO
         n = n + 1
         Chem$(n) = SQL_ResColText(2)
         WFract (n) = VAL(SQL_ResColText(3))
      LOOP
   ELSE
      PRINT "Not able to access table: "; Matx$
      WAITKEY$
   END IF
   SQL_CloseDB   'close the database
 END SUB

'---------------------------------------------------------------
 SUB GetElemGP (Zelem (), Chx$(), n)
'---------------------------------------------------------------
   SQL_OpenDB "Data\GeoProg.DSN"
   Work$ = "SELECT * FROM Elements "
   SQL_Stmt %SQL_STMT_IMMEDIATE, work$
   DO
      SQL_Fetch %NEXT_ROW
      IF SQL_EOD THEN EXIT DO
      n = n + 1
      Zelem (n) = VAL(SQL_ResColText(1))
      Chx$(n) = SQL_ResColText(2)
   LOOP
   SQL_CloseDB                    ' close database
 END SUB

'---------------------------------------------------------------
 SUB GetXCross(Zelem (), Eg (), Chx$(), Xcross (), nel, ne)
'---------------------------------------------------------------
   SQL_OpenDB "Data\Photon.DSN"
   sResult$ = SQL_DBInfoStr(%DB_TABLE_TERM)
   OPEN "Xsect.txt" FOR OUTPUT AS #3
   FOR i = 1 TO nel
      jstart = 1
      Work$ = "SELECT * FROM [" + Chx$(i) + "]"
      IF SQL_Stmt(%SQL_STMT_IMMEDIATE, work$) = %SUCCESS THEN
         PRINT #3, "Element "; Chx$(i); USING$(" ###", Zelem (i))
         DO
            SQL_Fetch %NEXT_ROW
            lResult = SQL_FetchPos
            IF SQL_EOD THEN EXIT DO
            FOR j = jstart TO ne
               Ex  = VAL(SQL_ResColText(1))
               Ratio  = Eg (j)/ Ex
               IF Ratio  > 0.99 AND Ratio  < 1.01 THEN
                  Xcross (i, j) = VAL(SQL_ResColText(3))/VAL(SQL_ResColText(8))
                  jstart = j + 1
                  PRINT #3, USING$("##.### ##.#### ##.#### ##.####", Eg (j), VAL(SQL_ResColText(3)),VAL(SQL_ResColText(8)), Xcross (i, j))
                  EXIT FOR
               END IF
            NEXT j
            IF j = ne THEN EXIT DO
         LOOP
      ELSE
         PRINT "Not able to access table: "; Matx$
         WAITKEY$
      END IF
   NEXT i
   CLOSE #3
   SQL_CloseDB   'close the database
 END SUB

'---------------------------------------------------------------
 SUB GetGParms (Eg (), GP_Parm (), Chx$(), nel, ne)
'---------------------------------------------------------------
   SQL_OpenDB "Data\GeoProg.DSN"
   FOR i = 1 TO nel
      Work$ = "SELECT * FROM [" + Chx$(i) + "]"
      ne = 0
      IF SQL_Stmt(%SQL_STMT_IMMEDIATE, work$) = %SUCCESS THEN
         DO
            SQL_Fetch %NEXT_ROW
            lResult = SQL_FetchPos
            IF SQL_EOD THEN EXIT DO
            ne = ne + 1
            IF i = 1 THEN Eg (ne) = VAL(SQL_ResColText(2))
            FOR j = 1 TO 5
               GP_Parm (i, ne, j) = VAL(SQL_ResColText(j + 2))
            NEXT j
         LOOP
      ELSE
         PRINT "Not able to access table: "; Matx$
         WAITKEY$
      END IF
   NEXT i
   SQL_CloseDB   'close the database
 END SUB

'---------------------------------------------------------------
 FUNCTION Selectem(Material$(), iselect) AS STRING
'---------------------------------------------------------------
   IF iselect = n THEN iselect = 0
   iselect = VAL(ConsoleListBox(4, %CONSOLE_CENTER, 0, _
              "Select material of interest.", _
              "Radtool Box Material Database", _
              material$(), iselect+1, %RETURN_INDEX, 0))
   IF iselect = 0 THEN
      FUNCTION = " "
   ELSE
      FUNCTION = material$(iselect)
   END IF
 END FUNCTION

'------------------------------------------------------------------------------
 SUB GetMatXCross(Chem$(), WFract (), Eg (), XMatRatio (), MatSel$, nel, ne)
'------------------------------------------------------------------------------
'  Routine to compute the ratio of the compton scatter cross-section to the total
'  for the material
'
   DIM Fraction (ne, 2)
   FOR i = 1 TO ne
      Fraction (i, 1) = 0.0
      Fraction (i, 2) = 0.0
      XMatRatio (i) = 0.0
   NEXT i
   SQL_OpenDB "Data\Photon.DSN"
   sResult$ = SQL_DBInfoStr(%DB_TABLE_TERM)
   FOR i = 1 TO nel
      jstart = 1
      Work$ = "SELECT * FROM [" + Chem$(i) + "]"
      IF SQL_Stmt(%SQL_STMT_IMMEDIATE, Work$) = %SUCCESS THEN
         DO
            SQL_Fetch %NEXT_ROW
            IF SQL_EOD THEN EXIT DO
'            print jstart;SQL_ResColText(1)
            Ex  = VAL(SQL_ResColText(1))
            IF Ex  > Eg (ne) THEN EXIT DO
            FOR j = jstart TO ne
               ratio  = Eg (j)/Ex
               IF Ratio  > 0.999 AND Ratio  < 1.001 THEN
                  Fraction (j, 1) = Fraction (j, 1) + WFract (i) * VAL(SQL_ResColText(3))
                  Fraction (j, 2) = Fraction (j, 2) + WFract (i) * VAL(SQL_ResColText(8))
                  jstart = j + 1
                  EXIT FOR
               END IF
            NEXT j
            IF j = ne THEN EXIT DO
         LOOP
      ELSE
         PRINT "GetMatXCross: ";Work$
         PRINT "GetMatXCross: Not able to access the table: "; Chem$(i)
         WAITKEY$
      END IF
   NEXT i
   PRINT "Xcross Ratios for "; MatSel$
   FOR j = 1 TO ne
      XMatRatio (j) = Fraction (j, 1) / Fraction (j, 2)
      PRINT USING$("###.### ##.###^^^^ ##.###^^^^ ##.###^^^^", _
            Eg(j), Fraction(j, 1), Fraction(j, 2), XMatRatio(j))
   NEXT j
   SQL_CloseDB   'close the database
 END SUB

'---------------------------------------------------------------
 SUB CalGPParameters(Eg(), XMatRatio(), MatSel$, ne, GP_Parm(), _
                     GP_Mat(), Xcross(), Zelem(), nel)
'---------------------------------------------------------------
   FOR j = 1 TO ne
      R = XMatRatio(j)
      zeq = 0.0
      FOR i = 2 TO nel
         IF R > 0.999999# THEN
            IF R => Xcross(i-1,j) THEN
               zeq = Zelem(i-1)
               EXIT FOR
            END IF
         ELSEIF R => Xcross(i-1, j) AND R =< Xcross(i, j) THEN
            zeq = zfun(Zelem(i-1), Zelem(i), Xcross(i-1, j), Xcross(i, j), R)
            FOR k = 1 TO 5
               GP_mat(j, k) = zfun1(Zelem(i-1), Zelem(i), GP_Parm(i-1,j,k), GP_Parm(i,j,k), zeq)
            NEXT k
            EXIT FOR
         ELSEIF R >= Xcross(i, j) AND R =< Xcross(i-1,j) THEN
            zeq = zfun(Zelem(i), Zelem(i-1), Xcross(i, j), Xcross(i-1, j), R)
            FOR k = 1 TO 5
               GP_mat(j, k) = zfun1(Zelem(i), Zelem(i-1), GP_Parm(i,j,k), GP_Parm(i-1,j,k), zeq)
            NEXT k
            EXIT FOR
         END IF
      NEXT i
   NEXT j
   PRINT
   PRINT " GP Parameters of Photon Buildup in "; MCASE$(MatSel$)
   PRINT " E(MeV)   b       c       a      Xk       d"
   FOR i = 1 TO ne
      PRINT USING$("##.###", Eg(i));
      FOR j = 1 TO 5
         PRINT USING$(" ##.####", GP_Mat(i,j));
      NEXT j
      PRINT ""
   NEXT i
 END SUB

'---------------------------------------------------------------
 SUB Builup(E_MeV(), GP_Coeff(), Table$, ne)
'---------------------------------------------------------------
    DIM X(9) AS DOUBLE
    DIM zk AS DOUBLE
    DIM bup AS DOUBLE
    DIM ztanh2 AS DOUBLE
    DIM arg AS DOUBLE
    DIM i AS LONG
    DIM j AS LONG
    ztanh2 = tanh(-2.0)
    x(1) = 0.5: x(2) = 1.0: x(3) = 2.0: x(4) = 4.0: x(5) = 8.0
    x(6) = 10.0: x(7) = 20.0: x(8) = 40.0: x(9) = 60.0
    FileOut$ = Table$ + ".DAT"
    OPEN FileOut$ FOR OUTPUT AS #9
    CLS
    PRINT
    PRINT TAB(2) Symbol$ + ": " + Table$
    PRINT
    PRINT #9, TAB((80-LEN(Table$))\2) Table$
    PRINT #9, "E/MuR";
    FOR i = 1 TO 9
       PRINT #9, USING$(" ####.## ", x(i));
    NEXT i
    PRINT #9, ""
    FOR i = 1 TO  ne
       PRINT #9, USING$("##.## ", E_MeV(i));
       FOR j = 1 TO 9
          arg = x(j)/GP_Coeff(i, 4) -2.0#
          zk = GP_Coeff(i,2) * x(j)^GP_Coeff(i, 3) + _
               GP_Coeff(i, 5) * (tanh(arg) - ztanh2)/(1.0# - ztanh2)
          IF zk = 1.0# THEN
             bup = (GP_Coeff(i, 1) - 1.0#) * x(j)
          ELSE
             bup = (GP_Coeff(i, 1) - 1.0#) * (zk^x(j) - 1.0#)/(zk - 1.0#)
          END IF
          bup = 1.0# + bup
          PRINT #9, USING$("##.##^^^^", bup);
       NEXT j
       PRINT #9, ""
    NEXT i
    CLOSE #9
 END SUB

'---------------------------------------------------------------
 FUNCTION Zfun(Z1, Z2, R1, R2, R) AS DOUBLE
'---------------------------------------------------------------
'
   FUNCTION = (z1 * LOG(R2/R) + z2 * LOG(R/R1)) / LOG(R2/R1)

 END FUNCTION

'---------------------------------------------------------------
 FUNCTION Zfun1(Z1, Z2, R1, R2, Z) AS DOUBLE
'---------------------------------------------------------------
'
 FUNCTION = R1 + (R2-R1)/(Z2-Z1) * (Z-Z1)

 END FUNCTION

'---------------------------------------------------------------
 FUNCTION tanh(x#) AS DOUBLE
'---------------------------------------------------------------
    FUNCTION = (EXP(x#) - EXP(-x#))/(EXP(x#) + EXP(-x#))
 END FUNCTION
