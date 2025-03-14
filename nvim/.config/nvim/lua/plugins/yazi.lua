---@type LazySpec
return {
  'mikavilpas/yazi.nvim',
  keys = {
    {
      '<leader>y',
      '<cmd>Yazi cwd<cr>',
      desc = 'Explorer Yazi (Root Dir)',
    },
    {
      '<leader>Y',
      '<cmd>Yazi<cr>',
      desc = 'Explorer Yazi (cwd)',
    },
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      '<leader>\\',
      '<cmd>Yazi toggle<cr>',
      desc = 'Explorer Yazi (resume)',
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
