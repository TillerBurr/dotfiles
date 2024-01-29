return { {
    "GCBallesteros/NotebookNavigator.nvim",
    dependencies = {
        "echasnovski/mini.comment",
        "benlubas/molten-nvim",
        'anuvyklack/hydra.nvim'
        -- "3rd/image.nvim"
    },
    ft = { "python" },
    event = "VeryLazy",
    config = function()
        local nn = require "notebook-navigator"
        nn.setup({ activate_hydra_keys = "<leader>h", repl_provider = "molten" })
        vim.keymap.set("n","]h", function() nn.move_cell "d" end)
        vim.keymap.set("n","[h", function() nn.move_cell "u" end)
        vim.keymap.set("n","<leader>x", nn.run_and_move)
        vim.keymap.set("n","<leader>X",  nn.run_cell)
        vim.keymap.set("n", "<leader><C-a>",nn.add_cell_above)
        vim.keymap.set("n", "<leader><C-b>",nn.add_cell_below)
        -- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
        -- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
        -- require("image").setup({
        --     backend="kitty",
        --     integrations = {
        --         markdown = {
        --             enabled = true,
        --             clear_in_insert_mode = false,
        --             download_remote_images = true,
        --             only_render_image_at_cursor = false,
        --             filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        --         },
        --     },
        --     hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
        -- })
    end,
},
    {
        "benlubas/molten-nvim",
        name = "molten-nvim",
        -- dir = "~/code/moltenwt/output-position",
        -- branch = "output-position",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        ft = { "python" },
        init = function()
            -- vim.g.molten_virt_text_output = true
            vim.keymap.set("n","<leader>th","<cmd>MoltenHideOutput<CR>")
            vim.keymap.set("n","<leader>ts","<cmd>MoltenShowOutput<CR>")

        end
    } }
