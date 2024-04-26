vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Neotree mappings
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
