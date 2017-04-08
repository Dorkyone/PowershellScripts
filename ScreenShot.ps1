[Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
function screenshot([string]$path) {
   [int]$v = (Get-WmiObject -Class Win32_VideoController).CurrentVerticalResolution
   [int]$h = (Get-WmiObject -Class Win32_VideoController).CurrentHorizontalResolution
   Write-Host "Value of V is" $v " Value of H is" $h
   $bounds = [Drawing.Rectangle]::FromLTRB(0, 0, $h, $v)
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp) 
   $MyTmp = [Drawing.Point]::Empty
   Write-Host "Next part fails" $bounds.Location "-" $MyTmp "-" $bounds.size
   $graphics.CopyFromScreen($bounds.Location, $bounds.Location, $bounds.size) 
   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
   $v = $null
   $h= $null
}

screenshot "D:\screenshot.png"
