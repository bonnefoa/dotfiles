return {
	"overcache/NeoSolarized",
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	"tpope/vim-eunuch",
	"tpope/vim-commentary",
	"ludovicchabant/vim-gutentags",

	-- search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},

	{
		"sindrets/diffview.nvim",
		opts = {
			enhanced_diff_hl = false,
			view = {
				default = { layout = "diff2_horizontal" },
				merge_tool = { layout = "diff3_mixed" },
				file_history = { layout = "diff2_horizontal" },
			},
			default_args = {
				DiffviewOpen = { "-uno" },
				DiffviewFileHistory = {},
			},
		},
	},

	"ntpeters/vim-better-whitespace",
	"godlygeek/tabular",

	"nvim-lua/popup.nvim",

	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		event = { "BufWritePre" },
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cF",
				function()
					require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		opts = function()
			return {
				notify_no_formatters = true,
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				default_format_opts = {
					timeout_ms = 3000,
					async = false,
					quiet = false,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					python = { "black" },
					sh = { "shfmt" },
				},
				formatters = {
					injected = { options = { ignore_errors = true } },
				},
			}
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = "codedark",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "diagnostics", sources = { "nvim_diagnostic" } } },
				lualine_c = { { "filename", path = 1 }, "b:vista_nearest_method_or_function" },

				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },

				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		},
	},

	"prabirshrestha/async.vim",

	"AndrewRadev/splitjoin.vim",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	"farmergreg/vim-lastplace",
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({ })
    end
  },

	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			-- lsp_keymaps = false,
			-- other options
		},
		config = function(lp, opts)
			require("go").setup(opts)
			local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimports()
				end,
				group = format_sync_grp,
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
}
