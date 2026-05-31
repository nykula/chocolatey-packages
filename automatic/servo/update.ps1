import-module chocolatey-au

function global:au_GetLatest {
    $LatestRelease = Invoke-RestMethod -UseBasicParsing -Uri "https://api.github.com/repos/servo/servo/releases/latest"

    @{
        URL64 = ($LatestRelease.assets | Where-Object {$_.name.EndsWith("x86_64-windows-msvc.exe")}).browser_download_url
        Version = $LatestRelease.tag_name.Replace('v', '')
        ReleaseNotes = $LatestRelease.html_url
    }
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

update -ChecksumFor 64
