require("code_runner").setup {

  mode = "float",
  float = {
    border = "rounded",
  },
  filetype = {
    cpp = {
      "cd $dir &&",
      "g++ $fileName -Wall -std=c++2b ",
      "-o $dir/compiled/$fileNameWithoutExt &&",
      "$dir/compiled/$fileNameWithoutExt",
    },
    javascript = "node $fileName",

    go = "go run $fileName",

  },



}
