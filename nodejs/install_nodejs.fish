#! /usr/bin/fish

set ASDF_BRANCH=v0.10.2

if test -d ~/.asdf
    echo "\nInstalling asdf...\n"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_BRANCH
else
    echo "\nasdf already installed\n"
end
# check if asdf executable is added to the PATH and shims are enabled
if type -q asdf
    echo "\nadding asdf executable to the PATH\n"
    . $HOME/.asdf/asdf.sh
end

if not asdf plugin list | grep nodejs >/dev/null 2>&1
    echo "\nadding asdf plugin for nodejs\n"
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs latest
    asdf global nodejs latest
end

if not asdf plugin list | grep yarn >/dev/null 2>&1
    echo "\nadding asdf plugin for yarn\n"
    asdf plugin-add yarn
    asdf install yarn latest
    asdf global yarn latest
end
