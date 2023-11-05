return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("quarto").setup({
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
      })
    end,
  },
  { "jpalardy/vim-slime" },
  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "jmbuhr/otter.nvim" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "otter" } }))
    end,
  },
}
