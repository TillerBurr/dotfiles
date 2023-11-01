if not vim.g.vscode then
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_zero = require('lsp-zero')
lsp_zero.extend_cmp()
local lspconfig = require("lspconfig")
-- if utils.executable("pylsp") then
local venv_path = os.getenv('VIRTUAL_ENV')


local pylsp_config = {
  -- on_attach = custom_attach,
  -- cmd = { virtualenv_path .. "/bin/pylsp" },
  -- on_new_config = function(new_config, root_dir)
  --   -- Add the virtualenv path to the Python path
  -- new_config.cmd = { virtualenv_path .. "/bin/pylsp" }
  -- end,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        -- black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false },
        ruff = { enabled = false },
        -- type checker
        pylsp_mypy = {
          enabled = true,
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
local luasnip = require("luasnip")
local cmp = require('cmp')


cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<M-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      { "i", "c" }
    ),

    ["<C-Space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

})

lsp_zero.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = '🆇',
    warn = '⚠️',
    hint = 'ℹ️',
    info = '💡'
  }
})
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions  
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = "format code" })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,opts)
    -- Enable completion triggered by <c-x><c-o>
  lsp_zero.default_keymaps({ buffer = bufnr })
end)


local ruff_on_attach = function(client, bufnr)
     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) 
end

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'tsserver', 'rust_analyzer', 'pylsp','yamlls','marksman','ruff_lsp' },
  handlers = {
    lsp_zero.default_setup,
    pylsp = function()
      lspconfig.pylsp.setup(pylsp_config)
    end,
    yamlls = function()
        lspconfig.yamlls.setup({
            settings={
                yaml={
                    schemas={
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                        ["https://squidfunk.github.io/mkdocs-material/schema.json"]="mkdocs.yml"
                }
                }
        }
    })
    end,
    marksman = function()
        lspconfig.marksman.setup({})
    end,
    ruff_lsp= function()
        lspconfig.ruff_lsp.setup({on_attach=ruff_on_attach})
    end
  },
})

end
