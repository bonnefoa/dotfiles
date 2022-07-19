-- LSP settings
local lsp_status = require("lsp-status")
lsp_status.register_progress()
lsp_status.config({
    indicator_info = 'i',
    status_symbol = '',
})

local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)
	--lsp_status.on_attach(client)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local opts = { noremap = true, silent = true }
	vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

	buf_set_keymap("n", "gd", "<cmd>Lspsaga lsp_finder<cr>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

	buf_set_keymap("n", "gx", "<cmd>Lspsaga code_action<cr>", opts)
	buf_set_keymap("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)
	buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	buf_set_keymap("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	buf_set_keymap("n", "]D", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	buf_set_keymap("n", "[D", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	buf_set_keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})
	buf_set_keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
end

local capabilities = lsp_status.capabilities
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

--local servers = { "clangd", "rust_analyzer", "pyright", "gopls" }
local servers = { "gopls", "pyright", "tsserver", "clangd" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

nvim_lsp.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "sh", "zsh" },
})

--nvim_lsp.pylsp.setup({
    --on_attach = on_attach,
    --settings = {
        --pylsp = {
            --plugins = {
                --pylint = { enabled = true, executable = "pylint" },
                --pyflakes = { enabled = false },
                --pycodestyle = { enabled = false },
                --jedi_completion = { fuzzy = true },
                --pyls_isort = { enabled = false },
                --pylsp_mypy = { enabled = true },
            --},
        --},
    --},
    --flags = {
        --debounce_text_changes = 200,
    --},
    --capabilities = capabilities,
--})

-- Lua setup
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Lsp saga setup
local saga = require("lspsaga")
saga.init_lsp_saga()
