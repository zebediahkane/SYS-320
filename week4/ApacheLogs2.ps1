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
            "Referrer" = $words[10].TrimEnd('"')
        }
    }

    return $logData

}