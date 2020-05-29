"git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
"sh ~/.vim_runtime/install_awesome_vimrc.sh
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'

Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plug 'Valloric/YouCompleteMe'
call plug#end()
set number