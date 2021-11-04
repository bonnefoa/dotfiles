vim.api.nvim_set_keymap("", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>/", ":nohlsearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>R",
	[[<cmd>lua require('plenary.reload').reload_module('init', true)<CR>]],
	{ noremap = true, silent = true }
)
