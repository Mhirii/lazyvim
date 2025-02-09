local mini = false
local header =
		"                                                                   \n" ..
		"      ████ ██████           █████      ██                    \n" ..
		"     ███████████             █████                            \n" ..
		"     █████████ ███████████████████ ███   ███████████  \n" ..
		"    █████████  ███    █████████████ █████ ██████████████  \n" ..
		"   █████████ ██████████ █████████ █████ █████ ████ █████  \n" ..
		" ███████████ ███    ███ █████████ █████ █████ ████ █████ \n" ..
		"██████  █████████████████████ ████ █████ █████ ████ ██████\n"

if mini then
	return {
		"echasnovski/mini.starter",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "VimEnter",
		opts = function()
			local pad = string.rep(" ", 22)
			local new_section = function(name, action, section)
				return { name = name, action = action, section = pad .. section }
			end

			local starter = require("mini.starter")
			--stylua: ignore
			local config = {
				evaluate_single = true,
				header = [[
	
	
	
	
	                                              
	      ████ ██████           █████      ██
	     ███████████             █████ 
	     █████████ ███████████████████ ███   ███████████
	    █████████  ███    █████████████ █████ ██████████████
	   █████████ ██████████ █████████ █████ █████ ████ █████
	 ███████████ ███    ███ █████████ █████ █████ ████ █████
	██████  █████████████████████ ████ █████ █████ ████ ██████
	
	
]],
				items = {
					new_section("Find file", "Telescope find_files", "Telescope"),
					new_section("Old files", "Telescope oldfiles", "Telescope"),
					new_section("Config", "lua require('lazyvim.util').telescope.config_files()()", "Telescope"),
					new_section("Session restore", "lua require('persistence').load()", "Session"),
					new_section("workspaces", "WorkspacesOpen", "Session"),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(pad .. "░ ", false),
					starter.gen_hook.aligning("center", "center"),
				},
			}
			return config
		end,
		config = function(_, config)
			-- close Lazy and re-open when starter is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "MiniStarterOpened",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			local starter = require("mini.starter")
			starter.setup(config)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					local pad_footer = string.rep(" ", 8)
					starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(starter.refresh)
				end,
			})
		end,
	}
end


return {
	{
		"snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					pick = function(cmd, opts)
						return LazyVim.pick(cmd, opts)()
					end,
					header = header
					,
					-- stylua: ignore
					---@type snacks.dashboard.Item[]
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
						{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
						{ icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
						{ icon = " ", key = "w", desc = "Workspaces", action = ":WorkspacesOpen" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = function(_, opts)
			if not opts.picker then
				return
			end
			table.insert(opts.dashboard.preset.keys, 3, {
				icon = " ",
				key = "p",
				desc = "Projects",
				action = ":lua Snacks.picker.projects()",
			})
		end,
	},
}
