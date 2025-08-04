return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsign = require("gitsigns")

    gitsign.setup()

    vim.keymap.set("n", "<leader>gb", gitsign.toggle_current_line_blame, { desc = "Toggle current line blame" })
  end,
}
