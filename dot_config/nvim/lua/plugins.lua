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
    use("tpope/vim-eunuch")
    use("freitass/todo.txt-vim")

    use("sindrets/diffview.nvim")

    use("ntpeters/vim-better-whitespace")
    use("godlygeek/tabular")

    use("nvim-lua/popup.nvim")

    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-treesitter-textobjects")

    use('sbdchd/neoformat')

    use("nvim-lua/lsp-status.nvim")
    use("weilbith/nvim-lsp-smag")

    use({"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}})
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})

    use("ludovicchabant/vim-gutentags")

    use({"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}})

    use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
    use('VonHeikemen/lsp-zero.nvim')

    use('neomake/neomake')

    -- Autocompletion plugin
    use("hrsh7th/nvim-cmp")
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lsp-signature-help')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/vim-vsnip')
    use('mrcjkb/rustaceanvim')
    use('mfussenegger/nvim-dap')

    -- snippets
    use('L3MON4D3/LuaSnip')
    use("rafamadriz/friendly-snippets")
    use("saadparwaiz1/cmp_luasnip")

    use('prabirshrestha/async.vim')
    use('prabirshrestha/vim-lsp')

    use("fatih/vim-go")
    use("AndrewRadev/splitjoin.vim")
    use("leafgarland/typescript-vim")
    use("neoclide/vim-jsx-improve")
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use("kyazdani42/nvim-web-devicons")
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use("farmergreg/vim-lastplace")
    use("liuchengxu/vista.vim")

    use("kylechui/nvim-surround")
    use("tpope/vim-commentary")

    use({"williamboman/mason.nvim", run = ":MasonUpdate" })
    use("williamboman/mason-lspconfig")
end)
