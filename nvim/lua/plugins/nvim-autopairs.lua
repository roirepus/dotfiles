return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",               -- Load when entering insert mode
    opts = {
      enable_check_bracket_line = false, -- Allows modifying brackets even if they're not on the same line
      fast_wrap = {},                    -- Enables fast wrapping with `<M-e>` (Alt + e)
      map_c_w = true,                    -- Ensures `c-w` also works with pairs
    },
  },
}
