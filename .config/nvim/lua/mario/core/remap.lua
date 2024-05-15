vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Neotree mappings
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Open Neotree left", silent = true })

-- QOL keymaps
vim.keymap.set("n", "<C-f>", ":noh<CR>", { desc = "Remove highligth after search", silent = true })
vim.keymap.set("n", "<leader>s", ":set list!<CR>", { desc = "Show hidden chars", silent = true })
