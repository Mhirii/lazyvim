return {
  { "akinsho/horizon.nvim", version = "*" },
  opts = {
    transparent = true,
    plugins = {
      cmp = true,
      indent_blankline = true,
      nvim_tree = true,
      telescope = true,
      which_key = true,
      barbar = true,
      notify = true,
      symbols_outline = true,
      neo_tree = true,
      gitsigns = true,
      crates = true,
      hop = true,
      navic = true,
      quickscope = true,
      flash = true,
    },
    overrides = {
      colors = {
        -- CursorLine = { bg = "#1e1e1e", fg = "#ffffff", underline = true },
      },
    },
  },

  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({})
    end,
    opts = {
      transparent = true,
      terminal_colors = true,
      module_default = true,
      darken = { -- Darken floating windows and sidebar-like windows
        floats = true,
        sidebars = {
          enabled = true,
          list = {}, -- Apply dark background to specific windows
        },
      },
      modules = { -- List of various plugins and additional options
        -- ...
      },
      palettes = {},
      specs = {},
      groups = {},
    },
  },
}
