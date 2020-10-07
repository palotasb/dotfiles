syntax on
set ts=4
set ai
set showmatch
set binary noeol
set backspace=indent,eol,start
set ffs=mac,unix,dos

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
