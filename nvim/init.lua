------------------------------ HELPERS ------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------------------------------ PLUGINS ------------------------------
require('config')

------------------------------ OPTIONS ------------------------------
-- cmd 'colorscheme onedark'
cmd 'language en_US.UTF-8'

opt.termguicolors = true
opt.encoding = 'utf-8'
opt.fileencodings = 'utf-8'
opt.expandtab = true
opt.shiftwidth = 2
opt.number = true
opt.cursorline = true
opt.tabstop = 2
opt.smartindent = true
opt.showmatch = true
opt.clipboard = 'unnamed'
opt.list = true
opt.infercase = true
opt.switchbuf = 'useopen'
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'
opt.backspace = { 'indent', 'eol', 'start' }
opt.listchars = { tab = '»-', space = '_', eol = '↲'}
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess = opt.shortmess + 'c'
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.laststatus = 3

------------------------------ MAPPINGS ------------------------------

-- Emacs key binds
map('i', '<C-p>', '<Up>')
map('i', '<C-n>', '<Down>')
map('i', '<C-b>', '<Left>')
map('i', '<C-f>', '<Right>')

-- Split window
map('n', 'ss', ':split<CR><C-w>w')
map('n', 'sv', ':vsplit<CR><C-w>w')

-- Switch tab
map('', '<S-Tab>', ':tabprev<CR>')
map('', '<Tab>', ':tabnext<CR>')

-- Move window
map('', 'sh', '<C-w>h')
map('', 'sk', '<C-w>k')
map('', 'sj', '<C-w>j')
map('', 'sl', '<C-w>l')

-- Resize window
map('', '<A-l>', ':vertical resize +5<CR>')
map('', '<A-h>', ':vertical resize -5<CR>')
map('', '<A-j>', ':resize +5<CR>')
map('', '<A-k>', ':resize -5<CR>')

-- Split new terminal window
-- map('', 'T', ':split | wincmd j | resize -10 | terminal<CR>')

-- Copy Relative Path
map('n', 'rp', ':let @+ = expand("%")<CR>')

-- Terminal mode
map('t', '<C-w>[', '<C-\\><C-n>')
