vim.api.nvim_set_keymap('', "<C-\\>", ':NvimTreeToggle<CR>', { noremap = true, silent = true })

require('nvim-tree').setup {
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
}
