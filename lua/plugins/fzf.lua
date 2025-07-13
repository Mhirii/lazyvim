return {
	"ibhagwan/fzf-lua",
	opts = function(_, opts)
		local fzf = require("fzf-lua")
		local actions = fzf.actions
		opts.files = {
			cwd_prompt = false,
			actions = {
				["alt-I"] = { actions.toggle_ignore },
				["alt-h"] = { actions.toggle_hidden },
			},
		}
		opts.grep = {
			actions = {
				["alt-I"] = { actions.toggle_ignore },
				["alt-h"] = { actions.toggle_hidden },
			},
		}
	end,
	-- opts.keys = {
	keys = {
		-- { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
		-- { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
		-- {
		-- 	"<leader>,",
		-- 	"<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
		-- 	desc = "Switch Buffer",
		-- },
		-- { "<leader>/",       LazyVim.pick("live_grep"),                                  desc = "Grep (Root Dir)" },
		-- { "<leader>:",       "<cmd>FzfLua command_history<cr>",                          desc = "Command History" },
		-- { "<leader><space>", LazyVim.pick("files"),                                      desc = "Find Files (Root Dir)" },
		-- find
		{ "<leader>ff", false },
		{ "<leader>fF", false },
		{ "<leader>fb", false },
		{ "<leader>fc", false },
		{ "<leader>fg", false },
		{ "<leader>fo", false },
		{ "<leader>fR", false },
		{ "<leader>fr", false },
		{ "<leader>f",  LazyVim.pick("files"),                                      desc = "Find Files (Root Dir)" },
		{ "<leader>F",  LazyVim.pick("files", { root = false }),                    desc = "Find Files (cwd)" },
		{ "<leader>sb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
		{ "<leader>sc", LazyVim.pick.config_files(),                                desc = "Find Config File" },
		{ "<leader>sg", "<cmd>FzfLua git_files<cr>",                                desc = "Find Files (git-files)" },
		{ "<leader>so", "<cmd>FzfLua oldfiles<cr>",                                 desc = "Recent" },
		{ "<leader>sR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }),           desc = "Recent (cwd)" },
		-- git
		-- { "<leader>gc",      "<cmd>FzfLua git_commits<CR>",                              desc = "Commits" },
		-- { "<leader>gs",      "<cmd>FzfLua git_status<CR>",                               desc = "Status" },
		-- search
		-- { '<leader>s"', "<cmd>FzfLua registers<cr>",                                desc = "Registers" },
		-- { "<leader>sa", "<cmd>FzfLua autocmds<cr>",                                 desc = "Auto Commands" },
		-- { "<leader>sB", "<cmd>FzfLua grep_curbuf<cr>",                              desc = "Buffer" },
		{ "<leader>sc", "<cmd>FzfLua command_history<cr>",                          desc = "Command History" },
		{ "<leader>sC", "<cmd>FzfLua commands<cr>",                                 desc = "Commands" },
		-- { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>",                     desc = "Document Diagnostics" },
		-- { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>",                    desc = "Workspace Diagnostics" },
		-- { "<leader>sg", LazyVim.pick("live_grep"),                                  desc = "Grep (Root Dir)" },
		-- { "<leader>sG", LazyVim.pick("live_grep", { root = false }),                desc = "Grep (cwd)" },
		-- { "<leader>sh", "<cmd>FzfLua help_tags<cr>",                                desc = "Help Pages" },
		-- { "<leader>sH", "<cmd>FzfLua highlights<cr>",                               desc = "Search Highlight Groups" },
		-- { "<leader>sj", "<cmd>FzfLua jumps<cr>",                                    desc = "Jumplist" },
		-- { "<leader>sk", "<cmd>FzfLua keymaps<cr>",                                  desc = "Key Maps" },
		-- { "<leader>sl", "<cmd>FzfLua loclist<cr>",                                  desc = "Location List" },
		-- { "<leader>sM", "<cmd>FzfLua man_pages<cr>",                                desc = "Man Pages" },
		-- { "<leader>sm", "<cmd>FzfLua marks<cr>",                                    desc = "Jump to Mark" },
		{ "<leader>sr", "<cmd>FzfLua resume<cr>",                                   desc = "Resume" },
		-- { "<leader>sq", "<cmd>FzfLua quickfix<cr>",                                 desc = "Quickfix List" },
		-- { "<leader>sw", LazyVim.pick("grep_cword"),                                 desc = "Word (Root Dir)" },
		-- { "<leader>sW", LazyVim.pick("grep_cword", { root = false }),               desc = "Word (cwd)" },
		-- { "<leader>sw", LazyVim.pick("grep_visual"),                                mode = "v",                       desc = "Selection (Root Dir)" },
		-- { "<leader>sW", LazyVim.pick("grep_visual", { root = false }),              mode = "v",                       desc = "Selection (cwd)" },
		-- { "<leader>uC", LazyVim.pick("colorschemes"),                               desc = "Colorscheme with Preview" },
	}
	-- end
}
