vim.bo.commentstring = '; %s'

local ts_utils = require 'nvim-treesitter.ts_utils'

vim.keymap.set('n', '<leader>ap', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local node = ts_utils.get_node_at_cursor()

  -- Walk up to plain_xact node
  while node and node:type() ~= 'plain_xact' do
    node = node:parent()
  end

  if not node then
    print 'No plain_xact found.'
    return
  end

  -- Find the payee child
  local payee_node = nil
  for child in node:iter_children() do
    if child:type() == 'payee' then
      payee_node = child
      break
    end
  end

  if not payee_node then
    print 'No payee found.'
    return
  end

  -- Get payee text and range
  local payee_text = vim.treesitter.get_node_text(payee_node, bufnr)
  local start_row, start_col, end_row, end_col = payee_node:range()

  -- Insert new line below plain_xact (or below payee line)
  vim.api.nvim_buf_set_lines(bufnr, end_row + 1, end_row + 1, false, { '  ; AutosyncPayee: ' .. payee_text })

  -- Replace payee with "*"
  vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { '*' })

  -- Move cursor to payee position, insert mode
  vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col + 1 })
  -- vim.cmd 'normal! a'
end, { desc = 'Treesitter AutosyncPayee for Ledger' })
