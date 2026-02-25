$ErrorActionPreference = 'Stop'

$packageName = 'gettext'
$url32       = 'https://github.com/mlocati/gettext-iconv-windows/releases/download/v1.0-v1.18-r3/gettext1.0-iconv1.18-shared-32.exe'
$url64       = 'https://github.com/mlocati/gettext-iconv-windows/releases/download/v1.0-v1.18-r3/gettext1.0-iconv1.18-shared-64.exe'
$checksum32  = 'ed23c5dae0ab82e88db49d37368e5a093d34d8b069597357e7ccff403cc4e48f'
$checksum64  = '09d435ae5d371e46e4e8bc6b7d228d5b0f9276788824f568ec7d896c76a2e93b'

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path -parent $MyInvocation.MyCommand.Definition
  fileType       = 'exe'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
