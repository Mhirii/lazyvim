return {
	{ import = "lazyvim.plugins.extras.lang.go" },
	{
		"mfussenegger/nvim-lint",
		event = "LazyFile",
		opts = function(_, opts)
			opts.linters_by_ft.go = { "golangcilint" }
		end
	}
}
