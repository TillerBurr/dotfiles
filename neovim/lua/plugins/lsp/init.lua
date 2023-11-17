-- TODO: break this into smaller modules
return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "lukas-reineke/cmp-under-comparator",
            "onsails/lspkind.nvim",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",

        },
        config = function()
            local lspconfig = require('lspconfig')
            local lsp_zero = require("lsp-zero")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lsp_zero.preset({
                manage_nvim_cmp = {
                    set_basic_mappings = true,
                },
            })
            lsp_zero.set_preferences({
                suggest_lsp_servers = true,
                sign_icons = {
                    error = '🆇',
                    warn = '⚠️',
                    hint = 'ℹ️',
                    info = '💡'
                }
            })
            local pylsp_config = {
                settings = {
                    pylsp = {
                        plugins = {
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            pylint = { enabled = false },
                            ruff = { enabled = false },
                            pylsp_mypy = {
                                enabled = true,
                                report_progress = true,
                                live_mode = false
                            },
                            jedi_completion = { fuzzy = true },
                            isort = { enabled = false },
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
            local lspkind = require('lspkind')
            require("luasnip.loaders.from_vscode").lazy_load()
            luasnip.setup({
                region_check_events = "CursorHold,InsertLeave",
                -- those are for removing deleted snippets, also a common problem
                delete_check_events = "TextChanged,InsertEnter",
            })

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ["<CR>"] = cmp.mapping.confirm { select = true },
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
                sources = {
                    { name = "codeium" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },                        -- for path completion
                    { name = "buffer",  keyword_length = 2 }, -- for buffer word completion
                },
                completion = {
                    keyword_length = 1,
                    completeopt = "menu,noselect",
                },
                experimental = {
                    ghost_text = { hlgroup = "Comment" }
                },
                formatting = {
                    format = lspkind.cmp_format {
                        mode = "symbol_text",
                        ellipsis_char = '...',
                        symbol_map = { Codeium = "", },
                        menu = {
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            path = "[Path]",
                            buffer = "[Buffer]",
                            luasnip = "[Snip]"
                        },
                    },
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        require "cmp-under-comparator".under,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },

            })
            -- `/` cmdline setup.
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            -- `:` cmdline setup.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
            })
            lsp_zero.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                local opts = { buffer = bufnr, remap = false }

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
                vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
                -- Enable completion triggered by <c-x><c-o>
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)
            local ruff_on_attach = function(_, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
            require("mason").setup({})
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = { 'tsserver', 'rust_analyzer', 'pylsp', 'yamlls', 'marksman', 'ruff_lsp', 'lua_ls' },
                handlers = {
                    lsp_zero.default_setup,
                    pylsp = function()
                        lspconfig.pylsp.setup(pylsp_config)
                    end,
                    yamlls = function()
                        lspconfig.yamlls.setup({
                            settings = {
                                yaml = {
                                    schemas = {
                                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                        ["https://squidfunk.github.io/mkdocs-material/schema.json"] = "mkdocs.yml"
                                    }
                                }
                            }
                        })
                    end,
                    marksman = function()
                        lspconfig.marksman.setup({})
                    end,
                    ruff_lsp = function()
                        lspconfig.ruff_lsp.setup({ on_attach = ruff_on_attach })
                    end,
                    rust_analyzer = function()
                        lspconfig.rust_analyzer.setup({})
                    end
                },
            })
        end
    }
    , {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
}

}
