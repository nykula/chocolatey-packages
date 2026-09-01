$ErrorActionPreference = 'Stop'

$packageName = 'servo'
$url64       = 'https://github.com/servo/servo/releases/download/v0.5.0/servo-x86_64-windows-msvc.exe'
$checksum64  = 'd6710bf1caf987bc296ea73c1c5351c4b3a146cc3132cee8845b28146e41496f'

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
