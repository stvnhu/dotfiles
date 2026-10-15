return {
	treesitter_parsers = {
		"lua",
		"bash",
		"javascript",
		"nix",
	},
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"bash-language-server",
		"shfmt",
		"vtsls",
		"eslint-lsp",
		"prettier",
		"nil",
		"nixfmt",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		js = { "prettier" },
		nix = { "nixfmt" },
	},
}
