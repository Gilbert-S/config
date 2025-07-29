$PSDefaultParameterValues['*:Encoding'] = 'utf8'
oh-my-posh init pwsh --config "C:\Repos\config\gilbert.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

function Set-WindowTitle {
  $host.UI.RawUI.WindowTitle = [string]::Join(" ", $args)
}
Set-Alias -name "title" -value Set-WindowTitle

# Set-Alias -name "grep" -value "Select-String" | ft
function f_grep {$input | wsl -e grep @args}
Set-Alias -name "grep" -value f_grep

function f_awk {$input | wsl -e awk @args}
Set-Alias -name "awk" -value f_awk

git config --global alias.gone "!git branch -vv | awk '/: gone]/{print `$1}'"
git config --global alias.gonedelete "! git branch -d `$(git gone)"