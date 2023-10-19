if not vim.g.vscode then
require("nvim-treesitter.configs").setup {
    ensure_installed = { "python", "cpp", "lua", "vim", "json", "toml","fish","markdown"},
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { 'help' }, -- list of language that will be disabled
      additional_vim_regex_highlighting = false,
    },
  }
  end
