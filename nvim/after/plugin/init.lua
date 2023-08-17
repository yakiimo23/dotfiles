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

-- RSpec
vim.keymap.set("n", "<leader>rn", ":RSpecNearest<CR>", { desc = 'RSpec Nearest', noremap = true, silent = true })
vim.keymap.set("n", "<leader>rf", ":RSpecCurrentFile<CR>", { desc = 'RSpec Current File', noremap = true, silent = true })
vim.keymap.set("n", "<leader>rr", ":RSpecRerun<CR>", { desc = 'RSpec Rerun', noremap = true, silent = true })
vim.keymap.set("n", "<leader>rF", ":RSpecOnlyFailures<CR>", { desc = 'RSpec only Failures', noremap = true, silent = true })
vim.keymap.set("n", "<leader>rs", ":RSpecShowLastResult<CR>", { desc = 'RSpec Show Last Result', noremap = true, silent = true })
vim.keymap.set("n", "<leader>rj", ":RSpecJump<CR>", { desc = 'RSpec Jump', noremap = true, silent = true })
