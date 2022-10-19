#! /bin/zsh

alias pip3='python3 -m pip --user'
alias fix-zsh-plugins="find ~/.oh-my-zsh/custom -type f -print0 | xargs -0 sed -i -e 's/\r$//'"
alias alf='autoload -Uz'
alias ..='cd ..'
alias ...='cd ../..'
alias http='http --style=solarized'
alias l='ls -l'
alias ll='ls -al'
# alias ls='ls --color=auto -N'
alias plug_install="ex +PlugInstall +q +q"
alias vim='nvim'
alias nano='babi'
alias sz="source ~/.zshrc && zsh"
alias aactivate="ln -s .venv/bin/activate .activate.sh && echo 'deactivate'> .deactivate.sh"
alias lsal="pls --all --details"
alias lsa="pls --all"
alias lsl="pls --details"
alias dl="docker logs --follow"
alias dlt='docker logs --follow --tail 100'

# Alias for explorer.exe
alias explorer="explorer.exe"
