. (Join-Path $PSScriptRoot ../week4/ApacheLogs.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot ../week2/ProcessManagement4.ps1)

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display Last 10 Apache Logs`n"
$Prompt += "2 - Display Last 10 Failed Logins`n"
$Prompt += "3 - Display At Risk Users`n"
$Prompt += "4 - Start Chrome and go to Champlain.edu`n"
$Prompt += "5 - Exit`n"



$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if($choice -eq 1){
        # This uses ApacheLogs.ps1
        getLastLogs 10
    }

    elseif($choice -eq 2){
        getFailedLogins 10
    }

    elseif($choice -eq 3){   
    # This errors but then actually decides to work I am not sure how that works.
        $atRiskUsers = getAtRiskUsers
       
        if ($atRiskUsers.Length -gt 0) {
            return $atRiskUsers
        } else {
            Write-Host "No at risk users found" | Out-String
        }

    }

    elseif($choice -eq 4){
        openChrome
    }

    elseif($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }
    
    else {
        Write-Host "Option not found" | Out-String
    }

}



