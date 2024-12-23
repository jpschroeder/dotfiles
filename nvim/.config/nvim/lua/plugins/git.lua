return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    lazygit = {},
    styles = {
      lazygit = {
        border = 'rounded',
        wo = {
          winhighlight = 'Normal:LazyGitNormal,NormalNC:LazyGitNormal,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC',
        },
      },
    },
  },
  config = function(_, opts)
    -- clear the background for the lazygit window
    local normalfloat_hl = vim.api.nvim_get_hl(0, { name = 'NormalFloat' })
    local normalfloat_fg = normalfloat_hl and normalfloat_hl.fg
    if normalfloat_fg then
      vim.api.nvim_set_hl(0, 'LazyGitNormal', { fg = normalfloat_fg, bg = 'NONE' })
    end

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
