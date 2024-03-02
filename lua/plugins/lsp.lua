return {
    "neovim/nvim-lspconfig",
    opts = {
        autoformat = false,
        servers = {
            rust_analyzer = {
                mason = false,
                cmd = { vim.fn.expand("~/.toolbox/bin/rust-analyzer") }
            },
            jdtls = {},
        },
    },
}
