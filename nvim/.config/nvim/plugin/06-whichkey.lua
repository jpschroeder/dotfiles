vim.pack.add { 'https://github.com/folke/which-key.nvim' }

require('which-key').setup {
  preset = 'helix',
  spec = {
    mode = { 'n', 'v' },
    { '<leader>b', group = 'buffer' },
    { '<leader>s', group = 'search' },
    { '<leader>g', group = 'git' },
    { '[', group = 'prev' },
    { ']', group = 'next' },
    { 'g', group = 'goto' },
    { 'gr', group = 'lsp' },
    { 'z', group = 'fold' },
  },
}

vim.keymap.set('n', '<leader>?', function()
  require('which-key').show()
end, { desc = 'Which Key UI' })
