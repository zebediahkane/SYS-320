#Q8
#Get-ChildItem -Path $PSScriptRoot -Recurse | Where-Object { $_.Extension -like '.ps1' }

#Q9
$folderPath = "$PSScriptRoot\outfolder"
if (Test-Path -Path $folderPath) {
    Write-Host "Folder exists"

} else {
    New-Item -Path $folderPath -ItemType "Directory"
}