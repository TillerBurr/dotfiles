#! /bin/zsh

export UID=$(id -u)
export GID=$(id -g)
export UNAME=$(whoami)
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:/usr/bin
export TMPDIR=/tmp
export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export LIBGL_ALWAYS_INDIRECT=1
export GPG_TTY=$(tty)
#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export MCFLY_FUZZY=2
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
