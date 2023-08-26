return {
  'weizheheng/ror.nvim',
  dependencies = {
    'stevearc/dressing.nvim',
  },
  config = function()
    require('dressing').setup({
      input = {
        min_width = { 80, 0.9 },
      },
    })
    require('ror').setup()
  end,
}
