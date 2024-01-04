-----------------------------------------------------------------------
--
--                          custom variables                          --
------------------------------------------------------------------------

vim.g.logging_level = "info"
------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0      -- Disable perl provider
vim.g.loaded_ruby_provider = 0      -- Disable ruby provider
vim.g.loaded_node_provider = 0      -- Disable node provider
vim.g.did_install_default_menus = 1 -- do not load menu

if vim.loop.os_uname().version:match("Windows") then
    vim.api.nvim_err_writeln("Windows Detected.")
    vim.g.python3_host_prog = "~/tools/.venv/Scripts/python.exe"
else
    vim.g.python3_host_prog = "~/tools/.venv/bin/python"
end
-- Specify server commands for LanguageClient


-- Set the server commands
-- vim.g.LanguageClient_serverCommands = server_commands

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader                = " "
vim.g.maplocalleader           = " "
-- Enable highlighting for lua HERE doc inside vim script
vim.g.vimsyn_embed             = 'l'
vim.wo.number                  = true
-- Use English as main language
-- vim.cmd [[language en_US.UTF-8]]

-- Disable loading certain plugins

-- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.netrw_liststyle          = 3

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin      = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_tarPlugin         = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1

-- Disable sql omni completion, it is broken.
vim.g.loaded_sql_completion    = 1

-- Define the clipboard settings
vim.cmd([[
  if system('uname -r') =~ "microsoft"
    augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
    augroup END
  endif
]])
