#! /bin/zsh


export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=/usr/bin:$PATH
export TMPDIR=/tmp
export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export LIBGL_ALWAYS_INDIRECT=1
export GPG_TTY=$(tty)        
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
