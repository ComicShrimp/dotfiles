return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<leader>xd",
      function() require("trouble").toggle("diagnostics") end,
      desc = "Toggle Diagnostics",
    },
    {
      "<leader>xq",
      function() require("trouble").toggle("quickfix") end,
      desc = "Toggle Quickfix",
    },
    {
      "<leader>xl",
      function() require("trouble").toggle("loclist") end,
      desc = "Toggle loclist",
    },
    {
      "gR",
      function() require("trouble").toggle("lsp_references") end,
      desc = "Toggle LSP References",
    },
  },
}
