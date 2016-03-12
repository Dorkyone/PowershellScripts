$Destination = "F:\TV\"
$FilescopiedMsg = "Copied "
 
 If (Test-Path  $Destination){
 Write-Host "Checking for new files"
 $Source = '\\192.168.1.2\media'
 $Source2 = '\\192.168.1.2\media'
 Get-ChildItem -File $Source,$Source2 -filter "*.mkv" -Recurse  | Sort-Object LastWriteTime -Descending | Select-Object -First 10 |ForEach-Object {
       $Hitpath = $Destination+$_.Name
        #Write-Host "found " $Hitpath 
        If (!(Test-Path $Hitpath)){
          Write-Host "Copying " $_.Name
          Copy-Item -Path $_.FullName -Destination $Destination -force
          Write-Host "Copied" $_.Name "to" $Destination
          $FilescopiedMsg = $FilescopiedMsg + $_.Name + ", "
        } 
    }
        $EmailFrom = ""
        $EmailTo = "" 
        $Subject = "Files copied to USB" 

        $message = New-Object System.Net.Mail.MailMessage $EmailFrom, $EmailTo
        $message.Subject = $Subject
        $message.IsBodyHTML = $true
        #$message.Body = "<h2>This is an HTML-Formatted Email Sent to " + $EmailTo + "</h2><p>Isn't HTML <em>neat</em>?</p><p>You can make all sorts of <span style=""color:red;font-weight:bold;"">pretty colors!!</span>.</p>"
        $message.Body = $FilescopiedMsg 

        $SMTPServer = "smtp.gmail.com" 
        $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
        $SMTPClient.EnableSsl = $true 
        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("", ""); 
        $SMTPClient.Send($message)

     Write-Host "All done"
 } else {
 Write-Host "USB not connected"
}