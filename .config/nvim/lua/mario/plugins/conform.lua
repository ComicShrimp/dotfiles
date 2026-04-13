return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      liquid = { "prettier" },
      lua = { "stylua" },
      go = { "goimports", "gofumpt", "golines" },
      python = { "ruff_fix", "ruff_format" },
    },
    format_on_save = {
      lsp_format = "fallback",
      async = false,
      timeout_ms = 1000,
    },
  },
  keys = {
    {
      "<leader>gf",
      function()
        require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 1000 })
      end,
      desc = "Format file",
    },
  },
}
