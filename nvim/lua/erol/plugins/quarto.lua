require("quarto").setup({
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    languages = { "r", "python", "julia" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWrite" },
    },
    completion = {
      enabled = true,
    },
  },
  -- keymap = {
  --  hover = 'K',
  --  definition = 'gd'
  --}
})
