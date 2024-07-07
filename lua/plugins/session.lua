return {
  {
    "stevearc/resession.nvim",
    config = function()
      local resession = require("resession")
      resession.setup({
        autosave = {
          enabled = true,
          interval = 60,
          notify = true,
        },
      })

      -- Automatically save sessions on by working directory on exit
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          resession.save(vim.fn.getcwd(), { notify = true })
        end,
      })



          -- stylua: ignore start
      local map = vim.keymap.set
        map("n", "<Leader>Sl", function() require("resession").load "last" end,                           { desc = "Load last session" })
        map("n", "<Leader>Ss", function() require("resession").save() end,                                        { desc = "Save this session" })
        map("n", "<Leader>SS", function() require("resession").save(vim.fn.getcwd(), { dir = "dirsession" }) end, { desc = "Save this dirsession" })
        map("n", "<Leader>Sd", function() require("resession").delete() end,                                      { desc = "Delete a session" })
        map("n", "<Leader>SD", function() require("resession").delete(nil, { dir = "dirsession" }) end,           { desc = "Delete a dirsession" })
        map("n", "<Leader>Sf", function() require("resession").load() end,                                        { desc = "Load a session"})
        map("n", "<Leader>SF", function() require("resession").load(nil, { dir = "dirsession" }) end,             { desc = "Load a dirsession"  })
        map("n", "<Leader>S.", function() require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end, { desc = "Load current dirsession" } )
      -- stylua: ignore end
    end,
  },

  {
    "natecraddock/workspaces.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "stevearc/resession.nvim",
    },
    config = function()
      require("workspaces").setup({
        -- path to a file to store workspaces data in
        -- on a unix system this would be ~/.local/share/nvim/workspaces
        path = vim.fn.stdpath("data") .. "/workspaces",

        -- to change directory for nvim (:cd), or only for window (:lcd)
        -- deprecated, use cd_type instead
        -- global_cd = true,

        -- controls how the directory is changed. valid options are "global", "local", and "tab"
        --   "global" changes directory for the neovim process. same as the :cd command
        --   "local" changes directory for the current window. same as the :lcd command
        --   "tab" changes directory for the current tab. same as the :tcd command
        --
        -- if set, overrides the value of global_cd
        cd_type = "global",

        -- sort the list of workspaces by name after loading from the workspaces path.
        sort = true,

        -- sort by recent use rather than by name. requires sort to be true
        mru_sort = true,

        -- option to automatically activate workspace when opening neovim in a workspace directory
        auto_open = false,

        -- enable info-level notifications after adding or removing a workspace
        notify_info = true,

        -- lists of hooks to run after specific actions
        -- hooks can be a lua function or a vim command (string)
        -- lua hooks take a name, a path, and an optional state table
        -- if only one hook is needed, the list may be omitted
        hooks = {
          add = {},
          remove = {},
          rename = {},
          open_pre = {},
          open = function()
            require("resession").load(vim.fn.getcwd(), { dir = "dirsession" })
          end,
        },
      })
      local telescope = require("telescope")
      telescope.load_extension("workspaces")
    end,
    keys = {
      { "<leader>w", "<CMD>Telescope workspaces<CR>", mode = { "n" }, desc = "Workspaces - List" },
    },
  },
}
