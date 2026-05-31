import-module chocolatey-au

function global:au_GetLatest {
    $LatestRelease = Invoke-RestMethod -UseBasicParsing -Uri "https://api.github.com/repos/mlocati/gettext-iconv-windows/releases/latest"

    # https://github.com/mlocati/gettext-iconv-windows/issues/81#issuecomment-4099697274
    $date = $LatestRelease.published_at -split 'T' | select -First 1
    $version = $LatestRelease.tag_name -replace 'v' -split '-' | select -First 1
    $version = ($version -split '\.' | select -First 3) -join '.'
    if ( ($version -split '\.').Count -lt 3 ) {
        $version = $version + '.0'
    }
    $version = $version + '.' + ($date -replace '-')

    @{
        URL32 = ($LatestRelease.assets | Where-Object {$_.name.EndsWith("shared-32.exe")}).browser_download_url
        URL64 = ($LatestRelease.assets | Where-Object {$_.name.EndsWith("shared-64.exe")}).browser_download_url
        Version = $version
        ReleaseNotes = $LatestRelease.html_url
    }
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
