function grep_from_search()
	local opts = { quote = true }
	local helpers = require("telescope-live-grep-args.helpers")
	local value = vim.fn.getreg("/")
	value = vim.trim(value)
	value = helpers.quote(value, opts)
	value = value .. " "
	opts["default_text"] = value

	require("telescope").extensions.live_grep_args.live_grep_args(opts)
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = (build_cmd ~= "cmake") and "make"
					or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				enabled = build_cmd ~= nil,
				config = function(plugin)
					LazyVim.on_load("telescope.nvim", function()
						local ok, err = pcall(require("telescope").load_extension, "fzf")
						if not ok then
							local lib = plugin.dir .. "/build/libfzf." .. (LazyVim.is_win() and "dll" or "so")
							if not vim.uv.fs_stat(lib) then
								LazyVim.warn("`telescope-fzf-native.nvim` not built. Rebuilding...")
								require("lazy").build({ plugins = { plugin }, show = false }):wait(function()
									LazyVim.info("Rebuilding `telescope-fzf-native.nvim` done.\nPlease restart Neovim.")
								end)
							else
								LazyVim.error("Failed to load `telescope-fzf-native.nvim`:\n" .. err)
							end
						end
					end)
				end,
			},
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		keys = {
			{ "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<leader>ft", "<Cmd>Telescope tags<CR>", desc = "Tags" },
			{ "<leader>fr", "<Cmd>Telescope registers<CR>", desc = "Registers" },
			{ "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "<leader>fq", "<Cmd>Telescope quickfix<CR>", desc = "Quickfix" },
			{ "<leader>fB", "<Cmd>Telescope oldfiles<CR>", desc = "Oldfiles" },
			{ "<leader>f/", "<Cmd>Telescope search_history<CR>", desc = "Search history" },
			{ "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>fG", ":lua grep_from_search()<CR>", desc = "Grep From Search" },
		},
		config = function()
			local telescope = require("telescope")

			local actions = require("telescope.actions")
			local lga_actions = require("telescope-live-grep-args.actions")

			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					live_grep_args = {
						auto_quoting = true,
						mappings = {
							i = {
								["<C-i>"] = lga_actions.quote_prompt(),
								["<C-space>"] = lga_actions.to_fuzzy_refine,
							},
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "l", "--type", "f", "-H", "--strip-cwd-prefix" },
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
				mappings = {},
			})

			telescope.load_extension("live_grep_args")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
