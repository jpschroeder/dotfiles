return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    spec = {
      mode = { 'n', 'v' },
      { '<leader>b', group = 'buffer' },
      { '<leader>f', group = 'file/find' },
      { '<leader>s', group = 'search' },
      { '<leader>g', group = 'git' },
      { '[', group = 'prev' },
      { ']', group = 'next' },
      { 'g', group = 'goto' },
      { 'gr', group = 'lsp' },
      { 'z', group = 'fold' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show()
      end,
      desc = 'Which Key',
    },
  },
}
