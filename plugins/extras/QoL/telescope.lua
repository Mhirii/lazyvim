return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      {
        "<leader>fe",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Telescope File Browser",
      },
      { "<leader>fE", ":Telescope file_browser<CR>", desc = "Telescope File Browser (root)" },
    },
  },

  { "nvim-telescope/telescope-symbols.nvim" },

  {
    "telescope.nvim",
    dependencies = {
      "jvgrootveld/telescope-zoxide",
      config = function()
        require("telescope").load_extension("zoxide")
      end,
      keys = {
        { "<leader>fz", "<CMD>Telescope zoxide list<CR>" },
      },
    },
  },

  { -- Glyph Picker
    "2kabhishek/nerdy.nvim",
    keys = {
      { "<leader>fN", "<cmd> Nerdy<CR>", desc = "Glyph Picker" },
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
}
