return {
	{
		"supermaven-inc/supermaven-nvim",
		event = "VeryLazy",
		config = function()
			require("supermaven-nvim").setup({
				-- ignore_filetypes = { cpp = true }, -- or { "cpp", }
				color = {
					suggestion_color = "#ffffff",
					cterm = 244,
				},
				log_level = "info",            -- set to "off" to disable logging completely
				disable_inline_completion = false, -- disables inline completion for use with cmp
				disable_keymaps = false,       -- disables built in keymaps for more manual control
				condition = function()
					return false
				end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
			})
		end,
	},
	{
		"nvim-cmp",
		dependencies = {
			{
				"supermaven-inc/supermaven-nvim",
				config = function(_, opts)
				end,
			},
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = "supermaven",
				group_index = 1,
				priority = 100,
			})
		end,
	}
}
