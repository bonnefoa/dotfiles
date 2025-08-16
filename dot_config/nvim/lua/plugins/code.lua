return {
	"fatih/vim-go",
	"neomake/neomake",
	{
		"mrcjkb/rustaceanvim",
    lazy = false,
		config = function()
    end,
		opts = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>cR", function()
						vim.cmd.RustLsp("codeAction")
					end, { desc = "Code Action", buffer = bufnr })
          vim.lsp.inlay_hint.enable(false)
				end,
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						checkOnSave = diagnostics == "rust-analyzer",
						diagnostics = {
							enable = diagnostics == "rust-analyzer",
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
						files = {
							excludeDirs = {
								".direnv",
								".git",
								".github",
								".gitlab",
								"bin",
								"node_modules",
								"target",
								"venv",
								".venv",
							},
						},
					},
				},
			},
		},
	},
}
