return {
  'navarasu/onedark.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    style = 'darker',
    transparent = true,
    colors = {
      -- Lighten up the foreground a bit
      -- original: https://github.com/atom/atom/blob/master/packages/one-dark-syntax/styles/colors.less#L27
      fg = '#c5cad3', -- hsl(220, 14%, 80%)
    },
  },
  init = function()
    vim.cmd.colorscheme 'onedark'
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'NONE' })
  end,
}
