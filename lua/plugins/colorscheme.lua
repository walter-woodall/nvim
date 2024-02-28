return {
    -- add gruvbox
    {
        "Mofiqul/vscode.nvim",
        opts = {
            transparent = true,
        },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
    { "rebelot/kanagawa.nvim", priority = 1000, lazy = false },
    { "navarasu/onedark.nvim", priority = 1000, lazy = false },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , lazy = false },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight-night",
        },
    },
}
