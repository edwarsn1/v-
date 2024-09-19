Attribute VB_Name = "Module1"
Option Explicit
Sub Main()
  Dim wsICRP38 As Workspace
  Dim dbICRP38 As Database, tabRad As TableDef, fldRad(7) As Field, _
    rsICRP As Recordset
  Dim Nuclide As String, Infile As String
  Dim numRads As Integer, I As Integer, row, col
  Dim RadType As Integer, Edata(8) As Double
  
  On Error GoTo ErrLine
  Set wsICRP38 = DBEngine.Workspaces(0)
  Set dbICRP38 = wsICRP38.OpenDatabase("d:\rad_toolbox\vb\data\photon.mdb")
  Infile = "d:\rad_toolbox\photon\photon.trim"
  Open Infile For Input As #10
  While Not EOF(10)
    Input #10, Nuclide, numRads
    Set tabRad = dbICRP38.CreateTableDef(Nuclide)
    Set fldRad(0) = tabRad.CreateField("Photon Energy", dbDouble)
    Set fldRad(1) = tabRad.CreateField("Scattering - Coherent", dbDouble)
    Set fldRad(2) = tabRad.CreateField("Scattering - Incoherent", dbDouble)
    Set fldRad(3) = tabRad.CreateField("Photo-Electric Absorption", dbDouble)
    Set fldRad(4) = tabRad.CreateField("Pair Production in Nuclear Field", dbDouble)
    Set fldRad(5) = tabRad.CreateField("Pair Production in Electron Field", dbDouble)
    Set fldRad(6) = tabRad.CreateField("Total Attenuation with Coherent Scattering", dbDouble)
    Set fldRad(7) = tabRad.CreateField("Total Attenuation without Coherent Scattering", dbDouble)
    For I = 0 To 7
      tabRad.Fields.Append fldRad(I)
    Next I
    dbICRP38.TableDefs.Append tabRad
    Set rsICRP = tabRad.OpenRecordset
    rsICRP.AddNew
    For I = 1 To numRads
      Input #10, Edata(1), Edata(2), Edata(3), Edata(4), Edata(5), Edata(6), _
        Edata(7), Edata(8)
      rsICRP.AddNew
      rsICRP![Photon Energy] = Edata(1)
      rsICRP![Scattering - Coherent] = Edata(2)
      rsICRP![Scattering - Incoherent] = Edata(3)
      rsICRP![Photo-Electric Absorption] = Edata(4)
      rsICRP![Pair Production in Nuclear Field] = Edata(5)
      rsICRP![Pair Production in Electron Field] = Edata(6)
      rsICRP![Total Attenuation with Coherent Scattering] = Edata(7)
      rsICRP![Total Attenuation without Coherent Scattering] = Edata(8)
      rsICRP.Update
    Next I
    rsICRP.Close
  Wend
  Close #10
  dbICRP38.Close
  Exit Sub
ErrLine:
  MsgBox Err.Description
End Sub
