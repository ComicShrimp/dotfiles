return {
  -- Required to auto load configs for Lsps
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
      -- Packages Setup
      local lsp_to_install = {
        "lua_ls",
        "gopls",
        "eslint",
        "ts_ls",
        "tailwindcss",
        "rust_analyzer",
        "zls",
        "dockerls",
        "docker_compose_language_service",
        "vuels",
        "jsonls",
        "pyright",
      }

      -- Packages to install
      local mason_tools = {
        -- Docker
        "hadolint",
        -- JS/TS
        "eslint_d",
        "prettier",
        "js-debug-adapter",
        "typescript-language-server",
        -- Python
        "mypy",
        "ruff",
        "pyright",
        -- Go
        "goimports",
        "gofumpt",
        "golines",
        "gomodifytags",
        "impl",
        -- Lua
        "stylua",
        -- Others
        "marksman", -- Markdown
        -- Tree Siter
        "tree-sitter-cli",
      }

      -- Mason Setup
      require("mason").setup()

      local mr = require("mason-registry")

      local function ensure_installed()
        for _, tool in ipairs(mason_tools) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end

      ensure_installed()

      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = lsp_to_install,
      })
    end,
  },
}
