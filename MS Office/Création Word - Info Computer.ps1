
[Threading.Thread]::CurrentThread.CurrentCulture = 'fr-FR'

# Lancement de MS Word
$word = New-Object -ComObject "Word.Application"            

# Word se lance
$word.Visible = $True

# Word est démarré et est visible, nous créeons maintenant un nouveau document vide
$doc = $word.documents.add()

$doc.content.text = "=== Computer report ==="

# Variables qui vont nous permettre de remplir le fichier Word avec quelque-chose (pour l'exemple)
$description = Get-WmiObject -Class Win32_OperatingSystem | Select Description
$version = Get-WmiObject -Class Win32_OperatingSystem | Select Version
$processor = Get-WmiObject win32_processor | Select Name
$others = Get-WmiObject -Class Win32_ComputerSystem

$doc.content.insertparagraphafter()
$doc.Paragraphs.item(2).range.font.name = "Calibri"
$doc.Paragraphs.item(2).range.font.size = 11
$doc.Paragraphs.item(2).range.text = "Computer name : " + $env:computername + 
                                    "`nDescription : " + $description.Description +
                                    "`nVersion OS : " + $version.Version + 
                                    "`nProcesseur : " + $processor.Name +
                                    "`nManufacturer : " + $others.Manufacturer + 
                                    "`nModel : " + $others.Model + 
                                    "`nComputer Name : " + $others.Name + 
                                    "`nPhysicial Memory (RAM) : " + $others.TotalPhysicalMemory +
                                    "`nCurrent user logged : " +  [Environment]::UserName +
                                    "`nFull login : " + $others.PrimaryOwnerName + 
                                    "`nDomain : " + $others.Domain
 

# Pour éventuellement sauvegarder le fichier
$doc.SaveAs("C:\Temp\Computer_Report.docx")

# Pour fermer le document en cours dans Word (Word reste démarré)
#$doc.close()

# Pour quitter Word
#$word.Quit()

#################################################
# END OF PROGRAM
#################################################
