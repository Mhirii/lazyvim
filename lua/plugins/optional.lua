local common = {
	{ import = "lazyvim.plugins.extras.editor.harpoon2" },
	{ import = "lazyvim.plugins.extras.lang.docker" },
	{ import = "lazyvim.plugins.extras.lang.git" },
	{ import = "lazyvim.plugins.extras.lang.yaml" },
	{ import = "lazyvim.plugins.extras.lsp.neoconf" },
	{ import = "lazyvim.plugins.extras.util.octo" },
}

if not require("user.utils").is_personal() then
	return common
end


return vim.list_extend(common,
	{
		{ import = "lazyvim.plugins.extras.editor.overseer" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.sql" },
		{ import = "lazyvim.plugins.extras.lsp.neoconf" },
		{ import = "lazyvim.plugins.extras.util.dot" },
	}
)
