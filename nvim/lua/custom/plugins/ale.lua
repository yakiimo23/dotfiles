return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_linters = {
      -- ['*'] = { 'aspell', 'hunspell' },
      ['*'] = { 'cspell' },
    }

    vim.g.ale_cspell_options = '--config /Users/charlie/.config/nvim/spell/cspell.json'

    local function add_word_to_cspell()
      local word = vim.fn.expand('<cword>')
      local cspell_file = '/Users/charlie/.config/nvim/spell/cspell.json'  -- cspell.json ファイルのパス

      -- JSON ファイルを読み込む
      local file, err = io.open(cspell_file, 'r')
      if not file then
        print('Failed to open ' .. cspell_file .. ': ' .. err)
        return
      end

      local data = file:read('*a')
      file:close()

      -- JSON データを解析する
      local status, json = pcall(vim.fn.json_decode, data)
      if not status then
        print('Failed to parse ' .. cspell_file .. ': ' .. json)
        return
      end

      -- 単語を追加する
      table.insert(json.words, word)

      -- JSON ファイルを更新する
      file, err = io.open(cspell_file, 'w')
      if not file then
        print('Failed to open ' .. cspell_file .. ': ' .. err)
        return
      end

      file:write(vim.fn.json_encode(json))
      file:close()

      print('Added "' .. word .. '" to ' .. cspell_file)

      -- ALE を再実行する
      vim.cmd('ALELint')
    end

    vim.api.nvim_create_user_command('AddWordToCSpell', add_word_to_cspell, {})
  end,
}
