vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang then
      local has_parsers, parsers = pcall(require, 'nvim-treesitter.parsers')
      if has_parsers and parsers[lang] then
        local ok, _ = pcall(vim.treesitter.language.inspect, lang)
        if not ok then
          require('nvim-treesitter').install(lang)
        end
      end
    end
  end,
})

vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' }

require('nvim-treesitter-textobjects').setup {
  select = {
    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
      ['@class.outer'] = 'V', -- linewise
      ['@block.outer'] = 'V', -- linewise
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
