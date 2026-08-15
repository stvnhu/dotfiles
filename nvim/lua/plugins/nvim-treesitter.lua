vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

local success, treesitter = pcall(require, "nvim-treesitter")
if not success then
	return
end
treesitter.install({
	"bash",
	"cpp",
	"javascript",
	"json",
	"nix",
	"python",
	"toml",
})
