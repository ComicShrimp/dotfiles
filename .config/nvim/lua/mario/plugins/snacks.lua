return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    indent = {
      animate = {
        enabled = false,
      },
    },
    dashboard = { enabled = true },
    input = { enabled = true },
    words = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = {
      left = { "mark", "sign" }, -- priority of signs on the left (high to low)
      right = { "fold", "git" }, -- priority of signs on the right (high to low)
      folds = {
        open = false, -- show open fold icons
        git_hl = false, -- use Git Signs hl for fold icons
      },
      git = {
        -- patterns to match Git signs
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50, -- refresh at most every 50ms
    },
  },
  keys = {
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Open Lazygit",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      { desc = "Delete Current Buffer" },
    },
    {
      "]]",
      function()
        Snacks.words.jump(1, true)
      end,
      desc = "Jump to next reference",
    },
    {
      "[[",
      function()
        Snacks.words.jump(-1, true)
      end,
      desc = "Jump to previous reference",
    },
    {
      "<leader>h",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show notification history",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({ hidden = true })
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find git",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.grep({ hidden = true })
      end,
      desc = "Find string in file",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "Find references",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find Buffers",
    },
    -- Experimental
    {
      "<leader>sb",
      function()
        Snacks.picker.explorer({ hidden = true })
      end,
      desc = "File explorer",
    },
  },
}
