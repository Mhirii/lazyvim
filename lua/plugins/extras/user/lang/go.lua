return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("gopher").setup({
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    })
    local map = vim.keymap.set
    map("n", "<leader>kt", "<cmd>:GoTestsAll<CR>", { desc = "Go - Add Tests for file" })
    map("n", "<leader>kx", "<cmd>:GoTestsExp<CR>", { desc = "Go - Add Tests for Exported" })
    map("n", "<leader>kd", "<cmd>:GoCmt<CR>", { desc = "Go - Generate Doc Comment" })
    map("n", "<leader>ke", "<cmd>:GoIfErr<CR>", { desc = "Go - If Err" })
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
}
