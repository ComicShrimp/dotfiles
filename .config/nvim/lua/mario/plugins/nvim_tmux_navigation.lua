return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require("nvim-tmux-navigation").setup({})
    vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Navigate to the 'Left' panel" })
    vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Navigate to the 'Down' panel" })
    vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Navigate to the 'Up' panel" })
    vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Navigate to the 'Right' panel" })
  end,
}
