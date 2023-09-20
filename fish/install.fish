#! /bin/bash

# curl -L https://get.oh-my.fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
fisher install h-matsuo/fish-color-scheme-switcher
fisher install jorgebucaran/autopair.fish
fisher install edc/bass

# pdm completion fish > ~/.config/fish/completions/pdm.fish
# poetry completions fish > ~/.config/fish/completions/poetry.fish
