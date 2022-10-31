local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.completion.spell,
  null_ls.builtins.diagnostics.rubocop,
  null_ls.builtins.formatting.rubocop,
  null_ls.builtins.formatting.rustfmt,
}

null_ls.setup({ sources = sources })
