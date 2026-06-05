$ErrorActionPreference = 'Stop'

$packageName = 'poedit'
$url         = 'https://download.poedit.com/Poedit-3.9.1-setup.exe'
$checksum    = 'a6cb88246834e6e54224b923a839c9566580cb5d4be95d4eba1d18bd34e8ecc9'

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
