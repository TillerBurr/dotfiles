local keymap = vim.keymap

keymap.set("t", "<C-d>", "<C-\\><C-n>")
keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>b", "<cmd> :ls<CR>:b <Space>", { desc = "Go to Buffer" })
keymap.set("n", "<F9>", "<cmd>:bp<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<F10>", "<cmd>:bn<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>lg", "<cmd>:LazyGit<cr>", { desc = "Open LazyGit" })

keymap.set("n", "<leader>xx", function()
	require("trouble").open()
end, { desc = "trouble open" })
keymap.set("n", "<leader>xw", function()
	require("trouble").open("workspace_diagnostics")
end, { desc = "workspace diagnostics" })
keymap.set("n", "<leader>xd", function()
	require("trouble").open("document_diagnostics")
end, { desc = "document diagnostics" })
keymap.set("n", "<leader>xq", function()
	require("trouble").open("quickfix")
end, { desc = "quickfix" })
keymap.set("n", "<leader>xl", function()
	require("trouble").open("loclist")
end, { desc = "loclist" })
keymap.set("n", "gr", function()
	require("trouble").open("lsp_references")
end, { desc = "lsp references" })

keymap.set("n", "H", "^", { desc = "Move to beginning of text on current line" })
keymap.set("n", "L", "g_", { desc = "Move to end of text on current line" })
keymap.set("v", "L", "g_", { desc = "Move to end of text on current line - Visual mode" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down in insert mode" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })
keymap.set("n", "<leader>t", "<cmd>:terminal<cr>", { desc = "open terminal" })
keymap.set("n", "<leader>km", "<cmd>:Telescope keymaps<CR>", { desc = "show keymaps" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Down" })
keymap.set("n", "J", "mzJ`z", { desc = "Append Next Line" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Append Next Line" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Append Next Line" })
keymap.set("n", "n", "nzzzv", { desc = "Next Search" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev Search" })
keymap.set("x", "<leader>p", '"_dP')
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<M-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<M-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("n", "<leader>O", "mzO<Esc>`z", { desc = "add blank line above" })
keymap.set("n", "<leader>o", "mzo<Esc>`z", { desc = "add blank line below" })
vim.keymap.set("n", "dd", function()
	---@diagnostic disable-next-line: param-type-mismatch
	if vim.fn.getline(".") == "" then
		return '"_dd'
	end
	return "dd"
end, { expr = true })
vim.keymap.set(
	"n",
	"<leader>cw",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Change all occurences of word under cursor" }
)
keymap.set("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { desc = "Find files with Telescope" })
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep files in starting directory" })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Search for active buffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Search for help tags" })
keymap.set(
	"n",
	"<leader>fd",
	":Telescope find_files find_command=find,-type,d,!,-name,'node_modules'<cr>",
	{ desc = "Search for directories" }
)
-- where the heck am I?
keymap.set("n", "<leader>fl", ":lua print(vim.fn.expand('%'))<cr>", { desc = "Print CWD relative to project root" })
