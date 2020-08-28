# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
## confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"
source ~/.exports
source ~/.aliases

source ~/.functions
fpath+=~/.zfunc
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#[[ -s /home/ubuntu/.autojump/etc/profile.d/autojump.sh ]] && source /home/ubuntu/.autojump/etc/profile.d/autojump.sh
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
#pyenv
#autojump
zsh-autosuggestions
autoupdate
vscode)
#k  git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
#zsh-autosuggestions git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#zsh-syntax-highlighting git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#poetry mkdir $ZSH_CUSTOM/plugins/poetry && poetry completions zsh > $ZSH/plugins/poetry/_poetry
#appup git clone https://github.com/Cloudstek/zsh-plugin-appup.git "$ZSH_CUSTOM/plugins/appup"
#autoupdate git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate
#emoji-cli git clone https://github.com/b4b4r07/emoji-cli $ZSH_CUSTOM/plugins/emoji-cli
#autojump git clone git://github.com/wting/autojump.git ~/autojump && cd autojump && ./install.py
#enchancd git clone https://github.com/b4b4r07/enhancd $ZSH_CUSTOM/plugins/enhancd
#powerlevel10k git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
#emojify sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"
#docker-compose git clone https://github.com/sroze/docker-compose-zsh-plugin.git $ZSH_CUSTOM/plugins/docker-compose
#nerdfonts
#materialshell
#fzf for enhancd
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install
#
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/enhancd/init.sh
source $ZSH_CUSTOM/plugins/forgit/forgit.plugin.zsh #   git clone https://github.com/wfxr/forgit.git $ZSH_CUSTOM/plugins/forgit

# User configuration
#
#
#
#
#
#https://fontawesome.com/cheatsheet
#
#
#
#
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# usraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export DISPLAY=$(cat /etc/resolv.conf | grep name | cut -d' ' -f2):0.0
#export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
#export DISPLAY=localhost:0.0
#export DISPLAY
#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=true

#export DOCKER_HOST=tcp://localhost:2375
#export DOCKER_TLS_VERIFY=1
#export COMPOSE_TLS_VERSION=TLSv1_2
#export DOCKER_CERT_PATH=/c/Users/tbaur/.docker/machine/machines/dev
#export DOCKER_MACHINE_NAME=dev
#export COMPOSE_CONVERT_WINDOWS_PATHS=true
export GPG_TTY=$(tty)
#[[ tty -s  ]] && export TERM="screen-256color"

#[[ ! tty -s  ]] && export TERM="xterm-256color"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ENHANCD_FILTER=fzy:fzf; export ENHANCD_FILTER
ENHANCD_HOOK_AFTER_CD='ls -A';export ENHANCD_HOOK_AFTER_CD

autoload -U compinit && compinit -u
source ~/.powerlevelrc


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#source /home/tbaur/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
#[[$USER=="tbaur"]] && [ -z "$(ps -ef | grep cron | grep -v grep)" ] && sudo /etc/init.d/cron start && export PATH="$PATH:/home/tbaur/.local/bin"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/ubuntu/.pyenv/bin:$PATH"
eval "$(pyenv init -)" #&& eval "$(pyenv virtualenv-init -)"

# Created by `userpath` on 2020-05-01 16:27:48
export PATH="$(yarn global bin):$PATH"
