local is_win = vim.fn.has('Windows')
local vscode_or_windows=function()
    if vim.g.vscode or is_win then
        return false
    else
        return true 
    end
end
if not vim.g.vscode and not is_win then
local moveline = require('moveline')
vim.keymap.set('n', '<M-k>', moveline.up)
vim.keymap.set('n', '<M-j>', moveline.down)
vim.keymap.set('v', '<M-k>', moveline.block_up)
vim.keymap.set('v', '<M-j>', moveline.block_down)
end
