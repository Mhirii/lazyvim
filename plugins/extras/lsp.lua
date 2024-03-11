return {
  {
    "andersevenrud/nvim_context_vt",
    dependencies = "nvim-treesitter",
    config = function(_, opts)
      require("nvim_context_vt").setup(opts)
      vim.cmd([[NvimContextVtToggle]])
    end,
    keys = {
      {
        "<leader>ux",
        "<cmd> NvimContextVtToggle<CR>",
        mode = "n",
        desc = "Toggle Context Visualizer",
      },
    },
    opts = {
      enabled = true,
      prefix = "",
      -- Override the internal highlight group name
      -- Default: 'ContextVt'
      highlight = "ContextVt",
      disable_ft = { "markdown" },
      -- Disable display of virtual text below blocks for indentation based languages like Python
      disable_virtual_lines = false,
      -- Same as above but only for spesific filetypes
      disable_virtual_lines_ft = { "yaml" },
      -- How many lines required after starting position to show virtual text
      min_rows = 1,
      -- Same as above but only for spesific filetypes
      min_rows_ft = {},
    },
  },

  {
    -- Displaying references and definition infos upon functions like JB's IDEA.
    "VidocqH/lsp-lens.nvim",
    event = "BufRead",
    opts = {
      include_declaration = true, -- Reference include declaration
      sections = { -- Enable / Disable specific request
        definition = false,
        references = true,
        implementation = false,
      },
    },
    keys = {
      {
        "<leader>uL",
        "<cmd>LspLensToggle<CR>",
        desc = "LSP Len Toggle",
      },
    },
  },
}
