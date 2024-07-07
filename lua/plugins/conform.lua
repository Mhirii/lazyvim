return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local formatters = require("conform").formatters_by_ft
      opts.formatters_by_ft = table.insert(formatters, {
        typescript = { "biome", "prettierd" },
        typescriptreact = { "biome", "prettierd" },
        lua = { "stylua" },
        sh = { "shfmt" },
      })
    end,
  },
}
