return {
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup({
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
      })
    end,
  },
  {
    "nguyenvukhang/nvim-toggler",
    config = function()
      require("nvim-toggler").setup({
        inverses = {
          ["disable"] = "enable",
        },
      })
    end,
    keys = {
      {
        "<leader>i",
        mode = { "n", "v" },
        function()
          require("nvim-toggler").toggle()
        end,
        desc = "Toggler",
      },
    },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}
