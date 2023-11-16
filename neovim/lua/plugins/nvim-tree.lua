
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set("n", "<leader>s",api.tree.toggle,opts("toggle nvim-tree"))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

return {
    "nvim-tree/nvim-tree.lua",
    -- keys = { "<leader>s" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup({
            auto_reload_on_write = true,
            on_attach = my_on_attach,
            disable_netrw = false,
            hijack_cursor = false,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            open_on_tab = false,
            sort_by = "name",
            update_cwd = false,
            view = {
                width = 30,
                --    hide_root_folder = false,
                side = "left",
                preserve_window_proportions = false,
                number = false,
                relativenumber = false,
                signcolumn = "yes",
            },
            renderer = {
                indent_markers = {
                    enable = false,
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        none = "  ",
                    },
                },
                icons = {
                    webdev_colors = true,
                },
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = false,
                update_cwd = false,
                ignore_list = {},
            },
            system_open = {
                cmd = "",
                args = {},
            },
            diagnostics = {
                enable = false,
                show_on_dirs = false,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = false,
                custom = {},
                exclude = {},
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 400,
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = false,
                },
                open_file = {
                    quit_on_open = false,
                    resize_window = false,
                    window_picker = {
                        enable = true,
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
            },
            trash = {
                cmd = "trash",
                require_confirm = true,
            },
            log = {
                enable = false,
                truncate = false,
                types = {
                    all = false,
                    config = false,
                    copy_paste = false,
                    diagnostics = false,
                    git = false,
                    profile = false,
                },
            },
        }
        )
    vim.keymap.set("n", "<leader>s",require('nvim-tree.api').tree.toggle)
    end
}
