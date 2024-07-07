-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local resession = require("resession")
    resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
    resession.save("last")
  end,
})
