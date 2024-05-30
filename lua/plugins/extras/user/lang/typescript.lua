return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        tsserver = {
          enabled = false,
        },
        vtsls = {
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
          keys = {
            {
              "gD",
              function()
                require("vtsls").commands.goto_source_definition(0)
              end,
              desc = "Goto Source Definition",
            },
            {
              "gR",
              function()
                require("vtsls").commands.file_references(0)
              end,
              desc = "File References",
            },
            {
              "<leader>ko",
              function()
                require("vtsls").commands.organize_imports(0)
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>ki",
              function()
                require("vtsls").commands.add_missing_imports(0)
              end,
              desc = "Add missing imports",
            },
            {
              "<leader>ku",
              function()
                require("vtsls").commands.remove_unused_imports(0)
              end,
              desc = "Remove unused imports",
            },
            {
              "<leader>kf",
              function()
                require("vtsls").commands.fix_all(0)
              end,
              desc = "Fix all diagnostics",
            },
            {
              "<leader>kV",
              function()
                require("vtsls").commands.select_ts_version(0)
              end,
              desc = "Select TS workspace version",
            },
            {
              "<leader>kR",
              function()
                require("vtsls").commands.restart_tsserver()
              end,
              desc = "Restart TSServer",
            },
            {
              "<leader>kC",
              function()
                require("vtsls").commands.goto_project_config()
              end,
              desc = "Restart TSServer",
            },
          },
        },
      },
      setup = {
        tsserver = function()
          -- disable tsserver
          return true
        end,
        vtsls = function(_, opts)
          -- copy typescript settings to javascript
          opts.settings.javascript =
            vim.tbl_deep_extend("force", {}, opts.settings.typescript, opts.settings.javascript or {})
          local plugins = vim.tbl_get(opts.settings, "vtsls", "tsserver", "globalPlugins")
          -- allow plugins to have a key for proper merging
          -- remove the key here
          if plugins then
            opts.settings.vtsls.tsserver.globalPlugins = vim.tbl_values(plugins)
          end
        end,
      },
    },
  },
}
