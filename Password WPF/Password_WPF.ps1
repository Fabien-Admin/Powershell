<#
#################################################################################################################
# Description du Script : Ce Script PowerShell g�n�re un mot de passe selon la complexit� choisit               #
# Nom du Script : Password.ps1                                                                                  #
# Version du Script : V1.0                                                                                      #
################################################################################################################# 
#>

#========================================================================
#		Fenêtre principale
#========================================================================

#Image au format Base64String
$pic1 = "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"

#Conversion de l'image en mode graphique
$pic1 = [System.Convert]::FromBase64String($pic1)

#Ci-dessous pour cacher la console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
 
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
#Action pour cacher la console
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr,0) | Out-Null

#============================================

 [System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.dll')      | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')      | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll')      | out-null  

#============================================
# WPF in PowerShell
#============================================

[XML]$xaml = @'

<Controls:MetroWindow
	xmlns:Controls="clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro"
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:iconPacks="http://metro.mahapps.com/winfx/xaml/iconpacks" 
	Title="Générateur de mot de passe"
	Height="365"
	Width="456"
	ResizeMode="CanMinimize"
	WindowStartupLocation="CenterScreen">
	
<Window.Resources>
	<ResourceDictionary>
		<ResourceDictionary.MergedDictionaries>
			<ResourceDictionary Source="pack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml" />
			<ResourceDictionary Source="pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml" />
			<ResourceDictionary Source="pack://application:,,,/MahApps.Metro;component/Styles/Themes/Dark.Cobalt.xaml"/>
		</ResourceDictionary.MergedDictionaries>
	</ResourceDictionary>
</Window.Resources>

<Controls:MetroWindow.RightWindowCommands>
	<Controls:WindowCommands>
	   <Button Name="MonBouton" >
			<iconPacks:PackIconOcticons Kind="Paintcan" Margin="0,5,0,0" ToolTip="Changer le thème"/>													
		</Button>	
	</Controls:WindowCommands>	
</Controls:MetroWindow.RightWindowCommands>	
	
    <Grid>
        <Button Name="Generer" Content="Générer le mot de passe" HorizontalAlignment="Left" VerticalAlignment="Top" Width="150" Margin="36,18,0,0"/>

        <GroupBox Name="GroupBox1" Header="12 caractères par défaut" Margin="12,61,0,0" Width="200" Height="175" HorizontalAlignment="Left" VerticalAlignment="Top" >
        </GroupBox>

        <GroupBox Name="GroupBox2" Header="Créer votre mot de passe" Margin="225,15,0,0" Width="214" Height="222" HorizontalAlignment="Left" VerticalAlignment="Top">
        </GroupBox>

        <RadioButton Name="Aleatoire" Content="Aléatoire" HorizontalAlignment="Left" Margin="28,100,0,0" VerticalAlignment="Top" IsChecked="True"/>
        <Label Name="Longueur" Content="Longueur" HorizontalAlignment="Left" Margin="26,134,0,0" Width="67" VerticalAlignment="Top"/>
        <TextBox Name="LongTextBox" HorizontalAlignment="Left" Margin="136,135,0,0" TextWrapping="Wrap" Text="12" VerticalAlignment="Top" Width="45"/>

        <RadioButton Name="Perso" Content="Personnaliser" HorizontalAlignment="Left" Margin="240,54,0,0" VerticalAlignment="Top"/>
        <CheckBox Name="Majuscules" IsChecked="{Binding ElementName=MetroWindow, Path=AllChecked, UpdateSourceTrigger=PropertyChanged}" Content="Majuscules" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="240,94,0,0" IsEnabled="False"/>
        <TextBox Name="MajTextBox" HorizontalAlignment="Left" Margin="368,91,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="40" IsEnabled="False"/>
        <CheckBox Name="Minuscules" IsChecked="{Binding ElementName=MetroWindow, Path=AllChecked, UpdateSourceTrigger=PropertyChanged}" Content="Minuscules" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="240,124,0,0" IsEnabled="False"/>
        <TextBox Name="MinTextBox" HorizontalAlignment="Left" Margin="368,121,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="40" IsEnabled="False"/>
        <CheckBox Name="Symboles" IsChecked="{Binding ElementName=MetroWindow, Path=AllChecked, UpdateSourceTrigger=PropertyChanged}" Content="Symboles" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="240,154,0,0" IsEnabled="False"/>
        <TextBox Name="SymbTextBox" HorizontalAlignment="Left" Margin="368,151,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="40" IsEnabled="False"/>
        <CheckBox Name="Chiffres" IsChecked="{Binding ElementName=MetroWindow, Path=AllChecked, UpdateSourceTrigger=PropertyChanged}" Content="Chiffres" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="240,184,0,0" IsEnabled="False"/>
        <TextBox Name="ChiffTextBox" HorizontalAlignment="Left" Margin="368,181,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="40" IsEnabled="False"/>

        <Label Name="ErreurRouge" Content="" HorizontalAlignment="Left" Margin="12,245,0,0" VerticalAlignment="Top" Width="500" Foreground="Red" FontFamily="Microsoft Sans Serif" FontSize="14"/>
		<Label Name="Resultat" Content="Le mot de passe s'affichera ici" VerticalAlignment="Top" HorizontalAlignment="Left" Margin="12,265,0,0" Width="730" FontSize="17" FontFamily="Microsoft Sans Serif"/>
        <Label Name="MessageVert" HorizontalAlignment="Left" Margin="12,298,0,0" VerticalAlignment="Top" Width="500" Foreground="Green" FontFamily="Microsoft Sans Serif" FontSize="12"/>

    </Grid>
</Controls:MetroWindow>

'@

# Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$Form=[Windows.Markup.XamlReader]::Load($reader)}
catch{Write-Host "Unable to load Windows.Markup.XamlReader.  Some possible causes for this problem include:  .NET Framework is missing.  PowerShell must be launched with PowerShell -sta. Invalid XAML code was encournted.":exit}
# Convertir Name=* dans XML en Variable du meme nom
$xaml.SelectNodes("//*[@Name]") | % { Set-Variable -Name ($_.Name) -Value $Form.FindName($_.Name)}

#Icone de la fenetre
$Form.Icon = $pic1

#============================================
# Script Password
#============================================

$MonBouton.Add_Click({
	$Theme = [ControlzEx.Theming.ThemeManager]::Current.DetectTheme($form)
    $my_theme = ($Theme.BaseColorScheme)
	If($my_theme -eq "Light")
		{
            [ControlzEx.Theming.ThemeManager]::Current.ChangeThemeBaseColor($form,"Dark")
				
		}
	ElseIf($my_theme -eq "Dark")
		{					
            [ControlzEx.Theming.ThemeManager]::Current.ChangeThemeBaseColor($form,"Light")
            
		}		
})


#Fonction de retour � l'�tat initial
function Depart{
                
                #Param�trage des statuts des diff�rents boutons et textes
                #Activation
                $Aleatoire.IsChecked = $true
                $LongTextBox.IsEnabled = $true
			    $LongTextBox.Text = 12
		        
                #D�sactivation
			    $Majuscules.IsEnabled = $false
			    $Minuscules.IsEnabled = $false
			    $Chiffres.IsEnabled = $false
			    $Symboles.IsEnabled = $false
			
			    $MajTextbox.IsEnabled = $false
			    $MinTextbox.IsEnabled = $false
			    $SymbTextbox.IsEnabled = $false
			    $ChiffTextbox.IsEnabled = $false

			    $Majuscules.IsChecked = $false
			    $Minuscules.IsChecked = $false
			    $Chiffres.IsChecked = $false
			    $Symboles.IsChecked = $false

                $MajTextbox.Text = ""
			    $MinTextbox.Text = ""
			    $SymbTextbox.Text = ""
			    $ChiffTextbox.Text = ""
                
                $Resultat.Content = $null
                $MessageVert.Content = $null
}

#Action au clic sur la checkbox Majuscules
$Majuscules.Add_Click({

    #Si la case est coch�e, activation de la Textbox et affichage du chiffre 4
    If ($Majuscules.IsChecked -eq $true) 
        {
            $MajTextbox.Text = 4
            $MajTextbox.IsEnabled = $true
        }
    
    #Sinon d�sactivation de la Texbox et pas d'affichage
    Else
        {
            $MajTextbox.Text = ""
            $MajTextbox.IsEnabled = $false
        }

    #Si toutes les cases sont d�coch�es, retour � l'�tat initial de la fenetre
    If (($Majuscules.IsChecked -eq $false) -and ($Minuscules.IsChecked -eq $false) -and ($Symboles.IsChecked -eq $false) -and ($Chiffres.IsChecked -eq $false))
        {
            Depart
        }
})

#Action au clic sur la checkbox Minuscules	
$Minuscules.Add_Click({
    
    #Si la case est coch�e, activation de la Textbox et affichage du chiffre 4
    If ($Minuscules.IsChecked -eq $true) 
        {
			$MinTextbox.Text = 4
            $MinTextbox.IsEnabled = $true
        }

    #Sinon d�sactivation de la Texbox et pas d'affichage
    Else
        {
            $MinTextbox.Text = ""
            $MinTextbox.IsEnabled = $false
        }
    
    #Si toutes les cases sont d�coch�es, retour � l'�tat initial de la fenetre
    If (($Majuscules.IsChecked -eq $false) -and ($Minuscules.IsChecked -eq $false) -and ($Symboles.IsChecked -eq $false) -and ($Chiffres.IsChecked -eq $false))
        {
            Depart
        }

})

#Action au clic sur la checkbox Symboles
$Symboles.Add_Click({
    
    #Si la case est coch�e, activation de la Textbox et affichage du chiffre 2
    If ($Symboles.IsChecked -eq $true) 
        {
			$SymbTextbox.Text = 2
            $SymbTextbox.IsEnabled = $true
        }

    #Sinon d�sactivation de la Texbox et pas d'affichage
    Else
        {
            $SymbTextbox.Text = ""
            $SymbTextbox.IsEnabled = $false
        }

    #Si toutes les cases sont d�coch�es, retour � l'�tat initial de la fenetre
    If (($Majuscules.IsChecked -eq $false) -and ($Minuscules.IsChecked -eq $false) -and ($Symboles.IsChecked -eq $false) -and ($Chiffres.IsChecked -eq $false))
        {
            Depart
        }
})

#Action au clic sur la checkbox Chiffres
$Chiffres.Add_Click({
    
    #Si la case est coch�e, activation de la Textbox et affichage du chiffre 4
    If ($Chiffres.IsChecked -eq $true) 
        {
			$ChiffTextbox.Text = 2
            $ChiffTextbox.IsEnabled = $true
        }

    #Sinon d�sactivation de la Texbox et pas d'affichage
    Else
        {
            $ChiffTextbox.Text = ""
            $ChiffTextbox.IsEnabled = $false
        }

    #Si toutes les cases sont d�coch�es, retour � l'�tat initial de la fenetre
    If (($Majuscules.IsChecked -eq $false) -and ($Minuscules.IsChecked -eq $false) -and ($Symboles.IsChecked -eq $false) -and ($Chiffres.IsChecked -eq $false))
        {
            Depart
        }
})

#Action au clic sur le bouton 'G�n�rer le mot de passe'
$Generer.Add_Click({
		
        #R�initialiser l'affichage d'erreur
        $ErreurRouge.Content = $null

        #D�claration des tableaux
		$RandomOption = @()
		$CompletePassword = @()
		$CompleteSmallPassword = @()
		$CompleteCapitalPassword = @()
		$CompleteSymbolPassword = @()
		$CompleteNumberPassword = @()
		
		#table des caract�res
		$JSon = @"
    [
        {"SrNo":  "1","Number":  "33","Character":  "!","Phonetic":  "Exclamation point","Type":  "Symbol"},
        {"SrNo":  "3","Number":  "35","Character":  "#","Phonetic":  "Hash sign","Type":  "Symbol"},
        {"SrNo":  "4","Number":  "36","Character":  "$","Phonetic":  "Dollar sign","Type":  "Symbol"},
        {"SrNo":  "5","Number":  "37","Character":  "%","Phonetic":  "Percent sign","Type":  "Symbol"},
        {"SrNo":  "10","Number":  "42","Character":  "*","Phonetic":  "Asterisk","Type":  "Symbol"},
        {"SrNo":  "11","Number":  "43","Character":  "+","Phonetic":  "Plus sign","Type":  "Symbol"},
        {"SrNo":  "19","Number":  "61","Character":  "=","Phonetic":  "Equal sign","Type":  "Symbol"},
        {"SrNo":  "21","Number":  "63","Character":  "?","Phonetic":  "Question mark","Type":  "Symbol"},
        {"SrNo":  "22","Number":  "64","Character":  "@","Phonetic":  "At symbol","Type":  "Symbol"},
        {"SrNo":  "33","Number":  "65","Character":  "A","Phonetic":  "Alpha ","Type":  "Capital Letter"},
        {"SrNo":  "34","Number":  "66","Character":  "B","Phonetic":  "Bravo ","Type":  "Capital Letter"},
        {"SrNo":  "35","Number":  "67","Character":  "C","Phonetic":  "Charlie ","Type":  "Capital Letter"},
        {"SrNo":  "36","Number":  "68","Character":  "D","Phonetic":  "Delta ","Type":  "Capital Letter"},
        {"SrNo":  "37","Number":  "69","Character":  "E","Phonetic":  "Echo ","Type":  "Capital Letter"},
        {"SrNo":  "38","Number":  "70","Character":  "F","Phonetic":  "Foxtrot ","Type":  "Capital Letter"},
        {"SrNo":  "39","Number":  "71","Character":  "G","Phonetic":  "Golf ","Type":  "Capital Letter"},
        {"SrNo":  "40","Number":  "72","Character":  "H","Phonetic":  "Hotel ","Type":  "Capital Letter"},
        {"SrNo":  "41","Number":  "73","Character":  "I","Phonetic":  "India ","Type":  "Capital Letter"},
        {"SrNo":  "42","Number":  "74","Character":  "J","Phonetic":  "Juliet ","Type":  "Capital Letter"},
        {"SrNo":  "43","Number":  "75","Character":  "K","Phonetic":  "Kilo ","Type":  "Capital Letter"},
        {"SrNo":  "44","Number":  "76","Character":  "L","Phonetic":  "Lima ","Type":  "Capital Letter"},
        {"SrNo":  "45","Number":  "77","Character":  "M","Phonetic":  "Mike ","Type":  "Capital Letter"},
        {"SrNo":  "46","Number":  "78","Character":  "N","Phonetic":  "November ","Type":  "Capital Letter"},
        {"SrNo":  "48","Number":  "80","Character":  "P","Phonetic":  "Papa ","Type":  "Capital Letter"},
        {"SrNo":  "49","Number":  "81","Character":  "Q","Phonetic":  "Quebec ","Type":  "Capital Letter"},
        {"SrNo":  "50","Number":  "82","Character":  "R","Phonetic":  "Romeo ","Type":  "Capital Letter"},
        {"SrNo":  "51","Number":  "83","Character":  "S","Phonetic":  "Sierra ","Type":  "Capital Letter"},
        {"SrNo":  "52","Number":  "84","Character":  "T","Phonetic":  "Tango ","Type":  "Capital Letter"},
        {"SrNo":  "53","Number":  "85","Character":  "U","Phonetic":  "Uniform ","Type":  "Capital Letter"},
        {"SrNo":  "54","Number":  "86","Character":  "V","Phonetic":  "Victor ","Type":  "Capital Letter"},
        {"SrNo":  "55","Number":  "87","Character":  "W","Phonetic":  "Whiskey ","Type":  "Capital Letter"},
        {"SrNo":  "56","Number":  "88","Character":  "X","Phonetic":  "X-Ray ","Type":  "Capital Letter"},
        {"SrNo":  "57","Number":  "89","Character":  "Y","Phonetic":  "Yankee ","Type":  "Capital Letter"},
        {"SrNo":  "58","Number":  "90","Character":  "Z","Phonetic":  "Zulu ","Type":  "Capital Letter"},
        {"SrNo":  "59","Number":  "97","Character":  "a","Phonetic":  "Alpha ","Type":  "Small Letter"},
        {"SrNo":  "60","Number":  "98","Character":  "b","Phonetic":  "Bravo ","Type":  "Small Letter"},
        {"SrNo":  "61","Number":  "99","Character":  "c","Phonetic":  "Charlie ","Type":  "Small Letter"},
        {"SrNo":  "62","Number":  "100","Character":  "d","Phonetic":  "Delta ","Type":  "Small Letter"},
        {"SrNo":  "63","Number":  "101","Character":  "e","Phonetic":  "Echo ","Type":  "Small Letter"},
        {"SrNo":  "64","Number":  "102","Character":  "f","Phonetic":  "Foxtrot ","Type":  "Small Letter"},
        {"SrNo":  "65","Number":  "103","Character":  "g","Phonetic":  "Golf ","Type":  "Small Letter"},
        {"SrNo":  "66","Number":  "104","Character":  "h","Phonetic":  "Hotel ","Type":  "Small Letter"},
        {"SrNo":  "67","Number":  "105","Character":  "i","Phonetic":  "India ","Type":  "Small Letter"},
        {"SrNo":  "68","Number":  "106","Character":  "j","Phonetic":  "Juliet ","Type":  "Small Letter"},
        {"SrNo":  "69","Number":  "107","Character":  "k","Phonetic":  "Kilo ","Type":  "Small Letter"},
        {"SrNo":  "70","Number":  "108","Character":  "l","Phonetic":  "Lima ","Type":  "Small Letter"},
        {"SrNo":  "71","Number":  "109","Character":  "m","Phonetic":  "Mike ","Type":  "Small Letter"},
        {"SrNo":  "72","Number":  "110","Character":  "n","Phonetic":  "November ","Type":  "Small Letter"},
        {"SrNo":  "74","Number":  "112","Character":  "p","Phonetic":  "Papa ","Type":  "Small Letter"},
        {"SrNo":  "75","Number":  "113","Character":  "q","Phonetic":  "Quebec ","Type":  "Small Letter"},
        {"SrNo":  "76","Number":  "114","Character":  "r","Phonetic":  "Romeo ","Type":  "Small Letter"},
        {"SrNo":  "77","Number":  "115","Character":  "s","Phonetic":  "Sierra ","Type":  "Small Letter"},
        {"SrNo":  "78","Number":  "116","Character":  "t","Phonetic":  "Tango ","Type":  "Small Letter"},
        {"SrNo":  "79","Number":  "117","Character":  "u","Phonetic":  "Uniform ","Type":  "Small Letter"},
        {"SrNo":  "80","Number":  "118","Character":  "v","Phonetic":  "Victor ","Type":  "Small Letter"},
        {"SrNo":  "81","Number":  "119","Character":  "w","Phonetic":  "Whiskey ","Type":  "Small Letter"},
        {"SrNo":  "82","Number":  "120","Character":  "x","Phonetic":  "X-Ray ","Type":  "Small Letter"},
        {"SrNo":  "83","Number":  "121","Character":  "y","Phonetic":  "Yankee ","Type":  "Small Letter"},
        {"SrNo":  "84","Number":  "122","Character":  "z","Phonetic":  "Zulu ","Type":  "Small Letter"},
        {"SrNo":  "85","Number":  "48","Character":  "0","Phonetic":  "Zero","Type":  "Number"},
        {"SrNo":  "86","Number":  "49","Character":  "1","Phonetic":  "One","Type":  "Number"},
        {"SrNo":  "87","Number":  "50","Character":  "2","Phonetic":  "Two","Type":  "Number"},
        {"SrNo":  "88","Number":  "51","Character":  "3","Phonetic":  "Three","Type":  "Number"},
        {"SrNo":  "89","Number":  "52","Character":  "4","Phonetic":  "Four","Type":  "Number"},
        {"SrNo":  "90","Number":  "53","Character":  "5","Phonetic":  "Five","Type":  "Number"},
        {"SrNo":  "91","Number":  "54","Character":  "6","Phonetic":  "Six","Type":  "Number"},
        {"SrNo":  "92","Number":  "55","Character":  "7","Phonetic":  "Seven","Type":  "Number"},
        {"SrNo":  "93","Number":  "56","Character":  "8","Phonetic":  "Eight","Type":  "Number"},
        {"SrNo":  "94","Number":  "57","Character":  "9","Phonetic":  "Nine","Type":  "Number"}
    ]
"@
		
		<#Excluded Characters
		{"SrNo":  "2","Number":  "34","Character":  "\"","Phonetic":  "Double quotes","Type":  "Symbol"},
		{"SrNo":  "6","Number":  "38","Character":  "&","Phonetic":  "Ampersand","Type":  "Symbol"},
		{"SrNo":  "7","Number":  "39","Character":  "'","Phonetic":  "Single quote","Type":  "Symbol"},
        {"SrNo":  "8","Number":  "40","Character":  "(","Phonetic":  "Opening parenthesis","Type":  "Symbol"},
        {"SrNo":  "9","Number":  "41","Character":  ")","Phonetic":  "Closing parenthesis","Type":  "Symbol"},
		{"SrNo":  "12","Number":  "44","Character":  ",","Phonetic":  "Comma","Type":  "Symbol"},
		{"SrNo":  "13","Number":  "45","Character":  "-","Phonetic":  "Minus sign -Hyphen","Type":  "Symbol"},
		{"SrNo":  "14","Number":  "46","Character":  ".","Phonetic":  "Period","Type":  "Symbol"},
        {"SrNo":  "15","Number":  "47","Character":  "/","Phonetic":  "Slash","Type":  "Symbol"},
        {"SrNo":  "16","Number":  "58","Character":  ":","Phonetic":  "Colon","Type":  "Symbol"},
        {"SrNo":  "17","Number":  "59","Character":  ";","Phonetic":  "SemiColon","Type":  "Symbol"},
        {"SrNo":  "18","Number":  "60","Character":  "<","Phonetic":  "Less than sign","Type":  "Symbol"},
		{"SrNo":  "20","Number":  "62","Character":  ">","Phonetic":  "Greater than sign","Type":  "Symbol"},
		{"SrNo":  "23","Number":  "91","Character":  "[","Phonetic":  "Opening bracket","Type":  "Symbol"},
        {"SrNo":  "24","Number":  "92","Character":  "\\","Phonetic":  "Backslash","Type":  "Symbol"},
        {"SrNo":  "25","Number":  "93","Character":  "]","Phonetic":  "Closing bracket","Type":  "Symbol"},
        {"SrNo":  "26","Number":  "94","Character":  "^","Phonetic":  "Caret - circumflex","Type":  "Symbol"},
        {"SrNo":  "27","Number":  "95","Character":  "_","Phonetic":  "Underscore","Type":  "Symbol"},
        {"SrNo":  "28","Number":  "96","Character":  "`","Phonetic":  "Grave accent","Type":  "Symbol"},
		{"SrNo":  "29","Number":  "123","Character":  "{","Phonetic":  "Opening brace","Type":  "Symbol"},
        {"SrNo":  "30","Number":  "124","Character":  "|","Phonetic":  "Vertical bar","Type":  "Symbol"},
        {"SrNo":  "31","Number":  "125","Character":  "}","Phonetic":  "Closing brace","Type":  "Symbol"},
        {"SrNo":  "32","Number":  "126","Character":  "~","Phonetic":  "Equivalency sign - Tilde","Type":  "Symbol"},
		{"SrNo":  "47","Number":  "79","Character":  "O","Phonetic":  "Oscar ","Type":  "Capital Letter"},		
		{"SrNo":  "73","Number":  "111","Character":  "o","Phonetic":  "Oscar ","Type":  "Small Letter"},				
		#>
		
		#Fonction pour la g�n�ration al�atoire de caract�res
		function Get-Rng
		{
			$RandomBytes = New-Object -TypeName "System.Byte[]" 4
			$Random = New-Object -TypeName "System.Security.Cryptography.RNGCryptoServiceProvider"
			$Random.GetBytes($RandomBytes)
			[BitConverter]::ToInt32($RandomBytes, 0)
		}	
		
		#tables
		$AlphbatesTable = $JSon | ConvertFrom-Json
		$SymbolTable = $AlphbatesTable | Where-Object { $_.Type -eq 'Symbol' }
		$CapitalLetterTable = $AlphbatesTable | Where-Object { $_.Type -eq 'Capital Letter' }
		$SmallLetterTable = $AlphbatesTable | Where-Object { $_.Type -eq 'Small Letter' }
		$NumberTable = $AlphbatesTable | Where-Object { $_.Type -eq 'Number' }
		
		#Si le bouton Al�atoire est actif
		if ($Aleatoire.IsChecked -eq $true)
		{
  
            #Si la Textbox Longueur est un chiffre et que la valeur n'est pas nulle
			if (($LongTextBox.Text -match '[1-9]') -and ($LongTextBox.Text -ne $null))
			{

                #Boucle d'it�ration tant que la valeur n'est pas celle de la Textbox
				for ($i = 1; $i -le $LongTextBox.Text; $i++)
				{
                    #G�n�ration du mot de passe
					$DefaultUniqueNumber = Get-Rng
					$PasswordHash = Get-Random -InputObject $AlphbatesTable -SetSeed $DefaultUniqueNumber
					$CompletePassword += $PasswordHash.Character
					$CompletePassword = $CompletePassword -join ''
                    #Affichage du mot de passe
					$Resultat.Content = $CompletePassword
					# Copie le r�sultat dans le presse-papier
					$Resultat.Content | clip
					#Affiche le message en vert
					$MessageVert.Content = 'Le mot de passe est copié dans le Presse-papier, utiliser Ctrl+V pour coller.'
				}
			}

            #Sinon fonction Erreur
			else { 
			$ErreurRouge.Content = "Saisissez une longueur de mot de passe valide"
			$Resultat.Content = $null
			Depart			
			}
		}

        #Si le bouton Personnalisation est actif
		if ($Perso.IsChecked -eq $true)
		{
			
            #Si une des Textbox n'est pas un chiffre
            if (($Majuscules.IsChecked -eq $true -and $MajTextbox.Text -notmatch '[1-9]') -or ($Minuscules.IsChecked -eq $true -and $MinTextbox.Text -notmatch '[1-9]') -or ($Symboles.IsChecked -eq $true -and $SymbTextbox.Text -notmatch '[1-9]') -or ($Chiffres.IsChecked -eq $true -and $ChiffTextbox.Text -notmatch '[1-9]'))
            {
            $ErreurRouge.Content = "Saisissez une longueur de mot de passe valide"
			Depart	
            }

            #Si Textbox Majuscules est un ou plusieurs chiffres
			if ($MajTextbox.Text -match '[1-9]')
			{
				for ($c = 1; $c -le $MajTextbox.Text; $c++)
				{
                    #G�n�ration du mot de passe
					$CapitalUniqueNumber = Get-Rng
					$CompleteCapitalPassword += Get-Random -InputObject $CapitalLetterTable -SetSeed $CapitalUniqueNumber

				}
				
			}
		
            #Si Textbox Minuscules est un ou plusieurs chiffres
			if ($MinTextbox.Text -match '[1-9]')
			{
                #Boucle d'it�ration tant que la valeur n'est pas celle de la Textbox
				for ($sm = 1; $sm -le $MinTextbox.Text; $sm++)
				{
                    #G�n�ration du mot de passe
					$SmallUniqueNumber = Get-Rng
					$CompleteSmallPassword += Get-Random -InputObject $SmallLetterTable -SetSeed $SmallUniqueNumber

				}
			}

            #Si Textbox Symboles est un ou plusieurs chiffres
			if ($SymbTextbox.Text -match '[1-9]')
			{
                #Boucle d'it�ration tant que la valeur n'est pas celle de la Textbox
				for ($sy = 1; $sy -le $SymbTextbox.Text; $sy++)
				{
                    #G�n�ration du mot de passe
					$SymbolUniqueNumber = Get-Rng
					$CompleteSymbolPassword += Get-Random -InputObject $SymbolTable -SetSeed $SymbolUniqueNumber

				}
	
			}
			
            #Si Textbox Chiffres est un ou plusieurs chiffres
			if ($ChiffTextbox.Text -match '[1-9]')
			{
                #Boucle d'it�ration tant que la valeur n'est pas celle de la Textbox
				for ($N = 1; $N -le $ChiffTextbox.Text; $N++)
				{
                    #G�n�ration du mot de passe
					$NumberUniqueNumber = Get-Rng
					$CompleteNumberPassword += Get-Random -InputObject $NumberTable -SetSeed $NumberUniqueNumber

				}
			}

			#Ajouter des caract�res selon la complexit� choisie
			$RandomOption += $CompleteSmallPassword
			$RandomOption += $CompleteCapitalPassword
			$RandomOption += $CompleteNumberPassword
			$RandomOption += $CompleteSymbolPassword
			#Organisation al�atoire des caract�res
			$CompletePassword = $RandomOption | Select-Object *, @{ N = 'Sort'; E = { 1 .. 500 | Get-Random (Get-Rng) } } | Sort-Object -Property Sort
			#Concat�nation des caract�res
			$CompletePassword = $CompletePassword.Character -join ''
            #Affichage du mot de passe
			$Resultat.Content = $CompletePassword
			# Copie le r�sultat dans le presse-papier
			$Resultat.Content | clip
			#Affiche le message en vert
			$MessageVert.Content = 'Le mot de passe est copié dans le Presse-papier, utiliser Ctrl+V pour coller.'
            }



	})

#Ferme la fenetre si le bouton Echap est appuy�
$Form.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
{$x=$Form.Close()}})
	
#Action au clic sur le bouton Al�atoire
$Aleatoire.Add_Click({
         
        #Action si le bouton al�atoire est activ�
        If ($Aleatoire.IsChecked -eq $true) 
            {

                #Param�trage des statuts des diff�rents boutons et textes
                #Activation
  			    $LongTextBox.IsEnabled = $true
			    $LongTextBox.Text = 12
		        
                #D�sactivation
			    $Majuscules.IsEnabled = $false
			    $Minuscules.IsEnabled = $false
			    $Chiffres.IsEnabled = $false
			    $Symboles.IsEnabled = $false
			
			    $MajTextbox.IsEnabled = $false
			    $MinTextbox.IsEnabled = $false
			    $SymbTextbox.IsEnabled = $false
			    $ChiffTextbox.IsEnabled = $false

			    $Majuscules.IsChecked = $false
			    $Minuscules.IsChecked = $false
			    $Chiffres.IsChecked = $false
			    $Symboles.IsChecked = $false

                $MajTextbox.Text = ""
			    $MinTextbox.Text = ""
			    $SymbTextbox.Text = ""
			    $ChiffTextbox.Text = ""
                
                $ErreurRouge.Content = $null
                $Resultat.Content = $null
                $MessageVert.Content = $null
            }
})

#Action au clic sur le bouton Personnaliser
$Perso.Add_Click({

        #Action si le bouton Personnalisation est activ�
        If ($Perso.IsChecked -eq $true) 
            {
                #Param�trage des statuts des diff�rents boutons et textes
                #D�sactivation
			    $LongTextBox.IsEnabled = $false
                $LongTextBox.Text = ""

                $ErreurRouge.Content = $null
                $Resultat.Content = $null
                $MessageVert.Content = $null
			
                #Activation
			    $Majuscules.IsEnabled = $true
			    $Minuscules.IsEnabled = $true
			    $Chiffres.IsEnabled = $true
			    $Symboles.IsEnabled = $true
			
                $MajTextbox.IsEnabled = $true
			    $MinTextbox.IsEnabled = $true
			    $SymbTextbox.IsEnabled = $true
			    $ChiffTextbox.IsEnabled = $true
			
			    $Majuscules.IsChecked = $true
			    $Minuscules.IsChecked = $true
			    $Chiffres.IsChecked = $true
			    $Symboles.IsChecked = $true
			
			    #Valeur par d�faut
			    $MajTextbox.Text = 4
			    $MinTextbox.Text = 4
			    $SymbTextbox.Text = 2
			    $ChiffTextbox.Text = 2
                
            }
})
			
#Affichage GUI
$Form.ShowDialog() | Out-Null