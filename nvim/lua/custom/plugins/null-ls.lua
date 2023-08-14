if vim.g.vscode then
  return {}
end
return {
  'jose-elias-alvarez/null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'davidmh/cspell.nvim',
  },
  config = function ()
    local config = {
      config_file_path = '~/.config/cspell/cspell.json',

      find_json = function(cwd)
      end,

      on_success = function(cspell_config_file, params, action_name)
        if action_name == 'add_to_json' then
          os.execute(
            string.format(
              "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
              cspell_config_file,
              cspell_config_file
            )
          )
        end
      end
    }
    local conditional = function(fn)
      local utils = require("null-ls.utils").make_conditional_utils()
      return fn(utils)
    end
    local null_ls = require('null-ls')
    local cspell = require('cspell')
    null_ls.setup({
      sources = {
        cspell.diagnostics.with({ config = config }),
        cspell.code_actions.with({ config = config }),
        conditional(function(utils)
          return utils.root_has_file('Gemfile')
            and null_ls.builtins.diagnostics.rubocop.with({
              command = 'bundle',
              args = vim.list_extend({ 'exec', 'rubocop' }, null_ls.builtins.diagnostics.rubocop._opts.args),
            })
            or null_ls.builtins.diagnostics.rubocop
        end),
      },
    })
  end
}
