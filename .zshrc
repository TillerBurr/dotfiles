#! /bin/zsh
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
source ~/antigen.zsh
antigen init ~/.antigenrc
# # get the directory where this file is located
_custom_zsh_config_base="${${(%):-%x}:A:h}"
# load all our config files
for file ($_custom_zsh_config_base/zshrc.d/*.zsh(N)); do
 source $file
 done
#
#source ~/antigen.zsh

# Load Antigen configurations
# antigen init ~/.antigenrc
