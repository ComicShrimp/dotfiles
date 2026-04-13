return {
  "ComicShrimp/99",
  branch = "main",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local _99 = require("99")
    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)
    _99.setup({
      provider = _99.Providers.KiroProvider,
      logger = {
        level = _99.DEBUG,
        path = "/tmp/" .. basename .. ".99.debug",
        print_on_error = true,
      },
      tmp_dir = "./.tmp",
      completion = {
        files = {},
        source = "blink",
      },
      md_files = {
        "AGENT.md",
      },
    })
  end,
  keys = {
    {
      "<leader>9v",
      function() require("99").visual() end,
      mode = "v",
      desc = "[99 - Plugin] Show prompt window",
    },
    {
      "<leader>9x",
      function() require("99").stop_all_requests() end,
      desc = "[99 - Plugin] Stop all requests",
    },
    {
      "<leader>9s",
      function() require("99").search() end,
      desc = "[99 - Plugin] Search",
    },
    {
      "<leader>9p",
      function() require("99.extensions.telescope").select_provider() end,
      desc = "[99 - Plugin] Switch AI provider",
    },
    {
      "<leader>9m",
      function() require("99.extensions.telescope").select_model() end,
      desc = "[99 - Plugin] Switch AI model for current provider",
    },
  },
}
