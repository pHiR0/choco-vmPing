$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = "https://github.com/r-smith/vmPing/releases/download/v$($env:ChocolateyPackageVersion)/vmPing.exe"
$checksum = '9FBF4D8D888D3BA3DEEBA316409924464EFBC20A8A9B256CB516413378515A8B'

$WebFile = @{
  PackageName = 'vmPing'
  FileFullPath = Join-Path $toolsDir "$($env:ChocolateyPackageName).exe"
  url = $url
  checksum = $checksum
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @WebFile

$ShortCut = @{
  ShortcutFilePath = "$($env:ProgramData)\Microsoft\Windows\Start Menu\Programs\$($env:ChocolateyPackageName).lnk"
  TargetPath = $WebFile.FileFullPath
  WorkingDirectory = (get-item $WebFile.FileFullPath).Directory.FullName
  Description = "vmPing v$($env:ChocolateyPackageVersion)"
}

Install-ChocolateyShortcut @ShortCut