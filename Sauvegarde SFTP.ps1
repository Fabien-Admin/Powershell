# Script de sauvegarde d'un serveur en SFTP
#

#Declaration de variables

#Chemin de destination
$Dest = "C:\Sauvegarde\"

#Chemin dossier _old
$old = "C:\Sauvegarde\_old"
$empty = "C:\Sauvegarde\empty"

#Chemin des logs
$log = "C:\Logs\WinSCP.txt"

#Suppression du fichier de logs précédent
Remove-item -path $log -Force

#Tester si le dossier existe
if(!(Test-Path $old)){
   #Creation du dossier
   New-Item -Path $old -ItemType Directory -Force
}

#Copie des fichiers dans le dossier OLD
Move-Item -Path "C:\Sauvegarde\*" -Destination $old -Exclude $old -Force -ErrorAction SilentlyContinue

#Cryptage du mot de passe
$Pass = "motdepassencrypté"
$clearkey = "A8eU5sN1L5bG7fZK"
$key = $clearkey | ConvertTo-SecureString -AsPlainText -Force
$securestring = ConvertTo-SecureString -string $Pass -SecureKey $key
$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securestring)
$secure = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)

#Utilisation de Winscp pour recuperer les fichiers sur le serveur SFTP
& "C:\Program Files (x86)\WinSCP\WinSCP.com" `
  /log=$log /ini=nul `
  /command `
    "open sftp://utilisateur:$secure@sftp.exemple.com:22/ -hostkey=`"`"ssh-rsa 2048 hdydgdydgygydgydgydugsguysg`"`" -rawsettings FSProtocol=2" `
    "cd /" `
    "lcd C:\Sauvegarde\" `
    "get *" `
    "exit"


$winscpResult = $LastExitCode
if ($winscpResult -eq 0)
{
  Write-Host "Success"
  #Suppression du dossier "_old"
  Remove-Item -LiteralPath $old -Recurse -Force -ErrorAction SilentlyContinue
  
  if (Test-Path $old)
  {
		#Creation du dossier vide
		New-Item -Path $empty -ItemType Directory -Force

		#Purge du dossier _old
		Robocopy $empty $old /purge

		#Suppression des dossiers _old et empty
		Remove-Item -Path $old -Recurse -Force
		Remove-Item -Path $empty -Recurse -Force
  }

    #Objet du courriel
    $objet = "[Succès] Sauvegarde"
    #Création du corps du courriel
    $body = "La sauvegarde du serveur a bien été effectuée"
    
}
else
{
  Write-Host "Error"

    #Objet du courriel
    $objet = "[Erreur] Sauvegarde"
    #Création du corps du courriel
    $body = "La sauvegarde du serveur a rencontrée une erreur"
}

Write-Host $winscpResult
  
 #Envoi de courriel
#Variable pour envoi par mail
$expediteur = "SFTP@domaine.com"
$destinataire = "ITAdmin@domaine.com"
$SMTPserver = "server.domaine.com"
		
#Envoi du mail
$message = new-object System.Net.Mail.MailMessage $expediteur, $destinataire, $objet, $body
#Pièce jointe
$message.Attachments.Add($log)
$SMTPclient = new-object System.Net.Mail.SmtpClient $SMTPserver
$SMTPClient.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
$SMTPclient.Send($message)