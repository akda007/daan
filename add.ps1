function add {
    param(
        [string]$param
    )

    if(-not(Test-Path .daan/ADD)){
        return
    }   

    if ($param -eq "."){
        $list = (Get-ChildItem).Name

        Set-Content -Path .daan/ADD -Value ""

        foreach ($item in $list) {
            if ($item -ne ".daan"){
                Add-Content -Path .daan/ADD -Value $item
            }
        }
    }else{
        if(-not(Test-Path $param)){
            return
        }  
        Add-Content -Path .daan/ADD -Value $param
    }
    
}