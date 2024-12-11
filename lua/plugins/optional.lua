local hostname = vim.uv.os_gethostname()

local common = {
	-- { import = "lazyvim.plugins.extras.coding.copilot" },
	{ import = "lazyvim.plugins.extras.editor.harpoon2" },
	{ import = "lazyvim.plugins.extras.lang.docker" },
	{ import = "lazyvim.plugins.extras.lang.git" },
	{ import = "lazyvim.plugins.extras.lang.yaml" },
	{ import = "lazyvim.plugins.extras.util.octo" },
}

if hostname == 'gitpod' then
	return common
end


-- local machine
return vim.list_extend(common,
	{
		{ import = "lazyvim.plugins.extras.editor.overseer" },
		{ import = "lazyvim.plugins.extras.lang.cmake" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.sql" },
		{ import = "lazyvim.plugins.extras.lsp.neoconf" },
		{ import = "lazyvim.plugins.extras.util.dot" },
	}
)
