# Convert from EXE to Base64
$EXE_Path = <Path of your EXE>
$Base64_Code = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("$ServiceUI_Path"));
$Base64_Code | Out-File "C:\Temp\ExeTo64.txt" 
 
# Convert from PS1 to Base64
$PS1_Path = "C:\Users\fdauvergne\Downloads\Olfeo Project\linux_OK.ps1"
$Base64_Code = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("$PS1_Path"));
$Base64_Code | Out-File "C:\Temp\Ps1To64.txt"