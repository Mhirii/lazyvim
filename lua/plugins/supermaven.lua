return {
	"supermaven-inc/supermaven-nvim",
	dependencies = {
		{ import = "lazyvim.plugins.extras.ai.supermaven" },
	},
	config = function()
		require("supermaven-nvim").setup({
			-- ignore_filetypes = { cpp = true }, -- or { "cpp", }
			color = {
				suggestion_color = "#ffffff",
				cterm = 244,
			},
			log_level = "info", -- set to "off" to disable logging completely
			-- disable_inline_completion = false, -- disables inline completion for use with cmp
		})
	end,
}
