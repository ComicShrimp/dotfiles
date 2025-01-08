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
  },
}
