return { {
    dir = "~/code/NotebookNavigator.nvim",
    keys = {
        { "]h",        function() require("notebook-navigator").move_cell "d" end },
        { "[h",        function() require("notebook-navigator").move_cell "u" end },
        { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
        { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
        "echasnovski/mini.comment",
        "benlubas/molten-nvim",
        'anuvyklack/hydra.nvim'
        -- "3rd/image.nvim"
    },
    ft = { "python", ".ipynb" },
    event = "VeryLazy",
    config = function()
        local nn = require "notebook-navigator"
        nn.setup({ activate_hydra_keys = "<leader>h", repl_provider = "molten" })
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
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        ft = { "python", ".ipynb" },
        -- init = function()
        --     vim.g.molten_virt_text_output = true
        -- end
    } }
