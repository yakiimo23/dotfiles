return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
      model = "o3-mini",
      prompts = {
        Explain = {
          prompt = "> /COPILOT_EXPLAIN\n\n選択されたコードの説明を段落として書きなさい。",
        },
        Review = {
          prompt = "> /COPILOT_REVIEW\n\n選択したコードをレビューしなさい。",
        },
        Fix = {
          prompt = "> /COPILOT_GENERATE\n\nこのコードには問題があります。バグを修正したコードに書き換えてください。",
        },
        Optimize = {
          prompt = "> /COPILOT_GENERATE\n\n選択したコードを最適化し、パフォーマンスと可読性を向上させなさい。",
        },
        Docs = {
          prompt = "> /COPILOT_GENERATE\n\n選択したコードにドキュメントコメントを追加してください。",
        },
        Tests = {
          prompt = "> /COPILOT_GENERATE\n\n私のコードのテストを作成してください。",
        },
        Commit = {
          prompt = "> #git:staged\n\nコミットメッセージを commitizen conventionに従って記述します。タイトルは最大50文字で、メッセージは72文字で折り返す。メッセージ全体をgitcommit言語でコードブロックにラップする。",
        },
      },
    }
  end,
}
