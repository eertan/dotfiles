-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- ToggleTerm
keymap.set("n", "C-Bslash", "<cmd>ToggleTerm<cr>")
-- dapui
keymap.set("n", "<leader>dt", "<cmd>DapToggleBreakpoint<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>ds", "<cmd>DapRestartFrame<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>do", "<cmd>DapStepOver<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>dk", "<cmd>DapTerminate<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- lsp
local whichkey = require("which-key")
local keymap_l = {
  l = {
    name = "Code",
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
  },
}

local keymap_g = {
  name = "Goto",
  d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
  D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
  s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
  I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
  t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
}
whichkey.register(keymap_l, { prefix = "<leader>" })
whichkey.register(keymap_g, { prefix = "G" })
