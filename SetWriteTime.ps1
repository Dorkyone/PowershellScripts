$FileName = 'Taken.2.2012.mkv'
$ACL = (Get-Item $FileName).GetAccessControl("access")
$Group = New-Object System.Security.Principal.NTAccount("Builtin","Administrators")
$ACL.SetOwner($Group)
Set-Acl -Path $FileName -AclObject $ACL
#Get-Acl $FileName | Format-List

$file = Get-Item $FileName
$date = (Get-Date).AddDays(-2)
$file.CreationTime = $date
$file.LastAccessTime = $date
$file.LastWriteTime  = $date
Get-item $file | Format-List