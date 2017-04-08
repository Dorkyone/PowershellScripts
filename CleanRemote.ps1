Write-Host "Entering Remote path"
$Path = "C:\SomePath"
#Set-Location $Path
#Get-Location

$Date = (Get-Date).AddDays(-2)
$ExtRemoval = '.ignore'
$Folders = Get-ChildItem -Path $Path -Recurse -Force | ForEach-Object {
        if ($_.Extension -eq $ExtRemoval) {
            Write-Host $_.FullName $_.CreationTime $ACL.Owner
            #Remove-Item $_.FullName -Force 
            Write-Host "Deleted $_.FullName" -ForegroundColor Green
           } else {
            #$Account = New-Object System.Security.Principal.NTAccount("BUILTIN","Administrators")
            #$ACL = (Get-Item $_.FullName).GetAccessControl("Owner") 
            #Write-Host $_.FullName $_.CreationTime $ACL.Owner
            #$_.CreationTime = $Date
            #$_.LastAccessTime = $Date
            #$_.LastWriteTime  = $Date
            #$ACL.SetOwner($Account)
            Write-Host $_.FullName $_.CreationTime $ACL.Owner 
           }
     }   

