function readConfiguration() {
    $configFile = Get-Content -Path (Join-Path $PSScriptRoot configuration.txt)
    $lines = $configFile -split '\r?\n'

    return [pscustomobject]@{
        "Days" = $lines[0]
        "ExecutionTime" = $lines[1]
    }
}

function changeConfiguration() {
    $configPath = (Join-Path $PSScriptRoot configuration.txt)
    $configFile = Get-Content -Path $configPath

    $newValues = getNewConfigValues

    Set-Content -Path $configPath -Value "$($newValues.Days)`n$($newValues.ExecutionTime)"
    Write-Host "Configuration Changed" | Out-String
}

function getNewConfigValues() {
    $newDays
    $newTime

    # Check days

    while ($true) {
        try {
            [int]$newDays = Read-Host -Prompt "Enter the number of days for which the logs will be obtained: "
            break
        } catch {
            Write-Host "Please enter an integer." | Out-String
        } 
    }

    # Time
    while ($true) {
        $newTime = Read-Host -Prompt "Enter the daily execution time of the script: "
            
        if ($newTime -match "\b((1[0-2]|0?[1-9]):([0-5][0-9]) ([AaPp][Mm]))") {
            break
        } else {
            Write-Host "Please enter time in digit:digitdigit AM/PM format." | Out-String
        }
    }

    return [pscustomobject]@{
        "Days" = $newDays
        "ExecutionTime" = $newTime
    }
}

function configurationMenu() {
    clear

    $Prompt = "`n"
    $Prompt += "Please choose your operation:`n"
    $Prompt += "1 - Show configuration`n"
    $Prompt += "2 - Change configuration`n"
    $Prompt += "3 - Exit`n"

    $operation = $true

    while($operation){

        Write-Host $Prompt | Out-String
        $choice = Read-Host 

        if($choice -eq 1){
            $config = readConfiguration
            $config | Format-Table | Out-String
        }

        elseif($choice -eq 2){
            changeConfiguration
        }

        elseif($choice -eq 3){ 
            Write-Host "Goodbye" | Out-String
            exit
            $operation = $false   
        }
    
        else {
            Write-Host "Option not found" | Out-String
        }

    }

}