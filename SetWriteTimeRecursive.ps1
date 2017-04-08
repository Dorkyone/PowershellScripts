$Date = (Get-Date).AddDays(-2)
$Path = "C:\SomePath\"

Get-ChildItem -Path $Path -Recurse -Force |ForEach-Object {
    if ($_.Extension -eq '.ignore') {
        Write-Host $_.FullName $_.CreationTime $ACL.Owner
        Remove-Item $_.FullName -Force 
    } else {
        $Account = New-Object System.Security.Principal.NTAccount("BUILTIN","Administrators")
        $ACL = (Get-Item $_.FullName).GetAccessControl("Owner") 
        Write-Host $_.FullName $_.CreationTime $ACL.Owner
        $_.CreationTime = $Date
        $_.LastAccessTime = $Date
        $_.LastWriteTime  = $Date
        $ACL.SetOwner($Account)
        Write-Host $_.FullName $_.CreationTime $ACL.Owner 
    }
}