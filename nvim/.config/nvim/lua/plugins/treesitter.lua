return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ---@module 'treesitter-modules'
    ---@type ts.mod.UserConfig
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
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    branch = 'main',
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
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
          set_jumps = true, -- whether to set jumps in the jumplist
        },
      }

      vim.keymap.set({ 'x', 'o' }, 'aa', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects')
      end, { desc = 'Select outer parameter' })
      vim.keymap.set({ 'x', 'o' }, 'ia', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects')
      end, { desc = 'Select inner parameter' })
      vim.keymap.set({ 'x', 'o' }, 'af', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
      end, { desc = 'Select outer function' })
      vim.keymap.set({ 'x', 'o' }, 'if', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
      end, { desc = 'Select inner function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
      end, { desc = 'Select outer class' })
      vim.keymap.set({ 'x', 'o' }, 'ic', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
      end, { desc = 'Select inner class' })
      vim.keymap.set({ 'x', 'o' }, 'ab', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@block.outer', 'textobjects')
      end, { desc = 'Select outer block' })
      vim.keymap.set({ 'x', 'o' }, 'ib', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@block.inner', 'textobjects')
      end, { desc = 'Select inner block' })
      vim.keymap.set({ 'x', 'o' }, 'as', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
      end, { desc = 'Select outer scope' })

      -- Jump to function
      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
      end, { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
      end, { desc = 'Next function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
      end, { desc = 'Previous function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
      end, { desc = 'Previous function end' })

      -- Jump to parameter
      vim.keymap.set({ 'n', 'x', 'o' }, ']a', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@parameter.outer', 'textobjects')
      end, { desc = 'Next parameter start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']A', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@parameter.outer', 'textobjects')
      end, { desc = 'Next parameter end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[a', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@parameter.outer', 'textobjects')
      end, { desc = 'Previous parameter start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[A', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@parameter.outer', 'textobjects')
      end, { desc = 'Previous parameter end' })

      -- Jump to class
      vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
      end, { desc = 'Next class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']C', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
      end, { desc = 'Next class end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
      end, { desc = 'Previous class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[C', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
      end, { desc = 'Previous class end' })

      -- Jump to block
      vim.keymap.set({ 'n', 'x', 'o' }, ']b', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@block.outer', 'textobjects')
      end, { desc = 'Next block start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']B', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@block.outer', 'textobjects')
      end, { desc = 'Next block end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[b', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@block.outer', 'textobjects')
      end, { desc = 'Previous block start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[B', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@block.outer', 'textobjects')
      end, { desc = 'Previous block end' })

      -- For ledger files
      -- vim.keymap.set({ 'x', 'o' }, 'ax', function()
      --   require('nvim-treesitter-textobjects.select').select_textobject('@xact.outer', 'textobjects')
      -- end, { desc = 'Select outer transaction' })
      -- vim.keymap.set({ 'x', 'o' }, 'ix', function()
      --   require('nvim-treesitter-textobjects.select').select_textobject('@xact.inner', 'textobjects')
      -- end, { desc = 'Select inner transaction' })
      -- vim.keymap.set({ 'x', 'o' }, 'ap', function()
      --   require('nvim-treesitter-textobjects.select').select_textobject('@posting.outer', 'textobjects')
      -- end, { desc = 'Select outer posting' })
      -- vim.keymap.set({ 'x', 'o' }, 'ip', function()
      --   require('nvim-treesitter-textobjects.select').select_textobject('@posting.inner', 'textobjects')
      -- end, { desc = 'Select inner posting' })
      -- Jump to transaction
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']x', function()
      --   require('nvim-treesitter-textobjects.move').goto_next_start('@xact.outer', 'textobjects')
      -- end, { desc = 'Next transaction start' })
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']X', function()
      --   require('nvim-treesitter-textobjects.move').goto_next_end('@xact.outer', 'textobjects')
      -- end, { desc = 'Next transaction end' })
      -- vim.keymap.set({ 'n', 'x', 'o' }, '[x', function()
      --   require('nvim-treesitter-textobjects.move').goto_previous_start('@xact.outer', 'textobjects')
      -- end, { desc = 'Previous transaction start' })
      -- vim.keymap.set({ 'n', 'x', 'o' }, '[X', function()
      --   require('nvim-treesitter-textobjects.move').goto_previous_end('@xact.outer', 'textobjects')
      -- end, { desc = 'Previous transaction end' })
      -- -- Jump to posting
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']p', function()
      --   require('nvim-treesitter-textobjects.move').goto_next_start('@posting.outer', 'textobjects')
      -- end, { desc = 'Next posting start' })
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']P', function()
      --   require('nvim-treesitter-textobjects.move').goto_next_end('@posting.outer', 'textobjects')
      -- end, { desc = 'Next posting end' })
      -- vim.keymap.set({ 'n', 'x', 'o' }, '[p', function()
      --   require('nvim-treesitter-textobjects.move').goto_previous_start('@posting.outer', 'textobjects')
      -- end, { desc = 'Previous posting start' })
      -- vim.keymap.set({ 'n', 'x', 'o' }, '[P', function()
      --   require('nvim-treesitter-textobjects.move').goto_previous_end('@posting.outer', 'textobjects')
      -- end, { desc = 'Previous posting end' })
    end,
  },
}
