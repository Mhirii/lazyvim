local decode = function(filename)
  local file = io.open(filename, "r")
  if not file then
    return false
  end
  local content = file:read("*a")
  file:close()

  local parsed, json = pcall(vim.fn.json_decode, content)
  if not parsed then
    return false
  end
  return json
end

local function check_json_key_exists(json, ...)
  return vim.tbl_get(json, ...) ~= nil
end
local check_dep = function(decoded, package_name)
  if
      check_json_key_exists(decoded, "dependencies", package_name)
      or check_json_key_exists(decoded, "devDependencies", "prettier")
  then
    return true
  end
  return false
end

local get_packagejson = function()
  local root = LazyVim.root.get()
  local files = vim.fs.find("package.json", { path = root })
  return files[1]
end

local has_eslint = function()
  local package = get_packagejson()
  if not package then
    return false
  end
  local decoded = decode(package)
  return check_dep(decoded, "eslint")
end

local has_prettier = function()
  local package = get_packagejson()
  if not package then
    return false
  end
  local decoded = decode(package)
  return check_dep(decoded, "prettier")
end

return {
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.vue" },
  {
    "jellydn/typecheck.nvim",
    dependencies = { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    ft = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" },
    opts = {
      debug = true,
      mode = "trouble",
    },
    keys = {
      {
        "<leader>ck",
        "<cmd>Typecheck<cr>",
        desc = "Run Type Check",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "vuki656/package-info.nvim",
        event = { "BufRead package.json" },
        opts = {},
      },
      {
        "David-Kunz/cmp-npm",
        event = { "BufRead package.json" },
        opts = {},
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "npm", keyword_length = 3 },
      }))
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css", "html", "javascript", "jsdoc", "scss", "typescript" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css-lsp", "html-lsp", "biome" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    enabled = true,
    opts = function(_, opts)
      if has_eslint() then
        opts.linters_by_ft = {
          javascript = { "eslint" },
          javascriptreact = { "eslint" },
          typescript = { "eslint" },
          typescriptreact = { "eslint" },
        }
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
      }
      -- if has_prettier() then
      --   opts.formatters_by_ft = {
      --     javascript = { "prettier" },
      --     javascriptreact = { "prettier" },
      --     typescript = { "prettier" },
      --     typescriptreact = { "prettier" },
      --     vue = { "prettier" },
      --   }
      -- end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.vtsls.settings.vtsls.enableMoveToFileCodeAction = false
      opts.servers.vtsls.settings.typescript.inlayHints = false
    end,
  }
}
