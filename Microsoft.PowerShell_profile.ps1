$PSDefaultParameterValues['*:Encoding'] = 'utf8'
oh-my-posh init pwsh --config "C:\Repos\config\gilbert.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

function Set-WindowTitle {
  $host.UI.RawUI.WindowTitle = [string]::Join(" ", $args)
}
Set-Alias -name "title" -value Set-WindowTitle