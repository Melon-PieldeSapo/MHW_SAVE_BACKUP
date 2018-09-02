Add-Type -Assembly "System.IO.Compression.FileSystem" ;

. .\config.ps1

If(!(test-path $backup_path))
{
      New-Item -ItemType Directory -Force -Path $backup_path
}

[System.IO.Compression.ZipFile]::CreateFromDirectory($savedata_path, ($backup_path + $backup_name) + ".zip")
Write-Host "BackUp Created: $( ($backup_path + $backup_name)).zip"