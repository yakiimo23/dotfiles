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
vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', { desc = 'Lsp Code Action' })
vim.keymap.set('n', '[e', ':Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>')

-- ror
vim.keymap.set('n', '<leader>rc', ":lua require('ror.commands').list_commands()<CR>", { desc = '[R]or [C]ommands', silent = true })
vim.keymap.set('n', '<leader>rf', ":lua require('ror.test').run()<CR>", { desc = '[R]or run current [F]ile', silent = true })
vim.keymap.set('n', '<leader>rl', ":lua require('ror.test').run('Line')<CR>", { desc = '[R]or run current [L]ine', silent = true })
vim.keymap.set('n', '<leader>rt', ":lua require('ror.test').attach_terminal()<CR>", { desc = '[R]or toggle [T]erminal', silent = true })
