return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "EdenEast/nightfox.nvim", priority = 1000, opts = {} },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
    opts = {
      integrations = {
        cmp = true,
        blink_cmp = true,
        dashboard = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        dropbar = {
          enabled = false,
          color_mode = true, -- enable color for kind's texts, not just kind's icons
        },
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        markdown = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        harpoon = true,
      },
    },
  },
}
