return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
	},
	priority = 1000,
	init = function()
		vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
	end,
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
}
