$Destination = 'F:\TV\'
 
 If (Test-Path  $Destination){
 Write-Host "Checking for new files"
 $Source = '\\192.168.1.2\MEDIA'
 $Source2 = '\\192.168.1.2\TV\MEDIA'
 Get-ChildItem -File $Source,$Source2 -filter "*.mkv" -Recurse  | Sort-Object LastWriteTime -Descending | Select-Object -First 10 |ForEach-Object {
       $Hitpath = $Destination+$_.Name
        #Write-Host "found " $Hitpath 
        If (!(Test-Path $Hitpath)){
         # Write-Host "Copying " $_.Name
          Copy-Item -Path $_.FullName -Destination $Destination -force
          Write-Host "Copied" $_.Name "to" $Destination
        } 
     Write-Host "All done"
    }
 } else {
 Write-Host "USB not connected"
}