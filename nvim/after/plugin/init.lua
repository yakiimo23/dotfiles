-- [[ Custom Keymaps ]]

-- Toggle Tree
vim.keymap.set('n', '<leader>ff', ':NvimTreeToggle<CR>', { desc = 'Finder' })

-- Lazygit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Lazygit' })

-- Open In GitHub
vim.keymap.set('n', '<leader>ogr', ':OpenInGHRepo<CR>', { desc = 'Open In GitHub Repository' })
vim.keymap.set('n', '<leader>ogf', ':OpenInGHFile<CR>', { desc = 'Open In GitHub File' })

-- Lsp Saga
vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', { desc = 'Lsp Hover Doc' })
vim.keymap.set('n', '<leader>ld', ':Lspsaga show_buf_diagnostics<CR>', { desc = 'Lsp Show Buffer Diagnostics' })
vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', { desc = 'Lsp Code Action' })
vim.keymap.set('n', '[e', ':Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>')

-- copilot.lua
vim.keymap.set('i', '<Tab>', function()
  if require('copilot.suggestion').is_visible() then
    require('copilot.suggestion').accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
  end
end,{
  silent = true,
})

-- rspec to toggleterm
local rspec_path = function()
  local path = vim.fn.expand('%')
  return string.format('bin/rspec %s', path)
end

local rspec_path_with_current_line = function()
  local path = vim.fn.expand('%')
  local line = vim.fn.line('.')
  return string.format('bin/rspec %s:%s', path, line)
end

vim.keymap.set('n', '<leader>tf', function()
  require('toggleterm').exec(rspec_path())
end, { desc = 'Run Rspec File in toggleterm', silent = true })

vim.keymap.set('n', '<leader>tn', function()
  require('toggleterm').exec(rspec_path_with_current_line())
end, { desc = 'Run Rspec Nearest in toggleterm', silent = true })

-- Bug fix for tree-sitter
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
