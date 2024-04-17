require("diffview").setup({
    enhanced_diff_hl = false,
    view = {
        default = {layout = "diff2_horizontal"},
        merge_tool = {layout = "diff3_mixed"},
        file_history = {layout = "diff2_horizontal"}
    },
    default_args = {
        DiffviewOpen = {"-uno"},
        DiffviewFileHistory = {}
    },
})
