-- $XDG_CONFIG_HOME/cspell
local cspell_config_dir = '~/.config/cspell'
-- $XDG_DATA_HOME/cspell
local cspell_data_dir = '~/.local/share/cspell'
local cspell_files = {
  config = vim.call('expand', cspell_config_dir .. '/cspell.json'),
  user = vim.call('expand', cspell_data_dir .. '/user.txt'),
}
local null_ls = require('null-ls')

-- ユーザー辞書がなければ作成
if vim.fn.filereadable(cspell_files.user) ~= 1 then
  io.popen('mkdir -p ' .. cspell_data_dir)
  io.popen('touch ' .. cspell_files.user)
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.cspell.with({
      diagnostics_postprocess = function(diagnostic)
        -- レベルをWARNに変更（デフォルトはERROR）
        diagnostic.severity = vim.diagnostic.severity["WARN"]
      end,
      condition = function()
        -- cspellが実行できるときのみ有効
        return vim.fn.executable('cspell') > 0
      end,
      extra_args = { '--config', cspell_files.config },
    }),
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.formatting.rubocop
  },
})

-- cspell
local cspell_append = function(opts)
  local word = opts.args
  if not word or word == "" then
    -- 引数がなければcwordを取得
    word = vim.call('expand', '<cword>'):lower()
  end

  local dictionary_name = 'user'

  -- shellのechoコマンドで辞書ファイルに追記
  io.popen('echo ' .. word .. ' >> ' .. cspell_files[dictionary_name])

  -- 追加した単語および辞書を表示
  vim.notify(
    '"' .. word .. '" is appended to ' .. dictionary_name .. ' dictionary.',
    vim.log.levels.INFO,
    {}
  )

  -- cspellをリロードするため、現在行を更新してすぐ戻す
  if vim.api.nvim_get_option_value('modifiable',{}) then
    vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
    vim.api.nvim_command('silent! undo')
  end
end

vim.api.nvim_create_user_command(
  'CSpellAppend',
  cspell_append,
  { nargs = '?', bang = false }
)

local cspell_custom_actions = {
  name = 'append-to-cspell-dictionary',
  method = null_ls.methods.CODE_ACTION,
  filetypes = {},
  generator = {
    fn = function(_)
      -- 現在のカーソル位置
      local lnum = vim.fn.getcurpos()[2] - 1
      local col = vim.fn.getcurpos()[3]

      -- 現在行のエラーメッセージ一覧
      local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

      -- カーソル位置にcspellの警告が出ているか探索
      local word = ''
      local regex = '^Unknown word %((%w+)%)$'
      for _, v in pairs(diagnostics) do
        if v.source == "cspell" and
            v.col < col and col <= v.end_col and
            string.match(v.message, regex) then
          -- 見つかった場合、単語を抽出
          word = string.gsub(v.message, regex, '%1'):lower()
          break
        end
      end

      -- 警告が見つからなければ終了
      if word == '' then
        return
      end

      -- cspell_appendを呼び出すactionのリストを返却
      return {
        {
          title = 'Append "' .. word .. '" to user dictionary',
          action = function()
            cspell_append({ args = word })
          end
        }
      }
    end
  }
}
