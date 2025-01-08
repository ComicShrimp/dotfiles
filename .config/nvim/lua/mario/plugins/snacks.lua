return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    indent = {
      animate = {
        enabled = false,
      },
    },
    dashboard = { enabled = true },
    -- statuscolumn = { enabled = true },
  },
  keys = {
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Open Lazygit",
    },
  },
}
