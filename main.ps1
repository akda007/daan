. ..\add.ps1
. ..\checkout.ps1
. ..\commit.ps1
. ..\init.ps1
. ..\log.ps1


function Daan {
    param (
        [string]$option = "",
        [string]$arg = ""
    )

    $option = $option.ToLower()
    $arg = $arg.ToLower()

    switch ($option) {
        "add" { Add $arg }
        "checkout" { Checkout $arg }
        "commit" { Commit }
        "init" { Init }
        "log" {log}
        Default {
            "Daan commands: "
            "   daan log - checks commits"
            "   daan add {files]} - adds files for staging"
            "   daan commit - commits changes"
            "   daan checkout {commit} - rollback to previous commits"
        }
    }
    
}