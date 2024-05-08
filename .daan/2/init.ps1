function init {
    if(-not(Test-Path .dann)){
        New-Item -Path .daan -ItemType Directory
        New-Item -Path .daan/HEAD -ItemType File
        New-Item -Path .daan/LAST -ItemType File
        New-Item -Path .daan/ADD -ItemType File
    }
}