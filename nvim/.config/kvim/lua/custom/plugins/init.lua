-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- highlighting for csv
  'mechatroner/rainbow_csv',

  -- syntax highlighting for kitty config file: set ft=kitty
  'fladson/vim-kitty',

  -- kitty integration
  'knubie/vim-kitty-navigator',
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'navarasu/onedark.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      style = 'darker',
      transparent = true,
    },
    init = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
}
