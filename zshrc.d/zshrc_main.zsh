export ZSH="/home/$USER/.oh-my-zsh"



if [ -f ~/.private  ]; then
    source ~/.private
else 
     print "404: ~/.private not found."
fi
fpath+=~/.zfunc

ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"

DISABLE_UPDATE_PROMPT="true"

#ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git
colored-man-pages
colorize
cp
docker-machine
docker-compose
docker
supervisor
yarn
#thefuck
python
poetry
zsh-syntax-highlighting
pyenv
#autojump
zsh-autosuggestions
autoupdate
vscode
autoswitch_virtualenv $plugins)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/enhancd/init.sh
source $ZSH_CUSTOM/plugins/forgit/forgit.plugin.zsh #   git clone https://github.com/wfxr/forgit.git $ZSH_CUSTOM/plugins/forgit



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ENHANCD_FILTER=fzy:fzf; export ENHANCD_FILTER
ENHANCD_HOOK_AFTER_CD='ls -A';export ENHANCD_HOOK_AFTER_CD

autoload -U compinit && compinit -u
source ~/.powerlevelrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

eval "$(pyenv init -)" #&& eval "$(pyenv virtualenv-init -)"
eval "$(pyenv virtualenv-init -)"
