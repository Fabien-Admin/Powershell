#Chemin du fichier à modifier
$File = "C:\Temp\New.txt"

#Modification de la date de création
$(Get-Item $File).creationtime=$(Get-Date "01/01/2222 12:23")

#Modification de la date du dernier accès
$(Get-Item $File).lastaccesstime=$(Get-Date "22/01/2025 23:23")

#Modification de la date de dernière modification
$(Get-Item $File).lastwritetime=$(Get-Date "31/12/2107 23:59")