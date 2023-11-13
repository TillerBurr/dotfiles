local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

keymap.set("t", "<C-d>", "<C-\\><C-n>")
keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>b", "<cmd> :ls<CR>:b <Space>", { desc = "Go to Buffer" })
keymap.set("n", "<F9>", "<cmd>:bp<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<F10>", "<cmd>:bn<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>lg", "<cmd>:LazyGit<cr>", { desc = "Open LazyGit" })

keymap.set("n", "<leader>xx", function() require("trouble").open() end, { desc = "trouble open" })
keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end,
    { desc = "workspace diagnostics" })
keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end,
    { desc = "document diagnostics" })
keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end, { desc = "quickfix" })
keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end, { desc = "loclist" })
keymap.set("n", "gR", function() require("trouble").open("lsp_references") end, { desc = "lsp references" })

keymap.set("n", "<M-UP>", "<C-w>k", { desc = "Move Window Up" })
keymap.set("n", "<M-DOWN>", "<C-w>j", { desc = "Move Window Down" })
keymap.set("n", "<M-RIGHT>", "<C-w>l", { desc = "Move Window left" })
keymap.set("n", "<M-LEFT>", "<C-w>h", { desc = "Move Window right" })
keymap.set("n", "<leader>t", "<cmd>:terminal<cr>", { desc = "open terminal" })
keymap.set("n", "<leader>km", "<cmd>:Telescope keymaps<CR>", { desc = "show keymaps" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Down" })
keymap.set("n", "J", "mzJ`z", { desc = "Append Next Line" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Append Next Line" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Append Next Line" })
keymap.set("n", "n", "nzzzv", { desc = "Next Search" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev Search" })
keymap.set("x", "<leader>p", "\"_dP")
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n","Q","<nop>")
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
