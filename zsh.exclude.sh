#! /bin/zsh
mkdir ~/.zsh-plugins
curl -L git.io/antigen > ~/antigen.zsh
git clone https://github.com/b4b4r07/enhancd ~/.zsh-plugins/enhancd
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && . ~/.fzf/install
