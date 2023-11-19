
using namespace System.Management.Automation
using namespace System.Management.Automation.Language


 
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Import-Module -Name Terminal-Icons
Import-Module PSReadLine
#set-alias desktop "Desktop.ps1"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\imakhlaq.omp.json" | Invoke-Expression

Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Function touch
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}
