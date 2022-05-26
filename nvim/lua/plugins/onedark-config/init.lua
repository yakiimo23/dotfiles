local onedarkpro = require('onedarkpro')

onedarkpro.setup({
  theme = function()
    if vim.o.background == 'dark' then
      return 'onedark'
    else
      return 'onelight'
    end
  end,
  colors = 'onedark'
})

-- onedarkpro.load()
