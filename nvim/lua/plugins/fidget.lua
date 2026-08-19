vim.pack.add({
	{ src = "https://github.com/j-hui/fidget.nvim" },
})

local success, fidget = pcall(require, "fidget")
if not success then
	return
end
fidget.setup()
