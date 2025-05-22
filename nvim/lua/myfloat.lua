-- Save this in your Neovim config (e.g., `lua/myfloat.lua`)
local function show_registers_float()
  -- Run :reg and capture the output
  local output = vim.api.nvim_exec2("registers", { output = true }).output
  local lines = vim.split(output, "\n")

  -- Create a scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Configure floating window size and position
  local width = math.floor(vim.o.columns * 0.5)
  local height = #lines
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Optional: close on <Esc>
  vim.keymap.set('n', '<Esc>', '<cmd>close<CR>', { buffer = buf, nowait = true })
end

-- Expose to command
vim.api.nvim_create_user_command('RegFloat', show_registers_float, {})
