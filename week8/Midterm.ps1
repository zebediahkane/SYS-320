# Challenge 1

# To avoid hardcoding this could be used:
# $iocUrl = Read-Host -Prompt "Enter IOC Url: "
$iocUrl = "http://10.0.17.6/IOC.html"

# This could also be not hardcoded with an input
# $logPath = Read-Host -Prompt "Enter Path to Log File: "
$logPath = "./access.log"

function fetchIOCs($url) {
    $page = Invoke-WebRequest -TimeoutSec 2 $url

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    $fullTable = @()

    for ($i = 1; $i -lt $trs.length; $i++) {
        $tds = $trs[$i].getElementsByTagName("td")
        
        $fullTable += [PSCustomObject]@{
            "Pattern" = $tds[0].innerText; `
            "Explaination"      = $tds[1].innerText;  
        }
    }

    return $fullTable
}

# Challenge 2
function parseLog($path) {
    $logData = @()
    $logFile = Get-Content $path


    foreach ($line in $logFile) {
        $words = $line.Split(" ")            
        $logData += [PSCustomObject]@{
            "IP"       = $words[0]
            "Time"     = $words[3].substring(1) 
            "Method"   = $words[5].substring(1)
            "Page"     = $words[6]
            "Protocol" = $words[7].TrimEnd('"')
            "Response" = $words[8]
            "Referrer" = $words[10]
        }
    }

    return $logData

}

# Challenge 3
function analyzeLogs($logs, $iocs) {
    $patterns = $iocs | Select-Object -ExpandProperty Pattern
    $filteredLogs = $logs | Where-Object {
        $page = $_.Page
        $patterns | Where-Object {
            $page -like "*$_*"
        }
    }
    
    return $filteredLogs
}

$logs = parseLog $logPath 
$iocs = fetchIOCs $iocUrl

$filteredLogs = analyzeLogs $logs $iocs
$filteredLogs | Format-Table | Out-String

