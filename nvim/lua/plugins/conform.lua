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
		-- html, css, javascript
		html = { "prettierd" },
		css = { "prettierd" },
		js = { "prettierd" },
		-- json
		json = { "prettierd" },
		-- lua
		lua = { "stylua" },
		-- nix
		nix = { "nixfmt" },
		-- python
		python = { "ruff_format" },
		-- toml
		toml = { "taplo" },
	},
})

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = augroup,
	callback = function()
		vim.fn.system("prettierd stop")
	end,
})
