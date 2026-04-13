return {
  "theprimeagen/harpoon",
  keys = {
    {
      "<leader>a",
      function() require("harpoon.mark").add_file() end,
      desc = "Add file to harpoon",
    },
    {
      "<leader>e",
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "Toggle harpoon menu",
    },
    { "<C-u>", function() require("harpoon.ui").nav_file(1) end },
    { "<C-i>", function() require("harpoon.ui").nav_file(2) end },
    { "<C-o>", function() require("harpoon.ui").nav_file(3) end },
  },
}
