return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  opts = { mode = "cursor", max_lines = 3 },
}
