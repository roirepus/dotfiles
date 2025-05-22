require('leap').set_default_mappings()
vim.api.nvim_set_hl(0, "LeapMatch", { fg = "#74c7ec", bold = true })
vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "#11111b", bg = "#eba0ac", bold = true })
vim.api.nvim_set_hl(0, "LeapLabelSecondary", { fg = "#11111b", bg = "#eba0ac", bold = true })
-- vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#555555" }) -- dimmed text
