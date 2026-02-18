. .\WebScraping2.ps1

$FullTable = gatherClasses

function daysTranslator($FullTable) {

    for ($i = 0; $i -lt $FullTable.length; $i++) {

        $Days = @()
    
        if ($FullTable[$i].Days -ilike "*M*") { $Days += "Monday" }
        if ($FullTable[$i].Days -ilike "T[TWF]") { $Days += "Tuesday" }
        elseif ($FullTable[$i].Days -ilike "*T") { $Days += "Tuesday" }
        if ($FullTable[$i].Days -ilike "*W*") { $Days += "Wednesday" }
        if ($FullTable[$i].Days -ilike "*TH*") { $Days += "Thursday" }
        if ($FullTable[$i].Days -ilike "*F*") { $Days += "Friday" }

        $FullTable[$i].Days = $Days
    }

    return $FullTable
}

$FullTable = daysTranslator($FullTable)

# 6-I
#$FullTable | Where-Object { $_."Instructor" -ilike "Furkan Paligu" }

# 6-II
#$FullTable | Where-Object { ($_."Location" -ilike "FREE 105") -and ($_.days -contains "Wednesday") } | `
#    Sort-Object -Property "Time Start" | Select-Object -Property "Time Start", "Time End", "Class Code"

# 6-III
$ITSInstructors = $FullTable | Where-Object {

    ($_."Class Code" -ilike "SYS*") -or `
    ($_."Class Code" -ilike "NET*") -or `
    ($_."Class Code" -ilike "SEC*") -or `
    ($_."Class Code" -ilike "FOR*") -or `
    ($_."Class Code" -ilike "CSI*") -or `
    ($_."Class Code" -ilike "DAT*") -and `
    ($_."Instructor" -notmatch '\d') } `
    | Sort-Object "Instructor" `
    | Select-Object -Property "Instructor"


# 6-IV
$FullTable | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } `
    | Group-Object "Instructor" `
    | Select-Object -Property Count, Name `
    | Sort-Object -Property Count -Descending