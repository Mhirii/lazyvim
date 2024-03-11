return {
  "LudoPinelli/comment-box.nvim",
  event = "VeryLazy",
  keys = {

    { "<leader>cbb", mode = { "n", "v" }, "<Cmd>CBccbox<CR>", desc = "Box Title" },
    { "<leader>cB", mode = { "n", "v" }, "<Cmd>CBccbox<CR>", desc = "Box Title" },
    { "<leader>cbt", mode = { "n", "v" }, "<Cmd>CBllline1<CR>", desc = "Title Line" },
    { "<leader>cbl", mode = { "n", "v" }, "<Cmd>CBline<CR>", desc = "Simple Line" },
    { "<leader>cbm", mode = { "n", "v" }, "<Cmd>CBllbox12<CR>", desc = "Mark Box" },
    { "<leader>cbd", mode = { "n", "v" }, "<Cmd>CBd<CR>", desc = "Remove comment" },
  },
}
