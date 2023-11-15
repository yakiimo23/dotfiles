return {
  'dense-analysis/ale',
  config = function()
    -- require('dense-analysis/ale').setup()
    vim.g.ale_linters = {
      ['*'] = { 'aspell', 'hunspell' },
    }
  end,
}
