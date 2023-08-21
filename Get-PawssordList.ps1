# Script de création de dictionnaire de mots de passe en utilisant des informations (Guessing)

function Get-PwdListInteractive {

    Write-Host "`r`n[+] Insérez les informations sur la victime pour créer un dictionnaire"
    Write-Host "[+] Si vous ne connaissez pas toutes les informations, appuyez simplement sur Entrée lorsque vous êtes invité ! ;)`r`n"

    $Global:profile = [PSCustomObject]@{
	
	'Prenom'			= ''
	'Nom'				= ''
	'Surnom'			= ''
	'Date'		    	= [int]''
	'Partner'		    = ''
	'Surnom_partner'  	= ''
	'Date_Partner'		= [int]''
	'Enfant'	    	= ''
	'Surnom_Enfant'	    = ''
	'Date_Enfant'	    = [int]''
	'Animal'	    	= ''
	'Company'	    	= ''
    'Mots'              = ''
    'Special'           = ''
    'Chiffres'          = ''
    'Leet'              = ''
    'Longueur'          = ''

	}
	
	# Prénom
	$profile.Prenom = (Read-Host "> 👩 👨 Prénom").ToLower()
    while ($profile.Prenom.Length -eq 0 -or $profile.Prenom.Trim() -eq "") {
        Write-Host "`r`n[-] Vous devez entrer au moins un prénom !"
        $profile.Prenom = (Read-Host "> Prénom").ToLower()
    }
	
	# Nom de famille
	$profile.Nom = (Read-Host "> Nom de famille").ToLower()
	
	# Surnom
	$profile.Surnom = (Read-Host "> Surnom").ToLower()

	# Date de naissance
	$profile.Date = Read-Host "> Date de naissance (JJMMAAAA)"
    #Boucle si le format n'est pas bon
	while ($profile.Date.Length -ne 0 -and $profile.Date.Length -ne 8) {
        Write-Host "`r`n[-] Vous devez entrer 8 chiffres pour la date de naissance !"
        $profile.Date = Read-Host "> Date de naissance (JJMMAAAA)"
    }

    # Prénom du conjoint
    $profile.partner = (Read-Host "> 👩 👨 Prénom du conjoint").ToLower()

	# Surnom du conjoint
    $profile.Surnom_partner = (Read-Host "> Surnom du conjoint").ToLower()

    # Date de naissance du conjoint
    $profile.Date_Partner = Read-Host "> Date de naissance du conjoint (JJMMAAAA)"
    #Boucle si le format n'est pas bon
	while ($profile.Date_Partner.Length -ne 0 -and $profile.Date_Partner.Length -ne 8) {
        Write-Host "`r`n[-] Vous devez entrer 8 chiffres pour la date de naissance du conjoint !"
        $profile.Date_Partner = Read-Host "> Date de naissance du conjoint (JJMMAAAA)"
    }

    # Prénom de l'enfant
    $profile.Enfant = (Read-Host "> 👧 👦 Prénom de l'enfant").ToLower()

    # Surnom de l'enfant
    $profile.Surnom_Enfant = (Read-Host "> Surnom de l'enfant").ToLower()

    # Date de naissance de l'enfant
    $profile.Date_Enfant = Read-Host "> Date de naissance de l'enfant (JJMMAAAA)"
    #Boucle si le format n'est pas bon
	while ($profile.Date_Enfant.Length -ne 0 -and $profile.Date_Enfant.Length -ne 8) {
        Write-Host "`r`n[-] Vous devez entrer 8 chiffres pour la date de naissance de l'enfant !"
        $profile.Date_Enfant = Read-Host "> Date de naissance de l'enfant (JJMMAAAA)"
    }

    # Nom de l'animal de compagnie
    $profile.Animal = (Read-Host "> 🐕 🐈 Nom de l'animal de compagnie").ToLower()

    # Nom de l'entreprise
    $profile.Company = (Read-Host "> 🌐 Nom de l'entreprise").ToLower()


    # Mots en plus
    $profile.Mots = (Read-Host "> Souhaitez-vous ajouter quelques mots clés concernant la victime ? O/[N]").ToLower()
    if ($profile.Mots -eq "o"){
        $profile.Mots = ((Read-Host "> Veuillez saisir les mots, séparés par une virgule. [ex.:hacker,juice,black], les espaces seront supprimés").ToLower()).replace(" ","")
        $profile.Mots = $profile.Mots.split(",") 
        }
            Else {$profile.Mots = ''}

    # Caractères spéciaux
    $profile.Special = (Read-Host "> Voulez-vous ajouter des caractères spéciaux à la fin des mots ? O/[N]").ToLower()
    if ($profile.Special -eq "o"){
        $profile.Special = "o" 
        }
            Else {$profile.Special = ''}

    # Chiffres aléatoires
    $profile.Chiffres = (Read-Host "> Voulez-vous ajouter des chiffres aléatoires à la fin des mots ? O/[N]").ToLower()
    if ($profile.Chiffres -eq "o"){
        $profile.Chiffres = "o" 
        }
            Else {$profile.Chiffres = ''}

    # Leet
    $profile.Leet = (Read-Host "> Voulez-vous le mode Leet ? [ex.: leet = 1337) O/[N]").ToLower()
    if ($profile.Leet -eq "o"){
        $profile.Leet = "o" 
        }
            Else {$profile.Leet = ''}

    # Longueur de mots de passe
    $profile.Longueur = Read-Host "> Voulez-vous définir une longueur de mots de passe ? O/[N]"
    if ($profile.Longueur -eq "o"){
        #Initialisation de la variable globale
        $Global:Mini = ''
        #Boucle tant que Mini n'est pas nul et que ça n'est pas un chiffre
        while ($Global:Mini -eq '') {
            try {[int]$Global:Mini = Read-Host "> Veuillez saisir la longueur minimale des mots de passe à créer"}
                        #Boucle si le format n'est pas bon
	                    catch {
                            Write-Host "`r`n[-] Vous devez entrer un ou plusieurs chiffres pour la longueur minimale !"
                        }
        }

        #Initialisation de la variable globale
        $Global:Maxi = ''
        #Boucle tant que Mini n'est pas nul et que ça n'est pas un chiffre
        while ($Global:Maxi -eq '') {
            try {[int]$Global:Maxi = Read-Host "> Veuillez saisir la longueur maximale des mots de passe à créer"}
                        #Boucle si le format n'est pas bon
	                    catch {
                            Write-Host "`r`n[-] Vous devez entrer un ou plusieurs chiffres pour la longueur maximale !"
                        }
        }
    }

    Write-host "`r`n[+] 👍 Profil créé avec succès:`r`n"

    #Affichage des objets s'il y en a
    $profile.PSObject.Properties | ForEach-Object {

        if (($_.value -eq 0) -or ($_.value.Trim() -eq "")){ 
            Write-Host -ForegroundColor Red "$($_.Name)" }

                Else{
                    Write-Host -NoNewline "$($_.Name) : "
                    Write-Host -ForegroundColor Green $_.Value }
    }
	
	Write-host "`r`n[+] 📝 Création du dictionnaire en cours ...`r`n"
	
    # Génération du dictionnaire
    Get-Wordlist -Profil $profile -Verbose
}

function Get-Leet {
    
    # Convertir les lettres en chiffres
    Param(
	[Parameter(Mandatory=$True,HelpMessage="Mots à convertir")]
	$Source = ''
	);
    
    # Correspondance des lettres en chiffres
    foreach ($lettres in $Source){
        $lettres = $lettres.replace('a','@')
        $lettres = $lettres.replace('i','1')
        $lettres = $lettres.replace('e','3')
        $lettres = $lettres.replace('t','7')
        $lettres = $lettres.replace('o','0')
        $lettres = $lettres.replace('s','5')
        $lettres = $lettres.replace('g','9')
        $lettres = $lettres.replace('z','2')

        return $lettres
    }
}

function Get-Concat {
    
    # Concaténation
    param (
        [Parameter(Mandatory=$True)]
        $Seq,
        [Parameter(Mandatory=$True)]
        [int]$Start,
        [Parameter(Mandatory=$True)]
        [int]$Stop
    )

    foreach ($mystr in $seq) {
        for ($num = $start; $num -lt $stop; $num++) {
            $Concat = $mystr + "$num"
            Write-Output -InputObject $Concat
        }
    }
}

function Get-Combi {
    
    # Tri et combinaison
    param (
        [Parameter(Mandatory=$True)]
        $Seq,
        [Parameter(Mandatory=$True)]
        $Start,
        [Parameter(Mandatory=$False)]
        $Special = ""
    )

    foreach ($mystr in $seq) {
        foreach ($mystr1 in $start) {
            If ($Special -ne $null) {
                foreach ($spe in $Special) {
                    $Combi = $mystr + $spe + $mystr1
                    Write-Output -InputObject $Combi
                    $Combi2 = $mystr + $mystr1 + $spe
                    Write-Output -InputObject $Combi2
                } 
            }Else {
                $Combi = $mystr + $mystr1
                Write-Output -InputObject $Combi
                $Combi2 = $mystr + $mystr1
                Write-Output -InputObject $Combi2

                }
        }
    }
}

function Get-Wordlist {
   
    # Générer la liste de mots de passe en se basant sur les données du profil
   	Param(
	[Parameter(Mandatory=$True,HelpMessage="Données de la victime")]
	$Profil = $profile
	);
    
    # Continue sans affichage en cas d'erreur
    $ErrorActionPreference = "SilentlyContinue"

    #Déclaration des variables 
    # Caractères Spéciaux
    $chars = "!", "@", "#", "$", "%", "&", "*", "+", "=", "?", "_"
    # Chiffres début et fin
    $numfrom = 0
    $numto = 100
    $nums = 0..100
    # Années
    $ans = 1950..2024

    Write-Verbose -Message "Dates d'anniversaire en cours ..."

    # Date d'anniversaire
    $Date_yy = $profile.Date.Substring(6)
    $Date_yyy = $profile.Date.Substring(5)
    $Date_yyyy = $profile.Date.Substring(4)
    $Date_xd = $profile.Date.Substring(1,1)
    $Date_xm = $profile.Date.Substring(3,1)
    $Date_dd = $profile.Date.Substring(0,2)
    $Date_mm = $profile.Date.Substring(2,2)

    $DatePart_yy = $profile.Date_Partner.Substring(6)
    $DatePart_yyy = $profile.Date_Partner.Substring(5)
    $DatePart_yyyy = $profile.Date_Partner.Substring(4)
    $DatePart_xd = $profile.Date_Partner.Substring(1,1)
    $DatePart_xm = $profile.Date_Partner.Substring(3,1)
    $DatePart_dd = $profile.Date_Partner.Substring(0,2)
    $DatePart_mm = $profile.Date_Partner.Substring(2,2)

    $DateEnf_yy = $profile.Date_Enfant.Substring(6)
    $DateEnf_yyy = $profile.Date_Enfant.Substring(5)
    $DateEnf_yyyy = $profile.Date_Enfant.Substring(4)
    $DateEnf_xd = $profile.Date_Enfant.Substring(1,1)
    $DateEnf_xm = $profile.Date_Enfant.Substring(3,1)
    $DateEnf_dd = $profile.Date_Enfant.Substring(0,2)
    $DateEnf_mm = $profile.Date_Enfant.Substring(2,2)

	
    # Première lettre en majuscule
    $TextInfo = (Get-Culture).TextInfo

    $Prenom_Up = $TextInfo.ToTitleCase($profile.Prenom)
    $Nom_Up = $TextInfo.ToTitleCase($profile.Nom)
    $Surnom_Up = $TextInfo.ToTitleCase($profile.Surnom)
    $Partner_Up = $TextInfo.ToTitleCase($profile.Partner)
    $Sur_Part_Up = $TextInfo.ToTitleCase($profile.Surnom_partner)
    $Enf_Up = $TextInfo.ToTitleCase($profile.Enfant)
    $Sur_Enf_Up = $TextInfo.ToTitleCase($profile.Surnom_Enfant)
    $Animal_Up = $TextInfo.ToTitleCase($profile.Animal)
    $Company_Up = $TextInfo.ToTitleCase($profile.Company)

    $wordsup = @()
    $wordsup += $profile.Mots | ForEach-Object { $TextInfo.ToTitleCase($_) }
    $words = @()
    $words = $profile.mots + $wordsup


    # Inverse les caractères des mots
    $Rev_Prenom = $profile.Prenom[-1..-($s.Length)] -join ''
    $Rev_Prenom_Up = $Prenom_Up[-1..-($s.Length)] -join ''
    $Rev_Nom = $profile.Nom[-1..-($s.Length)] -join ''
    $Rev_Nom_Up = $Nom_Up[-1..-($s.Length)] -join ''
    $Rev_Surnom = $profile.Surnom[-1..-($s.Length)] -join ''
    $Rev_Surnom_Up = $Surnom_Up[-1..-($s.Length)] -join ''
    $Rev_Partner = $profile.Partner[-1..-($s.Length)] -join ''
    $Rev_Partner_Up = $Partner_Up[-1..-($s.Length)] -join ''
    $Rev_SurPart = $profile.Surnom_partner[-1..-($s.Length)] -join ''
    $Rev_SurPart_Up = $Sur_Part_Up[-1..-($s.Length)] -join ''
    $Rev_Enf = $profile.Enfant[-1..-($s.Length)] -join ''
    $Rev_Enf_Up = $Enf_Up[-1..-($s.Length)] -join ''
    $Rev_SurEnf = $profile.Surnom_Enfant[-1..-($s.Length)] -join ''
    $Rev_SurEnf_Up = $Sur_Enf_Up[-1..-($s.Length)] -join ''
    $Rev_Animal = $profile.Surnom_Enfant[-1..-($s.Length)] -join ''
    $Rev_Animal_Up = $Animal_Up[-1..-($s.Length)] -join ''
    $Rev_Company = $profile.Company[-1..-($s.Length)] -join ''
    $Rev_Company_Up = $Company_Up[-1..-($s.Length)] -join ''
    
    $Reverse = (
        $Rev_Prenom ,
        $Rev_Prenom_Up ,
        $Rev_Nom ,
        $Rev_Nom_Up ,
        $Rev_Surnom ,
        $Rev_Surnom_Up ,
        $Rev_Partner ,
        $Rev_Partner_Up ,
        $Rev_SurPart ,
        $Rev_SurPart_Up ,
        $Rev_Enf ,
        $Rev_Enf_Up ,
        $Rev_SurEnf ,
        $Rev_SurEnf_Up ,
        $Rev_Animal ,
        $Rev_Animal_Up ,
        $Rev_Company ,
        $Rev_Company_Up )

    $Rev_N = ($Rev_Prenom, $Rev_Prenom_Up, $Rev_Nom, $Rev_Nom_Up , $Rev_Surnom, $Rev_Surnom_Up)
    $Rev_P = ($Rev_Partner, $Rev_Partner_Up)
    $Rev_E = ($Rev_Enf, $Rev_Enf_Up)


    Write-Verbose -Message "Combinaisons de mots en cours ..."

    # Combinations dates d'anniversaire
    $bds = (
        $Date_yy,
        $Date_yyy,
        $Date_yyyy,
        $Date_xd,
        $Date_xm,
        $Date_dd,
        $Date_mm )

    $bdss = @()

    foreach ($bds1 in $bds) {
        $bdss += $bds1

        foreach ($bds2 in $bds) {
            if ($bds.IndexOf($bds1) -ne $bds.IndexOf($bds2)) {
                $bdss += ($bds1 + $bds2)

                foreach ($bds3 in $bds) {
                    if (
                        $bds.IndexOf($dbd1) -ne $bds.IndexOf($bds2) -ne $bds.IndexOf($bds3) -and
                        $bds.IndexOf($dbd1) -ne $bds.IndexOf($dbd3)
                    ) {
                        $bdss += ($bds1 + $bds2 + $bds3)
                    }
                }
            }
        }
    }

    # Pour le Partner
    $wbds = ($DatePart_yy, $DatePart_yyy, $DatePart_yyyy, $DatePart_xd, $DatePart_xm, $DatePart_dd, $DatePart_mm)

    $wbdss = @()

    foreach ($wbds1 in $wbds) {
        $wbdss += $wbds1

        foreach ($wbds2 in $wbds) {
            if ($wbds.IndexOf($wbds1) -ne $wbds.IndexOf($wbds2)) { $wbdss += ($wbds1 + $wbds2)
                foreach ($wbds3 in $bws) {
                    if ($bws.IndexOf($dbd1) -ne $bws.IndexOf($dbd2) -and $wbds.IndexOf($wbds2) -ne $wbds.IndexOf($wbds3) -and $wbds.IndexOf($dbd1) -ne $wbds.IndexOf($dbd3))
                    { $wbdss += ($wbds1 + $wbds2 + $wbds3) }
                }
            }
        }
    }

    # Pour l'enfant
    $kbds = ($DateEnf_yy, $DateEnf_yyy, $DateEnf_yyyy, $DateEnf_xd, $DateEnf_xm, $DateEnf_dd, $DateEnf_mm)

    $kbdss = @()

    foreach ($kbds1 in $kbds) {
        $kbdss += $kbds1

        foreach ($kbds2 in $kbds) {
            if ($kbds.IndexOf($kbds1) -ne $kbds.IndexOf($kbds2)) {
                $kbdss += ($kbds1 + $kbds2)
                foreach ($kbds3 in $bws) {
                    if ($bws.IndexOf($dbd1) -ne $bws.IndexOf($dbd2) -and $kbds.IndexOf($kbds2) -ne $kbds.IndexOf($kbds3) -and $kbds.IndexOf($dbd1) -ne $kbds.IndexOf($dbd3)) {
                        $kbdss += ($kbds1 + $kbds2 + $kbds3)
                    }
                }
            }
        }
    }


    # Combinaison de mots
    $kombinaac = ($profile.Animal, $Animal_Up, $profile.Company, $Company_Up)

    $kombina = (
        $profile.Prenom,
        $profile.Nom,
        $profile.Surnom,
        $Prenom_Up,
        $Nom_Up,
        $Surnom_Up )

    $kombinaw = (
        $profile.Partner,
        $profile.Surnom_partner,
        $Partner_Up,
        $SurPart_Up ,
        $profile.Nom,
        $Nom_Up )

    $kombinak = (
        $profile.Enfant,
        $profile.Surnom_Enfant,
        $Enf_Up,
        $Sur_Enf_Up,
        $profile.Nom,
        $Nom_Up )


    $kombinaa = @()

    foreach ($kombina1 in $kombina) {
        $kombinaa += $kombina1

        foreach ($kombina2 in $kombina) {
            if (($kombina.IndexOf($kombina1) -ne $kombina.IndexOf($kombina2)) -and ($kombina.IndexOf($TextInfo.ToTitleCase($kombina1)) -ne $kombina.IndexOf($TextInfo.ToTitleCase($kombina2)))) {
                $combinedString = $kombina1 + $kombina2
                $kombinaa += $combinedString
            }
        }
    }

    $kombinaaw = @()

    foreach ($kombina1 in $kombinaw) {
        $kombinaaw += $kombina1

        foreach ($kombina2 in $kombinaw) {
            if (($kombinaw.IndexOf($kombina1) -ne $kombinaw.IndexOf($kombina2)) -and ($kombinaw.IndexOf($TextInfo.ToTitleCase($kombina1)) -ne $kombinaw.IndexOf($TextInfo.ToTitleCase($kombina2)))) {
                $combinedString = $kombina1 + $kombina2
                $kombinaaw += $combinedString
            }
        }
    }

    $kombinaak = @()

    foreach ($kombina1 in $kombinak) {
        $kombinaak += $kombina1

        foreach ($kombina2 in $kombinak) {
            if (($kombinak.IndexOf($kombina1) -ne $kombinak.IndexOf($kombina2)) -and ($kombinak.IndexOf($TextInfo.ToTitleCase($kombina1)) -ne $kombinak.IndexOf($TextInfo.ToTitleCase($kombina2)))) {
                $combinedString = $kombina1 + $kombina2
                $kombinaak += $combinedString
            }
        }
    }


    $kombi = @{}
    $kombi[1] = @(Get-Combi -Seq $kombinaa -Start $bdss)
    $kombi[1] += @(Get-Combi -Seq $kombinaa -Start $bdss -Special $chars)
    $kombi[2] = @(Get-Combi -Seq $kombinaaw -Start $wbdss)
    $kombi[2] += @(Get-Combi -Seq $kombinaaw -Start $wbdss -Special $chars)
    $kombi[3] = @(Get-Combi -Seq $kombinaak -Start $kbdss)
    $kombi[3] += @(Get-Combi -Seq $kombinaak -Start $kbdss -Special $chars)
    $kombi[4] = @(Get-Combi -Seq $kombinaa -Start $ans)
    $kombi[4] += @(Get-Combi -Seq $kombinaa -Start $ans -Special $chars)
    $kombi[5] = @(Get-Combi -Seq $kombinaac -Start $ans)
    $kombi[5] += @(Get-Combi -Seq $kombinaac -Start $ans -Special $chars)
    $kombi[6] = @(Get-Combi -Seq $kombinaaw -Start $ans)
    $kombi[6] += @(Get-Combi -Seq $kombinaaw -Start $ans -Special $chars)
    $kombi[7] = @(Get-Combi -Seq $kombinaak -Start $ans)
    $kombi[7] += @(Get-Combi -Seq $kombinaak -Start $ans -Special $chars)
    $kombi[8] = @(Get-Combi -Seq $words -Start $bdss)
    $kombi[8] += @(Get-Combi -Seq $words -Start $bdss -Special $chars)
    $kombi[9] = @(Get-Combi -Seq $words -Start $wbdss)
    $kombi[9] += @(Get-Combi -Seq $words -Start $wbdss -Special $chars)
    $kombi[10] = @(Get-Combi -Seq $words -Start $kbdss)
    $kombi[10] += @(Get-Combi -Seq $words -Start $kbdss -Special $chars)
    $kombi[11] = @(Get-Combi -Seq $words -Start $ans)
    $kombi[11] += @(Get-Combi -Seq $words -Start $ans -Special $chars)
    $kombi[12] = @(Get-Combi -Seq $reverse -Start $ans)
    $kombi[12] += @(Get-Combi -Seq $reverse -Start $ans -Special $chars)
    $kombi[13] = @(Get-Combi -Seq $Rev_Partner -Start $wbdss)
    $kombi[13] += @(Get-Combi -Seq $Rev_Partner -Start $wbdss -Special $chars)
    $kombi[14] = @(Get-Combi -Seq $Rev_Enf -Start $kbdss)
    $kombi[14] += @(Get-Combi -Seq $Rev_Enf -Start $kbdss -Special $chars)
    $kombi[15] = @(Get-Combi -Seq $Rev_Prenom -Start $bdss)
    $kombi[15] += @(Get-Combi -Seq $Rev_Prenom -Start $bdss -Special $chars)

    
    # Si chiffres aléatoires = OUI ; Ajout de chiffres de 0 à 100
    If ($profile.Chiffres -eq 'o') {
        Write-Verbose -Message "Chiffres aléatoires en cours ..."
        $kombi[16] = @(Get-Concat -Seq $words -Start $numfrom -Stop $numto)
        $kombi[17] = @(Get-Concat -Seq $kombinaa -Start $numfrom -Stop $numto)
        $kombi[18] = @(Get-Concat -Seq $kombinaac -Start $numfrom -Stop $numto)
        $kombi[19] = @(Get-Concat -Seq $kombinaaw -Start $numfrom -Stop $numto)
        $kombi[20] = @(Get-Concat -Seq $kombinaak -Start $numfrom -Stop $numto)
        $kombi[21] = @(Get-Concat -Seq $reverse -Start $numfrom -Stop $numto)
    }

    # Si caractères spéciaux = OUI ; Ajout de caractères spéciaux
    If (($profile.Special).Length -eq 3) {
        Write-Verbose -Message "Caractères spéciaux en cours ..."
        $kombi[22] = @(Get-Combi -Seq $kombinaa -Start $nums -Special $chars)
        $kombi[23] = @(Get-Combi -Seq $kombinaac -Start $nums -Special $chars)
        $kombi[24] = @(Get-Combi -Seq $kombinaaw -Start $nums -Special $chars)
        $kombi[25] = @(Get-Combi -Seq $kombinaak -Start $nums -Special $chars)
        $kombi[26] = @(Get-Combi -Seq $words -Start $nums -Special $chars)
        $kombi[27] = @(Get-Combi -Seq $reverse -Start $nums -Special $chars)
    }

    # Création de la liste de mots de passe
    $komb_unique = @()
    for ($i = 1; $i -le 27; $i++) {
        $komb_unique += $kombi[$i]
    }

    #Ajout de mots dans la liste précédente
    $List += ($kbds +
            $kbdss +
            $wbdss +
            $wbds +
            $bds +
            $bdss +
            $Rev_N +
            $Rev_P +
            $Rev_E +
            $Reverse +
            $wordsup +
            $words +
            $komb_unique)


    # Trier la liste et supprimer les doublons
    $List_Uniq = $List | Sort-Object -Unique -CaseSensitive

    # Si Mode Leet = OUI ; Ajout du mode Leet
    If ($profile.Leet -eq 'o') {
        Write-Verbose -Message "Mode Leet en cours ..."
        $Leet = @()

        foreach ($l in $List_Uniq) {
            $Leet += Get-Leet -Source $l
        }
    #Ajout Leet dans liste
    $List_Uniq += $Leet
    }

    # Si Longueur de mots de passe ; Récupérer que les mots de passe compris ou égals entre les deux valeurs Mini et Maxi
    If ($profile.Longueur -eq 'o') {
        Write-Verbose -Message "Longueur de mots de passe en cours ..."
        $Short_List = @()
        #Boucle pour chaque mot dans la liste
        foreach ($x in $List_Uniq) {
            if (($x.Length -le $Maxi) -and ($x.Length -ge $Mini)) {
                #Ajout du mot dans la nouvelle liste 
                $Short_List += $x
            }
        }
    #Remplacer la liste par la nouvelle
    $List_Uniq = $Short_List
    }
    

    # Vérifier le chemin, sinon créer le dossier
    $FileName = $profile.Prenom + ".txt"
    $Chemin = "C:\Temp\"

    if ( -not (Test-Path $Chemin -PathType Container)){
        New-Item -ItemType Directory $Chemin -Force
    } 

    # Création du dictionnaire de mots de passe
    $List_Uniq | Out-File -FilePath $Chemin$FileName -Encoding utf8


    Write-Host -ForegroundColor Green "`r`n[+] Dictionnaire créé avec succès.`r`n"
	Pause
}

Get-PwdListInteractive