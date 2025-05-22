return {

  mode = "float",
  float = {
    border = "rounded",
  },
  filetype = {
    cpp = {
      "cd $dir &&",
      "g++ $fileName -Wall -std=c++2b ",
      "-o $dir/.compiled/$fileNameWithoutExt &&",
      "$dir/.compiled/$fileNameWithoutExt",
    },
    javascript = "node $fileName",

    go = "go run $fileName",

    typescript = "deno run $fileName",
    --    typescript = "tsc -b && node $./dist/fileNameWithoutExt" .. ".js",

  },

  --code_runner keymaps
  vim.keymap.set("n", "<leader>run", ":RunCode<CR>"),
  vim.keymap.set("n", "<leader>er", ":RunClose<CR>"),
}
