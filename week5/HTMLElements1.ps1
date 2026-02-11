# Q9
$scrapedPage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.22/ToBeScraped.html
#$scrapedPage.Links.Count

# Q10
#$scrapedPage.Links 

# Q11
#$scrapedPage.Links.innerText
#$scrapedPage.Links.href

# Q12
$h2s = $scrapedPage.ParsedHtml.body.getElementsByTagName("h2")`
    | Select-Object -Property outerText | Format-Table
#$h2s

# Q13
$div1s = $scrapedPage.ParsedHtml.body.getElementsByClassName("div-1")`
    | Select-Object -Property innerText | Format-Table
$div1s