$ErrorActionPreference = 'Stop'

$packageName = 'servo'
$url64       = 'https://github.com/servo/servo/releases/download/v0.3.0/servo-x86_64-windows-msvc.exe'
$checksum64  = 'bd75f3d20aae9cf94417d06acdec1fb7371404f9509f98375fe9fc57be8e4e17'

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
