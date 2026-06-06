vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
}, { load = false })

vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.cmd.packadd 'blink.cmp'
    require('blink.cmp').setup {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
    }
  end,
})
