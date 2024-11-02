require('nvim-tree').setup {
  view = {
    width = 30,
    relativenumber = true,
  },

  filters = {
    dotfiles = false,
  },

  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  diagnostics = {
    enable = true,
  },
  modified = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    --debounce_delay = 50,
  },
  update_focused_file = {
    enable = true,
    debounce_delay = 15,
  },
  -- renderer = {
  --   icons = {
  --     glyphs = {
  --       modified = "M",
  --     },
  --   },
  -- },
}
