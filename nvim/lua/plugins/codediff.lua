return {
	"esmuellert/codediff.nvim",
	init = function()
		vim.keymap.set("n", "<leader>d", "<cmd>CodeDiff<cr>", { desc = "Open Git Diff" })
	end,
	opts = {},
}
