---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fe",
      "<cmd>Yazi cwd<cr>",
      desc = "Explorer Yazi (Root Dir)",
    },
    {
      "<leader>fE",
      "<cmd>Yazi<cr>",
      desc = "Explorer Yazi (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer Yazi (Root Dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer Yazi (cwd)", remap = true },
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      "<leader>\\",
      "<cmd>Yazi toggle<cr>",
      desc = "Explorer Yazi (resume)",
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
