require("lualine").setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    -- lualine_x = { 'buffers', },
    lualine_b = { 'branch', },
    --lualine_x = { '' },
    lualine_y = { '' },
    -- lualine_x = {
    --   {
    --     'tabs',
    --     mode = 2,
    --   },
    -- },
  }
}
