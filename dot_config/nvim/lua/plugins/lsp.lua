return {
	"VonHeikemen/lsp-zero.nvim",
	"prabirshrestha/vim-lsp",

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
		},
		ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "rust", "go" },
		keys = {
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{ "[d", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
			{ "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{ "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
			{ "gr", vim.lsp.buf.references, desc = "References", nowait = true },
			{ "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
			{ "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{ "gn", vim.lsp.buf.incoming_calls, desc = "Incoming Calls" },
			{ "gN", vim.lsp.buf.outgoing_calls, desc = "Outgoing Calls" },
			{ "K", vim.lsp.buf.hover, desc = "Hover" },
			{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
			{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
			{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
		},
		config = function() end,
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
					-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					-- prefix = "icons",
				},
				severity_sort = true,
			},
      inlay_hints = { enabled = false },
			capabilities = {
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
			},
			servers = {
				clangd = {
					keys = {
						{ "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
					},
					root_dir = function(fname)
						return require("lspconfig.util").root_pattern(
							"Makefile",
							"configure.ac",
							"configure.in",
							"config.h.in",
							"meson.build",
							"meson_options.txt",
							"build.ninja"
						)(fname) or require("lspconfig.util").root_pattern(
							"compile_commands.json",
							"compile_flags.txt"
						)(fname) or require("lspconfig.util").find_git_ancestor(fname)
					end,
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=llvm",
					},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						clangdFileStatus = true,
					},
				},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
			},
		},
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig",
		},
		ensure_installed = {
			"bashls",
			"clangd",
			"docker_compose_language_service",
			"dockerls",
			"gopls",
			"html",
			"jsonls",
			"ts_ls",
			"lua_ls",
			"pyright",
			"pylsp",
			"sqlls",
			"tflint",
			"yamlls",
		},
	},
}
