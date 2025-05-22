-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>f', function()
  require("conform").format()
end
)
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--floaterm
vim.keymap.set("n", "<leader>te", ":FloatermNew --width=0.8 --height=0.8 <CR>")

-- vim: ts=2 sts=2 sw=2 et
-- Use ctrl-[hjkl] to select the active split!
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', ':qa<CR>', { noremap = true, silent = true })
-- general keymaps vertical movement
--
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

--format
vim.keymap.set('n', "<leader>fo", ":Format<CR>")

--wrap in quotes
vim.api.nvim_set_keymap('n', '<leader>"', 'viw<esc>a"<esc>hbi"<esc>', { noremap = true, silent = true })
--wrap selection in quotes

vim.api.nvim_set_keymap('v', '<leader>"', '<esc>`<i"<esc>`>f"a<esc>', { noremap = true, silent = true })
-- wrap in brackerts
vim.api.nvim_set_keymap('n', '<leader>[', 'viw<esc>a]<esc>hbi[<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>(', 'viw<esc>a)<esc>hbi(<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>{', 'viw<esc>a}<esc>hbi{<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><n', 'viw<esc>a><esc>hbi<<esc>b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>>/', 'viw<esc>a/><esc>hbi<<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader></', 'viw<esc>a><esc>hbi</<esc>', { noremap = true, silent = true })
-- wrap selection in brackerts
vim.api.nvim_set_keymap('v', '<leader>[', '<esc>`<i[<esc>`>a]<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>(', '<esc>`<i(<esc>`>a)<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>{', '<esc>`<i{<esc>`>a}<esc>', { noremap = true, silent = true })
--center after searching

vim.keymap.set('n', "G", "Gzz$")
vim.keymap.set('v', "G", "Gzz$")
vim.keymap.set('n', "gg", "gg0")
vim.keymap.set('v', "gg", "gg0")
-- vim.keymap.set('n', "j", "jzz")
-- vim.keymap.set('n', "k", "kzz")
-- vim.keymap.set('n', "o", "o<esc>zzi")
-- vim.keymap.set('n', "O", "O<esc>zzi")
-- vim.keymap.set('n', "o", "o<esc>==zzA", { noremap = true, silent = true })
-- vim.keymap.set('n', "O", "O<esc>==zzA", { noremap = true, silent = true })



--undo tree undo tree

vim.keymap.set('n', "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", ":md", ":MarkdownPreviewToggle<CR>");


--vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vim.keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")
