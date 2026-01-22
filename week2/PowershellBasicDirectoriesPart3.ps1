#Q11
$files = Get-ChildItem -Path $PSScriptRoot -Filter '*.csv' -Recurse -File
$files | ForEach-Object { Rename-Item -Path $_.FullName -NewName "$($_.BaseName).log" };
Get-ChildItem -Path $PSScriptRoot -Filter '*.log' -Recurse -File