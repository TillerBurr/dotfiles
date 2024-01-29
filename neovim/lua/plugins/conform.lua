return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			["lua"] = { "stylua" },
			["python"] = { "ruff_fix", "ruff_format" },
			["go"] = { "gofmt" },
			["rust"] = { "rustfmt" },
		},
		-- formatters = { ruff_format = { command = vim.fn.expand("$HOME") .. "/tools/.venv/bin/ruff" } },
		format_on_save = {
			timout_ms = 500,
			lsp_fallback = true,
		},
	},
	-- config = function()
	-- 	local mason_reg = require("mason-registry")
	--
	-- 	local formatters = {}
	-- 	local formatters_by_ft = {}
	--
	--        local ruff_cmd=mason_reg.get_package("ruff").path
	--        vim.print(ruff_cmd)
	-- 	return {
	-- 		format_on_save = {
	-- 			lsp_fallback = true,
	-- 			timeout_ms = 500,
	-- 		},
	-- 		formatters = formatters,
	-- 		formatters_by_ft = formatters_by_ft,
	-- 	}
	-- end,
}
