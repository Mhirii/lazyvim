local Util = require("lazyvim.util")
local map = vim.keymap.set
local nomap = vim.keymap.del
local opts = { silent = true }

map({ "n", "v" }, "<leader>nd", "<cmd> NoiceDismiss <CR>", { desc = "Noice - Dismiss Notifications" })

if Util.has("smart-splits.nvim") then
  local splits = require("smart-splits")
  map("n", "<C-h>", function()
    splits.move_cursor_left()
  end, { desc = "SmartSplits - Focus Left" })
  map("n", "<C-j>", function()
    splits.move_cursor_down()
  end, { desc = "SmartSplits - Focus Down" })
  map("n", "<C-k>", function()
    splits.move_cursor_up()
  end, { desc = "SmartSplits - Focus Up" })
  map("n", "<C-l>", function()
    splits.move_cursor_right()
  end, { desc = "SmartSplits - Focus Right" })

  map("n", "<A-left>", function()
    splits.resize_left()
  end, { desc = "SmartSplits - Resize Left" })
  map("n", "<A-down>", function()
    splits.resize_down()
  end, { desc = "SmartSplits - Resize Down" })
  map("n", "<A-up>", function()
    splits.resize_up()
  end, { desc = "SmartSplits - Resize Up" })
  map("n", "<A-right>", function()
    splits.resize_right()
  end, { desc = "SmartSplits - Resize Right" })

  map("n", "<A-h>", function()
    splits.resize_left()
  end, { desc = "SmartSplits - Resize Left" })
  map("n", "<A-j>", function()
    splits.resize_down()
  end, { desc = "SmartSplits - Resize Down" })
  map("n", "<A-k>", function()
    splits.resize_up()
  end, { desc = "SmartSplits - Resize Up" })
  map("n", "<A-l>", function()
    splits.resize_right()
  end, { desc = "SmartSplits - Resize Right" })

  map("n", "<leader><leader>h", function()
    splits.swap_buf_left()
  end, { desc = "SmartSplits - Swap Buffer Left" })
  map("n", "<leader><leader>j", function()
    splits.swap_buf_down()
  end, { desc = "SmartSplits - Swap Buffer Down" })
  map("n", "<leader><leader>k", function()
    splits.swap_buf_up()
  end, { desc = "SmartSplits - Swap Buffer Up" })
  map("n", "<leader><leader>l", function()
    splits.swap_buf_right()
  end, { desc = "SmartSplits - Swap Buffer Right" })
end

--          ╭─────────────────────────────────────────────────────────╮
--          │                         unbind                          │
--          ╰─────────────────────────────────────────────────────────╯
nomap("n", "<leader>l") -- lazy
nomap("n", "<leader>fn") -- new file

nomap("n", "<leader>ft") -- desc = "Terminal (Root Dir)"
nomap("n", "<leader>fT") -- desc = "Terminal (cwd)"
nomap("n", "<leader>fb") -- desc = "Buffers"
nomap("n", "<leader>fc") -- desc = "Find Config File"
nomap("n", "<leader>ff") -- desc = "Find Files (Root Dir)"
nomap("n", "<leader>fF") -- { cwd = false }), desc = "Find Files (cwd)"
nomap("n", "<leader>fg") -- desc = "Find Files (git-files)"
nomap("n", "<leader>fr") -- desc = "Recent"
nomap("n", "<leader>fR") -- { cwd = vim.uv.cwd() }), desc = "Recent (cwd)"

-- lazygit
map({ "n", "v" }, "<leader>lg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })

-- lazy
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- lazy extras
map("n", "<leader>lx", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })
