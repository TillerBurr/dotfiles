return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("neogen").setup({})
        vim.api.nvim_set_keymap('n', '<leader>md', ':lua require("neogen").generate({})<CR>', { noremap = true })
    end

}
