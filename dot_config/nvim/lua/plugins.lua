
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use '9mm/vim-closer'
    use {'andymass/vim-matchup', event = 'VimEnter'}
    use {
        'dense-analysis/ale',
        ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'vim'},
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'overcache/NeoSolarized'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'godlygeek/tabular'
    use 'scrooloose/nerdcommenter'

    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    use 'tpope/vim-abolish'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-git'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'

    use {'vim-airline/vim-airline-themes', event = 'VimEnter'}
    use {'vim-airline/vim-airline', after = 'vim-airline-themes'}

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
    parser_configs.norg = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main"
        },
    }

    require('nvim-treesitter.configs').setup {
        ensure_installed = { "norg", "cpp", "c", "javascript", "json", "go" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }

    use { 
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, 
                    ["core.norg.concealer"] = {}, 
                    ["core.norg.completion"] = {
                        config = {
                            engine = "nvim-cmp" 
                        }
                    },
                    ["core.keybinds"] = { 
                        config = {
                            default_keybinds = true, 
                            neorg_leader = "<Leader>" 
                        }
                    },
                    ["core.norg.dirman"] = {
                    config = {
                        workspaces = {
                            my_workspace = "~/neorg"
                        }
                    }
                }
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim"
    }

    --use {'ambv/black', 'rtp' = 'vim'}
    --use 'davidhalter/jedi-vim'
    --use 'fatih/vim-go'
    --use 'honza/vim-snippets'
    --use 'kana/vim-altr'
    --use 'MarcWeber/vim-addon-mw-utils'
    --use {'neoclide/coc.nvim', branch= 'release'}
    --use 'SirVer/ultisnips'
    --use 'vhdirk/vim-cmake'
    --use 'vim-scripts/matchit.zip'
    --use 'wannesm/wmgraphviz.vim'

    -- "use 'Chiel92/vim-autoformat'
    -- "use 'ludovicchabant/vim-gutentags'
    -- "use 'rhysd/vim-clang-format'
    -- "use 'scrooloose/syntastic'

end)
