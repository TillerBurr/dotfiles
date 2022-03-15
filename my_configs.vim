let g:python3_host_prog=$HOME.'/.venv/bin/python3'

call plug#begin('~/.config/nvim')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'mtdl9/vim-log-highlighting'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Initialize plugin system
call plug#end()

colorscheme dracula
