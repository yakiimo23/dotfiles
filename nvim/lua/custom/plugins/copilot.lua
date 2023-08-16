return {
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  --   config = function ()
  --     require('copilot').setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end
  -- },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   dependencies = { 'zbirenbaum/copilot.lua' },
  --   event = 'InsertEnter',
  --   config = function ()
  --     require('copilot_cmp').setup()
  --   end
  -- },
  {
    'hrsh7th/cmp-copilot',
    event = 'InsertEnter',
  }
}
