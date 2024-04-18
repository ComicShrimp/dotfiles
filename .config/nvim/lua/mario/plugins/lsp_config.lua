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
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Packages Setup

      -- LSP servers to install and configure
      local lsp_to_install = {
        -- Javascript/Typescript
        "eslint",
        "tsserver",
        "tailwindcss",
        -- Rust
        "rust_analyzer",
        -- Lua
        "lua_ls",
        -- Python
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

      -- Packages to install
      local mason_tools = {
        -- JS/TS
        "eslint_d",
        "prettier",
        -- Python
        "mypy",
        "ruff",
        "pyright",
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

      -- Mason LSP Config Setup

      require("mason-lspconfig").setup({
        ensure_installed = lsp_to_install,
      })

      local lspconfig = require("lspconfig")

      for _, lsp in ipairs(lsp_to_install) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      -- Special configuration for some LSP servers
      require("lspconfig").pyright.setup({
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
      })

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
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename using LSP" })
    end,
  },
}
