return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    require("trouble").setup()
    local trouble = require("trouble")

    -- Lua
    vim.keymap.set("n", "<leader>xd", function()
      trouble.toggle("diagnostics")
    end, { desc = "Toggle Diagnostics" })

    vim.keymap.set("n", "<leader>xq", function()
      trouble.toggle("quickfix")
    end, { desc = "Toggle Quickfix" })

    vim.keymap.set("n", "<leader>xl", function()
      trouble.toggle("loclist")
    end, { desc = "Toggle loclist" })

    vim.keymap.set("n", "gR", function()
      trouble.toggle("lsp_references")
    end, { desc = "Toggle LSP References" })
  end,
}
