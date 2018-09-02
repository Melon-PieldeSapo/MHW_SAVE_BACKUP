Add-Type -Assembly "System.IO.Compression.FileSystem" ;

. .\config.ps1
. .\MHW_CREATE_SAVE_BACKUP.ps1

$file_to_restore = Read-Host -Prompt 'Input the backup name'


If(!(Test-Path ($backup_path+$file_to_restore) -PathType Leaf))
{
      Write-Host "Backup file: "+$savedata_path+$file_to_restore+" not found"
}ELSE{
    Remove-Item -path ($savedata_path+"\SAVEDATA1000")
    [System.IO.Compression.ZipFile]::ExtractToDirectory(($backup_path+$file_to_restore), $savedata_path)

    Write-Host "Savegame restored"
}


