--------------------------------------------------------------------------------
-- 1. Visuals & Typography (Distraction-Free Prose)
--------------------------------------------------------------------------------
vim.opt_local.wrap = true -- Enable soft-wrapping for long lines
vim.opt_local.linebreak = true -- Wrap text at words, never mid-character
vim.opt_local.breakindent = true -- Align wrapped lines to match their initial indentation
vim.opt_local.conceallevel = 2 -- Hide markdown symbols (**bold**, [links](url)) unless editing

--------------------------------------------------------------------------------
-- 2. Writing & Layout Configurations (Treesitter Optimized)
--------------------------------------------------------------------------------
vim.opt_local.spell = true -- Spellcheck prose (Treesitter natively ignores code blocks)
vim.opt_local.textwidth = 0 -- Disable absolute hard line breaks while typing

-- Treesitter-powered folding based on headings
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt_local.foldlevel = 99 -- Expand all folds by default when opening a file

-- Tab and indentation spacing (prevents aggressive 4-space markdown indents)
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

--------------------------------------------------------------------------------
-- 3. Standard Navigation Mappings (No Leader Keys)
--------------------------------------------------------------------------------
-- Quick Heading Navigation: Jump to next/previous header with ]] and [[
vim.keymap.set('n', ']]', '/^#\\+\\s/<CR>:nohlsearch<CR>', { buffer = true, silent = true, desc = 'Next Heading' })
vim.keymap.set('n', '[[', '?^#\\+\\s?<CR>:nohlsearch<CR>', { buffer = true, silent = true, desc = 'Previous Heading' })

vim.api.nvim_set_hl(0, '@markup.string', { bold = true, fg = '#e8ecf2' })
