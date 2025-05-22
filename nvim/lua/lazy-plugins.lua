require('lazy').setup({
  'tpope/vim-fugitive',

  'tpope/vim-rhubarb',

  'isakbm/gitgraph.nvim',

  'tpope/vim-sleuth',

  'voldikss/vim-floaterm',
  "ThePrimeagen/vim-be-good",
  "mbbill/undotree",
  "prisma/vim-prisma",
  'windwp/nvim-autopairs',
  "HiPhish/rainbow-delimiters.nvim",
  'windwp/nvim-ts-autotag',
  'ThePrimeagen/harpoon',
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim',

  require "plugins/lsp-config",
  require "plugins/oil",
  -- Lazy
  require "plugins/alpha",
  {
    "davidmh/mdx.nvim",
    config = true,
  },
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
    }
  },

  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },

  require "plugins/competitest",
  require "plugins/nvim-cmp",

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  { 'stevearc/conform.nvim', },
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',
  require 'plugins/hurl',
  require 'plugins/nvim-treesitter',
  require 'plugins/markdown-preview',
  require 'plugins/nvim-tree',
  require "plugins/catppuccin",
  require "plugins/none-ls",
  require "plugins/nvim-autopairs",
  require "plugins/coderunner",
  require "plugins/telescope",
  -- require "plugins/which-key",
}, {})

--
-- vim: ts=2 sts=2 sw=2 et
