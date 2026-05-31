$ErrorActionPreference = 'Stop'

$packageName = 'servo'
$url64       = 'https://github.com/servo/servo/releases/download/v0.2.0/servo-x86_64-windows-msvc.exe'
$checksum64  = 'e38b3163f28061e6dc365e7746de1c45f358bf3e6bd21895f6b121273f38fa77'

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
