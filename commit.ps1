$last = Join-Path -Path ".\.daan" -ChildPath "LAST"
function getAddList {
    $file = ".\.daan\ADD"
    $content = [string[]](Get-Content -Path $file)

    $content = $content | Where-Object { $null -ne $_ -and "" -ne $_ }
    return $content
}

function SetLast {
    param (
        $number
    )
    
    Set-Content -Path $last -Value $number
}

function SetHead {
    param (
        $number
    )
    
    Set-Content -Path ".\.daan\HEAD" -Value $number
}

function Commit {
    if (!(Test-Path -Path ".\.daan")) {
        return
    }

    if (!(Test-Path -Path $last)) {
        return
    }

    $last_commit = (Get-Content -Path $last -TotalCount 1)

    if ($null -eq $last_commit -or $last_commit -eq "") {
        $last_commit = 0
    } else {
        $last_commit[0]
    }

    $new_commit = ([int]$last_commit) + 1
    $new_commit_path = Join-Path -Path ".\.daan" -ChildPath "$new_commit"

    New-Item -Path $new_commit_path -ItemType Directory

    $add_list = getAddList

    foreach ($file in $add_list) {
        if (!(Test-Path -Path $file)) {
            continue
        }

        Copy-Item -Path $file -Destination (Join-Path -Path $new_commit_path -ChildPath "$file") -Recurse
    }

    SetLast -number $new_commit
    SetHead -number $new_commit

    Set-Content -Path .daan/ADD -Value ""
}
