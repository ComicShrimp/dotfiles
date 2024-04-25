return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = "left",
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        always_show = {
          ".env",
        },
      },
    },
  },
  -- config = function()
  --   vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
  --   vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  -- end,
}
