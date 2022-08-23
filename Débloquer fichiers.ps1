# Script permettant de débloquer tous les fichiers provenant d'internet contenus dans le dossier et tous les sous-dossiers.

#####################################################################################################################################################################

#Creation d'une fonction "ouverture de dossier".
Function Get-Folder($initialDirectory="")

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Selectionner un dossier"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    else{exit}
    return $folder
}

#Sélectionner le répertoire à débloquer
Read-Host "Cliquer sur Entrée pour sélectionner un dossier"

#Enregistre le chemin dans la variable $Directory
$Directory = Get-Folder

try {
	#Débloquer tous les fichiers contenus dans le dossier et les sous-dossiers
    Get-ChildItem -LiteralPath $Directory -Recurse | Unblock-File

    # success
	Write-Host "Fichiers débloqués !!!" -ForegroundColor Green
    pause

} catch {
	"⚠️ Erreur à la ligne $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}