vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'standard',
      },
    },
  },
})
vim.lsp.enable 'basedpyright'
vim.lsp.enable 'lua_ls'
vim.lsp.enable 'gopls'
vim.lsp.enable 'terraformls'

vim.pack.add({ 'https://github.com/folke/lazydev.nvim' }, { load = false })
