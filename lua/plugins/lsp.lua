return {
    "neovim/nvim-lspconfig",
    opts = {
        autoformat = false,
        servers = {
            jdtls = {},
        },
        setup = {
            jdtls = function ()
                return true
            end,
        },
    },
}
