$source = "https://docs.google.com/document/d/1yszZDM7wRzN2-eH9T3x1P1pCbkos3rDF3Zzs7blN0KM/export?format=docx"
$dest = "c:\doc.docx"
$wc = new-object System.Net.WebClient
$Credentials = New-Object Net.NetworkCredential("mediabox.ancliffe@gmail.com","Reddog#21")
$wc.Credentials =  $Credentials
$wc.DownloadFile($source, $dest)

