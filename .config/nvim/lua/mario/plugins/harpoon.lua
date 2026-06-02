return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Add file to harpoon",
    },
    {
      "<leader>e",
      function()
        local h = require("harpoon")
        h.ui:toggle_quick_menu(h:list())
      end,
      desc = "Toggle harpoon menu",
    },
    {
      "<M-u>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Go to harpoon 1",
    },
    {
      "<M-i>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Go to harpoon 2",
    },
    {
      "<M-o>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Go to harpoon 3",
    },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
}
