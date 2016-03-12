$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
Register-ScheduledJob -Trigger $trigger -FilePath C:\scripts\RegisteronUSBInsert.ps1 -Name CopyAndEmail