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

--nvim-tree keymaps
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")

--competitest keymaps
vim.keymap.set("n", "<leader>cr", ":CompetiTest run<CR>")
vim.keymap.set("n", "<leader>atc", ":CompetiTest add_testcase<CR>")
vim.keymap.set("n", "<leader>etc", ":CompetiTest edit_testcase<CR>")
vim.keymap.set("n", "<leader>qn", ":CompetiTest receive problem<CR>")
vim.keymap.set("n", "<leader>ct", ":CompetiTest receive contest<CR>")
vim.keymap.set("n", "<leader>show", ":CompetiTest show_ui<CR>")
--code_runner keymaps
vim.keymap.set("n", "<leader>run", ":RunCode<CR>")
vim.keymap.set("n", "<leader>er", ":RunClose<CR>")
--floaterm keymap

vim.keymap.set("n", ":term", ":FloatermNew<CR>")

-- vim: ts=2 sts=2 sw=2 et
-- Use ctrl-[hjkl] to select the active split!
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })
-- general keymaps vertical movement
--
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

--harpoon
vim.keymap.set('n', "<leader>hm", ":lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set('n', "<leader>ho", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set('n', "<leader>ha", ":lua require('harpoon.ui').nav_file(1)<CR>")
vim.keymap.set('n', "<leader>hb", ":lua require('harpoon.ui').nav_file(2)<CR>")
vim.keymap.set('n', "<leader>hc", ":lua require('harpoon.ui').nav_file(3)<CR>")
vim.keymap.set('n', "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>")
vim.keymap.set('n', "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>")
--format

vim.keymap.set('n', "<leader>fo", ":Format<CR>")

-- Function to execute multiple commands
local function on_save()
  vim.cmd("Format")
  -- Add other commands here
  --vim.cmd("AnotherCommand")
  --vim.cmd("YetAnotherCommand")
end

-- Auto-command to run the function before saving
--vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = on_save,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     if vim.bo.ft == '*' then
--       vim.lsp.buf.code_action {
--         context = { only = { "source.fixAll.ruff" } },
--         apply = true,
--       }
--     end
--   end,
-- })
--wrap in quotes
vim.api.nvim_set_keymap('n', '<leader>"', 'viw<esc>a"<esc>hbi"<esc>', { noremap = true, silent = true })
--wrap selection in quotes

vim.api.nvim_set_keymap('v', '<leader>"', '<esc>`<i"<esc>`>a"<esc>', { noremap = true, silent = true })
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
