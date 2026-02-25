. (Join-Path $PSScriptRoot Email.ps1)
. (Join-Path $PSScriptRoot Scheduler.ps1)
. (Join-Path $PSScriptRoot Configuration.ps1)
. "C:\Users\champuser\SYS-320\week6\Event-Log.ps1"

$configuration = readConfiguration

$Failed = getAtRiskUsers $configuration.Days

SendAlertEmail ($Failed | Format-Table | Out-String)

ChooseTimeToRun($configuration.ExecutionTime)