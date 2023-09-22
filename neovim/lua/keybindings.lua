local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

keymap.set("n","<leader>bd","<cmd>:bd<CR>",{ desc = "Delete current buffer" })
keymap.set("n","<leader>b","<cmd> :ls<CR>:b <Space>",{ desc = "Go to Buffer" })
keymap.set("n","<F9>","<cmd>:bp<cr>",{ desc = "Prev Buffer" })
keymap.set("n","<F10>","<cmd>:bn<cr>",{ desc = "Next Buffer" })
keymap.set("n","lg","<cmd>:LazyGit<cr>",{ desc = "Open LazyGit" })

keymap.set("n", "<leader>xx", function() require("trouble").open() end,{ desc = "trouble open" })
keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end,{ desc = "workspace diagnostics" })
keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end,{ desc = "document diagnostics" })
keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end,{ desc = "quickfix" })
keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end,{ desc = "loclist" })
keymap.set("n", "gR", function() require("trouble").open("lsp_references") end,{ desc = "lsp references" })

keymap.set("n","<M-UP>","<C-w>k",{ desc = "Move Window Up" })
keymap.set("n","<M-DOWN>","<C-w>j",{ desc = "Move Window Down" })
keymap.set("n","<M-RIGHT>","<C-w>l",{ desc = "Move Window left" })
keymap.set("n","<M-LEFT>","<C-w>h",{ desc = "Move Window right" })
keymap.set("n","<C-t>","<cmd>:terminal<cr>",{ desc = "open terminal" })
keymap.set("n", "<leader>km","<cmd>:Telescope keymaps<CR>",{ desc = "show keymaps" })
