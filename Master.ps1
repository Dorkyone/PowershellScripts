 Get-ChildItem -File  '\\192.168.1.2\MEDIA' -filter "*.mkv" -Recurse  | Sort-Object LastWriteTime -Descending | Select-Object -First 10 |ForEach-Object {
        #If (Test-Path -Path $_.Name){
          Write-Host $_.Name
          Write-Host "===================================="
          $nfopath = $_.FullName -replace 'mkv','nfo'
          Write-Host $nfopath

          $XPath = "/movie/thumb"

        If (Test-Path -Path $nfopath){
         try {
          $ImgURL = Select-Xml -Path $nfopath -XPath $xpath | Select-Object -ExpandProperty Node 
          Write-Host $ImgURL.'#text'
          }Catch{
           Write-Host "No NFO found"
          }

         try {
          $XPath = "/movie/plot"
          $ImgURL = Select-Xml -Path $path -XPath $xpath | Select-Object -ExpandProperty Node 
          Write-Host $ImgURL.'#text'
          }Catch{
           Write-Host "No NFO found"
          }
         }

          Write-Host ""
          Write-Host ""

          #Copy-Item -Path $_.FullName -Destination 'F:\Movies\' -PassThru -force 
        #} 
    }
