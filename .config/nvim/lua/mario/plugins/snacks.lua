return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
  },
  config = function()
    vim.keymap.set("n", "<leader>lg", function()
      Snacks.lazygit()
    end, { desc = "Open Lazygit" })
  end,
}
