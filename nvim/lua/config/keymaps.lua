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
vim.keymap.set("n", "rp", ':let @+ = expand("%:.")<CR>', { desc = "Copy Relative Path" })

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

-- Shift+Enter mapping with proper buffer scoping
local esc = string.char(27)

-- Helper function to set Shift+CR mapping
local function set_shift_cr(mode, rhs, opts)
  local ok = pcall(vim.keymap.set, mode, "<S-CR>", rhs, opts)
  if not ok then
    vim.keymap.set(mode, esc .. "[13;2u", rhs, opts)
  end
end

-- For normal file buffers: Shift+Enter -> newline
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function(ev)
    if vim.bo[ev.buf].buftype == "" then
      set_shift_cr("i", "<CR>", {
        buffer = ev.buf,
        noremap = true,
        silent = true,
        desc = "Shift+Enter -> newline",
      })
    end
  end,
})

-- For terminal buffers: Shift+Enter sends newline to terminal
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(ev)
    set_shift_cr("t", "<CR>", {
      buffer = ev.buf,
      noremap = true,
      silent = true,
      desc = "Shift+Enter sends newline to terminal",
    })
    -- Remove insert mode mappings in terminal buffers
    pcall(vim.keymap.del, "i", "<S-CR>", { buffer = ev.buf })
    pcall(vim.keymap.del, "i", esc .. "[13;2u", { buffer = ev.buf })
  end,
})

-- Disable Shift+Enter mapping in special buffer types
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "TelescopePrompt",
    "noice",
    "lazy",
    "qf",
    "neo-tree",
    "NvimTree",
    "oil",
    "help",
    "terminal",
    "toggleterm",
    "claudecode",
  },
  callback = function(ev)
    pcall(vim.keymap.del, "i", "<S-CR>", { buffer = ev.buf })
    pcall(vim.keymap.del, "i", esc .. "[13;2u", { buffer = ev.buf })
  end,
})

-- Debug Claude Code buffers
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  callback = function(ev)
    local bufname = vim.fn.bufname(ev.buf)
    if bufname:match("[Cc]laude") or bufname:match("claude") then
      vim.defer_fn(function()
        print(string.format("Claude buffer debug: name=%s, ft=%s, bt=%s, job_id=%s", 
          bufname, 
          vim.bo[ev.buf].filetype, 
          vim.bo[ev.buf].buftype,
          vim.b[ev.buf].terminal_job_id or "none"
        ))
      end, 100)
    end
  end,
})
