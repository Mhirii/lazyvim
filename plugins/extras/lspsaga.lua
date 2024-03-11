-- disable lsp-inlayhints if that is nightly version, will remove when 0.10.0 is stable
local enabled_inlay_hints = false
if vim.fn.has("nvim-0.10.0") == 1 then
  enabled_inlay_hints = false
end

return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    ft = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact", "svelte", "vue" },
    enabled = enabled_inlay_hints,
    opts = {
      debug_mode = true,
    },
    config = function(_, options)
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
      require("lsp-inlayhints").setup(options)
      -- define key map for toggle inlay hints: require('lsp-inlayhints').toggle()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>uI",
        "<cmd>lua require('lsp-inlayhints').toggle()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
  {
    "kkharji/lspsaga.nvim",
    event = "LspAttach",
    config = true,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      {
        "<leader>k",
        "<cmd>Lspsaga hover_doc<cr>",
        { noremap = true, silent = true },
        desc = "Hover",
      },

      -- LSP finder - Find the symbol's definition
      { "gh", mode = { "n" }, "<cmd>Lspsaga finder<CR>", desc = "Lspsaga Finder" },

      -- Code action
      { "<leader>ca", mode = { "n", "v" }, "<cmd>Lspsaga code_action<CR>" },
      { "<leader>.", mode = { "n", "v" }, "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },

      -- Rename all occurrences of the hovered word for the entire file
      { "cr", mode = { "n" }, "<cmd>Lspsaga rename<CR>", desc = "Rename" },

      -- Rename all occurrences of the hovered word for the selected files
      { "cR", mode = { "n" }, "<cmd>Lspsaga rename ++project<CR>", desc = "Rename in Project" },
      -- Peek definition
      { "gp", mode = { "n" }, "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },

      -- Go to definition
      { "gD", mode = { "n" }, "<cmd>Lspsaga goto_definition<CR>", desc = "Go to Definition" },

      -- Go to type definition
      { "gt", mode = { "n" }, "<cmd>Lspsaga goto_type_definition<CR>", desc = "Go to Type Definition" },

      -- Diagnostic jump can use `<c-o>` to jump back
      { "[e", mode = { "n" }, "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Next Diagnostic" },
      { "]e", mode = { "n" }, "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },

      -- Diagnostic jump with filters such as only jumping to an error
      {
        "[E",
        mode = { "n" },
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        desc = "Previous Error",
      },
      {
        "]E",
        mode = { "n" },
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        desc = "Next Error",
      },

      -- Toggle Outline
      { "<leader>co", mode = { "n" }, "<cmd>Lspsaga outline<CR>", desc = "Lspsaga Outline" },

      -- Pressing the key twice will enter the hover window
      { "K", mode = { "n" }, "<cmd>Lspsaga hover_doc<CR>", desc = "Hover" },
    },
  },
  {
    -- Dim the unused variables and functions using lsp and treesitter.
    "narutoxy/dim.lua",
    event = "BufRead",
    dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    config = true,
  },
}
