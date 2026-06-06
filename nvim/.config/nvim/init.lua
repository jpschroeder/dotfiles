-- Options
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.pytest_makeprg_params = '--tb=line --quiet' -- Set default options when running :make in a pytest file

vim.hl.priorities.semantic_tokens = 95 -- Prevent LSP from overwrtiting treesitter color settings

vim.opt.breakindent = true
vim.opt.colorcolumn = '88'
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect', 'fuzzy', 'popup' }
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = '▏ ', trail = '·' }
vim.opt.mouse = 'a'
vim.opt.mousescroll = 'ver:1,hor:3'
vim.opt.number = true
vim.opt.pumborder = 'rounded'
vim.opt.scrolloff = 2
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append 'c'
vim.opt.showmode = false
vim.opt.sidescrolloff = 4
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.virtualedit = 'block'
vim.opt.winborder = 'rounded'
vim.opt.wrap = false

vim.diagnostic.config {
  signs = {
    text = { ERROR = '', WARN = '', INFO = '', HINT = '' },
  },
}

-- Open help windows to the Right
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('help_window_right', {}),
  pattern = { '*.txt' },
  callback = function()
    if vim.o.filetype == 'help' then
      vim.cmd.wincmd 'L'
    end
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = vim.api.nvim_create_augroup('resize_splits', { clear = true }),
  callback = function()
    vim.cmd 'wincmd ='
  end,
})

-- Lsp autocompletion
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method("textDocumentation/completion") then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })

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

-- Windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Utils
vim.keymap.set('v', '<', '<gv', { desc = 'De-indent selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Quickfix
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
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics under the cursor' })
