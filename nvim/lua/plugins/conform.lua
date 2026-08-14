vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

local success, conform = pcall(require, "conform")
if not success then
	return
end
conform.setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		-- bash
		sh = { "shfmt" },
		bash = { "shfmt" },
		-- c / c++
		c = { "clang-format" },
		cpp = { "clang-format" },
		-- lua
		lua = { "stylua" },
		-- nix
		nix = { "nixfmt" },
		-- python
		python = { "ruff_format" },
	},
})
