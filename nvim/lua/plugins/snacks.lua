return {
	"folke/snacks.nvim",
	init = function()
		vim.keymap.set("n", "<leader>r", function()
			Snacks.picker.files()
		end, { desc = "Open snacks files picker" })
		vim.keymap.set("n", "<leader>e", function()
			Snacks.picker.explorer({ auto_close = true })
		end, { desc = "Open snacks explorer" })
		vim.keymap.set({ "n", "t" }, "<C-\\>", function()
			Snacks.terminal()
		end, { desc = "Toggle snacks terminal" })
	end,
	opts = {
		indent = {
			animate = {
				enabled = false,
			},
		},
		picker = {},
		scroll = {},
		terminal = {
			win = {
				position = "right",
			},
		},
	},
}
