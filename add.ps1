function add {
    if(-not(Test-Path .daan/ADD)){
        return
    }

    $list = Get-ChildItem.Name

    Set-Content .daan/ADD -Value $list
}