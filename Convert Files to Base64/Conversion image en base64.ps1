#Convertir un fichier image en fichier texte.
$FilePath = ".\Bart_Simpson.png"
$SaveTo = ".\bart.txt"
[byte[]]$Data = Get-Content $FilePath -Encoding Byte
[system.convert]::ToBase64String($Data) | Set-Content $SaveTo
