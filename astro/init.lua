return {
  colorscheme = "catppuccin",
  plugins = {
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function() require("catppuccin").setup {} end,
    },
    { "rebelot/kanagawa.nvim" },
    { "tiagovla/tokyodark.nvim" },
    { "folke/tokyonight.nvim" },
    { "rose-pine/neovim", name = "rose-pine" },
  },
  -- set highlight group for any theme
  -- the key is the name of the colorscheme or init
  -- the init key will apply to all colorschemes
  highlights = {
    -- apply highlight group to all colorschemes (include the default_theme)
    init = {
      -- set the transparency for all of these highlight groups
      Normal = { bg = "NONE", ctermbg = "NONE" },
      NormalNC = { bg = "NONE", ctermbg = "NONE" },
      CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      LineNr = {},
      SignColumn = {},
      StatusLine = {},
      NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
      NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
    },
  },
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
    },
    -- t = {
    --   -- setting a mapping to false will disable it
    --   -- ["<esc>"] = false,
    -- },
  },
}
