-- [[ Custom Setting Options ]]

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = { tab = '»-', space = '_', eol = '↲'}
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.cmdheight = 0
vim.opt.laststatus = 3

-- [[ Custom Keymaps ]]

-- Toggle Tree
vim.keymap.set('n', '<leader>ff', ':NvimTreeToggle<CR>', { desc = 'Finder' })

-- Switch Tabs
vim.keymap.set('n', '<C-h>', 'gT', { desc = 'Previous Tab' })
vim.keymap.set('n', '<C-l>', 'gt', { desc = 'Next Tab' })

-- Disable highlight after search
vim.keymap.set('n', '<leader>nn', ':noh<CR>', { desc = 'Disable hignlight' })

-- Copy Relative Path
vim.keymap.set('n', 'rp', ':let @+ = expand("%")<CR>', { desc = 'Copy Relative Path' })

-- Emacs Keybindings

vim.keymap.set('i', '<C-p>', '<Up>')
vim.keymap.set('i', '<C-n>', '<Down>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-f>', '<Right>')

-- Lazygit
vim.keymap.set('n', '<leader>lg', ':lua _lazygit_toggle()<CR>', { desc = 'Lazygit' })
