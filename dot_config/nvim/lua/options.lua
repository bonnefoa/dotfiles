-- Make line numbers default
vim.o.relativenumber = true

-- Disable mouse
vim.o.mouse = ""

--Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
-- Always draw sign column
vim.wo.signcolumn = "no"

-- Don't redraw during macro apply
vim.o.lazyredraw = true
--Match longest first in autocompletion

vim.o.wildmode = "longest,list,full"
vim.o.wildignore = "*.o,*.obj,.git,dist,deps,logs,*.pyc,**/target/**,*.d,docs,*.o,autom4te.cache,build-aux,doxydoc,*.la,*.sign,*.pub,*.trs,*.Po,*.pyo,**/eggs/**,**/parts/**,*.log,*.vdproj,*.src,*.sln,*.ri,*_check"
--Automatically write file when switching buffer
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.confirm = true
vim.o.visualbell = true
--Indent options
vim.o.cinoptions = "N-sg0"
vim.o.smartindent = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.pastetoggle = "<F10>"
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.o.completeopt = "menuone,noinsert,noselect"
-- Avoid showing extra messages when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

vim.cmd([[colorscheme NeoSolarized]])

--Remap , as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.g.strip_whitespace_on_save = true
vim.g.strip_whitespace_confirm = false

vim.g.gutentags_cache_dir = "~/.local/share/nvim/tags"
vim.g.gutentags_ctags_exclude = {'*.git', '*.svg', '*.hg','*/tests/*','build','dist','.tox','*sites/*/files/*','bin','node_modules','bower_components','cache','compiled','docs','example','bundle','vendor','*.md','*-lock.json','*.lock','*bundle*.js','*build*.js','.*rc*','*.json','*.min.*','*.map','*.bak','*.zip','*.pyc','*.class','*.sln','*.Master','*.csproj','*.tmp','*.csproj.user','*.cache','*.pdb','tags*','cscope.*','*.css','*.less','*.scss','*.js','*.exe', '*.dll','*.mp3', '*.ogg', '*.flac','*.swp', '*.swo','*.bmp', '*.gif', '*.ico', '*.jpg', '*.png','*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2','*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx','*.html', '*.mk', 'Makefile', '*.y', '*.build', '*.in', 'Makefile', 'GNUmakefile', 'configure', '*.status', '*.xsl', '*.sql', '*.txt'}

vim.g.localvimrc_ask = 0
vim.g.c_syntax_for_h = true
