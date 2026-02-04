. .\ApacheLogs2.ps1

parseLog("C:\xampp\apache\logs\access.log") | Where-Object `
{ ($_.Page -like '*page2.html') -and ($_.Referrer -like "*index.html") } | Format-Table -AutoSize | Out-String