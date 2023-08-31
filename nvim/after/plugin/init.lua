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

-- neotest-rspec
vim.keymap.set('n', '<leader>tf', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = '[T]est current [F]ile', silent = true })
vim.keymap.set('n', '<leader>tn', ":lua require('neotest').run.run()<CR>", { desc = '[T]est [N]earest test', silent = true })
vim.keymap.set('n', '<leader>to', ":lua require('neotest').output_panel.toggle()<CR>", { desc = '[T]est [O]utput', silent = true })
vim.keymap.set('n', '<leader>ts', ":lua require('neotest').summary.toggle()<CR>", { desc = '[T]est [S]ummary toggle', silent = true })
