#! /bin/zsh


export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=/usr/bin:$PATH
export TMPDIR=/tmp
export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export DISPLAY=$(cat /etc/resolv.conf | grep name | cut -d' ' -f2):0.0
export LIBGL_ALWAYS_INDIRECT=1

export GPG_TTY=$(tty)        
