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
  {'romgrk/fzy-lua-native'},
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
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
      })
    end
  },
  { 'lukas-reineke/cmp-under-comparator' },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  { 'rafamadriz/friendly-snippets' },
  {
    "Yggdroot/LeaderF",
    cmd = "Leaderf",
    build = function()
      if not vim.g.is_win then
        vim.cmd(":LeaderfInstallCExtension")
      end
    end,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
    },
  },
  { "rose-pine/neovim",          name = "rose-pine",  lazy = true },
  { "olimorris/onedarkpro.nvim", name = "onedarkpro", lazy = true },

  { 'yamatsum/nvim-cursorline' },
  {
    "akinsho/bufferline.nvim",
    event = { "BufEnter" },
    dependencies = 'nvim-tree/nvim-web-devicons',

  },

  -- fancy start screen
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }, {
  'mrjones2014/legendary.nvim',
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  -- sqlite is only needed if you want to use frecency sorting
  -- dependencies = { 'kkharji/sqlite.lua' }
},
  { 'ThePrimeagen/vim-be-good' },
  -- Highlight URLs inside vim
  { "itchyny/vim-highlighturl", event = "VeryLazy" },

  -- notification plugin
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
  },


  -- Automatic insertion and deletion of a pair of characters
  { "Raimondi/delimitMate",      event = "InsertEnter" },

  -- Comment plugin
  { "tpope/vim-commentary",      event = "VeryLazy" },


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

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

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
    dependencies = { "romgrk/fzy-lua-native",'roxma/nvim-yarp','roxma/vim-hug-neovim-rpc' },
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
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
