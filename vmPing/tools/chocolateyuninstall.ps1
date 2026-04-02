
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$exePath = Join-Path $toolsDir "$($env:ChocolateyPackageName).exe"

# Remove the executable, shim .gui marker, and Start Menu shortcut
Remove-Item -Path $exePath -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$exePath.gui" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$($env:ProgramData)\Microsoft\Windows\Start Menu\Programs\$($env:ChocolateyPackageName).lnk" -Force -ErrorAction SilentlyContinue
