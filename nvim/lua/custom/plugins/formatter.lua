return {
  'mhartington/formatter.nvim',
  config = function()
    local formatter_prettier = { require('formatter.defaults.prettier') }
    require('formatter').setup({
      filetype = {
        javascript      = formatter_prettier,
        javascriptreact = formatter_prettier,
        typescript      = formatter_prettier,
        typescriptreact = formatter_prettier,
      }
    })

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    augroup('__formatter__', { clear = true })
    autocmd('BufWritePost', {
      group = '__formatter__',
      command = 'FormatWrite',
    })
    vim.api.nvim_create_autocmd("User", {
      group = "__formatter__",
      pattern = "FormatterPre",
      command = "lua print('This will print before formatting')"
    })
    vim.api.nvim_create_autocmd("User", {
      group = "__formatter__",
      pattern = "FormatterPost",
      command = "lua print('This will print after formatting')"
    })
    -- vim.api.nvim_create_augroup('BufWritePreFormatter', {})
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --   command = 'FormatWrite',
    --   group = 'BufWritePreFormatter',
    --   pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    -- })
  end,
}
