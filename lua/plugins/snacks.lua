return {
    "snacks.nvim",
    opts = {
        indent = { enabled = true },
        input = { enabled = true },
        image = { enabled = false },
        notifier = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false }, -- we set this in options.lua
        toggle = { map = LazyVim.safe_keymap_set },
        words = { enabled = true },
    },
}
