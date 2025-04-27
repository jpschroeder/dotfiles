return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'go',
      'gomod',
      'gowork',
      'gosum',
      'python',
      'javascript',
      'query',
      'markdown',
      'terraform',
      'graphql',
      'sql',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = { query = '@parameter.outer', desc = 'Select outer parameter' },
          ['ia'] = { query = '@parameter.inner', desc = 'Select inner parameter' },
          ['af'] = { query = '@function.outer', desc = 'Select outer function' },
          ['if'] = { query = '@function.inner', desc = 'Select inner function' },
          ['ac'] = { query = '@class.outer', desc = 'Select outer class' },
          ['ic'] = { query = '@class.inner', desc = 'Select inner class' },
          ['ab'] = { query = '@block.outer', desc = 'Select outer block' },
          ['ib'] = { query = '@block.inner', desc = 'Select inner block' },
          -- For ledger files
          ['ax'] = { query = '@xact.outer', desc = 'Select outer transaction' },
          ['ix'] = { query = '@xact.inner', desc = 'Select inner transaction' },
          ['ap'] = { query = '@posting.outer', desc = 'Select outer posting' },
          ['ip'] = { query = '@posting.inner', desc = 'Select inner posting' },
        },
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = 'V', -- linewise
          ['@block.outer'] = 'V', -- linewise
          ['@xact.outer'] = 'V', -- linewise
          ['@posting.outer'] = 'V', -- linewise
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']a'] = '@parameter.outer',
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
          [']b'] = '@block.outer',
          [']x'] = '@xact.outer', -- for ledger files
          [']p'] = '@posting.outer', -- for ledger files
        },
        goto_next_end = {
          [']A'] = '@parameter.outer',
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
          [']B'] = '@block.outer',
          [']X'] = '@xact.outer', -- for ledger files
          [']P'] = '@posting.outer', -- for ledger files
        },
        goto_previous_start = {
          ['[a'] = '@parameter.outer',
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
          ['[b'] = '@block.outer',
          ['[x'] = '@xact.outer', -- for ledger files
          ['[p'] = '@posting.outer', -- for ledger files
        },
        goto_previous_end = {
          ['[A'] = '@parameter.outer',
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
          ['[B'] = '@block.outer',
          ['[X'] = '@xact.outer', -- for ledger files
          ['[P'] = '@posting.outer', -- for ledger files
        },
      },
    },
  },
}
