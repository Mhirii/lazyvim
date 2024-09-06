return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- commit = "07af0a9",
  -- pin = true,
  dependencies = {
    "echasnovski/mini.icons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below is optional, make sure to setup it properly if you have lazy=true
    -- {
    --   'MeanderingProgrammer/render-markdown.nvim',
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
  opts = function(_, opts)
    opts.provider = "copilot"
    opts.mappings = {
      ask = "<leader>av",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        both = "cb",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      toggle = {
        debug = "<leader>ad",
        hint = "<leader>ah",
      },
    }
  end,
}
