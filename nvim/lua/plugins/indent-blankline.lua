vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

local success, ibl = pcall(require, "ibl")
if not success then
	return
end
ibl.setup()
