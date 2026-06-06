vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_format', 'ruff_organize_imports' },
    json = { 'jq' },
    xml = { 'xmllint' },
    xsd = { 'xmllint' },
  },
  -- Set default options
  default_format_opts = {
    lsp_format = 'fallback',
  },
  -- Set up format-on-save
  -- format_on_save = { timeout_ms = 500 },
  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { '-i', '2' },
    },
  },
}

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  require('conform').format { async = true }
end, { desc = 'Format Buffer' })
