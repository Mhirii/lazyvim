return {
	{
		"echasnovski/mini.surround",
		dependencies = {
			{ import = "lazyvim.plugins.extras.coding.mini-surround" },
		},
		opts = {
			mappings = {
				add = "sa",
				delete = "sd",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",
			},
		},
	},

	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>x",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
		},
	},

	{
		"echasnovski/mini.files",
		dependencies = {
			{ import = "lazyvim.plugins.extras.editor.mini-files" },
		},
		keys = {
			{ "<leader>fm", false },
			{ "<leader>fM", false },
			{
				"<A-O>",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (Directory of Current File)",
			},
			{
				"<A-o>",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
		},
	}
}
