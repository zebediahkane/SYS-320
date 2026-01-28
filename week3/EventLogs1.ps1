function Get-Logs($numOfDays) {
    $logInOuts = Get-EventLog -LogName System -InstanceID (7001, 7002) -After (Get-Date).AddDays(-$numOfDays)

    $logInOutsTable = @()
    for ($i = 0; $i -lt $logInOuts.Count; $i++) {
        $log = $logInOuts[$i]
        $event = ""

        if ($log.InstanceId -eq 7001) { $event="Logon" }
        if ($log.InstanceId -eq 7002) { $event="Logoff" }

        $userSid = $log.ReplacementStrings[1]
        $objSID = New-Object System.Security.Principal.SecurityIdentifier($userSid)
        $objUser = $objSID.Translate([System.Security.Principal.NTAccount])
        $user = $objUser.Value

        $logInOutsTable += [PSCustomObject]@{ `
            "Time" = $log.TimeGenerated; `
            "Id" = $log.InstanceId; `
            "Event" = $event; `
            "User" = $user;
        }
    }

    $logInOutsTable
}

function Get-OnOffTimes($numOfDays) {
    $onOffs = Get-EventLog -LogName System | Where-Object `
    { ((6005, 6006) -contains $_.EventID) -and ($_.TimeGenerated -gt (Get-Date).AddDays(-$numOfDays)) }

    $onOffsTable = @()
    for ($i = 0; $i -lt $onOffs.Count; $i++) {
        $event = ""

        if ($onOffs[$i].EventID -eq 6005) { $event="Startup" }
        if ($onOffs[$i].EventID -eq 6006) { $event="Shutdown" }

        $onOffsTable += [PSCustomObject]@{ `
            "Time" = $onOffs[$i].TimeGenerated; `
            "Id" = $onOffs[$i].InstanceId; `
            "Event" = $event; `
            "User" = "System";
        }
    }

    $onOffsTable
}