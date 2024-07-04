return {
  colorscheme = "nightfly",
  plugins = {
    -- init = {
    --   ['kevinhwang91/nvim-ufo'] = {disable = true},
    -- },
    {
      "anuvyklack/pretty-fold.nvim",
      config = function() require("pretty-fold").setup() end,
    },
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function() require("catppuccin").setup {} end,
    },
    {
      "RRethy/base16-nvim",
    },
    { "rebelot/kanagawa.nvim" },
    {
      "tiagovla/tokyodark.nvim",
      config = function()
        require("tokyodark").setup() -- calling setup is optional
      end,
    },
    {
      "xiyaowong/transparent.nvim",
      lazy = false,
      config = function()
        require("transparent").setup {
          groups = { -- table: default groups
            "Normal",
            "NormalNC",
            "Comment",
            "Constant",
            "Special",
            "Identifier",
            "Statement",
            "PreProc",
            "Type",
            "Underlined",
            "Todo",
            "String",
            "Function",
            "Conditional",
            "Repeat",
            "Operator",
            "Structure",
            "LineNr",
            "NonText",
            "SignColumn",
            "CursorLine",
            "CursorLineNr",
            "StatusLine",
            "StatusLineNC",
            "EndOfBuffer",
            "winbar",
          },
          extra_groups = {
            "DiagnosticSignHint",
            "DiagnosticSignWarn",
            "DiagnosticSignError",
            "FoldColumn",
            "NormalFloat",
            "DiffAdd",
            "DiffChange",
            "DiffDelete",
            "DiffText",
            "UfoPreviewSbar",
            "UfoFoldedBg",
            "UfoPreviewThumb",
            "UfoPreviewWinBar",
            "UfoPreviewCursorLine",
            "UfoFoldedEllipsis",
            "UfoCursorFoldedLine",
          }, -- table: additional groups that should be cleared
          exclude_groups = {}, -- table: groups you don't want to clear
        } -- calling setup is optional
      end,
    },
    { "folke/tokyonight.nvim" },
    { "felipeagc/fleet-theme-nvim", config = function() require("fleet-theme").setup {} end },
    { "rose-pine/neovim", name = "rose-pine" },
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    {
      "declancm/maximize.nvim",
      opts = {
        default_keymaps = false,
      },
      -- keys = {
      --   {
      --     "n",
      --     "<Leader>M",
      --     "<Cmd>lua require('maximize').toggle()<CR>",
      --     desc = "Toggle Max",
      --   },
      -- },
    },
    -- {
    --   "rcarriga/nvim-notify",
    --   config = function()
    --     require("notify").setup {
    --       background_colour = "#000000",
    --     }
    --   end,
    -- },
    {
      "rcarriga/nvim-notify",
      init = function() require("astronvim.utils").load_plugin_with_func("nvim-notify", vim, "notify") end,
      opts = {
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { zindex = 175 })
          if not vim.g.ui_notifications_enabled then vim.api.nvim_win_close(win, true) end
          if not package.loaded["nvim-treesitter"] then pcall(require, "nvim-treesitter") end
          vim.wo[win].conceallevel = 3
          local buf = vim.api.nvim_win_get_buf(win)
          if not pcall(vim.treesitter.start, buf, "markdown") then vim.bo[buf].syntax = "markdown" end
          vim.wo[win].spell = false
        end,
        background_colour = "#000000",
      },
      config = require "plugins.configs.notify",
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap" },
      config = function()
        local dap = require "dap"

        local dapui = require "dapui"
        dapui.setup {
          layouts = {
            {
              elements = {
                {
                  id = "scopes",
                  size = 0.75,
                },
                {
                  id = "breakpoints",
                  size = 0.25,
                },
              },
              position = "left",
              size = 0.25,
            },
            {
              elements = { {
                id = "repl",
                size = 1.0,
              } },
              position = "bottom",
              size = 0.5,
            },
          },
        }
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
      end,
    },
    -- {
    --   "rcarriga/nvim-dap-ui",
    --   config = function()
    --     require("dapui").setup {
    --       layouts = {
    --         {
    --           elements = {
    --             {
    --               id = "scopes",
    --               size = 0.25,
    --             },
    --             {
    --               id = "breakpoints",
    --               size = 0.25,
    --             },
    --           },
    --           position = "left",
    --           size = 40,
    --         },
    --         {
    --           elements = { {
    --             id = "console",
    --             size = 0.5,
    --           } },
    --           position = "bottom",
    --           size = 10,
    --         },
    --       },
    --     }
    --   end,
    -- },
    {
      "nvim-neorg/neorg",
      build = ":Neorg sync-parsers",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = { -- Manages Neorg workspaces
              config = {
                workspaces = {
                  notes = "~/Documents/org_notes/",
                },
                default_workspace = "notes",
              },
            },
          },
        }
      end,
    },
  },
  -- set highlight group for any theme
  -- the key is the name of the colorscheme or init
  -- the init key will apply to all colorschemes
  -- highlights = {
  --   -- apply highlight group to all colorschemes (include the default_theme)
  --   init = {
  --     -- set the transparency for all of these highlight groups
  --     Normal = { bg = "NONE", ctermbg = "NONE" },
  --     NormalNC = { bg = "NONE", ctermbg = "NONE" },
  --     -- CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  --     CursorLine = { cterm = {}, bg = "NONE", ctermbg = "NONE", ctermfg = "NONE" },
  --     CursorLineNr = { cterm = {}, bg = "NONE", ctermbg = "NONE", ctermfg = "NONE" },
  --     LineNr = { bg = "NONE" },
  --     SignColumn = { bg = "NONE" },
  --     StatusLine = {},
  --     UfoFoldedBg = { bg = "NONE" },
  --     NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
  --     NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
  --   },
  -- },
  options = {
    opt = {
      showtabline = 0,
    },
  },
  diagnostics = {
    virtual_text = false,
    underline = true,
  },
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      ["<C-t>"] = { ":ToggleTerm lua require'toggleterm'.toggle(<count>, 'float')", desc = "Save File" },
      ["<leader>M"] = { "<Cmd>lua require('maximize').toggle()<CR>" },
    },
    -- t = {
    --   -- setting a mapping to false will disable it
    --   -- ["<esc>"] = false,
    -- },
  },
}
