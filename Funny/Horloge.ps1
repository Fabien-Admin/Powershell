function Get-Clock {
<#
    .SYSNOPSIS
        Displays a clock on the screen with date.
    .DESCRIPTION
        Displays a clock on the screen with date.
    .PARAMETER TimeColor
        Specify the color of the time display.
    .PARAMETER DateColor
        Specify the color of the date display.
        Default is White
    .NOTES
        Created: 15/01/2022
        Version History:
            Version 1.0 -- 15/01/2022
                -Initial build
    .EXAMPLE
        Get-Clock
        Description
        -----------
        Clock is displayed on screen

    .EXAMPLE
        Get-Clock -TimeColor DarkRed -DateColor Gold
        Description
        -----------
        Clock is displayed on screen with alternate colors

    .EXAMPLE
        Get-Clock –TimeColor "#669999" –DateColor "#334C4C"
        Description
        -----------
        Clock is displayed on screen with alternate colors as hex values
            
#>

Param (
    [parameter()]
    [string]$TimeColor = "White",
    [parameter()]
    [string]$DateColor = "White"
)

$Clockhash = [hashtable]::Synchronized(@{})
$Runspacehash = [hashtable]::Synchronized(@{})
$Runspacehash.host = $Host
$Clockhash.TimeColor = $TimeColor
$Clockhash.DateColor = $DateColor
$Runspacehash.runspace = [RunspaceFactory]::CreateRunspace()
$Runspacehash.runspace.ApartmentState = “STA”
$Runspacehash.runspace.ThreadOptions = “ReuseThread”
$Runspacehash.runspace.Open() 
$Runspacehash.psCmd = {Add-Type -AssemblyName PresentationCore,PresentationFramework,WindowsBase}.GetPowerShell() 
$Runspacehash.runspace.SessionStateProxy.SetVariable("Clockhash",$Clockhash)
$Runspacehash.runspace.SessionStateProxy.SetVariable("Runspacehash",$Runspacehash)
$Runspacehash.runspace.SessionStateProxy.SetVariable("TimeColor",$TimeColor)
$Runspacehash.runspace.SessionStateProxy.SetVariable("DateColor",$DateColor)
$Runspacehash.psCmd.Runspace = $Runspacehash.runspace 
$Runspacehash.Handle = $Runspacehash.psCmd.AddScript({ 

 $Script:Update = {
    $day,$Month, $Day_n, $Year, $Time = (Get-Date -f "dddd,MMMM,dd,yyyy,HH:mm:") -Split ','
    $Second = (Get-Date -f "ss")

    $Clockhash.second_txtbox.text = $Second
    $Clockhash.time_txtbox.text = $Time
    $Clockhash.day_txtbx.Text = $day
    $Clockhash.ampm_txtbx.text = $AMPM
    $Clockhash.day_n_txtbx.text = $Day_n
    $Clockhash.month_txtbx.text = $Month
    $Clockhash.year_txtbx.text = $year   
}

[xml]$xaml = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        WindowStyle = "None" WindowStartupLocation = "CenterScreen" SizeToContent = "WidthAndHeight" ShowInTaskbar = "False"
        ResizeMode = "NoResize" Title = "Clock" AllowsTransparency = "True" Background = "Transparent" Opacity = "1" Topmost = "True">
    <Grid x:Name = "Grid" Background = "Transparent">
        <TextBlock x:Name = "time_txtbox" FontSize = "72" Foreground = "$($Clockhash.TimeColor)" VerticalAlignment="Top" 
        HorizontalAlignment="Left" Margin="0,-26,0,0">
                <TextBlock.Effect>
                    <DropShadowEffect Color = "Black" ShadowDepth = "1" BlurRadius = "5" />
                </TextBlock.Effect>
        </TextBlock>
        <TextBlock x:Name = "second_txtbox" FontSize = "50" Foreground = "$($Clockhash.TimeColor)" VerticalAlignment="Top" 
        HorizontalAlignment="Left" Margin="190,-2,0,0">
                <TextBlock.Effect>
                    <DropShadowEffect Color = "Black" ShadowDepth = "1" BlurRadius = "5" />
                </TextBlock.Effect>
        </TextBlock>
        <TextBlock x:Name = "ampm_txtbx" FontSize=  "20" Foreground = "$($Clockhash.TimeColor)" Margin  = "133,0,0,0" 
        HorizontalAlignment="Left">
                <TextBlock.Effect>
                    <DropShadowEffect Color = "Black" ShadowDepth = "1" BlurRadius = "2" />
                </TextBlock.Effect>
        </TextBlock>
        <TextBlock x:Name = "day_n_txtbx" FontSize=  "38" Foreground = "$($Clockhash.DateColor)" Margin="10,42,0,0" 
        HorizontalAlignment="Left">
                <TextBlock.Effect>
                    <DropShadowEffect Color = "Black" ShadowDepth = "1" BlurRadius = "2" />
                </TextBlock.Effect>
        </TextBlock>
        <TextBlock x:Name = "month_txtbx" FontSize=  "20" Foreground = "$($Clockhash.DateColor)" Margin="59,62,0,0" 
        HorizontalAlignment="Left">
                <TextBlock.Effect>
                    <DropShadowEffect Color = "Black" ShadowDepth = "1" BlurRadius = "2" />
                </TextBlock.Effect>
        </TextBlock>
        <TextBlock x:Name = "day_txtbx" FontSize=  "15" Foreground = "$($Clockhash.DateColor)" Margin="59,50,0,0" 
        HorizontalAlignment="Left">
                <TextBlock.Effect>
                    <DropShadowEffect Color = "Black" ShadowDepth = "1" BlurRadius = "2" />
                </TextBlock.Effect>
        </TextBlock>
        <TextBlock x:Name = "year_txtbx" FontSize=  "38" Foreground = "$($Clockhash.DateColor)" Margin="5,42,0,0" 
        HorizontalAlignment="Left">
                <TextBlock.Effect>
                    <DropShadowEffect Color = "Black" ShadowDepth = "1" BlurRadius = "2" />
                </TextBlock.Effect>
        </TextBlock>
    </Grid>
</Window>
"@
 
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
$Clockhash.Window=[Windows.Markup.XamlReader]::Load( $reader )

$Clockhash.second_txtbox = $Clockhash.window.FindName("second_txtbox")
$Clockhash.time_txtbox = $Clockhash.window.FindName("time_txtbox")
$Clockhash.ampm_txtbx = $Clockhash.Window.FindName("ampm_txtbx")
$Clockhash.day_n_txtbx = $Clockhash.Window.FindName("day_n_txtbx")
$Clockhash.month_txtbx = $Clockhash.Window.FindName("month_txtbx")
$Clockhash.year_txtbx = $Clockhash.Window.FindName("year_txtbx")
$Clockhash.day_txtbx = $Clockhash.Window.FindName("day_txtbx")

#Timer Event
$Clockhash.Window.Add_SourceInitialized({
    #Create Timer object
    Write-Verbose "Creating timer object"
    $Script:timer = new-object System.Windows.Threading.DispatcherTimer 
    #Fire off every 1 minutes
    Write-Verbose "Adding 1 second interval to timer object"
    $timer.Interval = [TimeSpan]"0:0:1.00"
    #Add event per tick
    Write-Verbose "Adding Tick Event to timer object"
    $timer.Add_Tick({
    $Update.Invoke()
    [Windows.Input.InputEventHandler]{ $Clockhash.Window.UpdateLayout() }
    
})
    #Start timer
    Write-Verbose "Starting Timer"
    $timer.Start()
    If (-NOT $timer.IsEnabled) {
        $Clockhash.Window.Close()
    }
}) 

$Clockhash.Window.Add_Closed({
    $timer.Stop()
    $Runspacehash.PowerShell.Dispose()
    
    [gc]::Collect()
    [gc]::WaitForPendingFinalizers()    
})
$Clockhash.month_txtbx.Add_SizeChanged({
    [int]$clockhash.length = [math]::Round(($Clockhash.day_txtbx.ActualWidth,$Clockhash.month_txtbx.ActualWidth | 
        Sort -Descending)[0])
    [int]$Adjustment = $clockhash.length + 52 + 10 #Hard coded margin plus white space
    
    $YearMargin = $Clockhash.year_txtbx.Margin
    $Clockhash.year_txtbx.Margin = ("{0},{1},{2},{3}" -f ($Adjustment),
        $YearMargin.Top,$YearMargin.Right,$YearMargin.Bottom)
})

$Clockhash.Window.Add_MouseRightButtonUp({
    $ProcessID = [System.Diagnostics.Process]::GetCurrentProcess()
    $ProcessID = $ProcessID.ID
    & taskkill /PID $ProcessID /t /f
})
$Clockhash.Window.Add_MouseLeftButtonDown({
    $This.DragMove()
})
$Update.Invoke()
$Clockhash.Window.ShowDialog() | Out-Null
}).BeginInvoke()
}


#Ci-dessous pour cacher la console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
 
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
#Fonction à appeler pour cacher la console : Hide-Console
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr,0)

#Random Colors TimeColor
$TColor = "#{0:X6}" -f (Get-Random -Maximum 0xFFFFFF)
#Random Colors DateColor
$DColor = "#{0:X6}" -f (Get-Random -Maximum 0xFFFFFF)

#Start Function with random colors
Get-Clock -TimeColor $TColor -DateColor $DColor

pause