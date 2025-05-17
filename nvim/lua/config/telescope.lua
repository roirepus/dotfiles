-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local builtin = require("telescope.builtin")
require('telescope').setup {
  defaults = {
    hidden = true,
    file_ignore_patterns = { "%.git/", "%node_modules", ".next/" },
    find_command = { "rg", "--files", "--hidden",
      "--glob", "!**/.git/*",
      "--glob", "!**/.next/*", },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-p>'] = require("telescope.actions.layout").toggle_preview,
      },
    },
    preview = {
      hide_on_startup = false
    },
    layout_config = {
      width = 0.9,
      --      preview_width = 0.6,
      --preview_cutoff = 120,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>t?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>tb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

-- vim.keymap.set('n', '<leader>t/', function()
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_cursor {
--     previewer = true,
--     layout_config = {
--       height = 0.8,
--       width = 0.8,
--       preview_cutoff = 1,
--     },
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>t/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
    winblend = 0,
    previewer = true,
    layout_config = {
      height = 0.5,       -- Adjust height as needed
      preview_cutoff = 1, -- Ensure preview is always shown
    },
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    hidden = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>tf', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ts', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>tf', function()
  require("telescope.builtin").find_files {
    hidden = true,
    no_ignore = true,
  }
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>tw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>tg', function()
  require('telescope.builtin').live_grep {
    hidden = true,
    no_ignore = true,
  }
end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>tG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>tr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
--vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

-- vim: ts=2 sts=2 sw=2 et
