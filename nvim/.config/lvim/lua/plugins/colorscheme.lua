return {
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    "navarasu/onedark.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      style = "darker",
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
