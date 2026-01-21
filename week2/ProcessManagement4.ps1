$processes = Get-Process | Where-Object { $_.Name -like "*chrome*" }

if (!$processes) {
    # Starts web browser goes to champlain
    Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe "https://www.champlain.edu/""


    exit
}

# Stops chrome
foreach ($process in $processes) {
    Stop-Process -Id $process.Id
}