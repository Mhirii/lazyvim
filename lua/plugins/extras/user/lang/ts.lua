return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css",
        "html",
        "javascript",
        "tsx",
        "typescript",
        "vue",
      })
    end,
  },
  { "pmizio/typescript-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        html = { filetypes = { "xhtml", "html" } },
        cssls = {
          provideFormatter = false,
          capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  snippetSupport = true,
                },
              },
            },
          },
          settings = {
            css = {
              validate = false,
            },
            less = {
              validate = false,
            },
            scss = {
              validate = false,
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            "astro",
            "css",
            "eruby",
            "html",
            "xhtml",
            "htmldjango",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "typescriptreact",
            "vue",
          },
          init_options = {
            showSuggestionsAsSnippets = true,
          },
        },
        tsserver = {
          filetypes = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
          },
          init_options = {
            preferences = {
              importModuleSpecifierPreference = "non-relative",

              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = false,
              includeInlayFunctionParameterTypeHints = false,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = false,
              includeInlayVariableTypeHints = false,
            },
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.expand("$HOME/.npm-packages/lib/node_modules/@vue/typescript-plugin"),
                languages = { "javascript", "typescript", "vue" },
              },
            },
          },
        },
        ["typescript-tools"] = {
          filetypes = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
          },
          mason = false,
          keys = {
            {
              "<leader>ko",
              "<cmd>TSToolsOrganizeImports<cr>",
              desc = "Organize Imports",
            },
            {
              "<leader>ku",
              "<cmd>TSToolsRemoveUnusedImports<cr>",
              desc = "Remove Unused Imports",
            },
            {
              "<leader>kR",
              "<cmd>TSToolsRenameFile<cr>",
              desc = "Rename File",
            },
            {
              "<leader>ks",
              "<cmd>TSToolsSortImports<cr>",
              desc = "Sort Imports",
            },
            {
              "<leader>km",
              "<cmd>TSToolsAddMissingImports<cr>",
              desc = "Add Missing Imports",
            },
            {
              "gd",
              "<cmd>TSToolsGoToSourceDefinition<cr>",
              desc = "Goto Source Definition",
            },
          },
          settings = {
            -- tsserver settings
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },

            -- typescript-tools settings
            -- tsserver_plugins = {
            --   -- FIXME: find a way to pass location and languages like in tsserver config
            --   "@vue/typescript-plugin",
            -- },
          },
        },
        volar = {
          filetypes = { "vue" },
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                -- NOTE: `dynamicRegistration: true` reduces greatly the performance on nvim < 0.10.0
                dynamicRegistration = true,
              },
            },
          },
        },
        eslint = {
          settings = {
            run = "onSave",
          },
        },
      },
      setup = {
        -- NOTE: typescript-tools.nvim will not spawn a tsserver client, it will spawn typescript-tools client
        ["typescript-tools"] = function(_, opts)
          require("typescript-tools").setup(opts)
          return true
        end,
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "prettierd", "biome" })
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "biome" },
        ["javascriptreact"] = { "biome" },
        ["typescript"] = { "biome" },
        ["typescriptreact"] = { "biome" },
        ["vue"] = { "prettierd" },
        ["css"] = { "prettierd" },
        ["scss"] = { "prettierd" },
        ["less"] = { "prettierd" },
        ["html"] = { "prettierd" },
      },
    },
  },
}
