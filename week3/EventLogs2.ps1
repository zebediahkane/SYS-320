. (Join-Path $PSScriptRoot .\EventLogs1.ps1)

clear 

$loginoutsTable = Get-Logs(15)
$loginoutsTable

$shutdownsTable = Get-OnOffTimes(25)
$shutdownsTable

$startupsTable = Get-OnOffTimes(25)
$startupsTable