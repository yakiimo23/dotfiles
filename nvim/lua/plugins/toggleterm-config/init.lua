require('toggleterm').setup {
  size = 20,
  open_mapping = [[<C-t>]],
  hide_numbers = true,
  shading_factor = 2,
  direction = 'float',
  float_opts = {
    border = 'curved',
    winblend = 0
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

vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
