#script to add computer to domain, add domain user to local administrators group and cache domain user credentials to system before restarting the system so that the user can directly login into system
#Provide the domain full name
$domain = "" 
#Provide the user password who has previlige to join computer to domain
$password = "" | ConvertTo-SecureString -asPlainText -Force 
$domainSN = ""
#The user who has previlige to add computer to domain
$username = "$domainSN\JoinDomain"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
#This command will give warning to restart computer on success
Add-Computer -DomainName $domain -Credential $credential
#should output $domain if previous command success
Systeminfo | findstr /B /C:"Domain" 
#Provide to domain user name who needs to be added to computer
$DomainUser = 
$LocalGroup = "Administrators"
net localgroup $LocalGroup $DomainUser /add
#This will prompt the user to provide domain password and will cache the credentials once success.
Start-Process powershell.exe -Credential "$DomainUser" -NoNewWindow -ArgumentList "start-process powershell.exe -verb runAs" 
