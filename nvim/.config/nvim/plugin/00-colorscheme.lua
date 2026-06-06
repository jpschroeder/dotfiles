vim.pack.add { 'https://github.com/navarasu/onedark.nvim' }
local onedark = require 'onedark'
onedark.setup {
  style = 'darker',
  transparent = true,
  colors = {
    -- Lighten up the foreground a bit
    -- original: https://github.com/atom/atom/blob/master/packages/one-dark-syntax/styles/colors.less#L27
    fg = '#c5cad3', -- hsl(220, 14%, 80%)
  },
}
onedark.load()
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'NONE' })
