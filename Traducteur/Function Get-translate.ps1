function Get-Translate {
    <#
	.Synopsis
    Traduit un texte dans une autre langue


    .Description

    Cette applet de commande utilise le service de traduction Google API pour traduire un texte donné d'une langue à une autre. 
    Le texte à traduire peut être passé soit via le pipeline, soit via un paramètre sans nom, soit via le paramètre -Text.

    
    .parameter TargetLanguage

    Ce paramètre est facultatif et spécifie la langue cible pour la traduction. 
    La valeur par défaut est la langue du système.


    Liste des langues supportées :

    Langage     Code ISO-639-1
    Afrikaans    af
    Albanais	 sq
    Amharique	 am
    Arabe	     ar
    Arménien	 hy
    Azéri	     az
    Basque	     eu
    Biélorusse	 be
    Bengali	     bn
    Bosnien      bs
    Bulgare	     bg
    Catalan	     ca
    Cebuano	     ceb (ISO-639-2)
    Chinois (simplifié)	zh-CN ou zh (BCP-47)
    Chinois (traditionnel)	zh-TW (BCP-47)
    Corse	     co
    Croate	     hr
    Tchèque	     cs
    Danois	     da
    Néerlandais	 nl
    Anglais	     en
    Espéranto	 eo
    Estonien	 et
    Finnois	     fi
    Français	 fr
    Frison	     fy
    Galicien	 gl
    Géorgien	 ka
    Allemand	 de
    Grec	     el
    Gujarati	 gu
    Créole haïtien	ht
    Haoussa	     ha
    Hawaïen	     haw (ISO-639-2)
    Hébreu	     he ou iw
    Hindi	     hi
    Hmong	     hmn (ISO-639-2)
    Hongrois	 hu
    Islandais	 is
    Igbo	     ig
    Indonésien	 id
    Irlandais	 ga
    Italien	     it
    Japonais	 ja
    Javanais	 jv
    Kannada	     kn
    Kazakh	     kk
    Khmer	     km
    Kinyarwanda  rw
    Coréen	     ko
    Kurde	     ku
    Kirghyz	     ky
    Laotien	     lo
    Latin	     la
    Letton	     lv
    Lituanien	 lt
    Luxembourgeois	lb
    Macédonien	 mk
    Malgache	 mg
    Malais	     ms
    Malayâlam	 ml
    Maltais	     mt
    Maori	     mi
    Marathi	     mr
    Mongol	     mn
    Birman	     my
    Népalais	 ne
    Norvégien	 no
    Nyanja (Chichewa)	ny
    Odia (Oriya) or
    Pachtô	     ps
    Perse	     fa
    Polonais	 pl
    Portugais (Portugal, Brésil)	pt
    Panjabi	     pa
    Roumain	     ro
    Russe	     ru
    Samoan	     sm
    Gaélique (Écosse)	gd
    Serbe	     sr
    Sesotho	     st
    Shona	     sn
    Sindhî	     sd
    Singhalais	 si
    Slovaque	 sk
    Slovène	     sl
    Somali	     so
    Spanish	     es
    Soundanais	 su
    Swahili	     sw
    Suédois	     sv
    Tagalog (philippin)	tl
    Tadjik	     tg
    Tamoul	     ta
    Tatar	     tt
    Télougou	 te
    Thaï	     th
    Turc	     tr
    Turkmène	 tk
    Ukrainien	 uk
    Urdu	     ur
    Ouïghour	 ug
    Ouzbek	     uz
    Vietnamien	 vi
    Gallois	     cy
    Xhosa	     xh
    Yiddish	     yi
    Yoruba	     yo
    Zulu	     zu

	
	.parameter Text
	C'est le seul paramètre obligatoire. Il précise le texte à traduire. Ce paramètre peut également être passé sans nom (voir exemples ci-dessous).
	
    .parameter select
	Dieser Parameter ist optional und kann verwendet werden, um eine bestimmte Übersetzung auszuwählen.
	
    .example
	L'exemple suivant traduit un texte dans la langue définie dans le système à l'aide de la reconnaissance automatique de langue de Google et affiche la traduction à l'écran :
	
    PS C:\> Get-Translate "This is a first test using Powershell."
	
    Ceci est un premier test avec Powershell.
	
 
    
    .example
    L'exemple suivant montre comment vous pouvez utiliser le pipeline pour traduire un texte :
    
    PS C:\> echo "This is a second test using the Pipeline instead of an unnamed parameter." | Get-Translate
    
    Il s'agit d'un deuxième test utilisant le Pipeline au lieu d'un paramètre sans nom.
    

    
    .example
    Un troisième exemple montre comment vous pouvez utiliser des paramètres nommés pour affecter la traduction.
    
    PS C:\> Get-Translate -TargetLanguage fr -Text "Hello world."
    
    Bonjour le monde.
    

	
	#>

    [CmdletBinding ()] 
    param (
        [parameter (mandatory = $False,
            helpmessage = "Langue cible pour la traduction, la langue définie dans le système est utilisée par défaut (optionel).")]
        [string]$TargetLanguage = $(get-culture).name.Substring(0, 2).toupper(),
        [Parameter (Mandatory = $True, position = 0, ValueFromPipeline = $true, valuefromremainingarguments = $True,
            helpmessage = "Texte à traduire (obligatoire)")]
        [string]$Text
    )

    process {

        # Paramètres Proxy
        $Wcl = new-object System.Net.WebClient
        $Wcl.Headers.Add(“user-agent”, “PowerShell Script”)
        $Wcl.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

        # URL du traducteur Google API
        $Uri = “https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$($TargetLanguage)&dt=t&q=$Text”
        # Réponse de Google API
        $Response = Invoke-RestMethod -Uri $Uri -Method Get
        # Sélection du texte uniquement
        $Translation = $Response[0].SyncRoot | foreach { $_[0] }

        # Affichage du texte traduit
        return $Translation
        }
}