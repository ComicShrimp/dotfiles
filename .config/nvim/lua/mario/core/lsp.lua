vim.lsp.enable({
  "lua_ls",
  "gopls",
  "eslint",
  "vtsls",
  "tailwindcss",
  "rust_analyzer",
  "zls",
  "dockerls",
  "docker_compose_language_service",
  "vuels",
  "jsonls",
  "pyright",
})

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = {
    source = true, -- Or "if_many"
    -- prefix = "●", -- Could be '■', '▎', 'x'
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
  },
})

-- Keymaps
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open cursor diagnostics" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename using LSP" })
