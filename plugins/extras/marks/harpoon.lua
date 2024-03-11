return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "BufRead",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function(_, options)
    local status_ok, harpoon = pcall(require, "harpoon")
    if not status_ok then
      return
    end
    harpoon:setup(options)
  end,

  keys = {
    {
      "<leader>fh",
      "<cmd>Telescope harpoon marks<cr>",
      desc = "Telescope Harpoon Marks",
    },
    {
      "<leader>hl",
      "<cmd>Telescope harpoon marks<cr>",
      desc = "Telescope Harpoon Marks",
    },
    {
      "<leader>hr",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon toggle menu",
    },
    {
      "<leader>ha",
      function()
        local harpoon = require("harpoon")
        harpoon:list():append()
      end,
      desc = "Harpoon Add File",
    },
  },
  opts = {},
}
