import-module chocolatey-au

$releases = 'https://poedit.net/download'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "Poedit-.+-setup.exe"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version = "$($url[0] -split '/' |select -Last 1)" -split '-' |select -First 2 |select -Last 1

    $Latest = @{ URL = $url[0]; Version = $version }
    return $Latest
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

update -ChecksumFor 32
