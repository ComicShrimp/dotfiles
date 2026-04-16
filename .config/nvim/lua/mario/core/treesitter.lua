-- Auto-start treesitter for any filetype that has a parser available (Neovim 0.12+)
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then return end
    pcall(vim.treesitter.start, ev.buf, lang)
  end,
})
