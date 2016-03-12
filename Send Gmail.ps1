$EmailFrom = ""
$EmailTo = "" 
$Subject = "Notification from XYZ 2" 

$message = New-Object System.Net.Mail.MailMessage $EmailFrom, $EmailTo
$message.Subject = $Subject
$message.IsBodyHTML = $true
 
$SMTPServer = "smtp.gmail.com" 
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("", ""); 
$SMTPClient.Send($message)