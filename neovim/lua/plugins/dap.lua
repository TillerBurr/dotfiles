return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "mfussenegger/nvim-dap-python" },
		{ "theHamsta/nvim-dap-virtual-text" },
		{ "rcarriga/nvim-dap-ui" },
		{ "nvim-telescope/telescope-dap.nvim" },
		{ "mrcjkb/rustaceanvim" },
	},
	config = function()
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set

		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		require("dap-python").setup("~/tools/.venv/bin/python")
		require("nvim-dap-virtual-text").setup({ commented = true, virt_text_win_col = 90 })

		keymap("n", "<Leader>da", "<CMD>lua require('dap').continue()<CR>", opts)
		keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts)
		keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", opts)
		keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", opts)
		keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", opts)
		keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", opts)
		keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", opts)
		keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", opts)
		keymap("n", "<Leader>du", "<CMD>lua require('dapui').open()<CR>", opts)
		keymap("n", "<Leader>dc", "<CMD>lua require('dapui').close()<CR>", opts)
		keymap("n", "<Leader>dn", "<CMD>lua require('dap-python').test_method()<CR>", opts)
		keymap("n", "<Leader>df", "<CMD>lua require('dap-python').test_method()<CR>", opts)
		keymap("v", "<Leader>ds <ESC>", "<CMD>lua require('dap-python').debug_selection()<CR>", opts)

		keymap("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>", opts)
		keymap("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>", opts)
		keymap("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>", opts)
	end,
}
