return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
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
