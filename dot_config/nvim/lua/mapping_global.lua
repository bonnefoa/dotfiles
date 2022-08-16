local map = require("mapping_util").map
local set_keymap = require("mapping_util").set_keymap

map("<leader>ff", "require('telescope.builtin').find_files()")
map("<leader>fg", "require('telescope.builtin').live_grep()")
map("<leader>fG", "Grep_from_search()")
map("<leader>ft", "require('telescope.builtin').tags()")
map("<leader>fb", "require('telescope.builtin').buffers()")
map("<leader>fB", "require('telescope.builtin').oldfiles()")

set_keymap("<C-h>", "<C-w>h", "")
set_keymap("<C-j>", "<C-w>j", "")
set_keymap("<C-k>", "<C-w>k", "")
set_keymap("<C-l>", "<C-w>l", "")
set_keymap("<leader>/", ":nohlsearch<CR>", "")

set_keymap("<leader>tt", "<cmd>TroubleToggle<cr>", "")
