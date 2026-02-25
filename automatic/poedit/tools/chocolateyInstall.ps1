$ErrorActionPreference = 'Stop'

$packageName = 'poedit'
$url         = 'https://download.poedit.net/Poedit-3.8-setup.exe'
$checksum    = '5910fc282e736651ab122a34b1e9b393c4cafae3386b556460749347b4e57e6d'

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
Install-ChocolateyPackage @packageArgs
