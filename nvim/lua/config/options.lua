-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.wrap = true
opt.clipboard = "unnamedplus"

vim.g.lazyvim_picker = "fzf"
-- vim.g.lazyvim_picker = "telescope"
-- vim.g.lazyvim_ruby_lsp = "solargraph"
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

vim.g.snacks_animate = false
