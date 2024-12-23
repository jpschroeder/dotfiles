return {
  'navarasu/onedark.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    style = 'darker',
    transparent = true,
  },
  init = function()
    vim.cmd.colorscheme 'onedark'
  end,
}
