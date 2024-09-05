-- [[ Custom Options ]]
-- vim.opt.tabstop = 4 -- disabled for now b/c figured out by plugin
vim.opt.relativenumber = true
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.opt.cmdheight = 0 -- hide the command line (it will show if necessary)
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.smartindent = true -- Insert indents automatically
-- vim.opt.wrap = false -- Disable line wrap
vim.opt.linebreak = true
vim.opt.colorcolumn = '88' -- Marker at column 88
vim.opt.laststatus = 3 -- Global statusline
vim.opt.virtualedit = 'block'
vim.opt.termguicolors = true
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.grepformat = '%f:%l:%c:%m' -- Use ripgrep for grep
vim.opt.grepprg = 'rg --vimgrep'
vim.g.netrw_liststyle = 3 -- netrw use tree view
vim.g.netrw_banner = 0 -- disable banner
vim.highlight.priorities.semantic_tokens = 95 -- Prevent LSP from overwrtiting treesitter color settings

-- [[ Custom Keymaps ]]
-- Close all but the current buffer
vim.keymap.set('n', '<leader>bo', function()
  vim.cmd '%bd|e#'
end, { desc = 'Leave [O]nly the current [B]uffer' })

-- delete buffer without closing split
vim.keymap.set('n', '<leader>bd', '<cmd>bp|bd#<cr>', { desc = '[D]elete the current [B]uffer' })

-- make space a noop
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Make space a noop' })

-- when indenting block in visual mode keep the selection
vim.keymap.set('v', '<', '<gv', { desc = 'De-indent selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection' })

-- delete without yanking
vim.keymap.set({ 'n', 'v' }, '<leader>d', [['_d]], { desc = 'Delete without yanking' })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Copy/Paste to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank motion to system clipboard' }) -- yank motion
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard' }) -- yank line
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste after cursor from system clipboard' }) -- paste after cursor
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste before cursor from system clipboard' }) -- paste before cursor

if jit.os == 'OSX' then
  vim.keymap.set({ 'n', 'v' }, '<D-c>', '"+y', { desc = 'Copy to system clipboard' }) -- cmd+c to copy to system clipboard
  vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+p', { desc = 'Paste from system clipboard' }) -- cmd+v to paste from system clipboard
  vim.keymap.set('i', '<D-v>', '<C-R>+', { desc = 'Paste from system clipboard' }) -- cmd+v to paste in insert mode
else
  vim.keymap.set({ 'n', 'v' }, '<C-c>', '"+y', { desc = 'Copy to system clipboard' }) -- cmd+c to copy to system clipboard
  vim.keymap.set({ 'n', 'v' }, '<C-v>', '"+p', { desc = 'Paste from system clipboard' }) -- cmd+v to paste from system clipboard
  vim.keymap.set('i', '<C-v>', '<C-R>+', { desc = 'Paste from system clipboard' }) -- cmd+v to paste in insert mode
end

-- vim.keymap.set('n', '<leader>l', '<cmd>20Lexplore<cr>', { desc = 'Open netrw explorer' })

-- Tell Kitty that the editor is running
-- See: https://sw.kovidgoyal.net/kitty/mapping/#conditional-mappings-depending-on-the-state-of-the-focused-window
vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
  group = vim.api.nvim_create_augroup('KittySetVarVimEnter', { clear = true }),
  callback = function()
    io.stdout:write '\x1b]1337;SetUserVar=in_editor=MQo\007'
  end,
})

vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
  group = vim.api.nvim_create_augroup('KittyUnsetVarVimLeave', { clear = true }),
  callback = function()
    io.stdout:write '\x1b]1337;SetUserVar=in_editor\007'
  end,
})
