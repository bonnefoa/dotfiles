-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require("packer").use
require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("overcache/NeoSolarized")
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("tpope/vim-eunuch")
    use("freitass/todo.txt-vim")

    use("ntpeters/vim-better-whitespace")
    use("scrooloose/nerdcommenter")
    use("godlygeek/tabular")
    use("ludovicchabant/vim-gutentags")

    use("nvim-lua/popup.nvim")
    use("chrisbra/csv.vim")

    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-treesitter-textobjects")


    use('sbdchd/neoformat')
    use("tami5/lspsaga.nvim")

    use("nvim-lua/lsp-status.nvim")

    use({"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}})
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})

    use("mfussenegger/nvim-lint")

    use({"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}})

    use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
    use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp")

    -- snippets
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip") -- Snippets plugin
    use("rafamadriz/friendly-snippets")

    use("fatih/vim-go")
    use("leafgarland/typescript-vim")
    use("neoclide/vim-jsx-improve")
end)
