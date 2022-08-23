<# Script de génération de logs dans le fichier C:\Temp\Logs\Creat_users.txt
#>

#Démarrage de la génération de logs et affichage de la date du jour et de l'heure
Start-Transcript -Path C:\Temp\Logs\Create_Users.txt -Append
Get-Date -Format "dd/MM/yyyy HH:mm:ss"

Stop-Transcript