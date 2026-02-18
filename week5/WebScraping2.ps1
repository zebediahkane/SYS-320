function gatherClasses() {
    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.22/Courses2026SP.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    $fullTable = @()

    for ($i = 1; $i -lt $trs.length; $i++) {
        $tds = $trs[$i].getElementsByTagName("td")
        $Times = $tds[5].innerText.split("-")
        
        $fullTable += [PSCustomObject]@{
                                        "Class Code" = $tds[0].innerText; `
                                        "Title"      = $tds[1].innerText; `
                                        "Days"       = $tds[4].innerText; `
                                        "Time Start" = $Times[0]; `
                                        "Time End"   = $Times[1]; `
                                        "Instructor" = $tds[6].innerText; `
                                        "Location"   = $tds[9].innerText; `    
        }
    }

    return $fullTable
}
