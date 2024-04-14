local Config = require("lazyvim.config")

for _, other in ipairs({ "aerial", "outline" }) do
  local extra = "lazyvim.plugins.extras.editor." .. other
  if vim.tbl_contains(Config.json.data.extras, extra) then
    other = other:gsub("^%l", string.upper)
    LazyVim.error({
      "**Trouble v3** includes support for document symbols.",
      ("You currently have the **%s** extra enabled."):format(other),
      "Please disable it in your config.",
    })
  end
end

return {
  {
    "folke/trouble.nvim",
    branch = "dev",
    keys = {
      { "<leader>xx", false },
      { "<leader>ld", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", false },
      { "<leader>lD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      {
        "<leader>cS",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP references/definitions/... (Trouble)",
      },
      { "<leader>xL", false },
      { "<leader>lL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", false },
      { "<leader>lQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  -- lualine integration
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      local trouble = require("trouble")
      if not trouble.statusline then
        LazyVim.error("You have enabled the **trouble-v3** extra,\nbut still need to update it with `:Lazy`")
        return
      end

      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
      })
      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
    end,
  },
}
