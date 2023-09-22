local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_zero = require('lsp-zero')
lsp_zero.extend_cmp()
local lspconfig = require("lspconfig")
local virtualenv_path = os.getenv("HOME") .. "/tools/nvim_python/.venv"
-- if utils.executable("pylsp") then
local venv_path = os.getenv('VIRTUAL_ENV')
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
  py_path = venv_path .. "/bin/python3"
else
  py_path = vim.g.python3_host_prog
end


local pylsp_config = {
  -- on_attach = custom_attach,
  -- cmd = { virtualenv_path .. "/bin/pylsp" },
  on_new_config = function(new_config, root_dir)
    -- Add the virtualenv path to the Python path
    new_config.cmd = { virtualenv_path .. "/bin/pylsp" }
  end,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = true, overrides = { "--python-executable", py_path, true }, },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false },
        ruff = { enabled = true, overrides = { "--python-executable", py_path, true }, },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = {
          enabled = true,
          overrides = { "--python-executable", py_path, true },
          report_progress = true,
          live_mode = false
        },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
}

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'tsserver', 'rust_analyzer', 'pylsp' },
  handlers = {
    lsp_zero.default_setup,
    pylsp = function()
      lspconfig.pylsp.setup(pylsp_config)
    end
  },
})
