return {
  "coder/claudecode.nvim",
  event = "VeryLazy", -- WebSocket サーバーを起動時にロード
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
  opts = {
    terminal_cmd = "~/.claude/local/claude",
    visual_demotion_delay_ms = 100,
    connection_wait_delay = 500,
    terminal = {
      provider = "none",
    },
    diff_opts = {
      vertical_split = false,
      open_in_current_tab = false,
    },
  },
}
