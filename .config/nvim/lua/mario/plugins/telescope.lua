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
      local telescopeConfig = require("telescope.config")

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      telescope.setup({
        defaults = {
          mappings = {
            n = { ["<C-t>"] = require("trouble.sources.telescope").open },
            i = { ["<C-t>"] = require("trouble.sources.telescope").open },
          },
          -- `hidden = true` is not supported in text grep commands.
          vimgrep_arguments = vimgrep_arguments,
          path_display = { "smart" },
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
        extensions = {
          fzf = {},
        },
      })

      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>cd", builtin.diagnostics, { desc = "Code diagnostics" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
