return {
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "saghen/blink.cmp",
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
      -- Enable code completion
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local default_lsp_setup = {
        capabilities = capabilities,
      }

      -- Packages Setup

      -- LSP servers to install and configure
      local lsp_to_install = {
        -- Javascript/Typescript
        eslint = default_lsp_setup,
        ts_ls = {
          capabilities = capabilities,
          on_attach = function(client)
            client.server_capabilities.document_formatting = false
          end,
          init_options = {
            preferences = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
        tailwindcss = default_lsp_setup,
        -- Rust
        rust_analyzer = default_lsp_setup,
        -- Lua
        lua_ls = {
          capabilities,
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        -- Python
        pyright = {
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
              },
            },
          },
        },
        -- Go
        gopls = default_lsp_setup,
        zls = default_lsp_setup,
        -- Docker
        dockerls = default_lsp_setup,
        docker_compose_language_service = default_lsp_setup,
        -- Vue
        vuels = default_lsp_setup,
        -- Others
        jsonls = default_lsp_setup,
      }

      -- Packages to install
      local mason_tools = {
        -- JS/TS
        "eslint_d",
        "prettier",
        -- Python
        "mypy",
        "ruff",
        "pyright",
        -- Go
        "gofumpt",
        "goimports-reviser",
        "golines",
        -- Lua
        "stylua",
        -- Others
        "marksman", -- Markdown
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

      local function getKeys(tbl)
        local keys = {}
        for key, _ in pairs(tbl) do
          table.insert(keys, key)
        end
        return keys
      end

      -- Mason LSP Config Setup

      require("mason-lspconfig").setup({
        ensure_installed = getKeys(lsp_to_install),
      })

      local lspconfig = require("lspconfig")

      for lsp, config_setup in pairs(lsp_to_install) do
        lspconfig[lsp].setup(config_setup)
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename using LSP" })
    end,
  },
}
