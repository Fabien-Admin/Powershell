# Convert from Base64 to EXE
$EXE_Path = "$env:TEMP\<EXE name.exe>"
$Base64_Code = "TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAA..."
[byte[]]$Bytes = [convert]::FromBase64String($Base64_Code)
[System.IO.File]::WriteAllBytes($EXE_Path,$Bytes)
 
# Convert from Base64 to PS1
$PS1_Path = "$env:TEMP\<PS1 name.ps1>"
$Base64_Code = "TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAA..."
[byte[]]$Bytes = [convert]::FromBase64String($Base64_Code)
[System.IO.File]::WriteAllBytes($PS1_Path,$Bytes)