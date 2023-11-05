-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.b.slime_cell_delimiter = "#%%"

-- -- slime, tmux
vim.g.slime_target = "tmux"
vim.g.slime_bracketed_paste = 1
vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

-- slime, neovvim terminal
-- vim.g.slime_target = "neovim"
-- vim.g.slime_python_ipython = 1

-- git blame, lualine
vim.g.gitblame_display_virtual_text = 0

-- send code with Enter and leader Enter
local keymap = vim.keymap
keymap.set("n", "<leader><cr>", "<Plug>SlimeRegionSend")
keymap.set("n", "<leader><cr>", "<Plug>SlimeRegionSend")
