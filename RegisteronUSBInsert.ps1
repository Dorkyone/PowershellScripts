# Create the event registration
$Query = "select * from __InstanceCreationEvent within 5 where TargetInstance ISA 'Win32_LogicalDisk' and TargetInstance.DriveType = 2 and TargetInstance.VolumeName  = 'SteveTravel' ";
Register-WmiEvent -Query $Query -Action $Action -SourceIdentifier USBFlashDrive;
Write-Host "Event registered"

# Define a PowerShell ScriptBlock that will be executed when an event occurs
$Action = { 
    Write-Host "USB Connected";
    C:\Scripts\CopyAndEmail.ps1;  
    #Unregister-Event -SourceIdentifier USBFlashDrive;
    #Write-Host "USB event unregistered";
};

