$secpasswd = ConvertTo-SecureString "" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("", $secpasswd)
Enter-PSSession -ComputerName 192.168.1.2 -Credential: $mycreds 