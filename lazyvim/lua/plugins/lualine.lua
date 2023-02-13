return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local custom_t = require("lualine.themes.material")
      local ll = require("lualine")
      custom_t.insert.b.bg = "None"
      custom_t.visual.b.bg = "None"
      custom_t.replace.b.bg = "None"
      custom_t.normal.b.bg = "None"
      custom_t.normal.c.bg = "None"
      ll.setup({ options = { theme = custom_t } })
    end,
  },
}
