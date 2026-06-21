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

      -- Tools to install only if not already in PATH
      local tools = {
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
        "nixfmt",
        "nil",
        "statix",
      }

      for _, tool in ipairs(tools) do
        local p = mr.get_package(tool)
        -- Only install if not already installed AND not found in system PATH
        if not p:is_installed() and vim.fn.executable(tool) == 0 then
          p:install()
        end
      end

      require("mason-lspconfig").setup({
        automatic_enable = true,
        -- Only install servers not already available in PATH
        ensure_installed = vim.tbl_filter(function(server)
          return vim.fn.executable(server) == 0
        end, {
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
        }),
      })
    end,
  },
}
