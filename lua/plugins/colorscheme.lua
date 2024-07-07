---@param hl Highlights
---@param c ColorScheme
local highlights = function(hl, c)
  hl.CursorLineNr = { fg = c.orange, bold = true }
  -- hl.LineNr = { fg = c.orange, bold = true }
  hl.LineNrAbove = { fg = c.fg_gutter }
  hl.LineNrBelow = { fg = c.fg_gutter }
  local prompt = "#2d3149"

  hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
  hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopePromptNormal = { bg = prompt }
  hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
  hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }

  -- ── Transparent with red borders ──────────────────────────────────────
  hl.TelescopeNormal = { bg = c.transparent, fg = c.fg_dark }
  hl.TelescopeBorder = { bg = c.transparent, fg = c.blue2 }
  hl.TelescopePromptNormal = { bg = c.transparent }
  hl.TelescopePromptBorder = { bg = c.transparent, fg = c.orange }
  hl.TelescopePromptTitle = { bg = c.transparent, fg = c.orange }
  hl.TelescopePreviewTitle = { bg = c.transparent, fg = c.blue2 }
  hl.TelescopeResultsTitle = { bg = c.transparent, fg = c.blue2 }

  hl.TSRainbowRed = { fg = c.red }
  hl.TSRainbowYellow = { fg = c.yellow }
  hl.TSRainbowBlue = { fg = c.blue }
  hl.TSRainbowOrange = { fg = c.orange }
  hl.TSRainbowGreen = { fg = c.green2 }
  hl.TSRainbowViolet = { fg = c.purple }
  hl.TSRainbowCyan = { fg = c.cyan }

  hl.LspInlayHint = { link = "Comment" }

  hl["@string.documentation"] = { fg = c.yellow }
  -- hl["@comment.documentation"] = { fg = "#636da6", italic = false, style = { italic = false } }

  -- Smali
  hl["@parameter.builtin"] = { fg = "#efc890" }

  -- Rust
  hl["@lsp.typemod.function.defaultLibrary.rust"] = { link = "@function" }
  hl["@lsp.typemod.method.defaultLibrary.rust"] = { link = "@method" }
  hl["@lsp.type.selfTypeKeyword.rust"] = { link = "@variable.builtin" }
  hl["@lsp.type.decorator.rust"] = { link = "@attribute" }
  hl["@lsp.type.deriveHelper.rust"] = { link = "@attribute" }
  hl["@lsp.type.generic.rust"] = { link = "@variable" }
  hl["@lsp.type.formatSpecifier.rust"] = { link = "@punctuation.special" }
  hl["@lsp.type.variable.rust"] = { link = "@variable" }
  hl["@lsp.type.escapeSequence"] = { link = "@string.escape" }
  hl["@lsp.type.selfKeyword"] = { link = "@variable.builtin" }
  hl["@lsp.typemod.variable.constant.rust"] = { link = "@constant" }
  hl["@lsp.typemod.keyword.async.rust"] = { link = "@keyword.coroutine" }
  hl["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" }
  hl["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" }
  -- why are these so bad?
  hl["@lsp.type.keyword.cs"] = {}
  hl["@lsp.type.keyword.go"] = {}
  hl["@lsp.type.keyword.rust"] = {}
  hl["@lsp.type.keyword.zig"] = {}
  hl["@lsp.type.type.zig"] = {}
  hl["@lsp.typemod.keyword.injected"] = { link = "@keyword" }

  hl["@lsp.type.operator"] = { link = "@operator" }
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    config = function()
      local transparency = function()
        return not vim.g.neovide
      end

      require("tokyonight").setup({
        on_highlights = highlights,
        transparent = transparency(),
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
      })
    end,
  },
  {
    "yashguptaz/calvera-dark.nvim",
  },
}
