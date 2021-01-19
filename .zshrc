#! /bin/zsh
#

# # get the directory where this file is located
_custom_zsh_config_base="${${(%):-%x}:A:h}"

# load all our config files
for file ($_custom_zsh_config_base/zshrc.d/*.zsh(N)); do
  source $file
  done
