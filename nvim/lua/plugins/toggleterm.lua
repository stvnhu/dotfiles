vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

local success, toggleterm = pcall(require, "toggleterm")
if not success then
	return
end
toggleterm.setup({
	open_mapping = [[<c-\>]],
})
