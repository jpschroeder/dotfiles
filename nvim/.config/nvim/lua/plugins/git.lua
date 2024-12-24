return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    lazygit = {},
    styles = {
      lazygit = {
        border = 'rounded',
        -- wo = {
        --   winhighlight = 'Normal:LazyGitNormal,NormalNC:LazyGitNormal,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC',
        -- },
      },
    },
  },
  config = function(_, opts)
    -- clear the background for the lazygit window
    -- local hl = vim.api.nvim_get_hl(0, { name = 'NormalFloat' })
    -- local fg = hl and hl.fg or 'NONE'
    -- vim.api.nvim_set_hl(0, 'LazyGitNormal', { fg = fg, bg = 'NONE' })

    Snacks.setup(opts)
  end,
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit Log',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      mode = { 'n', 'x' },
      desc = 'Git Browse (open)',
    },
    {
      '<leader>gY',
      function()
        Snacks.gitbrowse {
          open = function(url)
            vim.fn.setreg('+', url)
          end,
          notify = false,
        }
      end,
      mode = { 'n', 'x' },
      desc = 'Git Browse (copy)',
    },
  },
}
