-- Make line numbers default
vim.o.relativenumber = true

-- Enable break indent
vim.o.breakindent = true

--Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
-- Always draw sign column
vim.wo.signcolumn = 'yes'

-- Don't redraw during macro apply
vim.o.lazyredraw = true
--Match longest first in autocompletion

vim.o.wildmode = 'longest,list,full'
--Automatically write file when switching buffer
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.confirm = true
vim.o.visualbell = true
--Indent options
vim.o.cinoptions = 'N-sg0'
vim.o.smartindent = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.pastetoggle = '<F10>'
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.cmd [[colorscheme NeoSolarized]]

--Remap , as leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.g.strip_whitespace_on_save = true
vim.g.strip_whitespace_confirm = false
