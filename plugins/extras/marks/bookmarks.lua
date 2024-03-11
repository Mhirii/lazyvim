return {
  "tomasky/bookmarks.nvim",
  config = function()
    require("bookmarks").setup({
      save_file = vim.fn.expand("$HOME/.local/share/nvim/bookmarks"),
      keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function(bufnr)
        local bm = require("bookmarks")
        local map = vim.keymap.set
        map("n", "ma", bm.bookmark_toggle, { desc = "Toggle Bookmark" }) -- add or remove bookmark at current line
        map("n", "mi", bm.bookmark_ann, { desc = "Add Bookmark Annotation" }) -- add or edit mark annotation at current line
        map("n", "mc", bm.bookmark_clean, { desc = "Clean all Bookmarks in buffer" }) -- clean all marks in local buffer
        map("n", "mn", bm.bookmark_next, { desc = "Next Mark in buffer" }) -- jump to next mark in local buffer
        map("n", "mp", bm.bookmark_prev, { desc = "Previous Mark in buffer" }) -- jump to previous mark in local buffer
        map("n", "ml", bm.bookmark_list, { desc = "List Bookmarks" }) -- show marked file list in quickfix window
      end,
    })
    -- TODO: telescope
    require("telescope").load_extension("bookmarks")
  end,
}
