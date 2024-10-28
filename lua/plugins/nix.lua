return {
	{ import = "lazyvim.plugins.extras.lang.nix" },
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = {
				nix = { "alejandra", "nixfmt, nixpkgs-fmt" },
			}
		end,
	},
}
