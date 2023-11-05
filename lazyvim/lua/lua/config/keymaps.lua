-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local whichkey = require("which-key")
local quarto = {
  Q = {
    name = "quarto",
    p = { ":lua require'quarto'.quartoPreview()<cr>", "preview" },
    q = { ":lua require'quarto'.quartoClosePreview()<cr>", "close" },
    h = { ":QuartoHelp ", "help" },
    e = { ":lua require'otter'.export()<cr>", "export" },
    E = { ":lua require'otter'.export(true)<cr>", "export overwrite" },
  },
}

local slime = {
  S = {
    name = "slime",
    c = { ":SlimeConfig<cr>", "slime config" },
    n = { ":split term://$SHELL<cr>", "new terminal" },
    r = { ":split term://R<cr>", "new R terminal" },
    p = { ":split term://python<cr>", "new python terminal" },
    i = { ":split term://ipython<cr>", "new ipython terminal" },
    j = { ":split term://julia<cr>", "new julia terminal" },
    s = { ":echo b:terminal_job_id<cr>", "show terminal id" },
  },
}

local debug = {
  d = {
    name = "debug",
    t = { ":DapToggleBreakpoint<cr>", "toggle breakpoint" },
    c = { ":DapContinue<cr>", "start/continue" },
  },
}
whichkey.register(quarto, { prefix = "<leader>" })
whichkey.register(slime, { prefix = "<leader>" })
whichkey.register(debug, { prefix = "<leader>" })
