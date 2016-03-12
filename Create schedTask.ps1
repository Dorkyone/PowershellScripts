$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-ExecutionPolicy Bypass -ErrorAction SilentlyContinue -File "C:\Scripts\Get top 3 recent episodes.ps1"' 
$trigger =  New-ScheduledTaskTrigger -Daily -At 4am
Try {
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CheckKodiTVEP" -Description "Check most recent TV episodes in KODI"
} Catch  {
    Write-Host "Error" 
} Finally {
    Write-Host "All done"
}