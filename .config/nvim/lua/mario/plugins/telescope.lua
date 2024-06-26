return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
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
          -- `hidden = true` is not supported in text grep commands.
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
      })

      telescope.setup({
        defaults = {
          path_display = { "smart" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Find git files" })
      vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Find string in files" })
      vim.keymap.set("n", "<leader>pr", builtin.lsp_references, { desc = "Find references" })
      vim.keymap.set("n", "<leader>cd", builtin.diagnostics, { desc = "Code diagnostics" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
