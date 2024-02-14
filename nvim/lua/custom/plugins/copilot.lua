return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function ()
      require('copilot').setup({
        -- suggestion = { enabled = false },
        -- panel = { enabled = false },
        suggestion = {
          accept = false,
          auto_trigger = true,
        },
        filetypes = {
          markdown = true,
          gitcommit = true,
          yaml = true,
        }
      })
    end
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function ()
      require('copilot_cmp').setup()
    end
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    opts = {
      show_help = "yes",
      debug = true,
      disable_extra_info = 'no',
      prompts = {
        Explain = "コードの説明",
        Review = "以下のコードを確認し、簡潔な提案をすること。",
        Tests = "選択したコードがどのように動作するかを簡単に説明し、ユニットテストを生成する。",
        Refactor = "明快さと読みやすさを向上させるためにコードをリファクタリングする。",
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>cci",
        function ()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask Copilot",
      }
    },
  },
}
