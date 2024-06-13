-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Switch Tabs
vim.keymap.set("n", "<C-h>", "gT", { desc = "Previous Tab" })
vim.keymap.set("n", "<C-l>", "gt", { desc = "Next Tab" })

-- Emacs Keybindings
vim.keymap.set("i", "<C-p>", "<Up>")
vim.keymap.set("i", "<C-n>", "<Down>")
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")

-- Copy Relative Path
vim.keymap.set("n", "rp", ':let @+ = expand("%")<CR>', { desc = "Copy Relative Path" })

-- Run Rspec
local rspec_path = function()
  local path = vim.fn.expand("%")
  return string.format("bin/rspec %s", path)
end

local rspec_path_with_current_line = function()
  local path = vim.fn.expand("%")
  local line = vim.fn.line(".")
  return string.format("bin/rspec %s:%s", path, line)
end

vim.keymap.set("n", "<leader>tf", function()
  require("toggleterm").exec(rspec_path())
end, { desc = "Run Rspec File in toggleterm", silent = true })

vim.keymap.set("n", "<leader>tn", function()
  require("toggleterm").exec(rspec_path_with_current_line())
end, { desc = "Run Rspec Nearest in toggleterm", silent = true })

-- Git Linker
vim.keymap.set("n", "<leader>gy", "<cmd>lua require('gitlinker').get_buf_range_url('n')<cr>", { desc = "Get link" })
vim.keymap.set("v", "<leader>gy", "<cmd>lua require('gitlinker').get_buf_range_url('v')<cr>", { desc = "Get link" })
