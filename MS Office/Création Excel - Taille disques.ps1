
[Threading.Thread]::CurrentThread.CurrentCulture = 'fr-FR'

# Lancement d'une instance de MS Excel
$excel = New-Object -ComObject "Excel.Application" 
# Excel se lance en mode visible
$excel.Visible = $True
# Excel ne donnera aucune alerte ou ne vous demandera aucune confirmation dans vos actions
$excel.DisplayAlerts = $False

# Création d'une feuille Excel
$workbook = $excel.Workbooks.Add()

# Ajout de 4 feuilles Excel
$workbook.worksheets.add()
$workbook.worksheets.add()
$workbook.worksheets.add()
$workbook.worksheets.add()

# Définir le nom de la feuille en fonction de sa position + activation de la feuille 1
$sheet = $workbook.Worksheets.Item(1)
$sheet.name = "Page N°1"
$sheet.Activate() | Out-Null

$sheet1 = $workbook.worksheets.Item(2)
$sheet1.name = "Page N°2"

$sheet2 = $workbook.worksheets.Item(3)
$sheet2.name = "Page N°3"

$sheet3 = $workbook.worksheets.Item(4)
$sheet3.name = "Page N°4"

$sheet4 = $workbook.worksheets.Item(5)
$sheet4.name = "Page N°5"

# On se positionne en A1 sur Excel (ligne=1/colonne=1)
# La première ligne corresponddra aux titres des colonnes
$row = 1
$Column = 1

# Saisie des données dans Excel
$sheet.Cells.Item($row,$column)= 'Device ID'
$sheet.Cells.Item($row,$column).Font.Bold=$True
$Column++ # On passe à la colonne suivante

$sheet.Cells.Item($row,$column)= 'Volume Name'
$sheet.Cells.Item($row,$column).Font.Bold=$True
$Column++ # On passe à la colonne suivante

$sheet.Cells.Item($row,$column)= 'Free space (in GB)'
$sheet.Cells.Item($row,$column).Font.Bold=$True
$Column++ # On passe à la colonne suivante

# On passe à la seconde ligne et on revient à la colonne 1 (A2)
$row = 2
$Column = 1

# Récupération des données sur les disques locaux : on récupère 3 informations : DeviceID, VolumeName, Espace libre en Go
$entries = Get-WmiObject -Class Win32_LogicalDisk | Select-Object -Property DeviceID,VolumeName, @{Name='Free Space GB';Expression={$_.FreeSpace/1GB} }

# Pour chaque entrée (aka chaque disque dur) on parcourt le fichier Excel et on affiche les informations
foreach ($entry in $entries)  {

    $sheet.Cells.Item($row,$column) = $entry.DeviceID
    $column++

    $sheet.Cells.Item($row,$column) = $entry.VolumeName
    $column++
    
    $sheet.Cells.Item($row,$column) = $entry.'Free Space GB'
    $column++
    
    $row++
    $column=1
}

#sauvegarder le fichier que vous venez de générer
$workbook.SaveAs("C:\Temp\test.xlsx")
#$excel.Quit()

#################################################
# END OF PROGRAM
#################################################