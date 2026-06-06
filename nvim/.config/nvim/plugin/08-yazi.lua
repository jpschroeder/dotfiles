vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mikavilpas/yazi.nvim',
}

require('yazi').setup {
  keymaps = {
    show_help = '<f1>',
  },
}

vim.keymap.set('n', '<leader>y', '<cmd>Yazi cwd<cr>', { desc = 'Yazi File Explorer (root)' })
vim.keymap.set('n', '<leader>Y', '<cmd>Yazi<cr>', { desc = 'Yazi File Explorer (current)' })
