if vim.g.vscode then
  return {}
end

return {
  'petertriho/nvim-scrollbar',
  dependencies = {
    'kevinhwang91/nvim-hlslens',
    'lewis6991/gitsigns.nvim',
  },
  config = function()
    require('scrollbar').setup({
      handlers = {
        gitsigns = true,
        search = true,
      }
    })
  end,
}
