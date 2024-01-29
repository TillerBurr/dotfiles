return {
  "ecthelionvi/NeoComposer.nvim",
  dependencies = { "kkharji/sqlite.lua","nvim-telescope/telescope.nvim", "nvim-lualine/lualine.nvim" },
  opts = {},
  config = function()
      require("NeoComposer").setup()
      require('telescope').load_extension('macros')

  end,
  keys={{ "<leader>em", "<cmd>EditMacros<cr>", desc = "Edit Macros" },
   { "<leader>dm", "<cmd>ToggleDelay<cr>", desc = "Macro delays" },}
}
