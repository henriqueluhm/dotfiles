return {
	{ "rebelot/kanagawa.nvim" },
	{ "dzfrias/noir.nvim" },
	{ "pgdouyon/vim-yin-yang" },
	{ "morhetz/gruvbox" },
	{ "e-ink-colorscheme/e-ink.nvim" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "yin",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"pgdouyon/vim-yin-yang",
		config = function()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*", -- or "*" for all themes
				callback = function()
					local hl = vim.api.nvim_set_hl

					-- Transparent main UI areas
					hl(0, "Normal", { bg = "none" })
					hl(0, "NormalNC", { bg = "none" })
					hl(0, "NormalFloat", { bg = "none" })
					hl(0, "FloatBorder", { bg = "none" })
					hl(0, "Pmenu", { bg = "none" })
					hl(0, "StatusLine", { bg = "none" })
					hl(0, "VertSplit", { bg = "none" })

					-- Transparent line numbers & gutter
					hl(0, "SignColumn", { bg = "none" })
					hl(0, "LineNr", { bg = "none" })
					hl(0, "CursorLineNr", { bg = "none" })
					hl(0, "FoldColumn", { bg = "none" })
					hl(0, "WinSeparator", { bg = "none" })
				end,
			})
		end,
	},
}
