return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard" } },
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
      extensions = { "neo-tree", "lazy", "trouble", "mason" },
    })
  end,
}
