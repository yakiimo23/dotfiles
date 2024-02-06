return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function ()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = true,
      }
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
  }
}
