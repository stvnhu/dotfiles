vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-lint" },
})

local success, lint = pcall(require, "lint")
if not success then
	return
end
lint.linters_by_ft = {
	-- bash
	sh = { "shellcheck" },
	bash = { "shellcheck" },
	-- c / c++
	c = { "clangtidy" },
	cpp = { "clangtidy" },
	-- javascript
	js = { "eslintd" },
	-- json
	json = { "jsonlint" },
	-- lua
	lua = { "selene" },
	-- nix
	nix = { "statix" },
	-- python
	python = { "ruff" },
}

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
	group = augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = augroup,
	callback = function()
		vim.fn.system("eslint_d stop")
	end,
})
