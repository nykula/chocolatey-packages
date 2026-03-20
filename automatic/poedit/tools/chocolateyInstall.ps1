$ErrorActionPreference = 'Stop'

$packageName = 'poedit'
$url         = 'https://download.poedit.net/Poedit-3.9-setup.exe'
$checksum    = '1caab38e20b395b965fef5024faa4c15c4997fd7347b6de64ecf2dfcab3a0165'

$packageArgs = @{
  packageName    = $packageName
  url            = $url
  url64bit       = $url
  checksum       = $checksum
  checksum64     = $checksum
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileType       = 'exe'
  silentArgs     = '/verysilent /norestart'
  validExitCodes = @(0)
}
Confirm-Win10
Install-ChocolateyPackage @packageArgs
