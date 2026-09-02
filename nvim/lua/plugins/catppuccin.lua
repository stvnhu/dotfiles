return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 950,
	init = function()
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}
