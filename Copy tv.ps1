 $Source = '\\192.168.1.2\MEDIA'
 $Destination = 'F:\TV\'

 Get-ChildItem -File $Source -filter "*.mkv" -Recurse  | Sort-Object LastWriteTime -Descending | Select-Object -First 10 |ForEach-Object {
        #If (Test-Path -Path $_.Name){
          Write-Host "Copying " $_.Name
         # Copy-Item -Path $_.FullName -Destination $Destination -PassThru -force 
        #} 
    }

$Source = '\\192.168.1.2\MEDIA'

 Get-ChildItem -File $Source -filter "*.mkv" -Recurse  | Sort-Object LastWriteTime -Descending | Select-Object -First 10 |ForEach-Object {
        #If (Test-Path -Path $_.Name){
          Write-Host "Copying " $_.Name
         # Copy-Item -Path $_.FullName -Destination $Destination -PassThru -force 
        #} 
    }