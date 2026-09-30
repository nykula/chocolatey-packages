$ErrorActionPreference = 'Stop'

$packageName = 'servo'
$url64       = 'https://github.com/servo/servo/releases/download/v0.6.0/servo-x86_64-windows-msvc.exe'
$checksum64  = '1c4ae0e739932a99dd5f4a7026a519ebc01968ac13de704452763e15a51168ea'

$packageArgs = @{
  packageName    = $packageName
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path -parent $MyInvocation.MyCommand.Definition
  fileType       = 'exe'
  silentArgs     = '/install /quiet /norestart'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
