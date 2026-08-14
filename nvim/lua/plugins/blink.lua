vim.pack.add({
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
})

local success1, blink = pcall(require, "blink.cmp")
if not success1 then
	return
end
blink.build():pwait()
blink.setup()
