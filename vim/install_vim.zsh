#!/usr/bin/env zsh

# Bootstrap a few things (install plugins and stuff) for vim config

PROMPT='[ VimBootstrapper ]'
_custom_zsh_config_base="${${(%):-%x}:A:h}"
mkdir -p ~/.config/nvim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh


curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install the NERDTree plugin
# echo "$PROMPT Installing NERDTree..."
# mkdir -p ~/.vim/pack/vendor/start/nerdtree
# git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
# vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
# echo "$PROMPT NERDTree has been installed!"

ln -sv "$_custom_zsh_config_base/vim/my_configs.vim" "$HOME/.vim_runtime/my_configs.vim"
ln -sv "$_custom_zsh_config_base/vim/.vimrc" "$HOME/.config/nvim/init.vim"

vim -c PlugInstall -c q -c q

echo "$PROMPT Be sure to create a Python virtual environment and install neovim and pynvim!"
echo "$PROMPT May Need to Run the Following Commands if the distro isn't up to date, i.e. Ubuntu18.04:"
echo "$PROMPT sudo add-apt-repository ppa:neovim-ppa/stable "
echo "$PROMPT sudo apt-get update"
echo "$PROMPT sudo apt-get install neovim"

