"My configuration file for vim
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'

Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe'
call plug#end()

syntax on	    "syntax highlighting

set number          "turns on line numbering
"set relativenumber  "turns on relative numbering

set foldlevel=99

set foldmethod=indent
nnoremap <space> za
set clipboard=unnamed
set tabstop=2 shiftwidth=2 expandtab "Tabs of width 2, convert tabs to spaces

set encoding=utf-8  "default text encoding is UTF-8

set cursorline  "highlight current line (vim shows a horizontal line under the current line)

set incsearch "search as characters are entered"
set hlsearch  "highlight matches"

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=88
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

autocmd vimenter * NERDTree "Start NERDTree whenever vim is fired up
let g:ycm_autoclose_preview_window_after_completion=1
"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

