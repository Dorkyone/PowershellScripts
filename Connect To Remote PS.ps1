$password = "TheFlyingFish"
$uName = "192.168.0.18\XBMC"
$CompIP = "192.168.0.18"

Set-Item wsman:\localhost\client\trustedhosts $CompIP 
Restart-Service WinRM

Test-WSMan $CompIP

$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($uName, $secpasswd)
Enter-PSSession -ComputerName $CompIP -Credential $mycreds 