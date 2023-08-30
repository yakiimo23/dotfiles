return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'olimorris/neotest-rspec',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-rspec')({
          rspec_cmd = function()
            return vim.tbl_flatten({
              'bin/rspec',
            })
          end
        })
      }
    })
  end,
}
