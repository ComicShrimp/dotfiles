return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    config = function()
      local telescope = require("telescope")
      local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, "--hidden")
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      telescope.setup({
        defaults = {
          mappings = {
            n = { ["<C-t>"] = require("trouble.sources.telescope").open },
            i = { ["<C-t>"] = require("trouble.sources.telescope").open },
          },
          vimgrep_arguments = vimgrep_arguments,
          path_display = { "smart" },
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
        extensions = { fzf = {} },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
    keys = {
      {
        "<leader>cd",
        function() require("telescope.builtin").diagnostics() end,
        desc = "Code diagnostics",
      },
    },
  },
}
