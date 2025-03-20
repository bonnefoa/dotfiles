local map = require("mapping_util").map
local set_keymap = require("mapping_util").set_keymap

map("<leader>ff", "require('telescope.builtin').find_files()")
map("<leader>fg", "require('telescope.builtin').live_grep()")
map("<leader>fG", "Grep_from_search()")
map("<leader>ft", "require('telescope.builtin').tags()")
map("<leader>fr", "require('telescope.builtin').registers()")
map("<leader>fb", "require('telescope.builtin').buffers()")
map("<leader>fd", "require('telescope.builtin').diagnostics()")
map("<leader>fq", "require('telescope.builtin').quickfix()")
map("<leader>fB", "require('telescope.builtin').oldfiles()")
map("<leader>f/", "require('telescope.builtin').search_history()")

set_keymap("<C-h>", "<C-w>h", "")
set_keymap("<C-j>", "<C-w>j", "")
set_keymap("<C-k>", "<C-w>k", "")
set_keymap("<C-l>", "<C-w>l", "")
set_keymap("<leader>/", ":nohlsearch<CR>", "")
