return {

  {
    "akinsho/toggleterm.nvim",
    version = "*"
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup({
        icons_enabled = true,
        theme = 'gruvbox',
      })
    end,
  },

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  'folke/neodev.nvim',

  {
    'hrsh7th/nvim-cmp', dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },


  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end
  },
  {
    "echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup()
    end
  },

  {
    "github/copilot.vim",
  },

}
