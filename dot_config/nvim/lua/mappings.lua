local default_opts = {noremap = true, silent = false}

local function set_keymap(keybind, cmd, mode, opts)
    mode = mode or "n"
    opts = opts or default_opts
    vim.api.nvim_set_keymap(mode, keybind, cmd, opts)
end

local function set_lua_cmd_keymap(keybind, cmd, mode, opts)
    set_keymap(keybind, ("<cmd>lua %s<CR>"):format(cmd), mode, opts)
end

set_lua_cmd_keymap("<leader>ff", "require('telescope.builtin').find_files()")
set_lua_cmd_keymap("<leader>fg", "require('telescope.builtin').live_grep()")
set_lua_cmd_keymap("<leader>fG", "Grep_from_search()")
set_lua_cmd_keymap("<leader>ft", "require('telescope.builtin').tags()")
set_lua_cmd_keymap("<leader>fb", "require('telescope.builtin').buffers()")
set_lua_cmd_keymap("<leader>fB", "require('telescope.builtin').oldfiles()")

set_keymap("<C-h>", "<C-w>h", "")
set_keymap("<C-j>", "<C-w>j", "")
set_keymap("<C-k>", "<C-w>k", "")
set_keymap("<C-l>", "<C-w>l", "")
set_keymap("<leader>/", ":nohlsearch<CR>", "")
