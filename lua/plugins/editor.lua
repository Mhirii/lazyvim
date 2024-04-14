return {

  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        false,
      },
      {
        "<leader>fE",
        false,
      },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
        remap = true,
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
        remap = true,
      },
    },
    opts = {
      window = {
        position = "right",
      },
    },
  },
}
