#! /usr/bin/fish
source ~/.asdf/asdf.fish
asdf plugin add pipx https://github.com/amrox/asdf-pyapp.git
asdf install pipx latest
asdf global pipx latest

while read -la line
    pipx install $line
end <python/pipx-requirements.txt
