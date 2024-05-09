function log {
    if(-not(Test-Path .daan)){
        return
    }

    $files = (Get-ChildItem -Path .daan) | Where-Object{Test-Path $_.FullName -PathType Container}

    $last_commit = (Get-Content -Path ".\.daan\HEAD" -TotalCount 1)
    
    for ($i = 1; $i -le $files.Length; $i++) {
        if ($i -eq $last_commit) {
            "Commit $i <--"
        } else {
            "Commit $i"
        }
    }
}