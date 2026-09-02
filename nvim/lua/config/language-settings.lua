return {
	treesitter_parsers = {
		"lua",
		"bash",
	},
	ensure_installed = {
        "lua-language-server",
		"stylua",
		"bash-language-server",
		"shfmt",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		bash = { "shfmt" },
	},
}
