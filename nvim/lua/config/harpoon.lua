require("harpoon").setup {

  --harpoon
  vim.keymap.set('n', "<leader>ht", ":lua require('harpoon.mark').add_file()<CR>"),
  vim.keymap.set('n', "<leader>hs", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
  vim.keymap.set('n', "<leader>ha", ":lua require('harpoon.ui').nav_file(1)<CR>"),
  vim.keymap.set('n', "<leader>hb", ":lua require('harpoon.ui').nav_file(2)<CR>"),
  vim.keymap.set('n', "<leader>hc", ":lua require('harpoon.ui').nav_file(3)<CR>"),
  vim.keymap.set('n', "<leader>hd", ":lua require('harpoon.ui').nav_file(4)<CR>"),
  vim.keymap.set('n', "<leader>he", ":lua require('harpoon.ui').nav_file(5)<CR>"),
  vim.keymap.set('n', "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>"),
  vim.keymap.set('n', "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>"),
}
