vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup()

vim.keymap.set('n', '<leader>o', function()
  require('oil').open(vim.fn.getcwd())
end, { desc = 'Oil File Explorer (root)' })
vim.keymap.set('n', '<leader>O', function()
  require('oil').open()
end, { desc = 'Oil File Explorer (current)' })
