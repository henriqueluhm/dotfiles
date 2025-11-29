return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "zettelkasten",
				path = "~/Documents/zettelkasten",
			},
		},
		templates = {
			folder = "templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
	},
}
