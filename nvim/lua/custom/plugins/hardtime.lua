return {
  'm4xshen/hardtime.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim'
  },
  opts = {
    restricted_keys = {
      ['j'] = {},
      ['k'] = {},
      ['h'] = {},
      ['l'] = {},
    },
    disable_mouse = false
  },
}
