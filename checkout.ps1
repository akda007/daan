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

    if ($null -eq $code) {
        Write-Error "Invalid commit code"
    }


   updateHead -code $code
}


function CopyFromCommit {
    param (
        OptionalParameters
    )
    
}