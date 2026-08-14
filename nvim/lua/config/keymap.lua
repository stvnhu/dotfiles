vim.g.mapleader = " "

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = ":quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = ":write" })
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open diagnostics to location list" })
