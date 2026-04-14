return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local mr = require("mason-registry")

      for _, tool in ipairs({
        "hadolint",
        "eslint_d",
        "prettier",
        "js-debug-adapter",
        "mypy",
        "ruff",
        "goimports",
        "gofumpt",
        "golines",
        "gomodifytags",
        "impl",
        "golangci-lint-langserver",
        "golangci-lint",
        "stylua",
        "marksman",
        "tree-sitter-cli",
      }) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end

      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
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
        },
      })
    end,
  },
}
