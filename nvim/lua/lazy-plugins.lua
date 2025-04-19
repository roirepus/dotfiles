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
  -- NOTE: First, some plugins that don't require any configuration


  -- lazy.nvim

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'isakbm/gitgraph.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  ---------------------------------------------------------------------------------theme---------------------------------
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('onedark').setup {
        -- Set a style preset. 'dark' is default.
        style = 'darker', -- dark, darker, cool, deep, warm, warmer, light
      }
      require('onedark').load()
    end,
  },

  {

    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end,

  },
  -- lazy.nvim

  ----------------------------------------------------------------------------------------------------------------
  ---auto-save
  -- {
  --   "pocco81/auto-save.nvim"
  -- },

  --{'Exafunction/codeium.vim'},
  { 'voldikss/vim-floaterm' },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "mbbill/undotree"
  },
  {
    "prisma/vim-prisma",
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",               -- Load when entering insert mode
    opts = {
      enable_check_bracket_line = false, -- Allows modifying brackets even if they're not on the same line
      fast_wrap = {},                    -- Enables fast wrapping with `<M-e>` (Alt + e)
      map_c_w = true,                    -- Ensures `c-w` also works with pairs
    },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
        }
      })
    end
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  --{ 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },

  -- plugins for cp
  {
    "CRAG666/code_runner.nvim",
    config = function()
    end
  },




  {
    'xeluxee/competitest.nvim',

    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
    end,
  },

  {
    dir = '~/nvim-stress-test',
  },
  --
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      --    -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      --    -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

    },

  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
  --------------------------------------------------------------------------------------------------git---------------------------------------------------
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
  },
  -------------------------------------------------------------------------------------------------------------------------------------------------------------


  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_b = { 'branch', },
        lualine_x = { '' },
        lualine_y = { '' },
        lualine_z = { '' }
      }
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  ------------------------------------------------------------------------------------finder,nav,tree plugins
  --nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

  },

  -- Fuzzy Finder (files, lsp, etc)
  {

    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    'ThePrimeagen/harpoon'
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,

  },
  --avante setup
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      -- for example
      provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
        timeout = 30000,  -- timeout in milliseconds
        temperature = 0,  -- adjust if needed
        max_tokens = 4096,
        -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",         -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy"
  -- },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',
  --require 'code-runner.lua',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
}, {})

--
-- vim: ts=2 sts=2 sw=2 et
