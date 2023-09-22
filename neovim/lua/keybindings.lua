local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

keymap.set("n","<leader>b","<cmd> :ls<CR>:b <Space>")
keymap.set("n","<F9>","<cmd>:bp<cr>")
keymap.set("n","<F10>","<cmd>:bn<cr>")
keymap.set("n","lg","<cmd>:LazyGit<cr>")

keymap.set("n", "<leader>xx", function() require("trouble").open() end)
keymap.set("n", "<leader>xx", function() require("trouble").open() end)
keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)

keymap.set("n","<M-UP>","<C-w>k")
keymap.set("n","<M-DOWN>","<C-w>j")
keymap.set("n","<M-RIGHT>","<C-w>l")
keymap.set("n","<M-LEFT>","<C-w>h")
keymap.set("n","<C-t>","<cmd>:terminal<cr>")
keymap.set("n", "<leader>km","<cmd>:Telescope keymaps<CR>")
