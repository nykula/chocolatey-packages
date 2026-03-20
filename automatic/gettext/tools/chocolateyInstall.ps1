$ErrorActionPreference = 'Stop'

$packageName = 'gettext'
$url32       = 'https://github.com/mlocati/gettext-iconv-windows/releases/download/v1.0-v1.19/gettext1.0-iconv1.19-shared-32.exe'
$url64       = 'https://github.com/mlocati/gettext-iconv-windows/releases/download/v1.0-v1.19/gettext1.0-iconv1.19-shared-64.exe'
$checksum32  = '6fff825bf31aa1f81e62501f1db8298224ebca22db15501e968659c7579e9ac9'
$checksum64  = '243afedc0cd748f1fac5d94c4be66a3f20280b49eeede892d93e08ca16218733'

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
