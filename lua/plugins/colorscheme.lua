return {
  -- add gruvbox
  {
    "Mofiqul/vscode.nvim",
    opts = {
      transparent = true,
    },
  },


  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  }
}
