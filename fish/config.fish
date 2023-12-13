if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -p ~/.local/bin
fish_add_path -p ~/.cargo/bin
fish_add_path -p ~/chromedrivers
fish_add_path -p ~/tools/lua-language-server/bin
fish_add_path -p ~/tools/ripgrep
fish_add_path -p ~/tools/nvim/bin
fish_add_path -p ~/.local/share/nvim/mason/bin/

set -gx PIPX_DEFAULT_PYTHON $HOME/.local/share/rtx/installs/python/3.11.4/bin/python
set -gx DPRINT_INSTALL $HOME/.dprint

alias vim nvim

if test -d $HOME/.pyenv
    eval (pyenv init --path)
end

if test -e ~/.private
    source ~/.private
end
# eval (aactivator init)

set -x UID $(id -u)
set -x GID $(id -g)
set -x UNAME $(whoami)
set -U autovenv_enable yes
set -U autovenv_announce yes

starship init fish | source
scheme set default
set -x RTX_CONFIG_FILE $HOME/.config/.rtx.toml
$HOME/.local/share/rtx/bin/rtx activate -s fish | source

# source $HOME/.local/git-subrepo/.fish.rc
fish_add_path -p ~/.rye/shims
fish_add_path -p $DPRINT_INSTALL/bin
