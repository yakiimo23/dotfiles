if vim.g.vscode then
  return {}
end

return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function ()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        -- null_ls.builtins.diagnostics.typos,
      },
    })
  end
}
