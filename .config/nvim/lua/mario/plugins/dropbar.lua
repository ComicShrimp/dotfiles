return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  opts = {
    bar = {
      enable = function(buf, win, _)
        return vim.bo[buf].buftype == ""
          and vim.fn.win_gettype(win) == ""
          and vim.bo[buf].filetype ~= "neo-tree"
      end,
    },
  },
}
