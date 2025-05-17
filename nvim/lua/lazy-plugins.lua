--
--
--
--/
-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
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
  {
    "davidmh/mdx.nvim",
    config = true,
  },

  require "plugins/competitest",
  require "plugins/nvim-cmp",

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },



  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    {
      'stevearc/conform.nvim',
      opts = {},
    }
  },
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',
  require 'plugins/hurl',
  require 'plugins/markdown-preview',
  require 'plugins/nvim-tree',
  require "plugins/catppuccin",
  require "plugins/none-ls",
  require "plugins/nvim-autopairs",
  require "plugins/coderunner",
  require "plugins/telescope",
  require "plugins/which-key",
}, {})

--
-- vim: ts=2 sts=2 sw=2 et
