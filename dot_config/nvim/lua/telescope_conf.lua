local actions = require("telescope.actions")

require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
    },
	defaults = {
        initial_mode = "insert",
		mappings = {
			n = {
				["q"] = actions.close,
            },
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

require("telescope").load_extension("fzf")
