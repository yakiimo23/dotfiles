return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function ()
    require('nvim-tree').setup {
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
      }
    }
  end
}
