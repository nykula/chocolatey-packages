$ErrorActionPreference = 'Stop'

$packageName = 'servo'
$url64       = 'https://github.com/servo/servo/releases/download/v0.4.0/servo-x86_64-windows-msvc.exe'
$checksum64  = 'f93c40ae164db5003848a7a2fa59afa0147228de9213610f54d9701c4ef4239e'

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
