. .\ApacheLogs2.ps1

$logData = parseLog("C:\xampp\apache\logs\access.log")

# Prints every log
Write-Host ($logData | Format-Table -AutoSize | Out-String)

# Filtered
parseLog("C:\xampp\apache\logs\access.log") | Where-Object `
{ ($_.Page -like '*page2.html') -and ($_.Referrer -like "*index.html") } | Format-Table -AutoSize | Out-String