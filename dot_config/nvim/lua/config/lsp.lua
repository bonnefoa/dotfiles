-- LSP servers enabled outside of after/ftplugin/*.lua
-- (clangd/gopls/pylsp/pyright are enabled per-filetype there).

-- ltex-ls-plus: grammar and spell checking, on demand only.
-- Self-contained on purpose: ltex's filetypes (markdown, gitcommit, ...)
-- are not in nvim-lspconfig's lazy-load trigger list, so relying on its
-- bundled ltex_plus config would only work for C buffers.
--
-- On-demand mechanics (server side, see LtexWorkspaceService/DocumentChecker
-- in ~/git-repos/ltex-ls-plus):
--   * checkFrequency = "Manual": no auto-check on open/edit/save. The server
--     only learns this from the first check (settings arrive via a
--     workspace/configuration round-trip during a check), so the very first
--     document of a session still runs one check on open.
--   * enabled = {}: full-document checks are skipped for every language,
--     which neutralizes that first-document check (it runs, finds nothing
--     to check, publishes no diagnostics).
--   * _ltex.checkDocument with a `range` argument bypasses `enabled`
--     entirely, so the mappings below work regardless.
vim.lsp.config("ltex_plus", {
	cmd = { "ltex-ls-plus" },
	filetypes = { "markdown", "gitcommit", "text", "rst", "c" },
	root_markers = { ".git" },
	single_file_support = true,
	get_language_id = function(_, ft)
		local map = { rst = "restructuredtext", text = "plaintext" }
		return map[ft] or ft
	end,
	settings = {
		ltex = {
			language = "en-US",
			checkFrequency = "Manual",
			enabled = {},
		},
	},
})
vim.lsp.enable("ltex_plus")

-- On-demand LTeX checking via the _ltex.checkDocument command.
-- A check REPLACES the buffer's diagnostics with the checked range's
-- results; <leader>lt checks the selection, <leader>lT the whole buffer.
local function ltex_check(bufnr, range)
	local client = vim.lsp.get_clients({ bufnr = bufnr, name = "ltex_plus" })[1]
	if not client then
		vim.notify("ltex_plus is not attached", vim.log.levels.WARN)
		return
	end
	local args = {
		uri = vim.uri_from_bufnr(bufnr),
		-- pass buffer contents so unsaved changes are checked, not the
		-- file on disk (the command's default)
		text = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n"),
		-- a range is required: ltex.enabled is empty, so a range-less
		-- (full-document) check would be skipped by the server
		range = range,
	}
	client:request("workspace/executeCommand",
		{ command = "_ltex.checkDocument", arguments = { args } },
		function(err)
			if err then
				vim.notify("ltex: " .. vim.inspect(err), vim.log.levels.ERROR)
			end
		end, 0)
end

local function whole_buffer_range(bufnr)
	local line_count = vim.api.nvim_buf_line_count(bufnr)
	local last_line = vim.api.nvim_buf_get_lines(bufnr, line_count - 1, line_count, false)[1] or ""
	return {
		start = { line = 0, character = 0 },
		["end"] = { line = line_count - 1, character = #last_line },
	}
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("ltex_plus", {}),
	callback = function(args)
		if vim.lsp.get_client_by_id(args.data.client_id).name ~= "ltex_plus" then
			return
		end
		local bufnr = args.buf
		-- visual: check only the selection
		vim.keymap.set("v", "<leader>lt", function()
			local p1, p2 = vim.fn.getpos("'<"), vim.fn.getpos("'>")
			local range = {
				start = { line = p1[2] - 1, character = p1[3] },
				["end"] = { line = p2[2] - 1, character = p2[3] + 1 }, -- LSP end exclusive
			}
			if vim.fn.visualmode() == "V" then
				range["end"] = { line = p2[2], character = 0 } -- whole last line
			end
			ltex_check(bufnr, range)
		end, { buffer = bufnr, desc = "LTeX: check selection" })
		-- normal: check the whole buffer
		vim.keymap.set("n", "<leader>lT", function()
			ltex_check(bufnr, whole_buffer_range(bufnr))
		end, { buffer = bufnr, desc = "LTeX: check whole buffer" })
	end,
})
