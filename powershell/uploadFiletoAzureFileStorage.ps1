$storageAccountName = ""
$storageAccountKey =""
$fileShare = "" #Name of fileshare
$local_path = "" #local path of file to be uploaded

$ctx = New-AzureStorageContext $storageAccountName $storageAccountKey
$share = Get-AzureStorageShare $fileShare -Context $ctx

#To upload to root directory
Set-AzureStorageFileContent -Share $share -Source $local_path

#To upload to a subdirectory
$subDirPath = "" #Subdirectory path with respect to root directory.
Set-AzureStorageFileContent -Share $share -Source $local_path -Path $subDirPath
