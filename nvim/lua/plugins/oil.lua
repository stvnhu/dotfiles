vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

local success, oil = pcall(require, "oil")
if not success then
	return
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1
oil.setup({ view_options = { show_hidden = true } })
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open oil" })
