return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()
    require("nvim-treesitter").install({
      "bash",
      "blade",
      "c",
      "comment",
      "css",
      "diff",
      "dockerfile",
      "fish",
      "gitcommit",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "html",
      "ini",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "nginx",
      "nix",
      "proto",
      "python",
      "query",
      "regex",
      "rust",
      "scss",
      "sql",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "zig",
    })

    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "*" },
      callback = function()
        local filetype = vim.bo.filetype
        if filetype and filetype ~= "" then
          local success = pcall(function()
            vim.treesitter.start()
          end)
          if not success then
            return
          end
        end
      end,
    })
  end,
}
