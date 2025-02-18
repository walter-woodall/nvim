return {
    "ibhagwan/fzf-lua",
    keys = {
        { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    },
    opts = {
        lsp = {
            async_or_timeout = 10000
        },
    },
}
