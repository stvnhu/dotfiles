return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "mason-org/mason.nvim", opts = {} },
		{ "mason-org/mason-lspconfig.nvim", opts = {} },
	},
	opts = {
		ensure_installed = require("config.language-settings").ensure_installed,
	},
}
