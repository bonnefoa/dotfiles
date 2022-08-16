local M = {}

local default_opts = {noremap = true, silent = false}

function M.set_keymap(keybind, cmd, mode, opts)
    mode = mode or "n"
    opts = opts or default_opts
    vim.api.nvim_set_keymap(mode, keybind, cmd, opts)
end

function M.map(keybind, cmd, mode, opts)
    M.set_keymap(keybind, ("<cmd>lua %s<CR>"):format(cmd), mode, opts)
end
return M
