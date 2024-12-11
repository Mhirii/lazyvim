return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	enabled = true,
	version = false,
	build = "make",
	-- commit = "07af0a9",
	-- pin = true,
	dependencies = {
		"echasnovski/mini.icons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"zbirenbaum/copilot.lua",
			opts = {
				suggestion = {
					enabled = false,
				}
			}
		},
		--- The below is optional, make sure to setup it properly if you have lazy=true
		{
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { "Avante" },
			},
			ft = { "Avante" },
		},
	},
	opts = {
		provider = "copilot",
		copilot = {
			model = "claude-3.5-sonnet"
		},
		mappings = {
			ask = "<leader>ai",
			edit = "<leader>ae",
			refresh = "<leader>ar",
			--- @class AvanteConflictMappings
			diff = {
				ours = "co",
				theirs = "ct",
				both = "cb",
				next = "]x",
				prev = "[x",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-CR>",
			},
			toggle = {
				debug = "<leader>ad",
				hint = "<leader>ah",
			},
		}
	},
}
