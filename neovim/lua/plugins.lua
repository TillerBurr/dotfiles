local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)



local plugin_specs = {
  -- auto-completion engine
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    requires = {
      -- LSP Support

    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = "VeryLazy",
    build = ":TSUpdate",

  },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lua' },
  { "onsails/lspkind-nvim" },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
  -- -- Python indent (follows the PEP8 style)
  -- { "Vimjas/vim-python-pep8-indent", ft = { "python" } },

  -- -- Python-related text object
  -- { "jeetsukumaran/vim-pythonsense", ft = { "python" } },
  {
    "Yggdroot/LeaderF",
    cmd = "Leaderf",
    build = function()
      if not vim.g.is_win then
        vim.cmd(":LeaderfInstallCExtension")
      end
    end,
  },
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
    },
  },
  { "rose-pine/neovim",          name = "rose-pine",  lazy = true },
  { "olimorris/onedarkpro.nvim", name = "onedarkpro", lazy = true },



  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

  },

  {
    "akinsho/bufferline.nvim",
    event = { "BufEnter" },
    dependencies = 'nvim-tree/nvim-web-devicons',

  },

  -- fancy start screen
  {
    "nvimdev/dashboard-nvim",
  },
  -- Highlight URLs inside vim
  { "itchyny/vim-highlighturl",  event = "VeryLazy" },

  -- notification plugin
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
  },


  -- Automatic insertion and deletion of a pair of characters
  { "Raimondi/delimitMate",      event = "InsertEnter" },

  -- Comment plugin
  { "tpope/vim-commentary",      event = "VeryLazy" },

  -- Autosave files on certain events
  { "907th/vim-auto-save",       event = "InsertEnter" },


  -- better UI for some nvim actions
  { "stevearc/dressing.nvim" },


  { "nvim-zh/better-escape.vim", event = { "InsertEnter" } },

  -- Auto format tools
  { "sbdchd/neoformat",          cmd = { "Neoformat" } },

  -- Git command inside vim
  {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
    cmd = { "Git", "GBrowse" },

  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },


  -- Show git change (change, delete, add) signs in vim sign column
  {
    "lewis6991/gitsigns.nvim",

  },

  -- Another markdown plugin
  { "preservim/vim-markdown",           ft = { "markdown" } },

  -- Faster footnote generation
  { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } },

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  -- { "godlygeek/tabular",                cmd = { "Tabularize" } },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  { "chrisbra/unicode.vim",            event = "VeryLazy" },

  -- Additional powerful text object for vim, this plugin should be studied
  -- carefully to use its full power
  { "wellle/targets.vim",              event = "VeryLazy" },


  -- Add indent object for vim (useful for languages like Python)
  { "michaeljsmith/vim-indent-object", event = "VeryLazy" },


  -- Modern matchit implementation
  { "andymass/vim-matchup",            event = "BufRead" },
  { "tpope/vim-scriptease",            cmd = { "Scriptnames", "Message", "Verbose" } },

  -- The missing auto-completion for cmdline!
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",
  },

  -- showing keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  -- show and trim trailing whitespaces
  { "jdhao/whitespace.nvim", event = "VeryLazy" },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    keys = { "<leader>s" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { "ii14/emmylua-nvim",     ft = "lua" },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    tag = "legacy",
  },
}

-- configuration for lazy itself.
local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
}

require("lazy").setup(plugin_specs, lazy_opts)
