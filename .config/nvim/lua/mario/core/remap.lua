vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Neotree mappings
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Open Neotree left", silent = true })

-- QOL keymaps
vim.keymap.set("n", "<C-f>", ":noh<CR>", { desc = "Remove highligth after search", silent = true })
vim.keymap.set("n", "<leader>s", ":set list!<CR>", { desc = "Show hidden chars", silent = true })

-- Inlay hints
if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = "Toggle Inlay Hints" })
end

-- Save file with <C-s>
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true })
