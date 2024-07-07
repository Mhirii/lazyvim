return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  cmd = "CopilotChat",
  keys = {
    { "<c-s>",     "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    { "<leader>a", "",     desc = "+ai",        mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        return require("CopilotChat").toggle()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        return require("CopilotChat").reset()
      end,
      desc = "Clear (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ai",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input)
        end
      end,
      desc = "Quick Chat (CopilotChat)",
      mode = { "n", "v" },
    },
    { "<leader>ae", "<CMD>CopilotChatExplain<CR>",  desc = "Explain (CopilotChat)",        mode = { "n", "v" } },
    { "<leader>ar", "<CMD>CopilotChatReview<CR>",   desc = "Review (CopilotChat)",         mode = { "n", "v" } },
    { "<leader>af", "<CMD>CopilotChatFix<CR>",      desc = "Fix (CopilotChat)",            mode = { "n", "v" } },
    { "<leader>ao", "<CMD>CopilotChatOptimize<CR>", desc = "Optimize (CopilotChat)",       mode = { "n", "v" } },
    { "<leader>aD", "<CMD>CopilotChatDocs<CR>",     desc = "Doc (CopilotChat)",            mode = { "n", "v" } },
    { "<leader>at", "<CMD>CopilotChatTests<CR>",    desc = "Generate Tests (CopilotChat)", mode = { "n", "v" } },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    require("CopilotChat.integrations.cmp").setup()

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}
