return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function ()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        -- suggestion = {
        --   accept = false,
        --   auto_trigger = true,
        -- },
        -- filetypes = {
        --   markdown = true,
        --   gitcommit = true,
        --   yaml = true,
        -- }
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
    branch = 'canary',
    dependencies = {
      'zbirenbaum/copilot.lua',
      'nvim-lua/plenary.nvim',
    },
    opts = {},
    keys = {
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        "<leader>cci",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      {
        "<leader>cct",
        "<cmd>CopilotChatToggle<cr>",
        desc = "CopilotChat - Toggle",
      }
    }
  },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   opts = {
  --     show_help = "yes",
  --     debug = true,
  --     language = 'Japanese',
  --     prompts = {
  --       Explain = "Explain how it works. Use Mongoid as the ORM.",
  --       Review = "Review the following code and provide concise suggestions. Use Mongoid as the ORM.",
  --       Tests = "Briefly explain how the selected code works, then generate spec. Use Mongoid as the ORM. Use fabrication for factories.",
  --       Refactor = "Refactor the code to improve clarity and readability.",
  --     },
  --   },
  --   build = function()
  --     vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  --   end,
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
  --     { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
  --     { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
  --     { "<leader>ccf", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
  --     {
  --       "<leader>cci",
  --       function ()
  --         local input = vim.fn.input("Quick Chat: ")
  --         if input ~= "" then
  --           vim.cmd("CopilotChat " .. input)
  --         end
  --       end,
  --       desc = "CopilotChat - Quick chat",
  --     },
  --     {
  --       "<leader>ccb",
  --       function ()
  --         local input = vim.fn.input("Buffer Chat: ")
  --         if input ~= "" then
  --           vim.cmd("CopilotChatBuffer " .. input)
  --         end
  --       end,
  --       desc = "CopilotChat - Buffer chat",
  --     },
  --     {
  --       "<leader>ccT",
  --       "<cmd>CopilotChatVsplitToggle<cr>",
  --       desc = "CopilotChat - Toggle Vsplit",
  --     },
  --     {
  --       "<leader>ccc",
  --       "<cmd>CopilotChatReset<cr>",
  --       desc = "CopilotChat - Reset chat history and clear buffer",
  --     },
  --     -- Show help actions with telescope
  --     {
  --       "<leader>cch",
  --       function()
  --         require("CopilotChat.code_actions").show_help_actions()
  --       end,
  --       desc = "CopilotChat - Help actions",
  --     },
  --     -- Show prompts actions with telescope
  --     {
  --       "<leader>ccp",
  --       function()
  --         require("CopilotChat.code_actions").show_prompt_actions()
  --       end,
  --       desc = "CopilotChat - Help actions",
  --     },
  --     {
  --       "<leader>ccp",
  --       ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
  --       mode = "x",
  --       desc = "CopilotChat - Prompt actions",
  --     },
  --   },
  -- },
}
