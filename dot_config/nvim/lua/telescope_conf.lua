local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

function Grep_from_search()
	local q = vim.fn.getreg("/")
	local sanitized = q:gsub("\\<(.*)\\>", "%1")
	require("telescope.builtin").grep_string({ search = sanitized, word_match = "-w" })
end

--Add leader shortcuts
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>sf", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>sg", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>sG", [[<cmd>lua Grep_from_search()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>sB", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })

require("telescope").load_extension("fzf")
