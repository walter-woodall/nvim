return {
    "neovim/nvim-lspconfig",
    opts = {
        autoformat = true,
        servers = {
            rust_analyzer = {},
            jdtls = {},
        }
    }
}
