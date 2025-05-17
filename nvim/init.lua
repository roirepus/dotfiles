vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure plugins ]]
require 'lazy-plugins'

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'


--mappings
require 'mappings'

--debugger

require 'kickstart/plugins/debug'
--autoformatting
require 'kickstart/plugins/autoformat'
require 'config'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
