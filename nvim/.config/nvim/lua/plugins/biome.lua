return {
	-- Disable other formatters / linters
	{
		"stevearc/conform.nvim",
		enabled = false,
	},

	-- Ensure biome is installed
	{
		"mason.nvim",
		opts = {
			ensure_installed = {
				"biome",
			},
		},
	},

	-- Configure Biome LSP
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				biome = {
					-- filetypes Biome should handle
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"json",
						"jsonc",
					},
				},
			},
		},
	},
}
