return {
	"nvim-treesitter/nvim-treesitter",
	init = function()
		local treesitter = require("nvim-treesitter")
		local language_settings = require("config.language-settings")
		treesitter.install(language_settings.treesitter_parsers)
	end,
	build = ":TSUpdate",
}
