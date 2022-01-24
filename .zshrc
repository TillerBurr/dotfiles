#! /bin/zsh
#

# # get the directory where this file is located
_custom_zsh_config_base="${${(%):-%x}:A:h}"
# load all our config files
for file ($_custom_zsh_config_base/zshrc.d/*.zsh(N)); do
 source $file
 done
#
source ~/antigen.zsh

# Load Antigen configurations
antigen init ~/.antigenrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
