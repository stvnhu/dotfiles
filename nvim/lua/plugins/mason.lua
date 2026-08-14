vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

local success1, mason = pcall(require, "mason")
if not success1 then
	return
end
mason.setup()

local success2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not success2 then
	return
end
mason_lspconfig.setup()

local success3, mason_installer = pcall(require, "mason-tool-installer")
if not success3 then
	return
end
mason_installer.setup({
	ensure_installed = {
		-- bash
		"bash-language-server",
		"shellcheck",
		"shfmt",
		-- c / c++
		"clangd",
		"clang-format",
		-- lua
		"lua-language-server",
		"selene",
		"stylua",
		-- nix
		"nil",
		"statix",
		"nixfmt",
		-- python
		"basedpyright",
		"ruff",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			diagnostics = { globals = { "vim" } },
		},
	},
})
