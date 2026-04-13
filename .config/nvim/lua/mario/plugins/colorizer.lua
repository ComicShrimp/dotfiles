return {
  "norcalli/nvim-colorizer.lua",
  opts = {},
  config = function()
    require("colorizer").setup({ "*", css = { rgb_fn = true } })
  end,
}
