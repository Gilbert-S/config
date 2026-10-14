$PSDefaultParameterValues['*:Encoding'] = 'utf8'
Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History
Invoke-Expression (& { (zoxide init powershell | Out-String) })


function Set-WindowTitle {
  $host.UI.RawUI.WindowTitle = [string]::Join(" ", $args)
}
Set-Alias -name "title" -value Set-WindowTitle

function f_grep {$input | wsl -e grep @args}
Set-Alias -name "grep" -value f_grep

function f_awk {$input | wsl -e awk @args}
Set-Alias -name "awk" -value f_awk

function f_runsd {& "E:\SwarmUI\launch-windows.bat"}
Set-Alias -name "runsd" -value f_runsd


function prompt {
  if (Test-Path variable:global:ompjob) {
    Receive-Job -Wait -AutoRemoveJob -Job $global:ompjob | Invoke-Expression;
    Remove-Variable ompjob -Scope Global;
    Import-Module -Name Terminal-Icons
    
    git config --global alias.gone "!git branch -vv | awk '/: gone]/{print `$1}'"
    git config --global alias.gonedelete "! git branch -d `$(git gone)"

    return prompt;
  }
  

  $global:ompjob = Start-Job {(@(& oh-my-posh.exe init powershell --config='C:\Repos\config\gilbert-tokyo.omp.json' --print) -join "`n")};
  write-host -ForegroundColor Blue "Loading omp in background...";
  Write-Host -ForegroundColor Green -NoNewline "$($executionContext.SessionState.Path.CurrentLocation) ".replace($HOME, '~');
  Write-Host -ForegroundColor Red -NoNewline ">";
  return " ";
}