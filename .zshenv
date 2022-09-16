export GPG_TTY=$(tty)
if [ -d "$HOME/.pyenv" ] && [ ! -d "$HOME/.asdf" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi
export PATH="$HOME/.local/pipx/bin:$PATH"
. "$HOME/.cargo/env"
