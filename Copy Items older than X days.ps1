$limit = (Get-Date).Date(-1)
$fileExt = '.avi'
Get-ChildItem -Path $path -Recurse -Force | 
Where-Object { 
!$_.PSIsContainer -and $_.LastWriteTime -gt $limit  -and $_.Extension -eq $fileExt  } | 
Copy-Item -Destination g:\ -Force