$password = ""
$uName = "192.168.0.18\"
$CompIP = "192.168.0.18"
$RemotePath = ""


#Set-Item wsman:\localhost\client\trustedhosts $CompIP 
#Restart-Service WinRM

$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($uName, $secpasswd)

#$s = New-PSSession -ComputerName $CompIP -Credential $mycreds
#Write-Host "Entering Session" $s.Name -ForegroundColor Green
#Enter-PSSession -Name $s.Name

Invoke-Command -FilePath .\CleanRemote.ps1 -Credential $mycreds -ComputerName $CompIP


#Write-Host "Disconnecting Session" $s.Name -ForegroundColor Green
#Disconnect-PSSession -Name $s.Name | Out-Null
