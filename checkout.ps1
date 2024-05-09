function updateHead {
    param (
        $code
    )
    
    Set-Content -Path ".\.daan\HEAD" -Value $code
}

function checkout {
    param (
        $code
    )

    $last_commit = Get-Content

    if ($null -eq $code) {
        Write-Error "Invalid commit code"

        return
    }


   updateHead -code $code
   CopyFromCommit -code $code
}


function CopyFromCommit {
    param (
        $code
    )

    $items = Get-ChildItem -Path ".\" | Where-Object {$_.Name -notlike "*.daan*"}

    if ($null -ne $items) { Remove-Item -Path $items } 

    Copy-Item -Path ".\.daan\$code\*" -Destination ".\"
}