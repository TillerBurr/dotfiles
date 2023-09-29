local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local vscode=function()
    if vim.g.vscode then
       return false
    else
        return true
    end
end
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

    },
    cond=vscode
  },
  {'romgrk/fzy-lua-native',cond=vscode},
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = "VeryLazy",
    build = ":TSUpdate",
    cond=vscode
  },
  { 'neovim/nvim-lspconfig',cond=vscode },
  { 'williamboman/mason.nvim',cond=vscode },
  { 'williamboman/mason-lspconfig.nvim',cond=vscode },
  {'b0o/mapx.nvim'},

  -- Autocompletion
  { 'hrsh7th/nvim-cmp',cond=vscode},
  { 'hrsh7th/cmp-nvim-lsp',cond=vscode },
  { 'hrsh7th/cmp-buffer',cond=vscode },
  { 'hrsh7th/cmp-path',cond=vscode },
  { 'saadparwaiz1/cmp_luasnip',cond=vscode },
  { 'hrsh7th/cmp-nvim-lua',cond=vscode },
  { "onsails/lspkind-nvim",cond=vscode },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    cond=vscode,
    config = function()
      require("codeium").setup({
      })
    end
  },
  { 'lukas-reineke/cmp-under-comparator',cond=vscode },
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
  { "nvim-lua/plenary.nvim"},
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
      dependencies = {
        'nvim-lua/plenary.nvim'
      }
    },
  },
  { "rose-pine/neovim",          name = "rose-pine",  lazy = true,cond=vscode },
  { "olimorris/onedarkpro.nvim", name = "onedarkpro", lazy = true,cond=vscode },

  { 'yamatsum/nvim-cursorline',cond=vscode },
  {
    "akinsho/bufferline.nvim",
    event = { "BufEnter" },
    dependencies = 'nvim-tree/nvim-web-devicons',
    cond=vscode

  },

  -- fancy start screen
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end,
    cond=vscode
  }, {
  'mrjones2014/legendary.nvim',
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  cond=vscode
  -- sqlite is only needed if you want to use frecency sorting
  -- dependencies = { 'kkharji/sqlite.lua' }
},
  { 'ThePrimeagen/vim-be-good' },
  -- Highlight URLs inside vim
  { "itchyny/vim-highlighturl", event = "VeryLazy",cond=vscode },

  -- notification plugin
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",cond=vscode
  },


  -- Automatic insertion and deletion of a pair of characters
  { "Raimondi/delimitMate",      event = "InsertEnter" ,cond=vscode,},

  -- Comment plugin
  { "tpope/vim-commentary",      event = "VeryLazy" ,cond=vscode},


  -- better UI for some nvim actions
  { "stevearc/dressing.nvim",cond=vscode },


  { "nvim-zh/better-escape.vim", event = { "InsertEnter" } ,cond=vscode},

  -- Auto format tools
  { "sbdchd/neoformat",          cmd = { "Neoformat" } ,cond=vscode},

  -- Git command inside vim
  {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
    cmd = { "Git", "GBrowse" },
cond=vscode
  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },cond=vscode
  },


  -- Show git change (change, delete, add) signs in vim sign column
  {
    "lewis6991/gitsigns.nvim",cond=vscode

  },

  -- Another markdown plugin
  { "preservim/vim-markdown",           ft = { "markdown" } ,cond=vscode},

  -- Faster footnote generation
  { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" }, cond=vscode },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, cond=vscode

  },

  { "chrisbra/unicode.vim",            event = "VeryLazy" },

  -- Additional powerful text object for vim, this plugin should be studied
  -- carefully to use its full power
  { "wellle/targets.vim",              event = "VeryLazy" , cond=vscode},


  -- Add indent object for vim (useful for languages like Python)
  { "michaeljsmith/vim-indent-object", event = "VeryLazy" , cond=vscode},


  -- Modern matchit implementation
  { "andymass/vim-matchup",            event = "BufRead" }, cond=vscode,
  { "tpope/vim-scriptease",            cmd = { "Scriptnames", "Message", "Verbose" } , cond=vscode},

  -- The missing auto-completion for cmdline!
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",
    dependencies = { "romgrk/fzy-lua-native",'roxma/nvim-yarp','roxma/vim-hug-neovim-rpc' }, cond=vscode
  },
  {
    'nvim-lualine/lualine.nvim',-- cond=vscode,
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  -- showing keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  -- show and trim trailing whitespaces
  { "jdhao/whitespace.nvim", event = "VeryLazy" , cond=vscode},

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    keys = { "<leader>s" },
  cond=vscode ,  dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { "ii14/emmylua-nvim",     ft = "lua" }, cond=vscode,
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
