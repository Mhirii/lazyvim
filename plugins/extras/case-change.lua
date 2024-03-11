return {
  "UTFeight/vim-case-change",
  keys = {
    -- NOTE: This is M-Shift-s
    {
      "<M-S>",
      "<cmd>ToggleCase<cr>",
      mode = "v",
      desc = "Toggle Case",
    },
    {
      "<M-S>",
      "<ESC>viw<cmd>ToggleCase<cr>",
      mode = { "i", "n" },
      desc = "Toggle Case",
    },
  },
}
