# Q2
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' | Select -last 5

# Q3
#Get-Content C:\xampp\apache\logs\access.log | Select-String -pattern "404|400" 

# Q4
#Get-Content C:\xampp\apache\logs\access.log | Select-String -NotMatch ' 200 '

# Q5
#$logs = Get-ChildItem -Path .\ -Filter *.log -Recurse -File
#$logs | Select-String "error"

# Q6
$logs = Get-Content C:\xampp\apache\logs\access.log | Select-String " 404 " | %{$_.Line.Split(" ")}
$logs = $logs | Select-String "^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$" -AllMatches
$logs.Count
