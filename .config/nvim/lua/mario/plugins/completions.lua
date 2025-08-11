return {
  "saghen/blink.cmp",
  dependencies = {
    { "rafamadriz/friendly-snippets" },
  },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = "super-tab" },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      -- use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    completion = {

      menu = {
        -- Don't automatically show the completion menu
        auto_show = true,

        -- nvim-cmp style menu
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", "kind", gap = 1 },
          },
        },
      },

      -- Show documentation when selecting a completion item
      documentation = { auto_show = true, auto_show_delay_ms = 500 },

      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = false },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- Use a preset for snippets, check the snippets documentation for more information
    snippets = { preset = "default" },

    -- Experimental signature help support
    signature = { enabled = false },
  },
  opts_extend = { "sources.default" },
}
