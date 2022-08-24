#Elévation de privilèges en mode Administrateur
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}
 

#Get the local IPv4 address
$IPv4 = (
    Get-NetIPConfiguration |
    Where-Object {
        $_.IPv4DefaultGateway -ne $null -and
        $_.NetAdapter.Status -ne "Disconnected"
    }
).IPv4Address.IPAddress

$Targetdir = "C:\Temp\Capture"
#Create folder if not exist
if(!(Test-Path -Path $Targetdir )){
    New-Item -ItemType directory -Path $Targetdir
}

#Create a capture during 30 seconds
New-NetEventSession -Name Nettest -LocalFilePath C:\Temp\Capture\Capture.etl
Add-NetEventPacketCaptureProvider -IpAddresses $env:HostIP -SessionName Nettest -TruncationLength 190
Start-NetEventSession -Name Nettest
Start-Sleep 30
Stop-NetEventSession -Name Nettest
Remove-NetEventSession -Name Nettest


<# Convert .etl to .pcap

Download the latest etl2pcapng from
https://github.com/microsoft/etl2pcapng/releases

#>

Set-Location C:\Temp\x64
./etl2pcapng.exe c:\temp\Capture\capture.etl c:\temp\Capture\capture.pcap
Set-Location C:\Temp\Capture
Get-ChildItem