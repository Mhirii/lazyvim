if not require("user.utils").is_personal() then
	return {}
end

return {
	{ import = "lazyvim.plugins.extras.coding.copilot-chat" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		cmd = "CopilotChat",
		keys = {
			{ "<c-s>",     "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
			{ "<leader>a", "",     desc = "+ai",        mode = { "n", "v" } },
			-- {
			--   "<leader>aa",
			--   function()
			--     return require("CopilotChat").toggle()
			--   end,
			--   desc = "Toggle (CopilotChat)",
			--   mode = { "n", "v" },
			-- },
			{
				"<leader>aX",
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
			{ "<leader>ax", "<CMD>CopilotChatExplain<CR>",  desc = "Explain (CopilotChat)",        mode = { "n", "v" } },
			{ "<leader>ar", "<CMD>CopilotChatReview<CR>",   desc = "Review (CopilotChat)",         mode = { "n", "v" } },
			{ "<leader>af", "<CMD>CopilotChatFix<CR>",      desc = "Fix (CopilotChat)",            mode = { "n", "v" } },
			{ "<leader>ao", "<CMD>CopilotChatOptimize<CR>", desc = "Optimize (CopilotChat)",       mode = { "n", "v" } },
			{ "<leader>aD", "<CMD>CopilotChatDocs<CR>",     desc = "Doc (CopilotChat)",            mode = { "n", "v" } },
			{ "<leader>at", "<CMD>CopilotChatTests<CR>",    desc = "Generate Tests (CopilotChat)", mode = { "n", "v" } },
			{ "<A-c>",      "<CMD>CopilotChatToggle<CR>",   desc = "Toggle (CopilotChat)",         mode = { "n", "v" } },
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

			opts.mappings = {
				complete = {
					detail = 'Use @<Tab> or /<Tab> for options.',
					insert = '<Tab>',
				},
				close = {
					normal = 'q',
					insert = '<C-c>'
				},
				reset = {
					normal = '<C-c>',
					insert = ''
				},
				submit_prompt = {
					normal = '<CR>',
					insert = '<C-m>'
				},
				accept_diff = {
					normal = '<C-y>',
					insert = '<C-y>'
				},
				yank_diff = {
					normal = 'gy',
				},
				show_diff = {
					normal = 'gd'
				},
				show_system_prompt = {
					normal = 'gp'
				},
				show_user_selection = {
					normal = 'gs'
				},
			}

			opts.model = 'claude-3.5-sonnet'


			chat.setup(opts)
		end,
	}
}
