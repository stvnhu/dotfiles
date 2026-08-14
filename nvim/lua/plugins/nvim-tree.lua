vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

local success, nvim_tree = pcall(require, "nvim-tree")
if not success then
	return
end
nvim_tree.setup({
	view = {
		float = {
			enable = true,
			open_win_config = function()
				local HEIGHT_RATIO = 0.8
				local WIDTH_RATIO = 0.5
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					relative = "editor",
					border = "rounded",
					width = window_w_int,
					height = window_h_int,
					row = center_y,
					col = center_x,
				}
			end,
		},
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
		},
	},
	filters = {
		git_ignored = false,
	},
})
vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
