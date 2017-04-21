Invoke-webrequest -uri https://download.microsoft.com/download/C/4/1/C41378D4-7F41-4BBE-9D0D-0E4F98585C61/PackageManagement_x64.msi -outfile C:\temp\PackageManagement_x64.msi
Start-Process -FilePath msiexec -ArgumentList /i, "C:\temp\PackageManagement_x64.msi", /qn -Verb RunAs -wait
Install-Module AzureRM
