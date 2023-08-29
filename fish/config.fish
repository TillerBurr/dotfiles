if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -p ~/.local/bin
fish_add_path -p ~/.cargo/bin
fish_add_path -p ~/chromedrivers

set -gx PIPX_DEFAULT_PYTHON /home/tbaur/.local/share/rtx/installs/python/3.11.4/bin/python

set -gx DPRINT_INSTALL /home/tbaur/.dprint


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
# source ~/.asdf/asdf.fish

starship init fish | source
scheme set default
set -x RTX_CONFIG_FILE $HOME/.config/.rtx.toml
/home/tbaur/.local/share/rtx/bin/rtx activate -s fish | source

source $HOME/.local/git-subrepo/.fish.rc
fish_add_path -p ~/.rye/shims
fish_add_path -p $DPRINT_INSTALL/bin
