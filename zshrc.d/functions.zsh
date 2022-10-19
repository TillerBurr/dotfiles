#! /bin/zsh
#
#
function clip (){cat ( | clip.exe)}
function fix-zsh (){find (  | xargs dos2unix}  )}
function docklogs() { docker logs --follow --tail 100 $@ 2>&1 | ccze -m ansi ; }


function mkcd() {mkdir -p -v "$1" cd "$1" }
