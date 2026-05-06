import-module chocolatey-au

$releases = 'https://github.com/mlocati/gettext-iconv-windows/releases'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "gettext.+shared-(32|64).exe"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    # https://github.com/mlocati/gettext-iconv-windows/issues/81#issuecomment-4099697274
    $date = ($download_page.ParsedHtml.GetElementsByTagName('relative-time') | select -First 1).GetAttribute("datetime") -split 'T' | select -First 1
    $version = ($url[0] -split '/' | select -Last 2 | select -First 1) -replace 'v' -split '-' | select -First 1
    $version = ($version -split '\.' | select -First 3) -join '.'
    if ( ($version -split '\.').Count -lt 3 ) {
        $version = $version + '.0'
    }
    $version = $version + '.' + ($date -replace '-')

    $url32 = 'https://github.com' + $url[0]
    $url64 = 'https://github.com' + $url[1]

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

update
