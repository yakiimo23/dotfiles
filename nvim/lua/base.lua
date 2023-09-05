-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = { tab = '»-', space = '_', eol = '↲' }
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.spelllang = { 'en_us', 'cjk' }
vim.opt.spell = true
-- vim.opt.foldmethod = 'indent'
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8', 'cp932', 'euc-jp', 'sjis' }
vim.opt.relativenumber = true
vim.opt.helplang = { 'ja', 'en' }

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Switch Tabs
vim.keymap.set('n', '<C-h>', 'gT', { desc = 'Previous Tab' })
vim.keymap.set('n', '<C-l>', 'gt', { desc = 'Next Tab' })

-- Buffer next/prev
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous Buffer' })

-- Disable highlight after search
vim.keymap.set('n', '<leader>nn', ':noh<CR>', { desc = 'Disable hignlight' })

-- Copy Relative Path
vim.keymap.set('n', 'rp', ':let @+ = expand("%")<CR>', { desc = 'Copy Relative Path' })

-- Emacs Keybindings
vim.keymap.set('i', '<C-p>', '<Up>')
vim.keymap.set('i', '<C-n>', '<Down>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-f>', '<Right>')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
