return {
  "mfussenegger/nvim-lint",
  events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  opts = {},
  config = function()
    require("lint").linters_by_ft = {
      dockerfile = { "hadolint" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "ruff", "mypy" },
      go = { "golangcilint" },
    }
  end,
  keys = {
    {
      "<leader>cl",
      function() require("lint").try_lint() end,
      desc = "Trigger linting for current file",
    },
  },
}
