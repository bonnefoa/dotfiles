vim.o.shiftwidth = 4

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set({"n", "v"}, "<leader>ca", function() vim.cmd.RustLsp('codeAction') end,
  { silent = true, buffer = bufnr, desc = "Code Action" })
vim.keymap.set("n", "K", function() vim.cmd.RustLsp({'hover', 'actions'}) end,
  { silent = true, buffer = bufnr, desc = "Hover" })
vim.keymap.set("n", "]d", function() vim.cmd.RustLsp('renderDiagnostic') end,
  {desc="Cycle Diagnostic"})
vim.keymap.set("n", "]D", function() vim.cmd.RustLsp('relatedDiagnostics') end,
  {desc="Related Diagnostic"})
vim.keymap.set("n", "J", function() vim.cmd.RustLsp('joinLines') end,
  {desc="Join Lines"})
vim.keymap.set("n", "gk", function() vim.cmd.RustLsp('openDocs') end,
  {desc="Open Docs"})

vim.g.rustaceanvim = {
    tools = {
        test_executor = 'background',
    },
}
