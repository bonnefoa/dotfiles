-- LSP settings
local lsp_status = require("lsp-status")
lsp_status.register_progress()
lsp_status.config({
    indicator_info = 'i',
    status_symbol = '',
})

vim.keymap.set('n', '<space>do', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)


	vim.keymap.set("n", "gi", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gn", vim.lsp.buf.incoming_calls, opts)
	vim.keymap.set("n", "gN", vim.lsp.buf.outgoing_calls, opts)

    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local capabilities = lsp_status.capabilities
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lspconfig = require("lspconfig")


--local servers = { "clangd", "rust_analyzer", "pyright", "gopls" }
local servers = { "gopls", "tsserver" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities,
    })
end

lspconfig.ccls.setup({
  init_options = {
    compilationDatabaseDirectory = "build";
    cache = {
        directory = vim.fs.normalize "~/.cache/ccls",
    },
    clang = {
      extraArgs = { "-Wshadow-all" } ;
    };
  },
  capabilities = capabilities
})

lspconfig.bashls.setup({
    capabilities = capabilities,
    filetypes = { "sh", "zsh" },
})

-- lspconfig.clangd.setup{
--     capabilities = capabilities,
--     cmd = {
--         "clangd",
--         "--background-index",
--         "--pch-storage=memory",
--         "--clang-tidy",
--         "--suggest-missing-includes",
--         "--all-scopes-completion",
--         "--pretty",
--         "--header-insertion=never"
--     },
-- }

require'lspconfig'.pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pylint = { enabled = true, executable = "pylint" },
                --pyflakes = { enabled = false },
                --pycodestyle = { enabled = false },
                --jedi_completion = { fuzzy = true },
                pyls_isort = { enabled = true },
                pylsp_mypy = { enabled = true },
                pycodestyle = {
                    maxLineLength = 120
                },
            },
        },
    },
    flags = {
        debounce_text_changes = 200,
    },
    capabilities = capabilities,
})

-- Lua setup
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.lua_ls.setup({
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

-- vim.lsp.set_log_level("trace")
