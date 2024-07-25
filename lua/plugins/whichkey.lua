return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    -- defaults = {},
    spec = {
      mode = { "n", "v" },
      { "g",             group = "+goto" },
      { "gs",            group = "+surround" },
      { "z",             group = "+fold" },
      { "]",             group = "+next" },
      { "[",             name = "+prev" },
      { "<leader><tab>", name = "+tabs" },
      {
        "<leader>b",
        group = "buffer",
        expand = function()
          return require("which-key.extras").expand.buf()
        end,
      },
      { "<leader>c", name = "+code" },
      -- ["<leader>f"] = { name = "+file/find" },
      { "<leader>g", name = "+git" },
      { "<leader>gh", name = "+hunks" },
      { "<leader>q", name = "+quit/session" },
      { "<leader>s", name = "+search" },
      { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
      {
        "<leader>w",
        group = "windows",
        proxy = "<c-w>",
        expand = function()
          return require("which-key.extras").expand.win()
        end,
      },
      -- ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    if not vim.tbl_isempty(opts.defaults) then
      LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
      wk.register(opts.defaults)
    end
  end,
}
