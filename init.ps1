function init {
    if(-not(Test-Path .dann)){
        New-Item -Path .daan -ItemType Directory
        New-Item -Path HEAD -ItemType .daan/HEAD
        New-Item -Path LAST -ItemType .daan/LAST
    }
}