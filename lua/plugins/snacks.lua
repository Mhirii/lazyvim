if true then return {} end
return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			win = {
				input = {
					keys = {
						["<a-c>"] = {
							"toggle_cwd",
							mode = { "n", "i" },
						},
					},
				},
			},
			actions = {
				---@param p snacks.Picker
				toggle_cwd = function(p)
					local root = LazyVim.root({ buf = p.input.filter.current_buf, normalize = true })
					local cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or ".")
					local current = p:cwd()
					p:set_cwd(current == root and cwd or root)
					p:find()
				end,
			},
		},
	},
	-- stylua: ignore
	keys = {

		{ "<leader>,",       false },
		{ "<leader>/",       false },
		{ "<leader>:",       false },
		{ "<leader><space>", false },
		{ "<leader>n",       false },
		-- find
		{ "<leader>fb",      false },
		{ "<leader>fB",      false },
		{ "<leader>fc",      false },
		{ "<leader>ff",      false },
		{ "<leader>fF",      false },
		{ "<leader>fg",      false },
		{ "<leader>fr",      false },
		{ "<leader>fR",      false },
		{ "<leader>fp",      false },
		-- git
		{ "<leader>gc",      false },
		{ "<leader>gd",      false },
		{ "<leader>gs",      false },
		-- Grep
		{ "<leader>sb",      false },
		{ "<leader>sB",      false },
		{ "<leader>sg",      false },
		{ "<leader>sG",      false },
		{ "<leader>sp",      false },
		{ "<leader>sw",      false },
		{ "<leader>sW",      false },
		-- search
		{ '<leader>s"',      false },
		{ "<leader>sa",      false },
		{ "<leader>sc",      false },
		{ "<leader>sC",      false },
		{ "<leader>sd",      false },
		{ "<leader>sh",      false },
		{ "<leader>sH",      false },
		{ "<leader>si",      false },
		{ "<leader>sj",      false },
		{ "<leader>sk",      false },
		{ "<leader>sl",      false },
		{ "<leader>sM",      false },
		{ "<leader>sm",      false },
		{ "<leader>sR",      false },
		{ "<leader>sq",      false },
		{ "<leader>su",      false },
		-- ui
		{ "<leader>uC",      false },


		{ "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{ "<leader>/",       LazyVim.pick("live_grep"),                                              desc = "Grep (Root Dir)" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
		{ "<leader><space>", LazyVim.pick("files"),                                                  desc = "Find Files (Root Dir)" },
		{ "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
		-- find
		{ "<leader>sb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{ "<leader>sB",      function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
		-- { "<leader>sc",      LazyVim.pick.config_files(),                                            desc = "Find Config File" },
		{ "<leader>f",       LazyVim.pick("files"),                                                  desc = "Find Files (Root Dir)" },
		{ "<leader>F",       LazyVim.pick("files", { root = false }),                                desc = "Find Files (cwd)" },
		{ "<leader>sg",      function() Snacks.picker.git_files() end,                               desc = "Find Files (git-files)" },
		{ "<leader>so",      LazyVim.pick("oldfiles"),                                               desc = "Recent" },
		{ "<leader>sR",      function() Snacks.picker.recent({ filter = { cwd = true } }) end,       desc = "Recent (cwd)" },
		{ "<leader>sp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
		-- git
		{ "<leader>gc",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
		{ "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (hunks)" },
		{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
		-- Grep
		{ "<leader>Sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
		{ "<leader>SB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
		{ "<leader>Sg",      LazyVim.pick("live_grep"),                                              desc = "Grep (Root Dir)" },
		{ "<leader>SG",      LazyVim.pick("live_grep", { root = false }),                            desc = "Grep (cwd)" },
		{ "<leader>Sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
		{ "<leader>Sw",      LazyVim.pick("grep_word"),                                              desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
		{ "<leader>SW",      LazyVim.pick("grep_word", { root = false }),                            desc = "Visual selection or word (cwd)",      mode = { "n", "x" } },
		-- search
		{ '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
		{ "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
		{ "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
		{ "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
		{ "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
		{ "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
		{ "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
		{ "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
		{ "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
		{ "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
		{ "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
		{ "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
		{ "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
		{ "<leader>sr",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
		{ "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
		{ "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undotree" },
		-- ui
		--
		{ "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
	},
	config = function(_, opts)
		opts.keys = {
			{ "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
			{ "<leader>/",       LazyVim.pick("live_grep"),                                              desc = "Grep (Root Dir)" },
			{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader><space>", LazyVim.pick("files"),                                                  desc = "Find Files (Root Dir)" },
			{ "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
			-- find
			{ "<leader>sb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
			{ "<leader>sB",      function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
			-- { "<leader>sc",      LazyVim.pick.config_files(),                                            desc = "Find Config File" },
			{ "<leader>f",       LazyVim.pick("files"),                                                  desc = "Find Files (Root Dir)" },
			{ "<leader>F",       LazyVim.pick("files", { root = false }),                                desc = "Find Files (cwd)" },
			{ "<leader>sg",      function() Snacks.picker.git_files() end,                               desc = "Find Files (git-files)" },
			{ "<leader>so",      LazyVim.pick("oldfiles"),                                               desc = "Recent" },
			{ "<leader>sR",      function() Snacks.picker.recent({ filter = { cwd = true } }) end,       desc = "Recent (cwd)" },
			{ "<leader>sp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
			-- git
			{ "<leader>gc",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
			{ "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (hunks)" },
			{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
			-- Grep
			{ "<leader>Sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
			{ "<leader>SB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
			{ "<leader>Sg",      LazyVim.pick("live_grep"),                                              desc = "Grep (Root Dir)" },
			{ "<leader>SG",      LazyVim.pick("live_grep", { root = false }),                            desc = "Grep (cwd)" },
			{ "<leader>Sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
			{ "<leader>Sw",      LazyVim.pick("grep_word"),                                              desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
			{ "<leader>SW",      LazyVim.pick("grep_word", { root = false }),                            desc = "Visual selection or word (cwd)",      mode = { "n", "x" } },
			-- search
			{ '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
			{ "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
			{ "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
			{ "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
			{ "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
			{ "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
			{ "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
			{ "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
			{ "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
			{ "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
			{ "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
			{ "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
			{ "<leader>sr",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
			{ "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
			{ "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undotree" },
			-- ui
			--
			{ "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
		}
	end
}
