return {
  "folke/flash.nvim",
  event = "VeryLazy",
  enabled = false,
  vscode = true,
  opts = {
    modes = {
      search = {
        enable = false,
        jump = { history = false, register = false, nohlsearch = false },
      },
      char = {
        jump_labels = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    { "<leader>uj", mode={"n","o","x","c"} ,function() require("flash").toggle() end,  desc = "Toggle Flash Search"  }
  },

  config = function()
    require("flash").jump({
      search = { forward = false, wrap = false, multi_window = false },
    })
  end,
}
