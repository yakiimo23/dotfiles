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
    'gptlang/CopilotChat.nvim'
  },
}
