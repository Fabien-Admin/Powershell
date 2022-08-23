# Autorisation d'execution du script, seulement dans cette session Powershell
Set-ExecutionPolicy Bypass -scope Process

#============================================
#Déclaration des fonctions
#============================================

function MessageBox {


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
#Fonction à appeler pour cacher la console : Hide-Console
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr,0) | Out-Null
#============================================

 [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.windows')  		| out-null
 [System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')                  | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll')    | out-null  
#============================================
# WPF in PowerShell
#============================================
[xml]$XAML = @'

<Controls:MetroWindow
	xmlns:Controls="clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro"
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Title="Admin Tools"
	Height="150"
	Width="300"
	Topmost="True"
	ResizeMode="NoResize"
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
	
    <Grid>
        <Label Name="Message" Content="Voulez-vous fermer cette application ?" VerticalAlignment="Top" HorizontalContentAlignment="Center" Margin="5,15"/>
		<Button Name="Btn_Oui" Content="Oui" HorizontalAlignment="Left" VerticalAlignment="Top" Width="75" Margin="50,60,0,0"/>
        <Button Name="Btn_Non" Content="Non" HorizontalAlignment="Right" VerticalAlignment="Top" Width="75" Margin="0,60,50,0"/>
    </Grid>
</Controls:MetroWindow>

'@


# Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$window=[Windows.Markup.XamlReader]::Load($reader)}
catch{Write-Host "Unable to load Windows.Markup.XamlReader.  Some possible causes for this problem include:  .NET Framework is missing.  PowerShell must be launched with PowerShell -sta. Invalid XAML code was encournted.":exit}
# Convertir Name=* dans XML en Variable du meme nom
$xaml.SelectNodes("//*[@Name]") | % { Set-Variable -Name ($_.Name) -Value $window.FindName($_.Name)}

#Icone de la fenetre
$window.Icon = $pic1

#============================================
# Choix Oui/Non
#============================================

#Fermeture des GUI
$Btn_Oui.Add_Click({
    $ProcessID = [System.Diagnostics.Process]::GetCurrentProcess()
    $ProcessID = $ProcessID.ID
    & taskkill /PID $ProcessID /t /f
})

#Fermeture de la fenetre MessageBox uniquement
$Btn_Non.Add_Click({
	$window.close()
	#Restaure le menu
	$Menu.WindowState = 'Normal'
})

#Affichage GUI
$window.ShowDialog() | Out-Null
}

function Script_Ping {
	
function PingSearch {
	
#Ci-dessous pour cacher la console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
 
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
#Fonction à appeler pour cacher la console : Hide-Console
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr,0) | Out-Null
#============================================

 [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.windows')  		| out-null
 [System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')                  | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll')    | out-null  

#============================================
# WPF in PowerShell
#============================================
[xml]$XAML = @'

<Controls:MetroWindow
	xmlns:Controls="clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro"
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Title="Ping"
	Height="150"
	Width="300"
	Topmost="True"
	ResizeMode="NoResize"
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
	
    <Grid>
		<Label Content="Entrer une destination :" HorizontalAlignment="Left" Margin="7,10,0,0" VerticalAlignment="Top"/>
		<TextBox Name="TextBox1" HorizontalAlignment="Left" Height="23" Margin="10,36,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173"/>
		<Button Name="Start1" Content="Start" HorizontalAlignment="Left" Margin="195,36,0,0" VerticalAlignment="Top" Width="75" Height="23" TabIndex="0" IsDefault="true"/>			
    </Grid>
</Controls:MetroWindow>

'@


# Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$window=[Windows.Markup.XamlReader]::Load($reader)}
catch{Write-Host "Unable to load Windows.Markup.XamlReader.  Some possible causes for this problem include:  .NET Framework is missing.  PowerShell must be launched with PowerShell -sta. Invalid XAML code was encournted.":exit}
# Convertir Name=* dans XML en Variable du meme nom
$xaml.SelectNodes("//*[@Name]") | % { Set-Variable -Name ($_.Name) -Value $window.FindName($_.Name)}

#============================================
# Choix de la destination
#============================================
#Exemple de destination de ping, texte par défaut
$TextBox1.Text = 'www.google.fr'
$TextBox1.Foreground = 'Darkgray'

#Supprimer le texte par défaut quand on clique sur la textbox
$TextBox1.Add_GotFocus({
    
    if ($TextBox1.Text -eq 'www.google.fr') {
        $TextBox1.Foreground = 'White'
        $TextBox1.Text = ''
    }
})

#Ferme la fenetre si le bouton Echap est appuyé
$window.Add_KeyDown({
        if ($_.Key -eq "Escape") {
            $window.close()
        }
})

#Action au clic sur le bouton Start
$Start1.Add_Click({
    
	$window.close()
	Ping
})

#Affichage GUI
$window.ShowDialog() | Out-Null
}

function Ping {

#Destination du ping
$UserInput = $TextBox1.Text
 
#Variable synchroniée 
$Global:SyncTable = [HashTable]::Synchronized(@{})
$SyncTable.CompName = "$UserInput"
$SyncTable.ContinuePing = $true
$SyncTable.CloseScript = $false
$SyncTable.Grid_Ping_Array = New-Object System.Collections.ArrayList
 
#Variable de l'espace de travail 
$Runspace1 = [RunspaceFactory]::CreateRunspace()
$Runspace1.ApartmentState = "STA"
$Runspace1.ThreadOptions = "ReuseThread"
$Runspace1.Open()
$Runspace1.SessionStateProxy.SetVariable("SyncTable",$SyncTable)
$psScript = [Powershell]::Create().AddScript({
    $UserInput = $SyncTable.CompName
    Add-Type -AssemblyName PresentationFramework,PresentationCore,WindowsBase
 
#Action au clic sur le bouton Stop/Fermer
Function Btn_CancelClose_Click {
	#Stopper la variable synchronisée
    $BtnContent = $SyncTable.Btn_CancelClose.Content
	#Si le bouton n'est pas sur STOP --> fermer le script et la fenetre
    if ($BtnContent -ne "Stop") {
		$SyncTable.CloseScript = $true
		$SyncTable.Window.close()
    }
	#Arret du ping
    $SyncTable.ContinuePing = $false
}

#Fenetre au premier plan et affichage dans la barre des taches 
Function Window_Activated {
    $SyncTable.Window.TopMost = $true
    $SyncTable.Window.ShowInTaskBar = $true
}
 
#============================================
# WPF in PowerShell
#============================================
 
    [XML]$xaml = @'
<Controls:MetroWindow
	xmlns:Controls="clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro"
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Title=""
	Height="350"
	Width="425"
	Topmost="True"
	ResizeMode="NoResize"
	WindowStartupLocation="CenterScreen"
	FontFamily="Consolas">
	
<Window.Resources>
	<ResourceDictionary>
		<ResourceDictionary.MergedDictionaries>
			<ResourceDictionary Source="pack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml" />
			<ResourceDictionary Source="pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml" />
			<ResourceDictionary Source="pack://application:,,,/MahApps.Metro;component/Styles/Themes/Dark.Cobalt.xaml"/>
		</ResourceDictionary.MergedDictionaries>
	</ResourceDictionary>
</Window.Resources>	
	
    <Grid>
        <Label x:Name="Lbl_CompName" Content="" VerticalAlignment="Top" HorizontalContentAlignment="Center" Margin="5,5"/>
        <DataGrid x:Name="Grid_Ping" Margin="5,35,5,130" IsReadOnly="True" AutoGenerateColumns="False" ItemBindingGroup="{Binding}" SelectionUnit="FullRow" HeadersVisibility="Column">
            <DataGrid.Columns>
                <DataGridTextColumn x:Name="Col_Reply" Binding="{Binding Path=ReplyIP}" Header="Réponse de   "/>
                <DataGridTextColumn x:Name="Col_Status" Binding="{Binding Path=Status}" Header="Statut   "/>
                <DataGridTextColumn x:Name="Col_Bytes" Binding="{Binding Path=Bytes}" Header="Octets  "/>
                <DataGridTextColumn x:Name="Col_Time" Binding="{Binding Path=Time}" Header="Temps  "/>
                <DataGridTextColumn x:Name="Col_TTL" Binding="{Binding Path=TTL}" Header="TTL  "/>
            </DataGrid.Columns>
        </DataGrid>
        <Border BorderThickness="1" BorderBrush="Black" Height="90" VerticalAlignment="Bottom" Margin="5,5,5,30"/>
        <Label x:Name="Lbl_PingStats" Content="" VerticalAlignment="Bottom" Margin="5,5,5,30" Height="90"/>
        <Button x:Name="Btn_CancelClose" Content="Stop" HorizontalAlignment="Right" VerticalAlignment="Bottom" Width="75" Margin="5,5,5,1"/>
    </Grid>
</Controls:MetroWindow>
'@

# Read XAML
$XMLReader = (New-Object System.Xml.XmlNodeReader $xaml)
$SyncTable.Window = [Windows.Markup.XamlReader]::Load($XMLReader)

$SyncTable.Window.Add_Closed({
	$SyncTable.CloseScript = $true
	$SyncTable.Window.close()})
	
$SyncTable.Window.Add_Activated({Window_Activated})
$SyncTable.Window.Title = "PING - $UserInput"
$SyncTable.Lbl_CompName = $SyncTable.Window.FindName("Lbl_CompName")
$SyncTable.Lbl_CompName.Content = "$UserInput"
$SyncTable.Grid_Ping = $SyncTable.Window.FindName("Grid_Ping")
$SyncTable.Lbl_PingStats = $SyncTable.Window.FindName("Lbl_PingStats")
$SyncTable.Lbl_PingStats.Content = ""
$SyncTable.Btn_CancelClose = $SyncTable.Window.FindName("Btn_CancelClose")
$SyncTable.Btn_CancelClose.Add_Click({Btn_CancelClose_Click})
$Timer = New-Object System.Windows.Threading.DispatcherTimer
$Timer.Interval = [TimeSpan]"0:0:0.50"
$Action = {
    $SyncTable.Grid_Ping.ItemsSource = $SyncTable.Grid_Ping_Array
    $SyncTable.Lbl_PingStats.Content = $Synctable.PingLabel
    $SyncTable.Grid_Ping.ScrollIntoView($SyncTable.Grid_Ping.Items[$SyncTable.Grid_Ping.Items.Count - 1])
    $SyncTable.Grid_Ping.UpdateLayout()
    if ($SyncTable.ContinuePing -ne $true) {
        $SyncTable.Btn_CancelClose.Content = "Fermer"
        $Timer.Stop()
    }
}
$Timer.Add_Tick($Action)
$Timer.Start()
$SyncTable.Window.ShowDialog() | Out-Null
})
$psScript.Runspace = $Runspace1
$Handle = $psScript.BeginInvoke()
 
$NumSuccess = 0
$NumUnsuccess = 0
$Count = 0
$IP = $null
$MinResTime = 0
$MaxResTime = 0
$AverageResTime = $null
$TotalResTime = 0
 
do {
    $ResponseTime = $null
    $ReplySize = $null
    $TTL = $null
    $StatusCode = $null
    $Count++
    $strQuery = "Select * from Win32_PingStatus where Address='$UserInput'" 
    $ping = Get-WmiObject -query $strQuery
    $IP = $ping.IPV4Address.IPAddressToString
    $ReplySize = $ping.ReplySize
    $ResponseTime = $ping.ResponseTime | Out-String
    $ResponseTimeText = "$ResponseTime ms"
    $ResponseTimeText = $ResponseTimeText.Replace("`n","").replace("`r","")
    $TTL = $ping.ResponseTimeToLive
    $StatusCode = $ping.StatusCode
    if ($StatusCode -eq 0) {
        $NumSuccess++
         
        $Results = Select-Object -InputObject "" ReplyIP, Status, Bytes, Time, TTL
        $Results.ReplyIP = $IP
        $Results.Status = "Succès"
        $Results.Bytes = $ReplySize
        $Results.Time = $ResponseTimeText
        $Results.TTL = $TTL
        $SyncTable.Grid_Ping_Array += $Results
         
        $PercentLoss = ($NumUnsuccess / $Count) * 100
        $PercentLoss = [Math]::Round($PercentLoss, 0)
        if ($ResponseTime -gt $MaxResTime -or $MaxResTime -eq $null) {$MaxResTime = $ResponseTime}
        if ($ResponseTime -lt $MinResTime -or $MinResTime -eq $null) {$MinResTime = $ResponseTime}
        $TotalResTime = $TotalResTime + $ResponseTime
        $AverageResTime = $TotalResTime / $NumSuccess
        $AverageResTimeRounded = [Math]::Round($AverageResTime, 2)
        $MinResTimeText = $MinResTime | Out-String
        $MinResTimeText = $MinResTimeText.replace("`n","").replace("`r","")
        $MaxResTimeText = $MaxResTime | Out-String
        $MaxResTimeText = $MaxResTimeText.replace("`n","").replace("`r","")
        $Synctable.PingLabel = "Statistiques Ping pour $IP" + " :`nPaquets : envoyés = $count" + ", reçus = $NumSuccess" + ", perdus = $NumUnsuccess (perte "+ $PercentLoss + "%),`nDurée approximative des boucles en millisecondes :`nMinimum = $MinResTimeText" + "ms, Maximum = $MaxResTimeText" + "ms, Moyenne = $AverageResTimeRounded" + "ms"
    }
    else {
        $NumUnsuccess++
        $Results = Select-Object -InputObject "" ReplyIP, Status
        $Results.ReplyIP = $IP
        $Results.Status = "Échec"
        $SyncTable.Grid_Ping_Array += $Results
        $PingResults.Rows.Add($IP,"Échec")
        $PercentLoss = ($NumUnsuccess / $Count) * 100
        $PercentLoss = [Math]::Round($PercentLoss, 2)
        $TotalResTime = $TotalResTime + $ResponseTime
        $MinResTimeText = $MinResTime | Out-String
        $MinResTimeText = $MinResTimeText.replace("`n","").replace("`r","")
        $MaxResTimeText = $MaxResTime | Out-String
        $MaxResTimeText = $MaxResTimeText.replace("`n","").replace("`r","")
        $Synctable.PingLabel = "Statistiques Ping pour $IP" + " :`nPaquets : envoyés = $count" + ", reçus = $NumSuccess" + ", perdus = $NumUnsuccess (perte "+ $PercentLoss + "%),`nDurée approximative des boucles en millisecondes :`nMinimum = $MinResTimeText" + "ms, Maximum = $MaxResTimeText" + "ms, Moyenne = $AverageResTimeRounded" + "ms"
    }
    Start-Sleep -Milliseconds 500
} while ($SyncTable.ContinuePing -eq $true)
 
do {
    Start-Sleep 10
} while ($SyncTable.CloseScript -ne $true)
}

#Appel de la fonction PingSearch
PingSearch
}

function Script_Tracert {
#Ci-dessous pour cacher la console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
 
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
#Fonction à appeler pour cacher la console : Hide-Console
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr,0) | Out-Null
#============================================

 [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.windows')  		| out-null
 [System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')                  | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll')    | out-null  

#============================================
# WPF in PowerShell
#============================================
[xml]$XAML = @'

<Controls:MetroWindow
	xmlns:Controls="clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro"
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Title="Tracert"
	Height="150"
	Width="300"
	Topmost="True"
	ResizeMode="NoResize"
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
	
    <Grid>
		<Label Content="Entrer une destination :" HorizontalAlignment="Left" Margin="7,10,0,0" VerticalAlignment="Top"/>
		<TextBox Name="TextBox1" HorizontalAlignment="Left" Height="23" Margin="10,36,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173"/>
		<Button Name="Start1" Content="Start" HorizontalAlignment="Left" Margin="195,36,0,0" VerticalAlignment="Top" Width="75" Height="23" TabIndex="0" IsDefault="true"/>			
    </Grid>
</Controls:MetroWindow>

'@


# Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$window=[Windows.Markup.XamlReader]::Load($reader)}
catch{Write-Host "Unable to load Windows.Markup.XamlReader.  Some possible causes for this problem include:  .NET Framework is missing.  PowerShell must be launched with PowerShell -sta. Invalid XAML code was encournted.":exit}
# Convertir Name=* dans XML en Variable du meme nom
$xaml.SelectNodes("//*[@Name]") | % { Set-Variable -Name ($_.Name) -Value $window.FindName($_.Name)}


#============================================
# Choix de la destination
#============================================

#Exemple de destination de ping, texte par défaut
$TextBox1.Text = 'www.google.fr'
$TextBox1.Foreground = 'Darkgray'

#Supprimer le texte par défaut quand on clique sur la textbox
$TextBox1.Add_GotFocus({
    
    if ($TextBox1.Text -eq 'www.google.fr') {
        $TextBox1.Foreground = 'White'
        $TextBox1.Text = ''
    }
})

#Ferme la fenetre si le bouton Echap est appuyé
$window.Add_KeyDown({
        if ($_.Key -eq "Escape") {
            $window.close()
        }
})

#Action au clic sur le bouton Start
$Start1.Add_Click({

    #Définir la valeur de "$TextBox1.Text" dans une variable d'environnement temporaire
    [System.Environment]::SetEnvironmentVariable('TEMP', $Textbox1.Text)

	#Fermeture de la fenetre TracertSearch
    $window.close()

    #Execute la commande 'tracert $env:TEMP' dans une nouvelle fenetre
	Start-Process powershell -args '-noexit', '-Command Write-Host "Tracert à destination de "$env:TEMP ; tracert $env:TEMP'

})

#Affichage GUI
$window.ShowDialog() | Out-Null
}

function Script_Nslookup {
#Ci-dessous pour cacher la console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
 
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
#Fonction à appeler pour cacher la console : Hide-Console
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr,0) | Out-Null
#============================================

 [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.windows')  		| out-null
 [System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')                  | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll')    | out-null  

#============================================
# WPF in PowerShell
#============================================

[XML]$xaml = @'
<Controls:MetroWindow
	xmlns:Controls="clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro"
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Title="Nslookup"
	Height="380"
	Width="440"
	Topmost="True"
	ResizeMode="NoResize"
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
	
    <Grid>
        <Label Content="Entrer une destination :" HorizontalAlignment="Left" Margin="7,5,0,0" VerticalAlignment="Top"/>
		<TextBox Name="TextBox" HorizontalAlignment="Left" Height="23" Margin="10,31,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="133"/>
		<Button Name="Btn_Start" Content="Start" HorizontalAlignment="Left" Margin="175,31,0,0" VerticalAlignment="Top" Width="75" Height="23" TabIndex="0" IsDefault="true"/>
        <DataGrid Name="Grid_NS" Margin="5,60,5,10" IsReadOnly="True" AutoGenerateColumns="False" ItemBindingGroup="{Binding}" SelectionUnit="FullRow" HeadersVisibility="Column">
            <DataGrid.Columns>
                <DataGridTextColumn x:Name="Col_Name" Binding="{Binding Path=Name}" Header="Nom                                             "/>
                <DataGridTextColumn x:Name="Col_IP" Binding="{Binding Path=IP}" Header="Adresse IP                                       "/>
            </DataGrid.Columns>
        </DataGrid>
        <Button Name="Btn_Close" Content="Fermer" HorizontalAlignment="Right" VerticalAlignment="Bottom" Width="75" Margin="5,5,5,5"/>
    </Grid>
</Controls:MetroWindow>
'@

# Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$window=[Windows.Markup.XamlReader]::Load($reader)}
catch{Write-Host "Unable to load Windows.Markup.XamlReader.  Some possible causes for this problem include:  .NET Framework is missing.  PowerShell must be launched with PowerShell -sta. Invalid XAML code was encournted.":exit}
# Convertir Name=* dans XML en Variable du meme nom
$xaml.SelectNodes("//*[@Name]") | % { Set-Variable -Name ($_.Name) -Value $window.FindName($_.Name)}


#============================================
# Action du script
#============================================
#Exemple de destination de nslookup, texte par défaut
$TextBox.Text = 'www.google.fr'
$TextBox.Foreground = 'Darkgray'

#Supprimer le texte par défaut quand on clique sur la textbox
$TextBox.Add_GotFocus({
    
    if ($TextBox.Text -eq 'www.google.fr') {
        $TextBox.Foreground = 'White'
        $TextBox.Text = ''
    }
})


#Action au clic bouton Start
$Btn_Start.Add_Click({ 
    
    #Effacer variable error
    $error.clear()
    
    Try {
 	#Résolution Nslookup
	$Result = Resolve-DNSName -Name $TextBox.Text
    }

    Catch{
        $Name = "Erreur"
        $IP = "Erreur"
    }


	#Regex IPV4
	$IPV4  = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
    
    If (!$error) {

	#If TextBox.Text IPV4 --> Name = NameHost / IP = Textbox.Text
    If ($TextBox.Text -match $IPV4) {
		$Name = $Result.NameHost
		$IP = $Textbox.Text	
    }

	#Else --> Name = Textbox.Text / IP = IP
	Else {
		$Name = $Textbox.Text
		$IP = $Result.IP4Address
	}
	}
    
    #Si les variables sont nulles alors "Erreur"
    If ($Name -eq $null) {$Name = "Erreur"}
    If ($IP -eq $null) {$IP = "Erreur"}
	
	#Si le résultat contient plusieurs IP alors Prendre la première
	If ($IP -is [array]) {$IP = $IP[0]}
	
	#Ajouter des données dans le tableau
	$Grid_NS.AddChild([pscustomobject]@{Name=$Name;IP=$IP})
	
	#Défilement automatique
	$Grid_NS.ScrollIntoView($Grid_NS.Items[$Grid_NS.Items.Count - 1])
    
})

#Action au clic bouton Fermer
$Btn_Close.Add_Click({ 
    
    #Fermeture de la fenetre Nslookup
    $window.close()
    #Restauration du Menu 
    $Menu.WindowState = 'Normal'
})

#Affichage GUI 
$window.ShowDialog() | Out-Null	
}

function Script_IPerf {
 
#============================================
 [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  		| out-null
 [System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')                  | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll')    | out-null  
 
# Set Variables
$SyncHash = [hashtable]::Synchronized(@{})
$SyncHash.Host = $host
$SyncHash.IperfFolder = $PSScriptRoot + '\Bin'

# UI Runspace
$UiRunspace = [runspacefactory]::CreateRunspace()
$UiRunspace.ApartmentState = 'STA'
$UiRunspace.ThreadOptions = 'ReuseThread'
$UiRunspace.Open()
$UiRunspace.SessionStateProxy.SetVariable('syncHash',$SyncHash)

# UI Script
$UiPowerShell = [PowerShell]::Create().AddScript(
    {
        $SyncHash.host.ui.WriteVerboseLine(' UI Script Started')
        trap {$SyncHash.host.ui.WriteErrorLine("$_`nError was in Line {0}`n{1}" -f ($_.InvocationInfo.ScriptLineNumber, $_.InvocationInfo.Line))}

        function Write-Status
        {
        [CmdletBinding()]
            param
            (
                [Parameter(Mandatory=$true, Position=0)]
                [String]$Text,
                
                [Parameter(Mandatory=$true, Position=1)]
                [String]$Colore
            )
            $syncHash.Form.Dispatcher.invoke([action]{
                    if (![string]::IsNullOrWhitespace([System.Windows.Documents.TextRange]::new($SyncHash.IperfJobOutputTextBox.Document.ContentStart, $SyncHash.IperfJobOutputTextBox.Document.ContentEnd).Text))
                    {
                        $SyncHash.IperfJobOutputTextBox.AppendText("`r")
                    }
                    
                    $TextRange = [System.Windows.Documents.TextRange]::new($SyncHash.IperfJobOutputTextBox.Document.ContentEnd, $SyncHash.IperfJobOutputTextBox.Document.ContentEnd)
                    $TextRange.Text = $Text
                    $TextRange.ApplyPropertyValue([System.Windows.Documents.TextElement]::ForegroundProperty, [System.Windows.Media.Brushes]::$Colore)
                    $SyncHash.IperfJobOutputTextBox.ScrollToEnd()
            })
        }

        function Start-Iperf
        {
            $SyncHash.host.ui.WriteVerboseLine('Start-Iperf')
            if ($SyncHash.IperfJobMonitorRunspace.RunspaceStateInfo.State -eq 'Opened')
            {
                Write-Status -Text 'Iperf Already Running' -Colore 'Orange'
            }
            else
            {

                #Get-Job | Remove-Job -Force
                #$SyncHash.Remove('IperfJob')

                # Iperf Job Monitor with Register-ObjectEvent in Runspace
                $InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
                $InitialSessionState.Commands.Add((New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList 'Stop-Iperf', (Get-Content Function:\Stop-Iperf)))
                $InitialSessionState.Commands.Add((New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList 'Write-Status', (Get-Content Function:\Write-Status)))
                $SyncHash.IperfJobMonitorRunspace = [runspacefactory]::CreateRunspace($InitialSessionState)
                $SyncHash.IperfJobMonitorRunspace.ApartmentState = 'STA'
                $SyncHash.IperfJobMonitorRunspace.ThreadOptions = 'ReuseThread'
                $SyncHash.IperfJobMonitorRunspace.Open()
                $SyncHash.IperfJobMonitorRunspace.SessionStateProxy.SetVariable('syncHash',$SyncHash)
                $SyncHash.IperfJobMonitorRunspace.SessionStateProxy.SetVariable('CsvFilePath',$SyncHash.CsvFilePathTextBox.Text)
                $SyncHash.IperfJobMonitorRunspace.SessionStateProxy.SetVariable('Command',$SyncHash.CommandTextBox.Text)
                $SyncHash.IperfJobMonitorRunspace.SessionStateProxy.SetVariable('IperfVersion',$IperfVersion)
                $SyncHash.IperfJobMonitorRunspace.SessionStateProxy.SetVariable('IperfExe',$IperfExe)
                $SyncHash.IperfJobMonitorPowerShell = [PowerShell]::Create().AddScript(
                    {
                        trap {$SyncHash.host.ui.WriteErrorLine("$_`nError was in Line {0}`n{1}" -f ($_.InvocationInfo.ScriptLineNumber, $_.InvocationInfo.Line))}
                        trap [System.Management.Automation.PipelineStoppedException] {$SyncHash.host.ui.WriteVerboseLine($_)}
                        
                        $SyncHash.host.ui.WriteVerboseLine('Start-Iperf Running')
                        Set-Location -Path $SyncHash.IperfFolder
                        
                        try
                        {
                            $ErrorActionPreferenceOrg = $ErrorActionPreference
                            if ($IperfVersion -eq 2)
                            {
                                'Time,localIp,localPort,RemoteIp,RemotePort,Id,Interval,Transfer,Bandwidth' | Out-File -FilePath $CsvFilePath
                                Write-Status -Text ((Invoke-Expression -Command "$IperfExe -v") 2>&1) -Colore 'Blue'
                                $ErrorActionPreference = 'stop'
                                Invoke-Expression -Command $Command | Out-File -FilePath $CsvFilePath -Append
                            }
                            else
                            {
                                Set-Content -Path $CsvFilePath -Value $null
                                #Write-Status -Text ((Invoke-Expression -Command "$IperfExe -v") -join ' ') -Colore 'Blue'
                                Invoke-Expression -Command $Command

                                if ($ErrorOut = Get-Content -Tail 5 -Path $CsvFilePath | Select-String -Pattern 'iperf3: error')
                                {
                                    Write-Error -Message $ErrorOut -ErrorAction Stop
                                }
                            }
                        }
                        catch
                        {
                            Write-Status -Text $_ -Colore 'Red'
                            Stop-Iperf
                        }
                        $ErrorActionPreference = $ErrorActionPreferenceOrg
                        Write-Status -Text 'Iperf Finished' -Colore 'Green'
                        Stop-Iperf

                        #Get-EventSubscriber | Unregister-Event
                        #$SyncHash.Remove('IperfJobMonitor')
                    })
                $SyncHash.IperfJobMonitorPowerShell.Runspace = $SyncHash.IperfJobMonitorRunspace
                $SyncHash.IperfJobMonitorHandle = $SyncHash.IperfJobMonitorPowerShell.BeginInvoke()
            }
        }

        function Stop-Iperf
        {
            $SyncHash.host.ui.WriteVerboseLine('Stop-Iperf')
            if ($SyncHash.IperfJobMonitorRunspace.RunspaceStateInfo.State -eq 'Opened')
            {
                $SyncHash.host.ui.WriteVerboseLine('Stop-Iperf Running')
                #$SyncHash.IperfJobMonitorPowerShell.EndInvoke($SyncHash.IperfJobMonitorHandle)
                $SyncHash.IperfJobMonitorRunspace.Close()
                $SyncHash.IperfJobMonitorPowerShell.Dispose()
            }
        }

        function Start-Analyzer
        {
            $SyncHash.host.ui.WriteVerboseLine('Start-Analyzer')
            if (!(Test-Path -Path $SyncHash.CsvFilePathTextBox.Text))
            {
                Write-Status -Text 'File not found' -Colore 'Red'
            }
            elseif ($SyncHash.AnalyzerRunspace.RunspaceStateInfo.State -eq 'Opened')
            {
                Write-Status -Text 'Analyzer Already Running' -Colore 'Orange'
            }
            else
            {
                # Analyzer Runspace
                $InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
                $InitialSessionState.Commands.Add((New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList 'Stop-Analyzer', (Get-Content Function:\Stop-Analyzer)))
                $InitialSessionState.Commands.Add((New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList 'Write-Status', (Get-Content Function:\Write-Status)))
                $SyncHash.AnalyzerRunspace = [runspacefactory]::CreateRunspace($InitialSessionState)
                $SyncHash.AnalyzerRunspace.ApartmentState = 'STA'
                $SyncHash.AnalyzerRunspace.ThreadOptions = 'ReuseThread'
                $SyncHash.AnalyzerRunspace.Open()
                $SyncHash.AnalyzerRunspace.SessionStateProxy.SetVariable('syncHash',$SyncHash)
                $SyncHash.AnalyzerRunspace.SessionStateProxy.SetVariable('CsvFilePath',$SyncHash.CsvFilePathTextBox.Text)
                $SyncHash.AnalyzerRunspace.SessionStateProxy.SetVariable('LastX',$SyncHash.LastXTextBox.Text)
                $SyncHash.AnalyzerRunspace.SessionStateProxy.SetVariable('IperfVersion',$IperfVersion)
                $SyncHash.AnalyzerPowerShell = [powershell]::Create()
                $SyncHash.AnalyzerPowerShell.Runspace = $SyncHash.AnalyzerRunspace
                $null = $SyncHash.AnalyzerPowerShell.AddScript($AnalyzerScript)
                $SyncHash.AnalyzerHandle = $SyncHash.AnalyzerPowerShell.BeginInvoke()
            }
        }

        # Analyzer Runspace Script
        $AnalyzerScript = 
        {
            $SyncHash.host.ui.WriteVerboseLine('Start-Analyzer Running')
            trap {$SyncHash.host.ui.WriteErrorLine("$_`nError was in Line {0}`n{1}" -f ($_.InvocationInfo.ScriptLineNumber, $_.InvocationInfo.Line))}
            trap [System.Management.Automation.PipelineStoppedException] {$SyncHash.host.ui.WriteVerboseLine($_)}

            $First  = $true
            $Header = $null
            $AnalyzerDataLength = 0

            $ChartDataAction0 = [Action]{
                $SyncHash.Chart.Series['Bandwidth (Mbits/sec)'].Points.Clear()
                $SyncHash.Chart.Series['Transfer (MBytes)'].Points.Clear()
                $SyncHash.host.ui.WriteVerboseLine('Clear Data: ' + ($SyncHash.Chart.Series['Transfer (MBytes)'].Points.Count | Out-String))
            }
            $SyncHash.Chart.Invoke($ChartDataAction0)

            Get-Content -Path $CsvFilePath -ReadCount 0 -Wait | ForEach-Object {
                trap {$SyncHash.host.ui.WriteErrorLine("$_`nError was in Line {0}`n{1}" -f ($_.InvocationInfo.ScriptLineNumber, $_.InvocationInfo.Line))}
                #$SyncHash.host.ui.WriteVerboseLine('Loop Data: ' + ($_ | Out-String)) ###
                $AnalyzerData = New-Object -TypeName System.Collections.Generic.List[System.Object]

                if ($IperfVersion -eq 2)
                {
                    foreach ($Line in $_)
                    {
                        if ($Line -like '*Bandwidth*')
                        {
                            $Header = $Line -split ','
                        }
                        else
                        {
                            if ($First -and !$Header)
                            {
                                Write-Status -Text 'CSV Error' -Colore 'Red'
                                Stop-Analyzer
                            }
                            else
                            {
                                $First = $false
                            }

                            $CsvLine = $Line | ConvertFrom-Csv -Header $Header
                            $CsvLine.Bandwidth = $CsvLine.Bandwidth /1Mb
                            $CsvLine.Transfer = $CsvLine.Transfer /1Mb
                            if (!($CsvLine.Interval).StartsWith('0.0-') -or ($CsvLine.Interval -eq '0.0-1.0'))
                            {
                                $AnalyzerData.add($CsvLine)
                            }   
                            else  
                            {
                                $SyncHash.host.ui.WriteVerboseLine('Remove Total Line: ' + $CsvLine.Time)
                            }
                        }
                    }
                }
                else
                {
                    $Csv = $_ | Where-Object {$_ -match '\[...\]'}
                    #$Csv = $a | Select-String -Pattern '\[...\]'
                    foreach ($Line in $Csv)
                    {
                        $Line = $Line -replace '[][]'
                        if ($Line -like ' ID *')
                        {
                            $Header = ($Line = $Line -replace 'Total Datagram','Total-Datagram' -replace 'Lost/Total Datagrams','Lost/Total-Datagrams') -split '\s+' | Where-Object {$_}
                            $HeaderIndex = @()
                            foreach ($Head in $Header)
                            {
                                $HeaderIndex += $Line.IndexOf($Head)
                            }
                        }
                        elseif ($Header -and $Line -notlike '*connected to*' -and $Line -notlike '*sender*' -and $Line -notlike '*receiver*' -and $Line -cnotlike '*datagrams*')
                        {
                            $i=0
                            $CsvLine = New-Object System.Object
                            foreach ($Head in $Header)
                            {
                                if ($i -lt $HeaderIndex.Length-1)
                                {
                                    $Cell = $Line.Substring($HeaderIndex[$i],$HeaderIndex[$i + 1] - $HeaderIndex[$i])
                                }
                                else
                                {
                                    $Cell = $Line.Substring($HeaderIndex[$i])
                                }

                                if ($Head -eq 'Transfer')
                                {
                                    $TransferData = $Cell.Trim() -split '\s+'
                                    if ($TransferData[1] -eq 'KBytes')
                                    {
                                        $Cell = $TransferData[0] /1kb
                                    }
                                    elseif ($TransferData[1] -eq 'GBytes')
                                    {
                                        $Cell = $TransferData[0] *1kb
                                    }
                                }

                                $i++
                                Add-Member -InputObject $CsvLine -NotePropertyName $Head -NotePropertyValue ("$Cell".Trim() -split '\s+')[0]
                            }
                            $AnalyzerData.add($CsvLine)
                        }
                    }
                }

                if ($AnalyzerData.Count -gt $LastX -and $LastX -gt 0)
                {
                    $SyncHash.host.ui.WriteVerboseLine('Trim Data 1')
                    $AnalyzerData = $AnalyzerData.GetRange($AnalyzerData.Count - $LastX, $LastX)
                }
                $SyncHash.host.ui.WriteVerboseLine('New Points: ' + $AnalyzerData.Count)

                if ($AnalyzerData.Count -gt 0)
                {
                    if ($AnalyzerDataLength -eq 0 -and $AnalyzerData.Count -gt 1)
                    {
                        $ChartDataAction1 = [Action]{
                            $SyncHash.Chart.Series['Bandwidth (Mbits/sec)'].Points.DataBindXY($AnalyzerData.Interval, $AnalyzerData.Bandwidth)
                            $SyncHash.Chart.Series['Transfer (MBytes)'].Points.DataBindXY($AnalyzerData.Interval, $AnalyzerData.Transfer)
                            $SyncHash.host.ui.WriteVerboseLine('Show Data: ' + ($SyncHash.Chart.Series['Transfer (MBytes)'].Points.Count | Out-String))
                        }
                        $SyncHash.Chart.Invoke($ChartDataAction1)
                    }
                    else
                    {
                        $ChartDataAction2 = [Action]{
                            while ($AnalyzerDataLength + $AnalyzerData.Count -gt $LastX -and $LastX -gt 0)
                            {
                                $SyncHash.Chart.Series['Bandwidth (Mbits/sec)'].Points.RemoveAt(0)
                                $SyncHash.Chart.Series['Transfer (MBytes)'].Points.RemoveAt(0)
                                $Global:AnalyzerDataLength --
                            }
                            foreach ($Point in $AnalyzerData)
                            {
                                $SyncHash.Chart.Series['Bandwidth (Mbits/sec)'].Points.AddXY($Point.Interval, $Point.Bandwidth)
                                $SyncHash.Chart.Series['Transfer (MBytes)'].Points.AddXY($Point.Interval, $Point.Transfer)
                                $SyncHash.host.ui.WriteVerboseLine('Add Data Point: ' + ($SyncHash.Chart.Series['Transfer (MBytes)'].Points.Count | Out-String))
                            }
                        }
                        $SyncHash.Chart.Invoke($ChartDataAction2)
                    }
                    $AnalyzerDataLength += $AnalyzerData.Count
                }
                else
                {
                    $SyncHash.host.ui.WriteVerboseLine('Point Skipped')
                }
                $SyncHash.host.ui.WriteVerboseLine('Analyzer Loop End: ' + ($AnalyzerDataLength | Out-String))
            }
        }

        function Stop-Analyzer
        {
            $SyncHash.host.ui.WriteVerboseLine('Stop-Analyzer')
            if ($SyncHash.AnalyzerRunspace.RunspaceStateInfo.State -eq 'Opened')
            {
                $SyncHash.host.ui.WriteVerboseLine('Stop-Analyzer Running')
                $SyncHash.AnalyzerRunspace.Close()
                $SyncHash.AnalyzerPowerShell.Dispose()
            }
        }

        function Set-IperfCommand
        {
                $IperfMode = ' -c ' + $SyncHash.IpTextBox.Text
                $SyncHash.IpTextBox.IsEnabled = $true
                $IperfTime = ' -t ' + $SyncHash.TimeTextBox.Text
                $SyncHash.TimeTextBox.IsEnabled = $true
                $IperfVersionParams = ' -p 5204 -f m --logfile ' + $SyncHash.CsvFilePathTextBox.Text
                $Global:IperfVersion = 3
                $Global:IperfExe = '.\Bin\iperf3.exe'
            
            $SyncHash.CommandTextBox.Text = $IperfExe + $IperfMode + $IperfTime + $IperfVersionParams + ' -i 1'
        }

        # GUI
        $InputXml = @"
<Controls:MetroWindow
		xmlns:Controls="clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:PPerf"
        xmlns:wf="clrnamespace:System.Windows.Forms;assembly=System.Windows.Forms"
        xmlns:wfi="clr-namespace:System.Windows.Forms;assembly=WindowsFormsIntegration"
        mc:Ignorable="d"
        Title="PPerf" Height="780" Width="770"
		Topmost="True"
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

    <Grid>
        <GroupBox x:Name="CsvFileGroupBox" Header="CSV File" Height="90" Margin="10,10,10,0" VerticalAlignment="Top">
            <Grid Margin="0">
                <Button x:Name="CsvFilePathButton" Content="_Browse" HorizontalAlignment="Left" Margin="10,0,0,0" Width="75" Height="20" VerticalAlignment="Center"/>
                <TextBox x:Name="CsvFilePathTextBox" Margin="90,0,10,0" TextWrapping="Wrap" Text="CSV File" Height="20" VerticalAlignment="Center"/>
            </Grid>
        </GroupBox>
        <RichTextBox x:Name="IperfJobOutputTextBox" Margin="10,0,10,10" VerticalScrollBarVisibility="Auto" Height="52" VerticalAlignment="Bottom"/>
        <GroupBox x:Name="iPerfGroupBox" Header="iPerf" Height="145" Margin="10,110,10,0" VerticalAlignment="Top">
            <Grid Margin="0">
                <GroupBox x:Name="ModeGroupBox" Header="Client" Height="65" Margin="0,0,10,0" VerticalAlignment="Top" HorizontalAlignment="Right" Width="100">
                    <Grid Margin="0">
                        <RadioButton x:Name="ClientRadio" Content="Client" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" IsChecked="True"/>
                    </Grid>
                </GroupBox>
                <Label x:Name="CommandLabel" Content="_Command" HorizontalAlignment="Left" Height="25" Margin="10,0,0,8" VerticalAlignment="Bottom" Width="68" Target="{Binding ElementName=CommandTextBox, Mode=OneWay}"/>
                <TextBox x:Name="CommandTextBox" Margin="83,0,10,10" TextWrapping="Wrap" Height="23" VerticalAlignment="Bottom"/>
                <Button x:Name="StartIperfButton" Content="Start Iperf" HorizontalAlignment="Left" Margin="10,8,0,0" VerticalAlignment="Top" Width="75"/>
                <Button x:Name="StopIperfButton" Content="Stop Iperf" HorizontalAlignment="Left" Margin="10,35,0,0" VerticalAlignment="Top" Width="75"/>
                <Label x:Name="IpLabel" Content="IP" HorizontalAlignment="Left" Margin="100,10,0,0" Width="20" Target="{Binding ElementName=IpTextBox, Mode=OneWay}" Height="23" VerticalAlignment="Top"/>
                <TextBox x:Name="IpTextBox" HorizontalAlignment="Left" Margin="145,10,0,0" TextWrapping="Wrap" Width="97" Height="23" VerticalAlignment="Top"/>
                <Label x:Name="TimeLabel" Content="Time" HorizontalAlignment="Left" Margin="100,38,0,0" Width="40" Target="{Binding ElementName=TimeTextBox, Mode=OneWay}" Height="23" VerticalAlignment="Top"/>
                <TextBox x:Name="TimeTextBox" HorizontalAlignment="Left" Margin="145,38,0,0" TextWrapping="Wrap" Width="97" Height="23" VerticalAlignment="Top"/>
                <GroupBox x:Name="VersionGroupBox" Header="iPerf Version" Height="65" Margin="0,0,115,0" VerticalAlignment="Top" HorizontalAlignment="Right" Width="100">
                    <Grid Margin="0">
                        <RadioButton x:Name="Version3Radio" Content="Version 3" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" IsChecked="True"/>
                    </Grid>
                </GroupBox>
            </Grid>
        </GroupBox>
        <GroupBox x:Name="AnalyzerGroupBox" Header="Analyzer" Height="105" Margin="10,260,10,0" VerticalAlignment="Top">
            <Grid Margin="0">
                <Button x:Name="StartAnalyzerButton" Content="Start Analyzer" HorizontalAlignment="Left" Margin="10,8,0,0" VerticalAlignment="Top" Width="95"/>
                <Button x:Name="StopAnalyzerButton" Content="Stop Analyzer" HorizontalAlignment="Left" Margin="10,35,0,0" VerticalAlignment="Top" Width="95"/>
                <Label x:Name="MaxScaleLabel" Content="Max Scale" HorizontalAlignment="Left" Height="23" Margin="110,10,0,0" VerticalAlignment="Top" Width="69" Target="{Binding ElementName=MaxScaleTextBox, Mode=OneWay}"/>
                <TextBox x:Name="MaxScaleTextBox" HorizontalAlignment="Left" Margin="184,10,0,0" TextWrapping="Wrap" Width="55" Height="23" VerticalAlignment="Top"/>
                <Label x:Name="LastXLabel" Content="Show Last" HorizontalAlignment="Left" Height="23" Margin="110,38,0,0" VerticalAlignment="Top" Width="69" Target="{Binding ElementName=LastXTextBox, Mode=OneWay}"/>
                <TextBox x:Name="LastXTextBox" HorizontalAlignment="Left" Margin="184,38,0,0" TextWrapping="Wrap" Width="55" Height="23" VerticalAlignment="Top"/>
                <CheckBox x:Name="MaxScaleCheckBox" Content="Auto" HorizontalAlignment="Left" Margin="244,16,0,0" VerticalAlignment="Top" IsChecked="True"/>
            </Grid>
        </GroupBox>
        <WindowsFormsHost x:Name="FormWfa" Margin="0,365,0,67"/>
    </Grid>
</Controls:MetroWindow>
"@
  
        $InputXml = $InputXml -replace 'mc:Ignorable="d"', '' -replace 'x:N', 'N' -replace '^<Win.*', '<Window'
                 
        [void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
        [xml]$Xaml = $InputXml
        
        #Read XAML
        $XamlReader = (New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $Xaml)
        try
        {
            $SyncHash.Form = [Windows.Markup.XamlReader]::Load( $XamlReader )
        }
        catch
        {
            $SyncHash.host.ui.WriteErrorLine('Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed.')
        }
        
        # Load XAML Objects In PowerShell
        $Xaml.SelectNodes('//*[@Name]') | ForEach-Object -Process {
            $SyncHash.Add($_.Name,$SyncHash.Form.FindName($_.Name))
            #Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)
        }
        
        #Get-Variable WPF*
        
        # Actually make the objects work
        # Create chart
        [void][reflection.assembly]::LoadWithPartialName('System.Windows.Forms')
        [void][Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms.DataVisualization')
        $SyncHash.Chart = New-Object -TypeName System.Windows.Forms.DataVisualization.Charting.Chart

        # Add chart area to chart
        $SyncHash.ChartArea = New-Object -TypeName System.Windows.Forms.DataVisualization.Charting.ChartArea
        $SyncHash.Chart.ChartAreas.Add($SyncHash.ChartArea)

        [void]$SyncHash.Chart.Series.Add('Bandwidth (Mbits/sec)')
        [void]$SyncHash.Chart.Series.Add('Transfer (MBytes)')

        # Display the chart on a form
        #$SyncHash.Chart.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right -bor [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Left
        #$SyncHash.Chart.Location = New-Object -TypeName System.Drawing.Size -ArgumentList (0, 100)
        $SyncHash.Chart.BackColor = [System.Drawing.Color]::Transparent
        $SyncHash.Chart.Series['Bandwidth (Mbits/sec)'].ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::'Line'
        $SyncHash.Chart.Series['Transfer (MBytes)'].ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::'Line'
        $SyncHash.Chart.Width = 800
        $SyncHash.ChartLegend = New-Object -TypeName System.Windows.Forms.DataVisualization.Charting.Legend
        [void]$SyncHash.Chart.Legends.Add($SyncHash.ChartLegend)

        $SyncHash.FormWfa.Child = $SyncHash.Chart
        #$SyncHash.Form.controls.add($SyncHash.Chart)
        #$SyncHash.Form.Invoke([action]{$SyncHash.Form.controls.add($SyncHash.Chart)})

        $SyncHash.StartIperfButton.Add_Click({
                Start-Iperf
        })
        
        $SyncHash.StopIperfButton.Add_Click({
                Stop-Iperf
        })

        $SyncHash.StartAnalyzerButton.Add_Click({
                Start-Analyzer
        })

        $SyncHash.StopAnalyzerButton.Add_Click({
                Stop-Analyzer
        })

        $SyncHash.IpTextBox.Text = 'iperf.astra.in.ua'
        $SyncHash.TimeTextBox.Text = 60

        $SyncHash.IpTextBox.add_TextChanged({
                Set-IperfCommand
        })

        $SyncHash.TimeTextBox.add_TextChanged({
                Set-IperfCommand
        })

        $SyncHash.ClientRadio.add_Checked({
                Set-IperfCommand
        })

        $SyncHash.Version3Radio.add_Checked({
                Set-IperfCommand
        })

        # Csv SaveFileDialog
        $CsvSaveFileDialog = New-Object -TypeName System.Windows.Forms.SaveFileDialog
        $CsvSaveFileDialog.Filter = 'Comma Separated|*.csv|All files|*.*'
        $CsvSaveFileDialog.FileName = ([Environment]::GetFolderPath('Desktop') + '\iperf.csv')

        $SyncHash.CsvFilePathTextBox.Text = $CsvSaveFileDialog.FileName
        $SyncHash.CsvFilePathTextBox.add_TextChanged({
                Set-IperfCommand
        })

        $SyncHash.CsvFilePathButton.Add_Click({
                $CsvSaveFileDialog.ShowDialog()
                $SyncHash.CsvFilePathTextBox.Text = $CsvSaveFileDialog.FileName
        })

        $SyncHash.MaxScaleTextBox.IsEnabled = $false
        $SyncHash.MaxScaleTextBox.Text = 100
        $SyncHash.MaxScaleTextBox.add_TextChanged({
                $SyncHash.Chart.ChartAreas[0].Axisy.Maximum = $SyncHash.MaxScaleTextBox.Text
        })

        $SyncHash.MaxScaleCheckBox.add_Checked({
                $SyncHash.MaxScaleTextBox.IsEnabled = $false
                $SyncHash.Chart.ChartAreas[0].Axisy.Maximum = 'NaN'
        })

        $SyncHash.MaxScaleCheckBox.add_Unchecked({
                $SyncHash.MaxScaleTextBox.IsEnabled = $true
                $SyncHash.Chart.ChartAreas[0].Axisy.Maximum = $SyncHash.MaxScaleTextBox.Text
        })

        $SyncHash.LastXTextBox.Text = 0
        $SyncHash.LastXTextBox.add_TextChanged({

        })

        Set-IperfCommand

        Write-Status -Text 'PPerf Version 3.2' -Colore 'White'

        # Shows the form
        $null = $SyncHash.Form.ShowDialog()

        # Clean
        $SyncHash.host.ui.WriteVerboseLine('Stop-Iperf End')
        Stop-Iperf

        $SyncHash.host.ui.WriteVerboseLine('Stop-Analyzer End')
        Stop-Analyzer

        #$SyncHash.Error = $Error
    }
)

$UiPowerShell.Runspace = $UiRunspace
$UiHandle = $UiPowerShell.BeginInvoke()	
}

#========================================================================
#		Radial Menu Dark Mode
#========================================================================

#Ci-dessous pour cacher la console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
 
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
#Fonction à appeler pour cacher la console : Hide-Console
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr,0) | Out-Null

#============================================

 [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  		| out-null
 [System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 		| out-null 
 [System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       		| out-null
 [System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')                  | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll')    | out-null  
 [System.Reflection.Assembly]::LoadFrom('assembly\RadialMenu.dll')    | out-null

#============================================
# WPF in PowerShell
#============================================

[XML]$xaml = @'
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
		xmlns:i="http://schemas.microsoft.com/expression/2010/interactivity"	
        xmlns:RadialMenu="clr-namespace:RadialMenu.Controls;assembly=RadialMenu" 
        xmlns:Converters="clr-namespace:RadialMenuDemo.Utils"        
		Title="AdminTools" 
        Width="400" 
        Height="400"  
		ResizeMode="CanResize"
		WindowStyle = "None"
		AllowsTransparency = "true"
		Background="Transparent"
		Topmost="True"
		WindowStartupLocation="CenterScreen"
		>
		
		
    <Window.Resources>
        <ResourceDictionary> 

			<SolidColorBrush x:Key="BlackBrush" Color="White"/>

			<Canvas x:Key="appbar_close" Width="76" Height="76" Clip="F1 M 0,0L 76,0L 76,76L 0,76L 0,0">
				<Path Width="31.6666" Height="31.6667" Canvas.Left="22.1666" Canvas.Top="22.1667" Stretch="Fill" Fill="{DynamicResource BlackBrush}" Data="F1 M 26.9166,22.1667L 37.9999,33.25L 49.0832,22.1668L 53.8332,26.9168L 42.7499,38L 53.8332,49.0834L 49.0833,53.8334L 37.9999,42.75L 26.9166,53.8334L 22.1666,49.0833L 33.25,38L 22.1667,26.9167L 26.9166,22.1667 Z "/>
			</Canvas>

			<Canvas x:Key="appbar_server" Width="76" Height="76" Clip="F1 M 0,0L 76,0L 76,76L 0,76L 0,0">
				<Path Width="38" Height="31" Canvas.Left="19" Canvas.Top="23" Stretch="Fill" Fill="{DynamicResource BlackBrush}" Data="F1 M 19,23L 57,23L 57,32L 19,32L 19,23 Z M 55,25L 53,25L 53,30L 55,30L 55,25 Z M 51,25L 49,25L 49,30L 51,30L 51,25 Z M 47,25L 45,25L 45,30L 47,30L 47,25 Z M 21,28L 21,30L 23,30L 23,28L 21,28 Z M 19,34L 57,34L 57,43L 19,43L 19,34 Z M 55,36L 53,36L 53,41L 55,41L 55,36 Z M 51,36L 49,36L 49,41L 51,41L 51,36 Z M 47,36L 45,36L 45,41L 47,41L 47,36 Z M 21,39L 21,41L 23,41L 23,39L 21,39 Z M 19,45L 57,45L 57,54L 19,54L 19,45 Z M 55,47L 53,47L 53,52L 55,52L 55,47 Z M 51,47L 49,47L 49,52L 51,52L 51,47 Z M 47,47L 45,47L 45,52L 47,52L 47,47 Z M 21,50L 21,52L 23,52L 23,50L 21,50 Z "/>
			</Canvas>
	   
			<Canvas x:Key="appbar_globe" Width="76" Height="76" Clip="F1 M 0,0L 76,0L 76,76L 0,76L 0,0">
				<Path Width="44.3333" Height="44.3333" Canvas.Left="15.8333" Canvas.Top="15.8333" Stretch="Fill" Fill="{DynamicResource BlackBrush}" Data="F1 M 38,15.8333C 50.2423,15.8333 60.1667,25.7577 60.1667,38C 60.1667,50.2423 50.2423,60.1667 38,60.1667C 25.7577,60.1667 15.8333,50.2423 15.8333,38C 15.8333,25.7577 25.7577,15.8333 38,15.8333 Z M 38,19C 37.0389,19 36.0944,19.0714 35.1716,19.2091C 34.9741,19.6392 34.8333,20.1113 34.8333,20.5833C 34.8333,22.1667 33.25,19 31.6667,22.1667C 30.0833,25.3333 31.6667,22.1667 31.6667,25.3333C 31.6667,26.9167 29.3752,25.771 30.0833,26.125C 31.6667,26.9167 31.6667,26.9167 30.0833,28.5C 30.0833,28.5 26.9167,26.9167 26.9167,28.5C 26.9167,30.0833 25.3333,30.0833 23.75,30.0833C 22.1667,30.0833 23.75,33.25 22.1667,33.25C 20.9493,33.25 21.6039,31.3779 20.5322,30.5126C 20.1248,31.4618 19.7925,32.4508 19.5428,33.4722C 20.6099,34.4283 20.7886,38.2053 22.1667,39.5834C 23.75,38 23.75,39.5834 25.3333,39.5834C 26.9167,39.5834 26.9167,39.5834 27.7083,41.1667C 29.2917,41.1667 30.0833,42.75 31.6667,44.3333C 33.25,45.9167 36.4166,45.9167 36.4166,47.5C 36.4166,49.0833 34.8333,47.5 34.8333,50.6667C 34.8333,52.25 34.8333,52.25 33.25,52.25C 32.2531,52.25 31.2561,54.1331 30.6544,55.528C 32.9142,56.4761 35.3959,57 38,57C 43.3179,57 48.1255,54.8153 51.5742,51.2944L 50.6666,49.4792C 50.6666,49.4792 52.6458,46.3125 51.0625,44.7292C 49.4791,43.1459 49.4791,41.5625 49.4791,41.5625C 49.4791,41.5625 46.3125,44.7292 44.7291,43.1458C 43.1458,41.5625 43.1458,43.1458 41.5625,39.9792C 39.9791,36.8125 43.1458,35.2292 43.1458,35.2292C 43.1458,35.2292 43.1458,32.0625 44.7291,32.0625C 46.3125,32.0625 47.8958,28.8959 51.0625,32.0625C 51.0625,32.0625 52.8924,30.8426 55.4814,30.5444C 54.6693,28.6428 53.5561,26.9006 52.2016,25.3777C 51.9172,25.5822 51.545,25.7292 51.0625,25.7292C 49.4791,25.7292 52.6458,28.8959 51.0625,28.8959C 49.4791,28.8959 49.4791,27.3125 47.8958,27.3125C 46.3125,27.3125 46.3125,28.8959 44.7291,30.4792C 43.1458,32.0625 44.7291,30.4792 43.1458,28.8959C 41.5625,27.3125 46.3125,28.8959 44.7291,27.3125C 43.1458,25.7292 46.3125,25.7292 46.3125,24.1459C 46.3125,22.904 48.2605,22.6362 49.1008,22.5784C 48.187,21.9195 47.2124,21.3398 46.3125,20.9792C 47.8958,22.5625 44.7291,24.1459 43.1458,24.1459C 41.6585,24.1459 42.9653,21.3518 43.1294,19.7005C 41.4977,19.2441 39.7773,19 38,19 Z M 19,38C 19,43.5885 21.4127,48.6134 25.2533,52.09L 23.75,49.0833C 22.1667,49.0833 21.375,45.5209 21.375,43.9375C 21.375,42.6669 20.8651,41.6512 21.4821,40.4812C 19.2482,38.2376 20.5833,39.454 20.5833,38C 20.5833,37.2463 19.8657,36.4925 19.1137,35.9096C 19.0385,36.5961 19,37.2935 19,38 Z "/>
			</Canvas>
		
			<Canvas x:Key="appbar_gauge_100" Width="76" Height="76" Clip="F1 M 0,0L 76,0L 76,76L 0,76L 0,0">
				<Path Width="53.8333" Height="33.3144" Canvas.Left="11.0833" Canvas.Top="17.4167" Stretch="Fill" Fill="{DynamicResource BlackBrush}" Data="F1 M 22.1667,44.3333L 11.0833,44.3333C 11.0833,29.4677 23.1343,17.4167 38,17.4167C 52.8656,17.4167 64.9166,29.4677 64.9166,44.3333L 53.8333,44.3333C 53.8333,44.0678 53.8268,43.8039 52.25,43.5417C 52.25,35.6716 45.87,29.2917 38,29.2917C 30.1299,29.2917 23.75,35.6716 23.75,43.5417L 22.1667,44.3333 Z M 36.2808,20.6446C 30.966,21.0248 26.135,23.1539 22.3603,26.4594L 25.4882,30.0342C 28.508,27.3897 32.3728,25.6865 36.6246,25.3824L 36.2808,20.6446 Z M 53.6396,26.4594C 49.8649,23.1539 45.034,21.0248 39.7192,20.6446L 39.3753,25.3824C 43.6272,25.6865 47.492,27.3897 50.5117,30.0342L 53.6396,26.4594 Z M 55.8739,28.6937L 52.2991,31.8216C 54.8225,34.7031 56.4889,38.3541 56.9004,42.3766L 61.6255,41.8874C 61.1111,36.8593 59.0281,32.2956 55.8739,28.6937 Z M 20.1261,28.6937C 16.9718,32.2956 14.8888,36.8593 14.3744,41.8874L 19.0995,42.3766C 19.511,38.3541 21.1774,34.7031 23.7008,31.8216L 20.1261,28.6937 Z M 38.5097,50.5544C 36.387,51.2034 34.14,50.0086 33.491,47.8859C 32.842,45.7631 34.0367,43.5161 36.1595,42.8671L 50.3425,43.4343L 38.5097,50.5544 Z "/>
			</Canvas>
		
			<Canvas x:Key="appbar_vector_group_removed" Width="76" Height="76" Clip="F1 M 0,0L 76,0L 76,76L 0,76L 0,0">
				<Path Width="38" Height="38" Canvas.Left="19" Canvas.Top="19" Stretch="Fill" Fill="{DynamicResource BlackBrush}" Data="F1 M 19,19L 24,19L 24,20L 40,20L 40,19.0001L 44.9999,19.0001L 44.9999,24.0001L 44,24L 44,32L 52,32L 52,31L 57,31L 57,36L 56,36L 56,52L 57,52L 57,57L 52,57L 52,56L 36,56L 36,57L 31,57L 31,52L 32,52L 32,44L 24,44L 24,45L 19,45L 19,40L 20,40L 20,24L 19,24L 19,19 Z M 40,24.0001L 40,23L 24,23L 24,24L 23,24L 23,40L 24,40L 24,41L 32,41L 32,36L 31,36L 31,31.0001L 36,31.0001L 36,32.0001L 41,32.0001L 41,24L 40,24.0001 Z M 51.9999,52L 52.9999,52L 52.9999,36L 51.9999,36L 51.9999,35L 36,35L 36,36L 35,36L 35,52L 36,52L 36,53L 51.9999,53L 51.9999,52 Z M 20,41L 20,44L 23,44L 23,41L 20,41 Z M 20,20L 20,23L 23,23L 23,20L 20,20 Z M 41,20L 41,23L 44,23L 44,20L 41,20 Z M 32,32L 32,35L 35,35L 35,32L 32,32 Z M 53,32L 53,35L 56,35L 56,32L 53,32 Z M 32,53L 32,56L 35,56L 35,53L 32,53 Z M 53,53L 53,56L 56,56L 56,53L 53,53 Z "/>
			</Canvas>
			
			<Canvas x:Key="appbar_console" Width="76" Height="76" Clip="F1 M 0,0L 76,0L 76,76L 0,76L 0,0">
				<Path Width="42" Height="36" Canvas.Left="17" Canvas.Top="20" Stretch="Fill" Fill="{DynamicResource BlackBrush}" Data="F1 M 17,20L 59,20L 59,56L 17,56L 17,20 Z M 20,26L 20,53L 56,53L 56,26L 20,26 Z M 23.75,31L 28.5,31L 33.25,37.5L 28.5,44L 23.75,44L 28.5,37.5L 23.75,31 Z "/>
			</Canvas>

</ResourceDictionary>

    </Window.Resources>
	
	
	
       <Grid>
		<RadialMenu:RadialMenu Name="MainMenu" IsOpen="true">
			<RadialMenu:RadialMenu.Resources>
				<Style  TargetType="RadialMenu:RadialMenuCentralItem">					
					<Setter Property="Background" Value="#FF252525"/> <!-- Close button background --> 
					<Setter Property="BorderBrush" Value="#FF0747C6"/> <!-- Close button border color --> 
					<Setter Property="BorderThickness" Value="4"/>
					<Setter Property="Width" Value="64"/>
					<Setter Property="Height" Value="64"/>
				</Style>

				<Style  TargetType="RadialMenu:RadialMenuItem" >
					<Setter Property="Background" Value="#FF252525"/> <!-- Background inside pie (Dark) --> 
					<Setter Property="Foreground" Value="White"/>
					<Setter Property="Padding" Value="2"/>
					<Setter Property="InnerRadius" Value="40"/>
					<Setter Property="OuterRadius" Value="150"/>
					<Setter Property="ContentRadius" Value="85"/>

					<Setter Property="EdgeBackground" Value="#FF0747C6"/> <!-- Background border Pie (Cobalt)--> 
					<Setter Property="EdgePadding" Value="7"/>
					<Setter Property="EdgeInnerRadius" Value="130"/>
					<Setter Property="EdgeOuterRadius" Value="145"/>

					<Setter Property="ArrowBackground" Value="#FFB9B9B9"/> <!-- Background arrow (Gray) --> 
					<Setter Property="ArrowRadius" Value="138"/>
				</Style>									
			</RadialMenu:RadialMenu.Resources>	

			
			<RadialMenu:RadialMenu.CentralItem>
				<RadialMenu:RadialMenuCentralItem Name="Close" Command="{Binding CloseRadialMenu1}" >
					<Rectangle Width="25" Height="25">
						<Rectangle.Fill>
							<VisualBrush Visual="{StaticResource appbar_close}"/>
						</Rectangle.Fill>
					</Rectangle>	
				</RadialMenu:RadialMenuCentralItem>
			</RadialMenu:RadialMenu.CentralItem>

			<RadialMenu:RadialMenuItem Name="Open_Ping" Command="{Binding Test1}">
				<WrapPanel Orientation="Vertical">
					<Rectangle Width="25" Height="25">
						<Rectangle.Fill>
							<VisualBrush Visual="{StaticResource appbar_console}"/>
						</Rectangle.Fill>
					</Rectangle>						
					<TextBlock FontSize="14" TextAlignment="Center">
						Ping
					</TextBlock>
				</WrapPanel>
			</RadialMenu:RadialMenuItem>

			<RadialMenu:RadialMenuItem Name="Open_Tracert" Command="{Binding Test2}">
				<WrapPanel Orientation="Vertical">
					<Rectangle Width="25" Height="25">
						<Rectangle.Fill>
							<VisualBrush Visual="{StaticResource appbar_server}"/>
						</Rectangle.Fill>
					</Rectangle>	
					<TextBlock FontSize="14" TextAlignment="Center">
						Tracert 
					</TextBlock>
				</WrapPanel>
			</RadialMenu:RadialMenuItem>

			<RadialMenu:RadialMenuItem Name="Open_Nslookup" Command="{Binding Test3}">
				<WrapPanel Orientation="Vertical">
					<Rectangle Width="25" Height="25">
						<Rectangle.Fill>
							<VisualBrush Visual="{StaticResource appbar_globe}"/>
						</Rectangle.Fill>
					</Rectangle>	
					<TextBlock FontSize="14" TextAlignment="Center">
						Nslookup
					</TextBlock>
				</WrapPanel>
			</RadialMenu:RadialMenuItem>

			<RadialMenu:RadialMenuItem Name="Open_Iperf" Command="{Binding Test4}">
				<WrapPanel Orientation="Vertical">
					<Rectangle Width="35" Height="25">
						<Rectangle.Fill>
							<VisualBrush Visual="{StaticResource appbar_gauge_100}"/>
						</Rectangle.Fill>
					</Rectangle>
					<TextBlock FontSize="14" TextAlignment="Center">
						Iperf
					</TextBlock>
				</WrapPanel>
			</RadialMenu:RadialMenuItem>

			<RadialMenu:RadialMenuItem Name="Move" Command="{Binding Test2}">
			 <WrapPanel Orientation="Vertical">
			  <Rectangle Width="25" Height="25">
			   <Rectangle.Fill>
				<VisualBrush Visual="{StaticResource appbar_vector_group_removed}"/>
			   </Rectangle.Fill>
			  </Rectangle>
			  <TextBlock FontSize="14" TextAlignment="Center">
			   Move 
			  </TextBlock>
			 </WrapPanel>
			</RadialMenu:RadialMenuItem> 

		</RadialMenu:RadialMenu>

        </Grid>
</Window>     
'@

# Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$Menu=[Windows.Markup.XamlReader]::Load($reader)}
catch{Write-Host "Unable to load Windows.Markup.XamlReader.  Some possible causes for this problem include:  .NET Framework is missing.  PowerShell must be launched with PowerShell -sta. Invalid XAML code was encournted.":exit}
# Convertir Name=* dans XML en Variable du meme nom
$xaml.SelectNodes("//*[@Name]") | % { Set-Variable -Name ($_.Name) -Value $Menu.FindName($_.Name)}

#============================================
# Action du script
#============================================

#Action au clic sur la croix du milieu
$Close.Add_Click({
	#Réduire le menu
	$Menu.WindowState = 'Minimized'
	#Appel de la fonction 'MessageBox'
	MessageBox
})

#Action au clic sur Ping
$Open_Ping.Add_Click({
	#Appel de la fonction 'Script_Ping' dans une nouvelle fenetre
	Start-Process powershell -args '-noprofile', '-noexit', '-Command', `
	  ('"' + 
	   ((Get-Command -CommandType Function Script_Ping).Definition -replace '"|\\(?=\\*("|$))', '\$&') +
	   '"')
})

#Action au clic sur Tracert
$Open_Tracert.Add_Click({
	#Appel de la fonction 'Script_Tracert'
	Script_Tracert
})

#Action au clic sur Nslookup
$Open_Nslookup.Add_Click({
	#Réduire le menu
	$Menu.WindowState = 'Minimized'
	#Appel de la fonction 'Script_Nslookup'
	Script_Nslookup
})

#Action au clic sur Iperf
$Open_Iperf.Add_Click({
	#Appel de la fonction 'Script_IPerf' dans une nouvelle fenetre
	Start-Process powershell -args '-noprofile', '-noexit', '-Command', `
	  ('"' + 
	   ((Get-Command -CommandType Function Script_IPerf).Definition -replace '"|\\(?=\\*("|$))', '\$&') +
	   '"')
})

#Click sur l'icone Move pour Glisser/Déplacer 
$Move.add_PreviewMouseLeftButtonDown({
   $_.handled=$true
   $Menu.DragMove()   
})

#Affichage Menu GUI
$Menu.ShowDialog() | Out-Null