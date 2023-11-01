vim.opt.nu = true
-- vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.undofile = true
local uname = vim.loop.os_uname()
_G.IS_WINDOWS = vim.fn.has('Windows')
if not _G.IS_WINDOWS then
    
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")


 vim.opt.colorcolumn = "89"
 vim.opt.clipboard:append("unnamedplus")
