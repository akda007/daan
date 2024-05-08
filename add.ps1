function add {
    if(-not(Test-Path .daan/ADD)){
        return
    }
    Set-Content -Path .daan/ADD -Value ""

    $list = (Get-ChildItem).Name

    foreach ($item in $list) {
        if ($item -ne ".daan"){
            Add-Content -Path .daan/ADD -Value $item
        }
    }
}