local null_ls = require('null-ls')

local sources = {
  -- null_ls.builtins.completion.spell,
  null_ls.builtins.diagnostics.rubocop.with({
    condition = function(utils)
      return utils.root_has_file({'.rubocop.yml'})
    end
  }),
  null_ls.builtins.formatting.rubocop.with({
    condition = function(utils)
      return utils.root_has_file({'.rubocop.yml'})
    end
  }),
  null_ls.builtins.formatting.rustfmt,
}

null_ls.setup({ sources = sources })
require('mason-null-ls').setup()
