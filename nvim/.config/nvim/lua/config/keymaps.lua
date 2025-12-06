-- Clipboard
if jit.os == 'OSX' then
  vim.keymap.set({ 'n', 'v' }, '<D-c>', '"+y', { desc = 'Copy to system clipboard' })
  vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+p', { desc = 'Paste from system clipboard' })
  vim.keymap.set({ 'i', 'c' }, '<D-v>', '<C-R>+', { desc = 'Paste from system clipboard' })
else
  vim.keymap.set({ 'n', 'v' }, '<C-c>', '"+y', { desc = 'Copy to system clipboard' })
  vim.keymap.set({ 'n', 'v' }, '<C-v>', '"+p', { desc = 'Paste from system clipboard' })
  vim.keymap.set({ 'i', 'c' }, '<C-v>', '<C-R>+', { desc = 'Paste from system clipboard' })
end

-- Kitty
-- vim.keymap.set('n', '<C-h>', '<cmd>KittyNavigateLeft<cr>', { desc = 'Go to Left Window' })
-- vim.keymap.set('n', '<C-j>', '<cmd>KittyNavigateDown<cr>', { desc = 'Go to Lower Window' })
-- vim.keymap.set('n', '<C-k>', '<cmd>KittyNavigateUp<cr>', { desc = 'Go to Upper Window' })
-- vim.keymap.set('n', '<C-l>', '<cmd>KittyNavigateRight<cr>', { desc = 'Go to Right Window' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Utils
vim.keymap.set('v', '<', '<gv', { desc = 'De-indent selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Quickfix
vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })
vim.keymap.set('n', '<leader>q', function()
  if vim.fn.getqflist({ winid = 0 }).winid == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end, { desc = 'Toggle Quickfix list' })

-- Buffers
vim.keymap.set('n', '<leader>bd', '<cmd>bp|bd#<cr>', { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#<cr>', { desc = 'Delete Other Buffers' })
vim.keymap.set('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- Windows
vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below' })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right' })
-- Force <C-w>] to open in a vertical split instead of horizontal
vim.keymap.set('n', '<C-w>]', ':vertical wincmd ]<CR>', { desc = 'Tag in Vertical Split' })

-- Diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
