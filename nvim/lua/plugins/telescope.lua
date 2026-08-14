vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})

local success, telescope = pcall(require, "telescope")
if not success then
	return
end

for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
	if path:match("telescope%-fzf%-native%.nvim") then
		local fzf_path = path
		local lib = fzf_path .. "/build/libfzf.so"

		if vim.fn.filereadable(lib) == 0 then
			vim.notify("Building telescope-fzf-native...", vim.log.levels.INFO)
			vim.fn.jobstart("cd " .. fzf_path .. " && make", {
				on_exit = function(_, code)
					if code == 0 then
						vim.notify("telescope-fzf-native built successfully!", vim.log.levels.INFO)
					else
						vim.notify("telescope-fzf-native build FAILED", vim.log.levels.ERROR)
					end
				end,
			})
		end

		if vim.fn.filereadable(lib) == 1 then
			telescope.load_extension("fzf")
		end

		break
	end
end

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope help tags" })
