require('trouble').setup{}

vim.api.nvim_set_keymap('n', '<leader>xx', ':TroubleToggle<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xw', ':TroubleToggle workspace_diagnostics<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xd', ':TroubleToggle document_diagnostics<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xl', ':TroubleToggle loclist<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xq', ':TroubleToggle quickfix<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'gR', ':TroubleToggle lsp_references<CR>', { silent = true, noremap = true })
