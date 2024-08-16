return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "eslint_d", "prettier", stop_after_first = true },
        typescript = { "eslint_d", "prettier", stop_after_first = true },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format" },
      },
      format_on_save = {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      conform.format({
        lsp_format = "fallback",
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file" })
  end,
}
