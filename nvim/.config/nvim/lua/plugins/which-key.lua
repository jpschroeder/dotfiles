return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
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
  },
  config = function(_, opts)
    -- clear the background of the whichkey window
    -- local hl = vim.api.nvim_get_hl(0, { name = 'NormalFloat' })
    -- local fg = hl and hl.fg or 'NONE'
    -- vim.api.nvim_set_hl(0, 'WhichKeyNormal', { fg = fg, bg = 'NONE' })

    require('which-key').setup(opts)
  end,
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show()
      end,
      desc = 'Which Key UI',
    },
  },
}
