function getAddList {
    $file = ".\.daan\ADD"
    
    return [string[]](Get-Content -Path $file)
}

function Commit {
    if (!(Test-Path -Path .\.daan)) {
        return
    }

    $last = Join-Path -Path ".\.daan" -ChildPath "LAST"

    if (!(Test-Path -Path $last)) {
        return
    }

    $last_commit = (Get-Content -Path $last -TotalCount 1)[0]

    if ($null -eq $last  -or $last -eq "") {
        $last_commit = 0
    }

    $new_commit = Join-Path -Path ".\.daan" -ChildPath $last_commit

    New-Item -Path $new_commit -ItemType Directory

    foreach ($file in getAddList) {
        if (!(Test-Path -Path $file)) {
            continue
        }

        Copy-Item -Path $file -Destination $new_commit -Recurse
    }
}