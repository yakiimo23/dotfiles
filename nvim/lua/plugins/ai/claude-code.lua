return {
  "coder/claudecode.nvim",
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    -- Shift+Enter for newline in Claude terminal
    {
      "<S-CR>",
      function()
        local job_id = vim.b.terminal_job_id
        if job_id then
          vim.fn.chansend(job_id, "\n")
        end
      end,
      mode = "t",
      desc = "Send newline to Claude terminal",
    },
    {
      "\x1b[13;2u",
      function()
        local job_id = vim.b.terminal_job_id
        if job_id then
          vim.fn.chansend(job_id, "\n")
        end
      end,
      mode = "t",
      desc = "Send newline to Claude terminal (escape sequence)",
    },
  },
  opts = {
    terminal_cmd = "~/.claude/local/claude",
    visual_demotion_delay_ms = 100, -- Slower selection demotion
    connection_wait_delay = 500, -- Longer delay for @ mention batching
    terminal = {
      split_side = "right",
      split_width_percentage = 0.4, -- Wider terminal
      provider = "auto",
      auto_close = true, -- Keep terminal open to review output
    },
    diff_opts = {
      vertical_split = false, -- Horizontal diffs
      open_in_current_tab = false, -- New tabs for diffs
    },
  },
  config = function(_, opts)
    require("claudecode").setup(opts)

    -- Additional keymap setup for Claude Code terminal
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*claude*",
      callback = function(ev)
        local buf = ev.buf
        vim.keymap.set("t", "<S-CR>", function()
          local job_id = vim.b[buf].terminal_job_id
          if job_id then
            vim.fn.chansend(job_id, "\n")
          end
        end, { buffer = buf, desc = "Claude: Send newline" })

        vim.keymap.set("t", "\x1b[13;2u", function()
          local job_id = vim.b[buf].terminal_job_id
          if job_id then
            vim.fn.chansend(job_id, "\n")
          end
        end, { buffer = buf, desc = "Claude: Send newline (esc seq)" })
      end,
    })
  end,
}
