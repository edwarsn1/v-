#COMPILE EXE
DEFLNG i-n
DEFDBL a-h, o-z

FUNCTION PBMAIN () AS LONG
    LOCAL f AS STRING
    LOCAL D AS DIRDATA
    LOCAL t AS IPOWERTIME
    t = CLASS "PowerTime"
    CHDIR "sys"
    f = DIR$("*.*", TO D)
    i = 1
    t.FileTime = d.CreationTime
    PRINT i; f; " "; t.Filetime
'    t.DateString = d.CreationTime
'    PRINT i; f; " "; t.DateString
    WAITKEY$
    DO
        f = DIR$
        IF LEN(F) = 0 THEN EXIT DO
        INCR i
        t.FileTime = d.CreationTime
        PRINT i; f; " "; t.Filetime
    LOOP
    WAITKEY$
END FUNCTION
