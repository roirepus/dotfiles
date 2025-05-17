require('competitest').setup {
  runner_ui = {
    interface = "popup",
  },
  --compile_directory = "./compiled",

  compile_command = {

    cpp = { exec = "g++", args = { "-Wall", "-std=c++2b", "$(FNAME)", "-o", "./compiled/$(FNOEXT)" } },
  },
  running_directory = "./compiled",

  running_command = {
    cpp = { exec = "./compiled/$(FNOEXT)" },
  },
  template_file = "../../template.cpp",
  evaluate_template_modifiers = true,
  testcases_directory = "./testcases",
  testcases_use_single_file = true,
}
