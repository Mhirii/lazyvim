local themes = require("user.colors")
local transparency = function()
  return not vim.g.neovide
end
return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      -- local transparency = function()
      --   return not vim.g.neovide
      -- end

      require("tokyonight").setup({
        transparent = true,
        hide_inactive_statusline = true,
        dim_inactive = false,
        lualine_bold = true,
        style = "night",
        styles = {
          sidebars = "transparent",
          floats = "dark",
          comments = { italic = false },
          keywords = { italic = false, bold = true },
          functions = { italic = false, bold = true },
          variables = { italic = false, bold = false },
        },
        vim.cmd.colorscheme("tokyonight"),
      })
    end,
  },
  { "bluz71/vim-nightfly-colors", enabled = false },
  {
    "oxfist/night-owl.nvim",
    enabled = false,
    -- lazy = false,
    -- priority = 1000,
    config = function()
      local night_owl = require("night-owl")

      night_owl.setup({
        -- These are the default settings
        bold = true,
        italics = false,
        underline = false,
        undercurl = false,
        transparent_background = false,
      })
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        transparent_background = transparency(),
        color_overrides = {
          mocha = themes.nero2(),
        },

        highlight_overrides = {
          all = function(colors)
            return {
              ["@function.method"] = { fg = colors.sapphire, style = { "bold" } },
              ["@function.builtin"] = { fg = colors.blue, style = { "bold" } },
              ["Function"] = { fg = colors.blue },
              ["@parameter"] = { fg = colors.peach },
              ["@keyword"] = { fg = colors.red, style = { "bold" } },
              ["NeoTreeNormal"] = { bg = colors.base },
              ["NeoTreeVertSplit"] = { fg = colors.base, bg = colors.base },
              ["NeoTree"] = { fg = colors.base, bg = colors.base },
              ["LazySpecial"] = { fg = colors.mauve },

            }
          end,
        },
      }
    end,
    opts = function(_, opts)
      opts.transparent_background = transparency()
      opts.term_colors = true
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  }
}
