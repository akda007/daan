function log {
    if(-not(Test-Path .daan)){
        return
    }

    $files = (Get-ChildItem -Path .daan) | Where-Object{Test-Path $_.FullName -PathType Container}
    
    Write-Host ($files)

}