require("trouble").setup {
    height = 5,
    {
        modes = {
            mydiags = {
                mode = "diagnostics",
                filter = {
                    any = {
                        buf = 0,
                        {
                            severity = vim.diagnostic.severity.ERROR,
                            function(item)
                                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
                            end,
                        },
                    },
                },
            }
        }
    }
}
