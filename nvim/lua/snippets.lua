local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
ls.add_snippets("cpp", {
  s("inc", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "  ",
      "int main() {",
      "  ",
      "  ",
    }),
    i(1),
    t({
      " ",
      " ",
      "}",
    }),
  }),
  s("sorvec", {
    t("vector<int>v={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};"),
    i(1),
    t(""),
  })
})
