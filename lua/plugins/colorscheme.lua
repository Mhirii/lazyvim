return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      -- local transparency = function()
      --   return not vim.g.neovide
      -- end

      require("tokyonight").setup({
        transparent = false,
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
  { "bluz71/vim-nightfly-colors" },
  {
    "oxfist/night-owl.nvim",
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
}