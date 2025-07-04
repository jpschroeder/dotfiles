vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.pytest_makeprg_params = '--tb=line --quiet' -- Set default options when running :make in a pytest file
vim.hl.priorities.semantic_tokens = 95 -- Prevent LSP from overwrtiting treesitter color settings
vim.opt.breakindent = true
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '88'
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.expandtab = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.linebreak = true
vim.opt.listchars = { tab = '▏ ', trail = '·' }
vim.opt.list = true
vim.opt.mouse = 'a'
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.sidescrolloff = 4
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.virtualedit = 'block'
vim.opt.wrap = false
vim.opt.winborder = 'rounded' -- style hover and signature help windows

-- Set the diagnostic icons
vim.diagnostic.config {
  signs = {
    text = { ERROR = '', WARN = '', INFO = '', HINT = '' },
  },
}
