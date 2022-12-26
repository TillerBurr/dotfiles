#! /bin/bash

ASDF_BRANCH=v0.10.2

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_BRANCH

mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions