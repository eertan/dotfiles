-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local cmd = vim.cmd
-- cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
-- cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
-- cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
-- cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
-- cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
-- cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
-- cmd("au ColorScheme * hi LineNr ctermbg=none guibg=none")
-- cmd("let &fcs='eob: '")
--
cmd("autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . 'ToggleTerm'<CR>")

cmd("nnoremap <silent><c-t> <Cmd>exe v:count1 . 'ToggleTerm'<CR>")
cmd("inoremap <silent><c-t> <Cmd>exe v:count1 . 'ToggleTerm'<CR>")
