#!/usr/bin/env zsh

# Bootstrap a few things (install plugins and stuff) for vim config

PROMPT='[ VimBootstrapper ]'

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install the NERDTree plugin
# echo "$PROMPT Installing NERDTree..."
# mkdir -p ~/.vim/pack/vendor/start/nerdtree
# git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
# vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
# echo "$PROMPT NERDTree has been installed!"



ex +PlugInstall +q +q
echo "$PROMPT Done!"
