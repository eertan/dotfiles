-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.relativenumber = true

vim.b.slime_cell_delimiter = "#%%"

-- -- slime, tmux
vim.g.slime_target = 'tmux'
vim.g.slime_bracketed_paste = 1
vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

-- slime, neovvim terminal
-- vim.g.slime_target = "neovim"
-- vim.g.slime_python_ipython = 1

-- git blame, lualine
vim.g.gitblame_display_virtual_text = 0

-- send code with Enter and leader Enter
lvim.keys.normal_mode["<leader><cr>"] = "<Plug>SlimeRegionSend"
lvim.keys.visual_mode["<cr>"] = "<Plug>SlimeRegionSend"


lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = false
lvim.colorscheme = "kanagawa"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.transparent_window = true
-- lvim.builtin.bufferline.active = false
-- All the treesitter parsers you want to install. If you want all of them, just
-- replace everything with "all".
-- Lualine config
lvim.builtin.lualine.style = 'lvim'

local custom_t = require "lualine.themes.material"
custom_t.insert.b.bg = 'None'
custom_t.visual.b.bg = 'None'
custom_t.replace.b.bg = 'None'
custom_t.normal.b.bg = 'None'
custom_t.normal.c.bg = 'None'


lvim.builtin.lualine.options.theme = custom_t

lvim.builtin.treesitter.ensure_installed = {
    "python",
}

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
}

-- TODO: debugpy installed by default
-- Setup dap for python
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function() require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python") end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function() require("dap-python").test_runner = "pytest" end)

-- Magma Setup

-- Image options. Other options:
-- 1. none:     Don't show images.
-- 2. ueberzug: use Ueberzug to display images.
-- 3. kitty:    use the Kitty protocol to display images.
vim.g.magma_image_provider = "kitty"

-- If this is set to true, then whenever you have an active cell its output
-- window will be automatically shown.
vim.g.magma_automatically_open_output = true

-- If this is true, then text output in the output window will be wrapped.
vim.g.magma_wrap_output = false

-- If this is true, then the output window will have rounded borders.
vim.g.magma_output_window_borders = false

-- The highlight group to be used for highlighting cells.
vim.g.magma_cell_highlight_group = "CursorLine"

-- Where to save/load with :MagmaSave and :MagmaLoad.
-- The generated file is placed in this directory, with the filename itself
-- being the buffer's name, with % replaced by %% and / replaced by %, and
-- postfixed with the extension .json.
vim.g.magma_save_path = vim.fn.stdpath "data" .. "/magma"

-- Mappings
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
lvim.builtin.which_key.vmappings["d"] = {
    name = "Debug",
    s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}

lvim.builtin.which_key.mappings["j"] = {
    name = "Jupyter",
    i = { "<Cmd>MagmaInit<CR>", "Init Magma" },
    d = { "<Cmd>MagmaDeinit<CR>", "Deinit Magma" },
    e = { "<Cmd>MagmaEvaluateLine<CR>", "Evaluate Line" },
    r = { "<Cmd>MagmaReevaluateCell<CR>", "Re evaluate cell" },
    D = { "<Cmd>MagmaDelete<CR>", "Delete cell" },
    s = { "<Cmd>MagmaShowOutput<CR>", "Show Output" },
    R = { "<Cmd>MagmaRestart!<CR>", "Restart Magma" },
    S = { "<Cmd>MagmaSave<CR>", "Save" },
}

lvim.builtin.which_key.vmappings["j"] = {
    name = "Jupyter",
    e = { "<esc><cmd>MagmaEvaluateVisual<cr>", "Evaluate Highlighted Line" },
}

lvim.builtin.which_key.mappings["P"] = {
    name = "Python",
    i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
    d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
}

lvim.builtin.which_key.mappings["C"] = {
    name = 'code',
    c = { ':SlimeConfig<cr>', 'slime config' },
    n = { ':split term://$SHELL<cr>', 'new terminal' },
    r = { ':split term://R<cr>', 'new R terminal' },
    p = { ':split term://python<cr>', 'new python terminal' },
    i = { ':split term://ipython<cr>', 'new ipython terminal' },
    j = { ':split term://julia<cr>', 'new julia terminal' },
    s = { ':echo b:terminal_job_id<cr>', 'show terminal id' },
}

lvim.builtin.which_key.mappings["Q"] = {
    name = 'quarto',
    p = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
    q = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
    h = { ":QuartoHelp ", 'help' },
    e = { ":lua require'otter'.export()<cr>", 'export' },
    E = { ":lua require'otter'.export(true)<cr>", 'export overwrite' },
}

lvim.builtin.which_key.vmappings['<cr>'] = { '<Plug>SlimeRegionSend', 'run code region' }

-- Additional Plugins
lvim.plugins = {
    -- You can switch between vritual environmnts.
    "AckslD/swenv.nvim",
    "daschw/leaf.nvim",
    "EdenEast/nightfox.nvim",
    "mfussenegger/nvim-dap-python",
    {
        -- You can generate docstrings automatically.
        "danymat/neogen",
        config = function()
          require("neogen").setup {
              enabled = true,
              languages = {
                  python = {
                      template = {
                          annotation_convention = "numpydoc",
                      },
                  },
              },
          }
        end,
    },
    -- {
    --     'alexghergh/nvim-tmux-navigation',
    --     config = function()
    --       local nvim_tmux_nav = require('nvim-tmux-navigation')

    --       nvim_tmux_nav.setup {
    --           disable_when_zoomed = true -- defaults to false
    --       }

    --       vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    --       vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    --       vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    --       vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    --       -- vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    --       -- vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    --     end
    -- },
    { 'quarto-dev/quarto-nvim',
        dependencies = {
            'jmbuhr/otter.nvim',
            'neovim/nvim-lspconfig'
        },
        config = function()
          require 'quarto'.setup {
              lspFeatures = {
                  enabled = true,
                  languages = { 'r', 'python', 'julia' },
                  diagnostics = {
                      enabled = true,
                      triggers = { "BufWrite" }
                  },
                  completion = {
                      enabled = true
                  }
              }
          }
        end
    },
    { 'jpalardy/vim-slime' },
    -- You can run blocks of code like jupyter notebook.
    { "dccsillag/magma-nvim" },
    {
        'sam4llis/nvim-tundra', config = function()
      require('nvim-tundra').setup({
          transparent_background = true,
          dim_inactive_windows = {
              enabled = false,
              color = nil,
          },
          editor = {
              search = {},
              substitute = {},
          },
          syntax = {
              booleans = { bold = true, italic = true },
              comments = { bold = true, italic = true },
              conditionals = {},
              constants = { bold = true },
              fields = {},
              functions = {},
              keywords = {},
              loops = {},
              numbers = { bold = true },
              operators = { bold = true },
              punctuation = {},
              strings = {},
              types = { italic = true },
          },
          diagnostics = {
              errors = {},
              warnings = {},
              information = {},
              hints = {},
          },
          plugins = {
              lsp = true,
              treesitter = true,
              telescope = true,
              nvimtree = true,
              cmp = true,
              context = true,
              dbui = true,
              gitsigns = true,
              neogit = true,
          },
          overwrite = {
              colors = {},
              highlights = {},
          },
      })
    end
    },
    { "rebelot/kanagawa.nvim" },
    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- "rcarriga/nvim-notify",
        },
        config = function()
          require("noice").setup({
              -- add any options here
              lsp = {
                  -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                  override = {
                      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                      ["vim.lsp.util.stylize_markdown"] = true,
                      ["cmp.entry.get_documentation"] = true,
                  },
              },
              -- you can enable a preset for easier configuration
              presets = {
                  bottom_search = true, -- use a classic bottom cmdline for search
                  command_palette = true, -- position the cmdline and popupmenu together
                  long_message_to_split = true, -- long messages will be sent to a split
                  inc_rename = false, -- enables an input dialog for inc-rename.nvim
                  lsp_doc_border = false, -- add a border to hover docs and signature help
              },
          })
        end,
    },
}

-- quarto completion lsp
table.insert(lvim.builtin.cmp.sources, 1, { name = "otter" })

-- , build = ":UpdateRemotePlugins"
local dap                                             = require("dap")
local dapui                                           = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]     = function()
  dapui.close()
end
