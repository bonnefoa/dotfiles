require('formatter').setup({
    filetype = {
        rust = {function() return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true} end},
        lua = {function() return {exe = "lua-format", args = {}, stdin = true} end},
        python = {function() return {exe = "black", args = {'-'}, stdin = true} end},
    }
})
