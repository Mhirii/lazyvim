-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd.colorscheme("tokyonight")

if vim.g.neovide then
  require("config.neovide")
end
