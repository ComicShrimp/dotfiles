return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      registers = true,
      marks = true,
      spelling = { enabled = true, suggestions = 20 },
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
    icons = { breadcrumb = "»", separator = "➜", group = "+" },
    keys = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
    win = { border = "rounded" },
    layout = { align = "left" },
    filter = function(_) return true end,
    show_help = true,
    triggers = { { "<auto>", mode = "nxso" } },
  },


}
