return {
  "coder/claudecode.nvim",
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil" },
    },
  },
  opts = {
    visual_demotion_delay_ms = 100, -- Slower selection demotion
    connection_wait_delay = 500, -- Longer delay for @ mention batching
    terminal = {
      split_side = "right",
      split_width_percentage = 0.4, -- Wider terminal
      provider = "auto",
      auto_close = false, -- Keep terminal open to review output
    },
    diff_opts = {
      vertical_split = false, -- Horizontal diffs
      open_in_current_tab = false, -- New tabs for diffs
    },
  },
}
