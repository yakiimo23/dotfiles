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
        Explain = "コードの説明をして。ORMにはMongoidを使用すること。",
        Review = "コードのレビューをして。ORMにはMongoidを使用すること。",
        Tests = "選択したコードがどのように動作するかを簡単に説明し、specを生成する。",
        Refactor = "明快さと読みやすさを向上させるためにコードをリファクタリングする。過度なメソッド分割は行わないこと。",
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>ccf", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      {
        "<leader>cci",
        function ()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask Copilot",
      },
      {
        "<leader>ccT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit",
      },
      {
        "<leader>ccc",
        "<cmd>CopilotChatReset<cr>",
        desc = "CopilotChat - Reset chat history and clear buffer",
      }
    },
  },
}
