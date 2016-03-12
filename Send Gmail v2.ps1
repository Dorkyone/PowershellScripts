$EmailFrom = ""
$EmailTo = "" 
$Subject = "Notification from XYZ 5" 

$message = New-Object System.Net.Mail.MailMessage $EmailFrom, $EmailTo
$message.Subject = $Subject
$message.IsBodyHTML = $true
$message.Body = "<h2>This is an HTML-Formatted Email Sent to " + $EmailTo + "</h2><p>Isn't HTML <em>neat</em>?</p><p>You can make all sorts of <span style=""color:red;font-weight:bold;"">pretty colors!!</span>.</p>"
 
$SMTPServer = "smtp.gmail.com" 
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("", ""); 
$SMTPClient.Send($message)