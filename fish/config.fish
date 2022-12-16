if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -p ~/.local/bin
fish_add_path -Pp $(yarn bin)
fish_add_path -p ~/.cargo/bin

if test -d $HOME/.pyenv && not test -d $HOME/.asdf
    eval (pyenv init --path)
end

if test -e ~/.private
    source ~/.private
end
# eval (aactivator init)

set -x UID $(id -u)
set -x GID $(id -g)
set -x UNAME $(whoami)
# set -x aactivator (which aactivator)/bin/activator
source ~/.asdf/asdf.fish

starship init fish | source
scheme set default
