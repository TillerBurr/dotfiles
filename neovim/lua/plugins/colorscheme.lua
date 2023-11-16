return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "frappe",
            integrations = {
                cmp = true,
                noice = true,
                gitsigns = true,
                notify = true,
                fidget = true,
                harpoon = true,
                hop = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
                    colored_indent_levels = false,
                },
                mason = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                telescope = {
                    enabled = true,
                    -- style = "nvchad"
                },
                which_key = true
            }
        }
        )

        vim.cmd.colorscheme("catppuccin")
    end
}
