return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  keys = {
    { "<leader>uz", ":ColorizerToggle<cr>", { desc = "Toggle Colorizer" } },
  },
  config = function()
    local default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = false, -- "Name" codes like Blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    }
    local css_options = {
      RGB = true,
      RRGGBB = true,
      names = true,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    }
    require("colorizer").setup({
      "*",
      lua = default_options,
      hypr = default_options,
      rust = default_options,
      conf = default_options,

      vue = css_options,
      tsx = css_options,
      css = css_options,
    })
  end,
}
