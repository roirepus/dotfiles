-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
-- Swap file settings
vim.opt.swapfile = false
vim.opt.cmdheight = 0
vim.opt.colorcolumn = "80"
vim.opt.fcs = { eob = " " }
vim.opt.wrap = true



-- Set highlight on search
vim.o.hlsearch = false
--indentation
vim.o.autoindent = true
vim.o.smartindent = false
vim.cmd("filetype plugin indent on")
--vim.opt.indentexpr=
--vim.opt.formatoptions:append("O")
-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.o.expandtab = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.api.nvim_set_option('formatoptions', vim.bo.formatoptions:gsub("[cro]", ""))
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end
})



--colors
vim.cmd("colorscheme catppuccin")
vim.api.nvim_set_hl(0, 'LineNr', { fg = "#eba0ac" })
vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#eba0ac", fg = "#313244" })

-- Enable mouse mode
vim.o.mouse = 'v'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
--vim.opt.smartindent = true
--vim.opt.cindent = false
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'



-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- vim: ts=2 sts=2 sw=2 et
