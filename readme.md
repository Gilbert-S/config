# Configs

## Windows Terminal (windows-terminal.settings.json)
* original location: 
  * `$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`
* Symlink
  * `New-Item -ItemType SymbolicLink -Name "settings.json" -Value "C:\repos\config\windows-terminal.settings.json" -Force`


## Powershell Profile
* C:\Users\kurzf\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
* `New-Item -ItemType SymbolicLink -Name "Microsoft.PowerShell_profile.ps1" -Value "C:\repos\config\Microsoft.PowerShell_profile.ps1" -Force`