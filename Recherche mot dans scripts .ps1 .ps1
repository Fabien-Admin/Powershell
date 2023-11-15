<#
 Description du Script : Script permettant de rechercher un mot précis dans tous les fichiers .PS1
 Nom du Script : Recherche mot dans script .ps1 .ps1
 Version du Script : V1.0
 Auteur : Fabien DAUVERGNE
#>

#Chemin du fichier texte
$Path = "C:\Temp\Mot_ps1.txt"

#En cas d'erreur, on ne dit rien et on continu
$ErrorActionPreference = "silentlycontinue"

#Demande du mot à rechercher
$Search = Read-Host -Prompt "Quel mot voulez-vous chercher ?"

#Lister tous les fichiers .ps1 et recherche le mot demandé
$Find = Get-ChildItem -Path "U:\_Scripts\_PowerShell" -Recurse -File -include "*.ps1" | %{Select-String -Path $_.FullName -Pattern $Search}

#Export du résultat dans un fichier texte
$Find | Out-File -LiteralPath $Path

#Affichage du résultat
"#####################################################"
Write-Host -NoNewline -ForegroundColor Green " $($Find.Count) "
Write-Host "élément(s) trouvé(s) pour : $($Search)"
"#####################################################"

#Extraction des résultats dans chaque fichier
foreach ($i in $Find){
Write-Host ""
Write-Host -NoNewline "Fichier : "
Write-Host -ForegroundColor Cyan "$($i.Path)"
Write-Host -NoNewline "Ligne : "
Write-Host -ForegroundColor Yellow "$($i.Line)"
Write-Host -NoNewline "Numéro de ligne : "
Write-Host -ForegroundColor Red "$($i.LineNumber)"
Write-Host ""
"#####################################################"
}

Write-Host -ForegroundColor Green "Le fichier texte est disponible : $Path"
Write-Host ""

Pause