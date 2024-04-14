return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = { style = "moon" },
  config = function()
    local transparency = function()
      return not vim.g.neovide
    end

    require("tokyonight").setup({
      transparent = transparency(),
      hide_inactive_statusline = true,
      dim_inactive = false,
      lualine_bold = true,
      style = "night",
      styles = {
        sidebars = "transparent",
        floats = "dark",
        comments = { italic = false },
        keywords = { italic = true },
        functions = { italic = false, bold = false },
        variables = { italic = false, bold = false },
      },
    })
  end,
}
