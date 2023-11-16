return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = { separator_style = "slant", numbers = "buffer_id", indicator = { style = 'underline' },
            diagnostics = "nvim_lsp"
        }
    }
}
