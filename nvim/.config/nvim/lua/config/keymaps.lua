if jit.os == 'OSX' then
  vim.keymap.set({ 'n', 'v' }, '<D-c>', '"+y', { desc = 'Copy to system clipboard' })
  vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+p', { desc = 'Paste from system clipboard' })
  vim.keymap.set({ 'i', 'c' }, '<D-v>', '<C-R>+', { desc = 'Paste from system clipboard' })
else
  vim.keymap.set({ 'n', 'v' }, '<C-c>', '"+y', { desc = 'Copy to system clipboard' })
  vim.keymap.set({ 'n', 'v' }, '<C-v>', '"+p', { desc = 'Paste from system clipboard' })
  vim.keymap.set({ 'i', 'c' }, '<C-v>', '<C-R>+', { desc = 'Paste from system clipboard' })
end

vim.keymap.set('n', '<C-h>', '<cmd>KittyNavigateLeft<cr>', { desc = 'Go to Left Window' })
vim.keymap.set('n', '<C-j>', '<cmd>KittyNavigateDown<cr>', { desc = 'Go to Lower Window' })
vim.keymap.set('n', '<C-k>', '<cmd>KittyNavigateUp<cr>', { desc = 'Go to Upper Window' })
vim.keymap.set('n', '<C-l>', '<cmd>KittyNavigateRight<cr>', { desc = 'Go to Right Window' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })
vim.keymap.set('n', '<leader>q', vim.cmd.copen, { desc = 'Open [Q]uickfix list' })
vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#<cr>', { desc = 'Leave [O]nly the current [B]uffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bp|bd#<cr>', { desc = '[D]elete the current [B]uffer' })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Make space a noop' })

vim.keymap.set('v', '<', '<gv', { desc = 'De-indent selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })

vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below' })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right' })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window' })

vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })

vim.keymap.set({ 'x', 'n' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- remove these mappings when v11 drops
vim.keymap.set('n', 'grn', function()
  vim.lsp.buf.rename()
end, { desc = 'vim.lsp.buf.rename()' })

vim.keymap.set({ 'n', 'x' }, 'gra', function()
  vim.lsp.buf.code_action()
end, { desc = 'vim.lsp.buf.code_action()' })

vim.keymap.set('n', 'grr', function()
  vim.lsp.buf.references()
end, { desc = 'vim.lsp.buf.references()' })

vim.keymap.set('n', 'gri', function()
  vim.lsp.buf.implementation()
end, { desc = 'vim.lsp.buf.implementation()' })

vim.keymap.set('n', 'gO', function()
  vim.lsp.buf.document_symbol()
end, { desc = 'vim.lsp.buf.document_symbol()' })

vim.keymap.set({ 'i', 's' }, '<C-S>', function()
  vim.lsp.buf.signature_help()
end, { desc = 'vim.lsp.buf.signature_help()' })