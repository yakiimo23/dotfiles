return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function ()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shading_factor = 2,
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        }
      }
    }

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = 'lazygit',
      hidden = true,
      direction = 'float'
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end
}
