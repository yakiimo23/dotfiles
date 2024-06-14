local select = require("CopilotChat.select")

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    prompts = {
      Explain = {
        prompt = "/COPILOT_EXPLAIN 選択されているアクティブなテキストに対する説明を段落形式で書いてください。",
      },
      Review = {
        prompt = "/COPILOT_REVIEW 選択されたコードをレビューしてください。",
        callback = function(response, source)
          local ns = vim.api.nvim_create_namespace("copilot_review")
          local diagnostics = {}
          for line in response:gmatch("[^\r\n]+") do
            if line:find("^line=") then
              local start_line = nil
              local end_line = nil
              local message = nil
              local single_match, message_match = line:match("^line=(%d+): (.*)$")
              if not single_match then
                local start_match, end_match, m_message_match = line:match("^line=(%d+)-(%d+): (.*)$")
                if start_match and end_match then
                  start_line = tonumber(start_match)
                  end_line = tonumber(end_match)
                  message = m_message_match
                end
              else
                start_line = tonumber(single_match)
                end_line = start_line
                message = message_match
              end

              if start_line and end_line then
                table.insert(diagnostics, {
                  lnum = start_line - 1,
                  end_lnum = end_line - 1,
                  col = 0,
                  message = message,
                  severity = vim.diagnostic.severity.WARN,
                  source = "Copilot Review",
                })
              end
            end
          end
          vim.diagnostic.set(ns, source.bufnr, diagnostics)
        end,
      },
      Fix = {
        prompt = "/COPILOT_GENERATE このコードには問題があります。バグを修正してコードを書き直してください。",
      },
      Optimize = {
        prompt = "/COPILOT_GENERATE 選択されたコードを最適化して、パフォーマンスと可読性を向上させてください。",
      },
      Docs = {
        prompt = "/COPILOT_GENERATE 選択箇所にドキュメントコメントを追加してください。",
      },
      Tests = {
        prompt = "/COPILOT_GENERATE 私のコードのテストを生成してください。",
      },
      FixDiagnostic = {
        prompt = "以下のファイルの diagnostic issue について支援してください。",
        selection = select.diagnostics,
      },
      Commit = {
        prompt = "コミットメッセージを commitizen convention に従って書いてください。タイトルは最大50文字、本文は72文字で折り返してください。全体を gitcommit 言語のコードブロックで囲んでください。",
        selection = select.gitdiff,
      },
      CommitStaged = {
        prompt = "コミットメッセージを commitizen convention に従って書いてください。タイトルは最大50文字、本文は72文字で折り返してください。全体を gitcommit 言語のコードブロックで囲んでください。",
        selection = function(source)
          return select.gitdiff(source, true)
        end,
      },
    },
  },
}
