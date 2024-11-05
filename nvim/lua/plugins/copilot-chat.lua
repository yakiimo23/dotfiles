return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      model = "gpt-4o",
      auto_insert_mode = true,
      show_help = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
      selection = function(source)
        local select = require("CopilotChat.select")
        return select.visual(source) or select.buffer(source)
      end,
      prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN 選択したコードを日本語で説明してください。",
        },
        Review = {
          prompt = "/COPILOT_REVIEW 選択したコードを日本語でレビューしてください。",
        },
        Fix = {
          prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
        },
        Optimize = {
          prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
        },
        Docs = {
          prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
        },
        Tests = {
          prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
        },
        FixDiagnostic = {
          prompt = "コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。",
          selection = require("CopilotChat.select").diagnostics,
        },
        Commit = {
          prompt = "commitizeの規則に従って、変更に対するコミットメッセージを日本語で記述してください。タイトルは最大50文字で、メッセージは72文字で折り返されるようにしてください。メッセージ全体をgitcommit言語のコードブロックでラップしてください。",
          selection = require("CopilotChat.select").gitdiff,
        },
        CommitStaged = {
          prompt = "commitizeの規則に従って、ステージ済みの変更に対するコミットメッセージを日本語で記述してください。タイトルは最大50文字で、メッセージは72文字で折り返されるようにしてください。メッセージ全体をgitcommit言語のコードブロックでラップしてください。",
          selection = function(source)
            return require("CopilotChat.select").gitdiff(source, true)
          end,
        },
      },
    }
  end,
}
