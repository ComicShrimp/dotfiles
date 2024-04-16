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
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = {
        -- Javascript/Typescript
        "eslint",
        "tsserver",
        "tailwindcss",
        -- "prettier", disabled because it dont have an entry in mason-lspconfig.nvim. Must be installed manually
        -- Rust
        "rust_analyzer",
        -- Lua
        "lua_ls",
        -- "luacheck", disabled because it dont have an entry in mason-lspconfig.nvim. Must be installed manually
        -- Python
        -- "mypy", disabled because it dont have an entry in mason-lspconfig.nvim. Must be installed manually
        "pyright",
        -- "ruff",
        "ruff_lsp",
        -- Docker
        "dockerls",
        "docker_compose_language_service",
        -- Vue
        "vuels",
        -- Others
        "jsonls",
      }

      require('mason').setup()
      require('mason-lspconfig').setup({
          ensure_installed = servers,
      })

      local lspconfig = require("lspconfig")

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      -- Special configuration for some LSP servers
      require('lspconfig').pyright.setup {
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      }

      require("lspconfig").tsserver.setup({
        capabilities = capabilities,
        on_attach = function(client)
          client.server_capabilities.document_formatting = false
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
    end,
  },
}
