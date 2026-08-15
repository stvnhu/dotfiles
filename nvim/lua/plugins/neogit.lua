vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/esmuellert/codediff.nvim" },
	{ src = "https://github.com/NeogitOrg/neogit" },
})

local success, _ = pcall(require, "neogit")
if not success then
	return
end
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
