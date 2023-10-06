return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  -- dependencies = { 'TheGLander/indent-rainbowline.nvim' },
  -- opt = function(_, opts)
  --   return require("indent-rainbowline").make_opts(opts)
  -- end,
  config = function()
    require('ibl').setup({
      indent = { char = '│', },
      scope = { enabled = true },
    })
  end,
}
